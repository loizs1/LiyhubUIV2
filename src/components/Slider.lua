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
    container.ClipsDescendants = false
    container.Parent = parent
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = theme.SmallCornerRadius or UDim.new(0, 5)
    corner.Parent = container
    
    if theme.UseStrokes then
        local stroke = Instance.new("UIStroke")
        stroke.Name = "BorderStroke"
        stroke.Color = theme.Border
        stroke.Thickness = 1
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Parent = container
    end
    
    local label = Instance.new("TextLabel")
    label.Name = "Label"
    label.Size = UDim2.new(0.65, 0, 0, 18)
    label.Position = UDim2.new(0, 10, 0, 7)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = theme.TextPrimary
    label.Font = theme.FontBold
    label.TextSize = theme.FontSizeRegular
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = container
    
    local valueBadge = Instance.new("Frame")
    valueBadge.Name = "ValueBadge"
    valueBadge.Size = UDim2.new(0, 36, 0, 18)
    valueBadge.Position = UDim2.new(1, -46, 0, 7)
    valueBadge.BackgroundColor3 = theme.Card
    valueBadge.BorderSizePixel = 0
    valueBadge.Parent = container
    
    local vbCorner = Instance.new("UICorner")
    vbCorner.CornerRadius = theme.SmallCornerRadius or UDim.new(0, 4)
    vbCorner.Parent = valueBadge
    
    if theme.UseStrokes then
        local vbStroke = Instance.new("UIStroke")
        vbStroke.Color = theme.BorderSubtle
        vbStroke.Thickness = 1
        vbStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        vbStroke.Parent = valueBadge
    end
    
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
    
    local track = Instance.new("TextButton")
    track.Name = "Track"
    track.Size = UDim2.new(1, -20, 0, 5)
    track.Position = UDim2.new(0, 10, 0, 32)
    track.BackgroundColor3 = theme.SliderTrack
    track.AutoButtonColor = false
    track.Text = ""
    track.BorderSizePixel = 0
    track.Parent = container
    
    local trackCorner = Instance.new("UICorner")
    trackCorner.CornerRadius = UDim.new(1, 0)
    trackCorner.Parent = track
    
    local fill = Instance.new("Frame")
    fill.Name = "Fill"
    fill.Size = UDim2.new(0, 0, 1, 0)
    fill.BackgroundColor3 = theme.SliderFill
    fill.BorderSizePixel = 0
    fill.Parent = track
    
    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(1, 0)
    fillCorner.Parent = fill
    
    local knob = Instance.new("Frame")
    knob.Name = "Knob"
    knob.Size = UDim2.new(0, 14, 0, 14)
    knob.Position = UDim2.new(1, -7, 0.5, -7)
    knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    knob.BorderSizePixel = 0
    knob.ZIndex = 5
    knob.Parent = fill
    
    local knobCorner = Instance.new("UICorner")
    knobCorner.CornerRadius = UDim.new(1, 0)
    knobCorner.Parent = knob
    
    local tooltip = Instance.new("Frame")
    tooltip.Name = "Tooltip"
    tooltip.Size = UDim2.new(0, 30, 0, 18)
    tooltip.Position = UDim2.new(0.5, -15, 0, -22)
    tooltip.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tooltip.BorderSizePixel = 0
    tooltip.Visible = false
    tooltip.ZIndex = 15
    tooltip.Parent = knob
    
    local ttCorner = Instance.new("UICorner")
    ttCorner.CornerRadius = UDim.new(0, 4)
    ttCorner.Parent = tooltip
    
    local ttText = Instance.new("TextLabel")
    ttText.Name = "Text"
    ttText.Size = UDim2.new(1, 0, 1, 0)
    ttText.BackgroundTransparency = 1
    ttText.Text = tostring(defaultVal)
    ttText.TextColor3 = Color3.fromRGB(14, 14, 16)
    ttText.Font = theme.FontBold
    ttText.TextSize = 10
    ttText.ZIndex = 16
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
        local trackAbsWidth = track.AbsoluteSize.X
        if trackAbsWidth <= 0 then return end
        
        local rel = math.clamp((inputX - trackAbsPos) / trackAbsWidth, 0, 1)
        local rawVal = self._min + (self._max - self._min) * rel
        local quantized = math.floor((rawVal - self._min) / self._step + 0.5) * self._step + self._min
        quantized = math.clamp(quantized, self._min, self._max)
        
        self._value = quantized
        local finalRel = (quantized - self._min) / (self._max - self._min)
        fill.Size = UDim2.new(finalRel, 0, 1, 0)
        valueLabel.Text = tostring(quantized) .. self._suffix
        ttText.Text = tostring(quantized)
        task.spawn(self._callback, quantized)
    end
    
    local initRel = math.clamp((defaultVal - minVal) / (maxVal - minVal), 0, 1)
    fill.Size = UDim2.new(initRel, 0, 1, 0)
    
    local trackDown = track.MouseButton1Down:Connect(function()
        if self._disabled then return end
        self._dragging = true
        tooltip.Visible = true
        local mousePos = UserInputService:GetMouseLocation()
        updateFromInput(mousePos.X)
    end)
    
    local moveConn = UserInputService.InputChanged:Connect(function(input)
        if self._dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            updateFromInput(input.Position.X)
        end
    end)
    
    local upConn = UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            if self._dragging then
                self._dragging = false
                tooltip.Visible = false
            end
        end
    end)
    
    if cleanup then
        cleanup:Add(trackDown)
        cleanup:Add(moveConn)
        cleanup:Add(upConn)
        cleanup:Add(container)
    end
    
    return self
end

function Slider:SetValue(val)
    val = math.clamp(val, self._min, self._max)
    self._value = val
    local rel = (val - self._min) / (self._max - self._min)
    self._fill.Size = UDim2.new(rel, 0, 1, 0)
    self._valueLabel.Text = tostring(val) .. self._suffix
    self._ttText.Text = tostring(val)
    task.spawn(self._callback, val)
end

function Slider:GetValue()
    return self._value
end

function Slider:Destroy()
    if self._container then
        self._container:Destroy()
    end
end

return Slider
