--[[
    LiyHub UI - Mobile Pin Tab Component
    A floating, draggable capsule pill button designed for mobile & desktop touch.
    Enables quick toggling of the main window with smooth tween animations.
]]

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local GuiService = game:GetService("GuiService")

local MobilePin = {}
MobilePin.__index = MobilePin

function MobilePin.new(screenGui, window, options, theme, cleanup)
    options = options or {}
    local titleText = options.Title or "LiyHub"
    local openSubText = options.OpenText or "Tap to Open"
    local closeSubText = options.CloseText or "Tap to Close"
    local logoAsset = options.Logo or options.Icon or "rbxassetid://6031075936" -- Sparkle / Logo
    local initialPos = options.Position or UDim2.new(0.5, -70, 0, 18)
    
    local container = Instance.new("TextButton")
    container.Name = "LiyHub_MobilePin"
    container.Size = UDim2.new(0, 140, 0, 38)
    container.Position = initialPos
    container.BackgroundColor3 = theme.Header or Color3.fromRGB(18, 18, 22)
    container.AutoButtonColor = false
    container.Text = ""
    container.BorderSizePixel = 0
    container.ZIndex = 200
    container.Active = true
    container.Modal = true
    container.Parent = screenGui
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(1, 0) -- Fully rounded capsule pill
    corner.Parent = container
    
    -- Logo Icon on left
    local iconBg = Instance.new("Frame")
    iconBg.Name = "IconBg"
    iconBg.Size = UDim2.new(0, 26, 0, 26)
    iconBg.Position = UDim2.new(0, 8, 0.5, -13)
    iconBg.BackgroundColor3 = theme.Element or Color3.fromRGB(26, 26, 31)
    iconBg.BorderSizePixel = 0
    iconBg.ZIndex = 201
    iconBg.Parent = container
    
    local ibCorner = Instance.new("UICorner")
    ibCorner.CornerRadius = UDim.new(1, 0)
    ibCorner.Parent = iconBg
    
    local iconImg = Instance.new("ImageLabel")
    iconImg.Name = "Logo"
    iconImg.Size = UDim2.new(0, 16, 0, 16)
    iconImg.Position = UDim2.new(0.5, -8, 0.5, -8)
    iconImg.BackgroundTransparency = 1
    iconImg.Image = logoAsset
    iconImg.ImageColor3 = theme.TextPrimary
    iconImg.ZIndex = 202
    iconImg.Parent = iconBg
    
    -- Text Container
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(1, -44, 0, 15)
    titleLabel.Position = UDim2.new(0, 40, 0, 5)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = titleText
    titleLabel.TextColor3 = theme.TextPrimary
    titleLabel.Font = theme.FontBold
    titleLabel.TextSize = 12
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.ZIndex = 201
    titleLabel.Parent = container
    
    local subLabel = Instance.new("TextLabel")
    subLabel.Name = "Subtitle"
    subLabel.Size = UDim2.new(1, -44, 0, 13)
    subLabel.Position = UDim2.new(0, 40, 0, 20)
    subLabel.BackgroundTransparency = 1
    subLabel.Text = openSubText
    subLabel.TextColor3 = theme.TextSecondary
    subLabel.Font = theme.FontRegular
    subLabel.TextSize = 10
    subLabel.TextXAlignment = Enum.TextXAlignment.Left
    subLabel.ZIndex = 201
    subLabel.Parent = container
    
    local self = setmetatable({
        _container = container,
        _iconImg = iconImg,
        _titleLabel = titleLabel,
        _subLabel = subLabel,
        _window = window,
        _theme = theme,
        _openSubText = openSubText,
        _closeSubText = closeSubText,
        _dragging = false,
        _hasDragged = false,
        _visible = true,
    }, MobilePin)
    
    -- Dragging with Boundary Clamping
    local dragStart = Vector3.zero
    local startPos = container.Position
    local isDragging = false
    local wasDragged = false
    
    local inputBeganConn = container.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            isDragging = true
            wasDragged = false
            dragStart = input.Position
            startPos = container.Position
        end
    end)
    
    local inputChangedConn = UserInputService.InputChanged:Connect(function(input)
        if isDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            if math.abs(delta.X) > 6 or math.abs(delta.Y) > 6 then
                wasDragged = true
                local newX = startPos.X.Offset + delta.X
                local newY = startPos.Y.Offset + delta.Y
                
                -- Clamp to viewport bounds
                local camera = workspace.CurrentCamera
                if camera then
                    local vpSize = camera.ViewportSize
                    newX = math.clamp(newX, 0, math.max(0, vpSize.X - container.AbsoluteSize.X))
                    newY = math.clamp(newY, 0, math.max(0, vpSize.Y - container.AbsoluteSize.Y))
                end
                
                container.Position = UDim2.new(0, newX, 0, newY)
            end
        end
    end)
    
    local inputEndedConn = UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            isDragging = false
            task.delay(0.08, function()
                wasDragged = false
            end)
        end
    end)
    
    -- Universal Activated Event (Modern cross-platform click + tap)
    local clickConn = container.Activated:Connect(function()
        if wasDragged then
            wasDragged = false
            return
        end
        
        -- Bounce animation
        TweenService:Create(container, TweenInfo.new(0.08, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 146, 0, 40)
        }):Play()
        task.delay(0.08, function()
            if container and container.Parent then
                TweenService:Create(container, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    Size = UDim2.new(0, 140, 0, 38)
                }):Play()
            end
        end)
        
        if self._window then
            self._window:Toggle()
            self:UpdateState()
        end
    end)
    
    if cleanup then
        cleanup:Add(inputBeganConn)
        cleanup:Add(inputChangedConn)
        cleanup:Add(inputEndedConn)
        cleanup:Add(clickConn)
        cleanup:Add(container)
    end
    
    self:UpdateState()
    return self
end

function MobilePin:UpdateState()
    if not self._window or not self._window._mainFrame then return end
    local isWinVisible = self._window._mainFrame.Visible
    self._subLabel.Text = isWinVisible and self._closeSubText or self._openSubText
end

function MobilePin:SetVisible(visible)
    self._visible = visible == true
    self._container.Visible = self._visible
end

function MobilePin:SetText(title, subtitle)
    if title then self._titleLabel.Text = tostring(title) end
    if subtitle then self._subLabel.Text = tostring(subtitle) end
end

function MobilePin:SetLogo(assetId)
    self._iconImg.Image = tostring(assetId)
end

function MobilePin:Destroy()
    if self._container then
        self._container:Destroy()
        self._container = nil
    end
end

return MobilePin

