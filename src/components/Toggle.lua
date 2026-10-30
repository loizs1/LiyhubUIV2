--[[
    LiyHub UI - Toggle Component
    An animated switch toggle with synchronized internal state, GetValue, and SetValue.
]]

local TweenService = game:GetService("TweenService")

local Toggle = {}
Toggle.__index = Toggle

function Toggle.new(parent, options, theme, cleanup)
    options = options or {}
    local text = options.Text or options.Name or "Toggle"
    local defaultState = options.Default == true
    local callback = options.Callback or options.OnChange or function() end
    
    local container = Instance.new("TextButton")
    container.Name = "Toggle_" .. text
    container.Size = UDim2.new(1, 0, 0, theme.ElementHeight or 36)
    container.BackgroundColor3 = theme.Element
    container.AutoButtonColor = false
    container.Text = ""
    container.BorderSizePixel = 0
    container.Parent = parent
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = theme.CornerRadius
    corner.Parent = container
    
    local label = Instance.new("TextLabel")
    label.Name = "Label"
    label.Size = UDim2.new(1, -60, 1, 0)
    label.Position = UDim2.new(0, 12, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = theme.TextPrimary
    label.Font = theme.FontRegular
    label.TextSize = theme.FontSizeRegular
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = container
    
    -- Switch Pill Container
    local switch = Instance.new("Frame")
    switch.Name = "Switch"
    switch.Size = UDim2.new(0, 40, 0, 20)
    switch.Position = UDim2.new(1, -50, 0.5, -10)
    switch.BackgroundColor3 = defaultState and theme.ToggleActive or theme.ToggleInactive
    switch.BorderSizePixel = 0
    switch.Parent = container
    
    local switchCorner = Instance.new("UICorner")
    switchCorner.CornerRadius = UDim.new(1, 0)
    switchCorner.Parent = switch
    
    -- Switch Knob
    local knob = Instance.new("Frame")
    knob.Name = "Knob"
    knob.Size = UDim2.new(0, 14, 0, 14)
    knob.Position = defaultState and UDim2.new(1, -17, 0.5, -7) or UDim2.new(0, 3, 0.5, -7)
    knob.BackgroundColor3 = defaultState and theme.ToggleKnob or theme.ToggleKnobInactive
    knob.BorderSizePixel = 0
    knob.Parent = switch
    
    local knobCorner = Instance.new("UICorner")
    knobCorner.CornerRadius = UDim.new(1, 0)
    knobCorner.Parent = knob
    
    local self = setmetatable({
        _container = container,
        _label = label,
        _switch = switch,
        _knob = knob,
        _theme = theme,
        _state = defaultState,
        _callback = callback,
        _disabled = false,
    }, Toggle)
    
    local function updateVisual(animate)
        local animTime = animate and theme.AnimationFast or 0
        local targetSwitchColor = self._state and theme.ToggleActive or theme.ToggleInactive
        local targetKnobColor = self._state and theme.ToggleKnob or theme.ToggleKnobInactive
        local targetKnobPos = self._state and UDim2.new(1, -17, 0.5, -7) or UDim2.new(0, 3, 0.5, -7)
        
        if animTime > 0 then
            TweenService:Create(switch, TweenInfo.new(animTime), {
                BackgroundColor3 = targetSwitchColor
            }):Play()
            TweenService:Create(knob, TweenInfo.new(animTime), {
                BackgroundColor3 = targetKnobColor,
                Position = targetKnobPos,
            }):Play()
        else
            switch.BackgroundColor3 = targetSwitchColor
            knob.BackgroundColor3 = targetKnobColor
            knob.Position = targetKnobPos
        end
    end
    
    -- Hover effect
    local hoverConn = container.MouseEnter:Connect(function()
        if self._disabled then return end
        TweenService:Create(container, TweenInfo.new(theme.AnimationFast), {
            BackgroundColor3 = theme.ElementHover
        }):Play()
    end)
    
    local leaveConn = container.MouseLeave:Connect(function()
        if self._disabled then return end
        TweenService:Create(container, TweenInfo.new(theme.AnimationFast), {
            BackgroundColor3 = theme.Element
        }):Play()
    end)
    
    local clickConn = container.Activated:Connect(function()
        if self._disabled then return end
        self:SetValue(not self._state, true)
    end)
    
    if cleanup then
        cleanup:Add(hoverConn)
        cleanup:Add(leaveConn)
        cleanup:Add(clickConn)
        cleanup:Add(container)
    end
    
    return self
end

function Toggle:GetValue()
    return self._state
end

function Toggle:SetValue(value, fireCallback)
    value = (value == true)
    if self._state == value and fireCallback == nil then return end
    
    self._state = value
    local targetSwitchColor = self._state and self._theme.ToggleActive or self._theme.ToggleInactive
    local targetKnobColor = self._state and self._theme.ToggleKnob or self._theme.ToggleKnobInactive
    local targetKnobPos = self._state and UDim2.new(1, -17, 0.5, -7) or UDim2.new(0, 3, 0.5, -7)
    
    TweenService:Create(self._switch, TweenInfo.new(self._theme.AnimationFast), {
        BackgroundColor3 = targetSwitchColor
    }):Play()
    TweenService:Create(self._knob, TweenInfo.new(self._theme.AnimationFast), {
        BackgroundColor3 = targetKnobColor,
        Position = targetKnobPos,
    }):Play()
    
    if fireCallback ~= false then
        task.spawn(self._callback, self._state)
    end
end

function Toggle:SetText(text)
    self._label.Text = tostring(text)
end

function Toggle:SetDisabled(state)
    self._disabled = state == true
    if self._disabled then
        self._label.TextColor3 = self._theme.TextDisabled
    else
        self._label.TextColor3 = self._theme.TextPrimary
    end
end

function Toggle:Destroy()
    if self._container then
        self._container:Destroy()
        self._container = nil
    end
end

return Toggle

