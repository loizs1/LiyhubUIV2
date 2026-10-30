local TweenService = game:GetService("TweenService")

local Toggle = {}
Toggle.__index = Toggle

function Toggle.new(parent, options, theme, cleanup)
    options = options or {}
    local text = options.Text or options.Name or "Toggle"
    local desc = options.Desc or options.Description
    local defaultState = options.Default == true
    local callback = options.Callback or options.OnChange or function() end
    
    local container = Instance.new("TextButton")
    container.Name = "Toggle_" .. text
    container.Size = UDim2.new(1, 0, 0, desc and 46 or (theme.SmallElementHeight or 34))
    container.BackgroundColor3 = theme.Element
    container.AutoButtonColor = false
    container.Text = ""
    container.BorderSizePixel = 0
    container.Active = true
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
    label.Size = UDim2.new(1, -44, 0, 18)
    label.Position = UDim2.new(0, 10, 0, desc and 6 or 8)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = theme.TextPrimary
    label.Font = theme.FontBold
    label.TextSize = 11
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Active = false
    label.Parent = container
    
    local descLabel = nil
    if desc then
        descLabel = Instance.new("TextLabel")
        descLabel.Name = "Description"
        descLabel.Size = UDim2.new(1, -44, 0, 14)
        descLabel.Position = UDim2.new(0, 10, 0, 26)
        descLabel.BackgroundTransparency = 1
        descLabel.Text = desc
        descLabel.TextColor3 = theme.TextMuted
        descLabel.Font = theme.FontRegular
        descLabel.TextSize = theme.FontSizeSmall
        descLabel.TextXAlignment = Enum.TextXAlignment.Left
        descLabel.TextTruncate = Enum.TextTruncate.AtEnd
        descLabel.Active = false
        descLabel.Parent = container
    end
    
    local switch = Instance.new("Frame")
    switch.Name = "Switch"
    switch.Size = UDim2.new(0, 32, 0, 16)
    switch.Position = UDim2.new(1, -40, 0.5, -8)
    switch.BackgroundColor3 = defaultState and theme.ToggleActive or theme.ToggleInactive
    switch.BorderSizePixel = 0
    switch.Active = false
    switch.Parent = container
    
    local switchCorner = Instance.new("UICorner")
    switchCorner.CornerRadius = UDim.new(1, 0)
    switchCorner.Parent = switch
    
    local switchStroke = Instance.new("UIStroke")
    switchStroke.Name = "SwitchStroke"
    switchStroke.Color = defaultState and theme.ToggleActive or theme.ToggleBorderInactive
    switchStroke.Thickness = 1
    switchStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    switchStroke.Parent = switch
    
    local knob = Instance.new("Frame")
    knob.Name = "Knob"
    knob.Size = UDim2.new(0, 12, 0, 12)
    knob.Position = defaultState and UDim2.new(1, -14, 0.5, -6) or UDim2.new(0, 2, 0.5, -6)
    knob.BackgroundColor3 = defaultState and theme.ToggleKnob or theme.ToggleKnobInactive
    knob.BorderSizePixel = 0
    knob.Active = false
    knob.Parent = switch
    
    local knobCorner = Instance.new("UICorner")
    knobCorner.CornerRadius = UDim.new(1, 0)
    knobCorner.Parent = knob
    
    local self = setmetatable({
        _container = container,
        _label = label,
        _switch = switch,
        _switchStroke = switchStroke,
        _knob = knob,
        _theme = theme,
        _state = defaultState,
        _callback = callback,
        _disabled = false,
    }, Toggle)
    
    local function updateVisual(animate)
        local animTime = animate and theme.AnimationFast or 0
        local targetSwitchColor = self._state and theme.ToggleActive or theme.ToggleInactive
        local targetStrokeColor = self._state and theme.ToggleActive or theme.ToggleBorderInactive
        local targetKnobColor = self._state and theme.ToggleKnob or theme.ToggleKnobInactive
        local targetKnobPos = self._state and UDim2.new(1, -14, 0.5, -6) or UDim2.new(0, 2, 0.5, -6)
        
        if animTime > 0 then
            TweenService:Create(switch, TweenInfo.new(animTime), { BackgroundColor3 = targetSwitchColor }):Play()
            TweenService:Create(switchStroke, TweenInfo.new(animTime), { Color = targetStrokeColor }):Play()
            TweenService:Create(knob, TweenInfo.new(animTime), {
                BackgroundColor3 = targetKnobColor,
                Position = targetKnobPos,
            }):Play()
        else
            switch.BackgroundColor3 = targetSwitchColor
            switchStroke.Color = targetStrokeColor
            knob.BackgroundColor3 = targetKnobColor
            knob.Position = targetKnobPos
        end
    end
    
    local lastToggle = 0
    local function toggleState()
        local now = os.clock()
        if now - lastToggle < 0.12 then return end
        lastToggle = now
        if self._disabled then return end
        self._state = not self._state
        updateVisual(true)
        task.spawn(self._callback, self._state)
    end
    
    local clickConn = container.Activated:Connect(toggleState)
    
    if cleanup then
        cleanup:Add(clickConn)
        cleanup:Add(container)
    end
    
    return self
end

function Toggle:SetValue(state)
    self._state = state == true
    local animTime = self._theme.AnimationFast or 0.15
    local targetSwitchColor = self._state and self._theme.ToggleActive or self._theme.ToggleInactive
    local targetStrokeColor = self._state and self._theme.ToggleActive or self._theme.ToggleBorderInactive
    local targetKnobColor = self._state and self._theme.ToggleKnob or self._theme.ToggleKnobInactive
    local targetKnobPos = self._state and UDim2.new(1, -14, 0.5, -6) or UDim2.new(0, 2, 0.5, -6)
    
    TweenService:Create(self._switch, TweenInfo.new(animTime), { BackgroundColor3 = targetSwitchColor }):Play()
    TweenService:Create(self._switchStroke, TweenInfo.new(animTime), { Color = targetStrokeColor }):Play()
    TweenService:Create(self._knob, TweenInfo.new(animTime), {
        BackgroundColor3 = targetKnobColor,
        Position = targetKnobPos,
    }):Play()
    task.spawn(self._callback, self._state)
end

function Toggle:GetValue()
    return self._state
end

function Toggle:Destroy()
    if self._container then
        self._container:Destroy()
    end
end

return Toggle
