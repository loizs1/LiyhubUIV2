local TweenService = game:GetService("TweenService")

local Input = {}
Input.__index = Input

function Input.new(parent, options, theme, cleanup)
    options = options or {}
    local text = options.Text or options.Name or "Input"
    local placeholder = options.Placeholder or "Type here..."
    local defaultText = options.Default or ""
    local clearOnFocus = options.ClearOnFocus == true
    local callback = options.Callback or options.OnChange or function() end
    local onSubmit = options.OnSubmit or options.OnEnter or function() end
    
    local container = Instance.new("Frame")
    container.Name = "Input_" .. text
    container.Size = UDim2.new(1, 0, 0, theme.ElementHeight or 36)
    container.BackgroundColor3 = theme.Element
    container.BorderSizePixel = 0
    container.Parent = parent
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = theme.CornerRadius
    corner.Parent = container
    
    local label = Instance.new("TextLabel")
    label.Name = "Label"
    label.Size = UDim2.new(0.45, 0, 1, 0)
    label.Position = UDim2.new(0, 12, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = theme.TextPrimary
    label.Font = theme.FontBold
    label.TextSize = theme.FontSizeRegular
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = container
    
    local boxBg = Instance.new("Frame")
    boxBg.Name = "BoxBackground"
    boxBg.Size = UDim2.new(0.55, -20, 0, 26)
    boxBg.Position = UDim2.new(0.45, 8, 0.5, -13)
    boxBg.BackgroundColor3 = theme.Card
    boxBg.BorderSizePixel = 0
    boxBg.Parent = container
    
    local boxCorner = Instance.new("UICorner")
    boxCorner.CornerRadius = theme.SmallCornerRadius
    boxCorner.Parent = boxBg
    
    local textBox = Instance.new("TextBox")
    textBox.Name = "TextBox"
    textBox.Size = UDim2.new(1, -12, 1, 0)
    textBox.Position = UDim2.new(0, 6, 0, 0)
    textBox.BackgroundTransparency = 1
    textBox.Text = defaultText
    textBox.PlaceholderText = placeholder
    textBox.PlaceholderColor3 = theme.TextMuted
    textBox.TextColor3 = theme.TextPrimary
    textBox.Font = theme.FontRegular
    textBox.TextSize = theme.FontSizeSmall
    textBox.ClearTextOnFocus = clearOnFocus
    textBox.TextXAlignment = Enum.TextXAlignment.Left
    textBox.Parent = boxBg
    
    local self = setmetatable({
        _container = container,
        _label = label,
        _boxBg = boxBg,
        _textBox = textBox,
        _theme = theme,
        _value = defaultText,
        _callback = callback,
        _onSubmit = onSubmit,
        _disabled = false,
    }, Input)
    
    local focusInConn = textBox.Focused:Connect(function()
        if self._disabled then return end
        TweenService:Create(boxBg, TweenInfo.new(theme.AnimationFast), {
            BackgroundColor3 = theme.ElementActive
        }):Play()
    end)
    
    local focusLostConn = textBox.FocusLost:Connect(function(enterPressed)
        if self._disabled then return end
        TweenService:Create(boxBg, TweenInfo.new(theme.AnimationFast), {
            BackgroundColor3 = theme.Card
        }):Play()
        
        self._value = textBox.Text
        task.spawn(self._callback, self._value)
        if enterPressed then
            task.spawn(self._onSubmit, self._value)
        end
    end)
    
    if cleanup then
        cleanup:Add(focusInConn)
        cleanup:Add(focusLostConn)
        cleanup:Add(container)
    end
    
    return self
end

function Input:GetValue()
    return self._value
end

function Input:SetValue(val, fireCallback)
    self._value = tostring(val or "")
    self._textBox.Text = self._value
    if fireCallback ~= false then
        task.spawn(self._callback, self._value)
    end
end

function Input:SetPlaceholder(text)
    self._textBox.PlaceholderText = tostring(text)
end

function Input:Destroy()
    if self._container then
        self._container:Destroy()
        self._container = nil
    end
end

return Input
