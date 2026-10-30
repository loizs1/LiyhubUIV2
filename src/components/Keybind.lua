local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local Keybind = {}
Keybind.__index = Keybind

function Keybind.new(parent, options, theme, cleanup)
    options = options or {}
    local text = options.Text or options.Name or "Keybind"
    local defaultKey = options.Default or Enum.KeyCode.RightControl
    local callback = options.Callback or options.OnChange or function() end
    local onTrigger = options.OnTrigger or function() end
    
    local container = Instance.new("Frame")
    container.Name = "Keybind_" .. text
    container.Size = UDim2.new(1, 0, 0, theme.ElementHeight or 36)
    container.BackgroundColor3 = theme.Element
    container.BorderSizePixel = 0
    container.Parent = parent
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = theme.CornerRadius
    corner.Parent = container
    
    local label = Instance.new("TextLabel")
    label.Name = "Label"
    label.Size = UDim2.new(0.6, 0, 1, 0)
    label.Position = UDim2.new(0, 12, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = theme.TextPrimary
    label.Font = theme.FontBold
    label.TextSize = theme.FontSizeRegular
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = container
    
    local keyButton = Instance.new("TextButton")
    keyButton.Name = "KeyButton"
    keyButton.Size = UDim2.new(0.4, -20, 0, 24)
    keyButton.Position = UDim2.new(0.6, 10, 0.5, -12)
    keyButton.BackgroundColor3 = theme.Card
    keyButton.AutoButtonColor = false
    keyButton.Text = defaultKey.Name
    keyButton.TextColor3 = theme.TextPrimary
    keyButton.Font = theme.FontBold
    keyButton.TextSize = theme.FontSizeSmall
    keyButton.BorderSizePixel = 0
    keyButton.Parent = container
    
    local keyCorner = Instance.new("UICorner")
    keyCorner.CornerRadius = theme.SmallCornerRadius
    keyCorner.Parent = keyButton
    
    local self = setmetatable({
        _container = container,
        _label = label,
        _keyButton = keyButton,
        _theme = theme,
        _key = defaultKey,
        _listening = false,
        _callback = callback,
        _onTrigger = onTrigger,
        _disabled = false,
    }, Keybind)
    
    local keyClickConn = keyButton.Activated:Connect(function()
        if self._disabled then return end
        self._listening = true
        self._keyButton.Text = "..."
        TweenService:Create(self._keyButton, TweenInfo.new(theme.AnimationFast), {
            BackgroundColor3 = theme.ElementActive
        }):Play()
    end)
    
    local inputBeganConn = UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if self._listening then
            if input.UserInputType == Enum.UserInputType.Keyboard then
                self._listening = false
                if input.KeyCode ~= Enum.KeyCode.Unknown then
                    self:SetValue(input.KeyCode, true)
                else
                    self:SetValue(self._key, false)
                end
                TweenService:Create(self._keyButton, TweenInfo.new(theme.AnimationFast), {
                    BackgroundColor3 = theme.Card
                }):Play()
            end
        else
            if not gameProcessed and input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == self._key then
                task.spawn(self._onTrigger)
            end
        end
    end)
    
    if cleanup then
        cleanup:Add(keyClickConn)
        cleanup:Add(inputBeganConn)
        cleanup:Add(container)
    end
    
    return self
end

function Keybind:GetValue()
    return self._key
end

function Keybind:SetValue(keyCode, fireCallback)
    if typeof(keyCode) == "EnumItem" and keyCode.EnumType == Enum.KeyCode then
        self._key = keyCode
        self._keyButton.Text = keyCode.Name
        if fireCallback ~= false then
            task.spawn(self._callback, self._key)
        end
    end
end

function Keybind:SetText(text)
    self._label.Text = tostring(text)
end

function Keybind:Destroy()
    if self._container then
        self._container:Destroy()
        self._container = nil
    end
end

return Keybind
