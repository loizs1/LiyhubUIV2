local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local Slider = {}
Slider.__index = Slider

local function formatValue(val, step, suffix, decimals)
    local dec = decimals
    if not dec then
        local stepStr = tostring(step)
        local dot = string.find(stepStr, "%.")
        if dot then
            dec = #stepStr - dot
        else
            dec = 0
        end
    end
    local formatted = (dec > 0) and string.format("%." .. dec .. "f", val) or tostring(math.floor(val + 0.5))
    local sfx = suffix or ""
    if sfx ~= "" and string.sub(sfx, 1, 1) ~= "%" and string.sub(sfx, 1, 1) ~= " " then
        sfx = " " .. sfx
    end
    return formatted .. sfx
end

function Slider.new(parent, options, theme, cleanup)
    options = options or {}
    local text = options.Title or options.Text or options.Name or "Slider"
    local minVal = options.Min or 0
    local maxVal = options.Max or 100
    if maxVal <= minVal then
        maxVal = minVal + 1
    end
    local stepVal = options.Step or 1
    local defaultVal = options.Default or minVal
    local suffix = options.Suffix or options.Unit or ""
    local decimals = options.Decimals
    local callback = options.Callback or options.OnChange or function() end
    local customGradient = options.Gradient
    
    local container = Instance.new("Frame")
    container.Name = "Slider_" .. text
    container.Size = UDim2.new(1, 0, 0, 56)
    container.BackgroundColor3 = theme.Element
    container.BorderSizePixel = 0
    container.ClipsDescendants = false
    container.Parent = parent
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = theme.SmallCornerRadius or UDim.new(0, 6)
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
    label.Size = UDim2.new(1, -20, 0, 16)
    label.Position = UDim2.new(0, 10, 0, 5)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = theme.TextPrimary
    label.Font = theme.FontBold
    label.TextSize = theme.FontSizeSmall or 12
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = container
    
    local track = Instance.new("TextButton")
    track.Name = "Track"
    track.Size = UDim2.new(1, -20, 0, 24)
    track.Position = UDim2.new(0, 10, 0, 25)
    track.BackgroundColor3 = Color3.fromRGB(20, 22, 30)
    track.AutoButtonColor = false
    track.Text = ""
    track.BorderSizePixel = 0
    track.ClipsDescendants = true
    track.Parent = container
    
    local trackCorner = Instance.new("UICorner")
    trackCorner.CornerRadius = UDim.new(0, 6)
    trackCorner.Parent = track
    
    local trackStroke = Instance.new("UIStroke")
    trackStroke.Name = "TrackStroke"
    trackStroke.Color = Color3.fromRGB(36, 40, 56)
    trackStroke.Thickness = 1
    trackStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    trackStroke.Parent = track
    
    local fill = Instance.new("Frame")
    fill.Name = "Fill"
    fill.Size = UDim2.new(0, 0, 1, 0)
    fill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    fill.BorderSizePixel = 0
    fill.ZIndex = 2
    fill.Parent = track
    
    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(0, 6)
    fillCorner.Parent = fill
    
    local fillGrad = Instance.new("UIGradient")
    fillGrad.Name = "FillGradient"
    fillGrad.Color = customGradient or ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(215, 220, 235)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255)),
    })
    fillGrad.Parent = fill
    
    local initRel = math.clamp((defaultVal - minVal) / (maxVal - minVal), 0, 1)
    
    local valueLabel = Instance.new("TextLabel")
    valueLabel.Name = "ValueLabel"
    valueLabel.Size = UDim2.new(0, 100, 1, 0)
    valueLabel.Position = UDim2.new(1, -12, 0.5, 0)
    valueLabel.AnchorPoint = Vector2.new(1, 0.5)
    valueLabel.BackgroundTransparency = 1
    valueLabel.Text = formatValue(defaultVal, stepVal, suffix, decimals)
    valueLabel.TextColor3 = (initRel > 0.72) and Color3.fromRGB(16, 17, 24) or Color3.fromRGB(240, 245, 255)
    valueLabel.Font = theme.FontBold
    valueLabel.TextSize = 12
    valueLabel.TextXAlignment = Enum.TextXAlignment.Right
    valueLabel.ZIndex = 10
    valueLabel.Parent = track
    
    local self = setmetatable({
        _container = container,
        _label = label,
        _valueLabel = valueLabel,
        _track = track,
        _fill = fill,
        _theme = theme,
        _min = minVal,
        _max = maxVal,
        _step = stepVal,
        _suffix = suffix,
        _decimals = decimals,
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
        valueLabel.Text = formatValue(quantized, self._step, self._suffix, self._decimals)
        valueLabel.TextColor3 = (finalRel > 0.72) and Color3.fromRGB(16, 17, 24) or Color3.fromRGB(240, 245, 255)
        task.spawn(self._callback, quantized)
    end
    
    fill.Size = UDim2.new(initRel, 0, 1, 0)
    
    local trackDown = track.MouseButton1Down:Connect(function()
        if self._disabled then return end
        self._dragging = true
        local mousePos = UserInputService:GetMouseLocation()
        updateFromInput(mousePos.X)
    end)
    self._trackDown = trackDown
    
    local moveConn = UserInputService.InputChanged:Connect(function(input)
        if self._dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            updateFromInput(input.Position.X)
        end
    end)
    self._moveConn = moveConn
    
    local upConn = UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            if self._dragging then
                self._dragging = false
            end
        end
    end)
    self._upConn = upConn
    
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
    self._valueLabel.Text = formatValue(val, self._step, self._suffix, self._decimals)
    self._valueLabel.TextColor3 = (rel > 0.72) and Color3.fromRGB(16, 17, 24) or Color3.fromRGB(240, 245, 255)
    task.spawn(self._callback, val)
end

function Slider:GetValue()
    return self._value
end

function Slider:Destroy()
    if self._trackDown then
        pcall(function() self._trackDown:Disconnect() end)
        self._trackDown = nil
    end
    if self._moveConn then
        pcall(function() self._moveConn:Disconnect() end)
        self._moveConn = nil
    end
    if self._upConn then
        pcall(function() self._upConn:Disconnect() end)
        self._upConn = nil
    end
    if self._container then
        self._container:Destroy()
        self._container = nil
    end
end

return Slider
