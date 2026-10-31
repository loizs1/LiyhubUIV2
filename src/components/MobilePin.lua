local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local MobilePin = {}
MobilePin.__index = MobilePin

function MobilePin.new(screenGui, window, options, theme, cleanup)
    options = options or {}
    local titleText = options.Title or "LiyHub"
    local openSubText = options.OpenText or "Tap to Open"
    local closeSubText = options.CloseText or "Tap to Close"
    local logoAsset = options.Logo or options.Icon or theme.DefaultLogo or "rbxasset://textures/LiyhubLogo.png"
    local initialPos = options.Position or UDim2.new(0.5, -70, 0, 14)
    local userText = options.User or ""
    
    local isDark = (theme.IsLight ~= true and theme.Name ~= "Pure White")
    local container = Instance.new("TextButton")
    container.Name = "LiyHub_MobilePin"
    container.Size = UDim2.new(0, 0, 0, 32)
    container.AutomaticSize = Enum.AutomaticSize.X
    container.Position = initialPos
    container.BackgroundColor3 = isDark and Color3.fromRGB(16, 17, 20) or Color3.fromRGB(255, 255, 255)
    container.AutoButtonColor = false
    container.Text = ""
    container.BorderSizePixel = 0
    container.ZIndex = 999999
    container.Active = true
    container.Modal = false
    container.Parent = screenGui
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(1, 0)
    corner.Parent = container
    
    local sizeConstraint = Instance.new("UISizeConstraint")
    sizeConstraint.MinSize = Vector2.new(110, 32)
    sizeConstraint.MaxSize = Vector2.new(240, 36)
    sizeConstraint.Parent = container
    
    local pinScale = Instance.new("UIScale")
    pinScale.Name = "PinScale"
    pinScale.Scale = 1.0
    pinScale.Parent = container
    
    local stroke = Instance.new("UIStroke")
    stroke.Name = "BorderStroke"
    stroke.Color = isDark and Color3.fromRGB(36, 38, 46) or Color3.fromRGB(220, 224, 232)
    stroke.Thickness = 1
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    stroke.Parent = container
    
    local iconImg = Instance.new("ImageLabel")
    iconImg.Name = "Logo"
    iconImg.Size = UDim2.fromOffset(20, 20)
    iconImg.Position = UDim2.new(0, 6, 0.5, -10)
    iconImg.BackgroundTransparency = 1
    iconImg.Image = options.Logo or theme.DefaultLogo or "rbxassetid://126257104774952"
    iconImg.ScaleType = Enum.ScaleType.Fit
    iconImg.BorderSizePixel = 0
    iconImg.Active = false
    iconImg.ZIndex = 1000001
    iconImg.Parent = container

    local iconCorner = Instance.new("UICorner")
    iconCorner.CornerRadius = UDim.new(0, 5)
    iconCorner.Parent = iconImg

    local logoStroke = Instance.new("UIStroke")
    logoStroke.Name = "LogoStroke"
    logoStroke.Color = isDark and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(18, 20, 24)
    logoStroke.Thickness = 1
    logoStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    logoStroke.Parent = iconImg
    
    local textContainer = Instance.new("Frame")
    textContainer.Name = "TextContainer"
    textContainer.Size = UDim2.new(0, 0, 1, 0)
    textContainer.AutomaticSize = Enum.AutomaticSize.X
    textContainer.Position = UDim2.new(0, 32, 0, 0)
    textContainer.BackgroundTransparency = 1
    textContainer.Parent = container
    
    local pad = Instance.new("UIPadding")
    pad.PaddingRight = UDim.new(0, 12)
    pad.Parent = textContainer
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(0, 0, 0, 15)
    titleLabel.AutomaticSize = Enum.AutomaticSize.X
    titleLabel.Position = UDim2.new(0, 0, 0, 2)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = titleText
    titleLabel.TextColor3 = isDark and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(18, 20, 24)
    titleLabel.Font = theme.FontBold
    titleLabel.TextSize = 11
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Active = false
    titleLabel.ZIndex = 1000001
    titleLabel.Parent = textContainer
    
    local subLabel = Instance.new("TextLabel")
    subLabel.Name = "Subtitle"
    subLabel.Size = UDim2.new(0, 0, 0, 12)
    subLabel.AutomaticSize = Enum.AutomaticSize.X
    subLabel.Position = UDim2.new(0, 0, 0, 16)
    subLabel.BackgroundTransparency = 1
    subLabel.Text = closeSubText
    subLabel.TextColor3 = isDark and Color3.fromRGB(130, 140, 160) or Color3.fromRGB(130, 136, 148)
    subLabel.Font = theme.FontRegular
    subLabel.TextSize = 9
    subLabel.TextXAlignment = Enum.TextXAlignment.Left
    subLabel.Active = false
    subLabel.ZIndex = 1000001
    subLabel.Parent = textContainer
    
    local self = setmetatable({
        _container = container,
        _window = window,
        _titleLabel = titleLabel,
        _subLabel = subLabel,
        _pinScale = pinScale,
        _openText = openSubText,
        _closeText = closeSubText,
        _userText = userText,
        _theme = theme,
        _dragging = false,
    }, MobilePin)
    
    local dragStart, startPos, dragMoved = nil, nil, false
    local downConn = container.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            self._dragging = true
            dragMoved = false
            dragStart = input.Position
            startPos = container.Position
        end
    end)
    self._downConn = downConn
    
    local moveConn = UserInputService.InputChanged:Connect(function(input)
        if self._dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            if delta.Magnitude > 3 then
                dragMoved = true
            end
            container.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)
    self._moveConn = moveConn
    
    local upConn = UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            if self._dragging then
                self._dragging = false
                if not dragMoved and window then
                    window:Toggle()
                end
            end
        end
    end)
    self._upConn = upConn
    
    if cleanup then
        cleanup:Add(downConn)
        cleanup:Add(moveConn)
        cleanup:Add(upConn)
        cleanup:Add(container)
    end
    
    return self
