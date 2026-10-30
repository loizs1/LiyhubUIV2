--[[
    LiyHub UI - Button Component
    A sleek, matte interactive button with smooth hover and click animations.
]]

local TweenService = game:GetService("TweenService")

local Button = {}
Button.__index = Button

function Button.new(parent, options, theme, cleanup)
    options = options or {}
    local text = options.Text or options.Name or "Button"
    local callback = options.Callback or options.OnClick or function() end
    local icon = options.Icon
    
    local container = Instance.new("TextButton")
    container.Name = "Button_" .. text
    container.Size = UDim2.new(1, 0, 0, theme.ElementHeight or 34)
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
    label.Size = UDim2.new(1, -20, 1, 0)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = theme.TextPrimary
    label.Font = theme.FontBold
    label.TextSize = theme.FontSizeRegular
    label.TextXAlignment = Enum.TextXAlignment.Center
    label.Parent = container
    
    local self = setmetatable({
        _container = container,
        _label = label,
        _theme = theme,
        _callback = callback,
        _disabled = false,
    }, Button)
    
    -- Hover / Click animations
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
    
    local downConn = container.MouseButton1Down:Connect(function()
        if self._disabled then return end
        TweenService:Create(container, TweenInfo.new(theme.AnimationFast), {
            BackgroundColor3 = theme.ElementActive
        }):Play()
    end)
    
    local upConn = container.MouseButton1Up:Connect(function()
        if self._disabled then return end
        TweenService:Create(container, TweenInfo.new(theme.AnimationFast), {
            BackgroundColor3 = theme.ElementHover
        }):Play()
    end)
    
    local clickConn = container.Activated:Connect(function()
        if self._disabled then return end
        task.spawn(self._callback)
    end)
    
    if cleanup then
        cleanup:Add(hoverConn)
        cleanup:Add(leaveConn)
        cleanup:Add(downConn)
        cleanup:Add(upConn)
        cleanup:Add(clickConn)
        cleanup:Add(container)
    end
    
    return self
end

function Button:SetText(newText)
    self._label.Text = tostring(newText)
end

function Button:SetCallback(newCallback)
    assert(type(newCallback) == "function", "Callback must be a function")
    self._callback = newCallback
end

function Button:SetDisabled(state)
    self._disabled = state == true
    if self._disabled then
        self._container.BackgroundColor3 = self._theme.Element
        self._label.TextColor3 = self._theme.TextDisabled
    else
        self._label.TextColor3 = self._theme.TextPrimary
    end
end

function Button:Destroy()
    if self._container then
        self._container:Destroy()
        self._container = nil
    end
end

return Button

