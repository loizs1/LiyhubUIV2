--[[
    LiyHub UI - Slider Component
    A precision numeric slider with drag tracking, bounds clamping, step quantization,
    real-time tooltip value bubble, and reliable callback execution.
]]

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local Slider = {}
Slider.__index = Slider

function Slider.new(parent, options, theme, cleanup)
    options = options or {}
    local text = options.Text or options.Name or "Slider"
    local minVal = options.Min or 0
    local maxVal = options.Max or 100
    if maxVal <= minVal then
        maxVal = minVal + 1
    end
    local stepVal = options.Step or 1
    local defaultVal = options.Default or minVal
    local suffix = options.Suffix or ""
    local callback = options.Callback or options.OnChange or function() end
    
    local container = Instance.new("Frame")
    container.Name = "Slider_" .. text
    container.Size = UDim2.new(1, 0, 0, 48)
    container.BackgroundColor3 = theme.Element
    container.BorderSizePixel = 0
    container.Parent = parent
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = theme.CornerRadius
    corner.Parent = container
    
    -- Title Label
    local label = Instance.new("TextLabel")
    label.Name = "Label"
    label.Size = UDim2.new(0.65, 0, 0, 20)
    label.Position = UDim2.new(0, 12, 0, 6)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = theme.TextPrimary
    label.Font = theme.FontRegular
    label.TextSize = theme.FontSizeRegular
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = container
    
    -- Static Value Display Badge on right
    local valueBadge = Instance.new("Frame")
    valueBadge.Name = "ValueBadge"
    valueBadge.Size = UDim2.new(0, 38, 0, 20)
    valueBadge.Position = UDim2.new(1, -50, 0, 6)
    valueBadge.BackgroundColor3 = theme.Card
    valueBadge.BorderSizePixel = 0
    valueBadge.Parent = container
    
    local vbCorner = Instance.new("UICorner")
    vbCorner.CornerRadius = theme.SmallCornerRadius
    vbCorner.Parent = valueBadge
    
    local valueLabel = Instance.new("TextLabel")
    valueLabel.Name = "ValueLabel"
    valueLabel.Size = UDim2.new(1, 0, 1, 0)
    valueLabel.BackgroundTransparency = 1
    valueLabel.Text = tostring(defaultVal) .. suffix
    valueLabel.TextColor3 = theme.TextPrimary
    valueLabel.Font = theme.FontBold
    valueLabel.TextSize = theme.FontSizeSmall
    valueLabel.TextXAlignment = Enum.TextXAlignment.Center
    valueLabel.Parent = valueBadge
    
    -- Track
    local track = Instance.new("TextButton")
    track.Name = "Track"
    track.Size = UDim2.new(1, -24, 0, 6)
    track.Position = UDim2.new(0, 12, 0, 32)
    track.BackgroundColor3 = theme.SliderTrack
    track.AutoButtonColor = false
    track.Text = ""
    track.BorderSizePixel = 0
    track.Parent = container
    
    local trackCorner = Instance.new("UICorner")
    trackCorner.CornerRadius = UDim.new(1, 0)
    trackCorner.Parent = track
    
    -- Fill Bar
    local fill = Instance.new("Frame")
    fill.Name = "Fill"
    fill.Size = UDim2.new(0, 0, 1, 0)
    fill.BackgroundColor3 = theme.SliderFill
    fill.BorderSizePixel = 0
    fill.Parent = track
    
    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(1, 0)
    fillCorner.Parent = fill
    
    -- Knob Handle
    local knob = Instance.new("Frame")
    knob.Name = "Knob"
    knob.Size = UDim2.new(0, 14, 0, 14)
    knob.Position = UDim2.new(1, -7, 0.5, -7)
    knob.BackgroundColor3 = theme.TextPrimary
    knob.BorderSizePixel = 0
    knob.Parent = fill
    
    local knobCorner = Instance.new("UICorner")
    knobCorner.CornerRadius = UDim.new(1, 0)
    knobCorner.Parent = knob
    
    -- Floating Tooltip Bubble above knob (active during drag)
    local tooltip = Instance.new("Frame")
    tooltip.Name = "Tooltip"
    tooltip.Size = UDim2.new(0, 32, 0, 18)
    tooltip.Position = UDim2.new(0.5, -16, 0, -22)
    tooltip.BackgroundColor3 = theme.TextPrimary
    tooltip.BorderSizePixel = 0
    tooltip.Visible = false
    tooltip.ZIndex = 10
    tooltip.Parent = knob
    
    local ttCorner = Instance.new("UICorner")
    ttCorner.CornerRadius = UDim.new(0, 4)
    ttCorner.Parent = tooltip
    
    local ttText = Instance.new("TextLabel")
    ttText.Name = "Text"
    ttText.Size = UDim2.new(1, 0, 1, 0)
    ttText.BackgroundTransparency = 1
    ttText.Text = tostring(defaultVal)
    ttText.TextColor3 = theme.Background
    ttText.Font = theme.FontBold
    ttText.TextSize = 10
    ttText.ZIndex = 11
    ttText.Parent = tooltip
    
    local self = setmetatable({
        _container = container,
        _label = label,
        _valueLabel = valueLabel,
        _track = track,
        _fill = fill,
        _knob = knob,
        _tooltip = tooltip,
        _ttText = ttText,
        _theme = theme,
        _min = minVal,
        _max = maxVal,
        _step = stepVal,
        _suffix = suffix,
        _value = defaultVal,
        _callback = callback,
        _dragging = false,
        _disabled = false,
    }, Slider)
    
    local function updateFromInput(inputX)
        local trackAbsPos = track.AbsolutePosition.X
        local trackAbsSize = track.AbsoluteSize.X
        if trackAbsSize <= 0 then return end
        
        local ratio = math.clamp((inputX - trackAbsPos) / trackAbsSize, 0, 1)
        local rawVal = self._min + (ratio * (self._max - self._min))
        self:SetValue(rawVal, true)
    end
    
    local trackDown = track.MouseButton1Down:Connect(function()
        if self._disabled then return end
        self._dragging = true
        self._tooltip.Visible = true
        local mousePos = UserInputService:GetMouseLocation().X
        updateFromInput(mousePos)
    end)
    
    local inputChangedConn = UserInputService.InputChanged:Connect(function(input)
        if self._dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            updateFromInput(input.Position.X)
        end
    end)
    
    local inputEndedConn = UserInputService.InputEnded:Connect(function(input)
        if self._dragging and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
            self._dragging = false
            self._tooltip.Visible = false
        end
    end)
    
    if cleanup then
        cleanup:Add(trackDown)
        cleanup:Add(inputChangedConn)
        cleanup:Add(inputEndedConn)
        cleanup:Add(container)
    end
    
    self:SetValue(defaultVal, false)
    return self
end

function Slider:GetValue()
    return self._value
end

function Slider:SetValue(val, fireCallback)
    local clamped = math.clamp(val, self._min, self._max)
    if self._step > 0 then
        local steps = math.round((clamped - self._min) / self._step)
        clamped = self._min + (steps * self._step)
    end
    clamped = math.clamp(clamped, self._min, self._max)
    
    self._value = clamped
    
    local ratio = (self._value - self._min) / (self._max - self._min)
    if self._max == self._min then ratio = 1 end
    
    self._fill.Size = UDim2.new(ratio, 0, 1, 0)
    
    local displayStr
    if self._step >= 1 then
        displayStr = string.format("%d", math.round(self._value))
    else
        displayStr = string.format("%.2f", self._value)
    end
    self._valueLabel.Text = displayStr .. self._suffix
    self._ttText.Text = displayStr
    
    if fireCallback ~= false then
        task.spawn(self._callback, self._value)
    end
end

function Slider:SetText(text)
    self._label.Text = tostring(text)
end

function Slider:Destroy()
    if self._container then
        self._container:Destroy()
        self._container = nil
    end
end

return Slider