end

function MobilePin:SetTheme(targetTheme, isDark)
    self._theme = targetTheme
    if self._container then
        self._container.BackgroundColor3 = isDark and Color3.fromRGB(16, 17, 20) or Color3.fromRGB(255, 255, 255)
        local stroke = self._container:FindFirstChildOfClass("UIStroke")
        if stroke then
            stroke.Color = isDark and Color3.fromRGB(36, 38, 46) or Color3.fromRGB(220, 224, 232)
        end
        local logo = self._container:FindFirstChild("Logo")
        local lStroke = logo and logo:FindFirstChildOfClass("UIStroke")
        if lStroke then
            lStroke.Color = isDark and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(18, 20, 24)
        end
    end
    if self._titleLabel then
        self._titleLabel.TextColor3 = isDark and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(18, 20, 24)
    end
    if self._subLabel then
        self._subLabel.TextColor3 = isDark and Color3.fromRGB(130, 140, 160) or Color3.fromRGB(130, 136, 148)
    end
end

function MobilePin:SetVisible(visible)
    self._container.Visible = visible == true
end

function MobilePin:SetUserText(userText)
    self._userText = userText or ""
    self:SetOpenState(not self._container.Visible)
end

function MobilePin:SetScale(scaleFactor)
    local s = tonumber(scaleFactor) or 1.0
    if self._pinScale then
        self._pinScale.Scale = math.clamp(s, 0.7, 1.5)
    end
end

function MobilePin:SetOpenState(isOpen)
    if isOpen then
        self._subLabel.Text = self._closeText
    else
        if self._userText and self._userText ~= "" then
            self._subLabel.Text = self._userText .. " | " .. self._openText
        else
            self._subLabel.Text = self._openText
        end
    end
end

function MobilePin:Destroy()
    if self._downConn then
        pcall(function() self._downConn:Disconnect() end)
        self._downConn = nil
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

return MobilePin
