local TweenService = game:GetService("TweenService")

local Button = {}
Button.__index = Button

function Button.new(parent, options, theme, cleanup)
    local self
    options = options or {}
    local isActionRow = (options.ButtonText ~= nil) or (options.Description ~= nil and options.Title ~= nil)
    local callback = options.Callback or options.OnClick or function() end
    local isPrimary = options.Variant == "Primary" or options.Primary == true or (options.ButtonText ~= nil)
    
    if isActionRow then
        local titleText = options.Title or options.Name or "Action"
        local descText = options.Description or options.Desc or ""
        local btnText = options.ButtonText or options.Text or "Click"
        
        local rowContainer = Instance.new("Frame")
        rowContainer.Name = "ActionRow_" .. titleText
        rowContainer.Size = UDim2.new(1, 0, 0, descText ~= "" and 46 or 36)
        rowContainer.BackgroundColor3 = theme.Element
        rowContainer.BorderSizePixel = 0
        rowContainer.Parent = parent
        
        local rCorner = Instance.new("UICorner")
        rCorner.CornerRadius = theme.SmallCornerRadius or UDim.new(0, 5)
        rCorner.Parent = rowContainer
        
        if theme.UseStrokes then
            local stroke = Instance.new("UIStroke")
            stroke.Name = "BorderStroke"
            stroke.Color = theme.Border
            stroke.Thickness = 1
            stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            stroke.Parent = rowContainer
        end
        
        local titleLabel = Instance.new("TextLabel")
        titleLabel.Name = "Title"
        titleLabel.Size = UDim2.new(1, -90, 0, 18)
        titleLabel.Position = UDim2.new(0, 10, 0, descText ~= "" and 6 or 9)
        titleLabel.BackgroundTransparency = 1
        titleLabel.Text = titleText
        titleLabel.TextColor3 = theme.TextPrimary
        titleLabel.Font = theme.FontBold
        titleLabel.TextSize = theme.FontSizeRegular
        titleLabel.TextXAlignment = Enum.TextXAlignment.Left
        titleLabel.Active = false
        titleLabel.Parent = rowContainer
        
        if descText ~= "" then
            local descLabel = Instance.new("TextLabel")
            descLabel.Name = "Description"
            descLabel.Size = UDim2.new(1, -90, 0, 14)
            descLabel.Position = UDim2.new(0, 10, 0, 25)
            descLabel.BackgroundTransparency = 1
            descLabel.Text = descText
            descLabel.TextColor3 = theme.TextMuted
            descLabel.Font = theme.FontRegular
            descLabel.TextSize = theme.FontSizeSmall
            descLabel.TextXAlignment = Enum.TextXAlignment.Left
            descLabel.TextTruncate = Enum.TextTruncate.AtEnd
            descLabel.Active = false
            descLabel.Parent = rowContainer
        end
        
        local isDark = (theme.IsLight ~= true and theme.Name ~= "Pure White")
        local btnBg = isDark and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(18, 20, 24)
        local btnTextCol = isDark and Color3.fromRGB(14, 14, 16) or Color3.fromRGB(255, 255, 255)

        local actionBtn = Instance.new("TextButton")
        actionBtn.Name = "ActionButton"
        actionBtn.Size = UDim2.new(0, 68, 0, 26)
        actionBtn.Position = UDim2.new(1, -78, 0.5, -13)
        actionBtn.BackgroundColor3 = btnBg
        actionBtn.AutoButtonColor = false
        actionBtn.Text = btnText
        actionBtn.TextColor3 = btnTextCol
        actionBtn.Font = theme.FontBold
        actionBtn.TextSize = theme.FontSizeSmall
        actionBtn.BorderSizePixel = 0
        actionBtn.Active = true
        actionBtn.ZIndex = 5
        actionBtn.Parent = rowContainer
        
        local abCorner = Instance.new("UICorner")
        abCorner.CornerRadius = theme.SmallCornerRadius or UDim.new(0, 4)
        abCorner.Parent = actionBtn
        
        local lastTrigger = 0
        local function trigger()
            local now = os.clock()
            if now - lastTrigger < 0.12 then return end
            lastTrigger = now
            task.spawn(callback)
        end
        local clickConn = actionBtn.Activated:Connect(trigger)
        
        local hConn = actionBtn.MouseEnter:Connect(function()
            local curDark = (self and self._theme and (self._theme.IsLight ~= true and self._theme.Name ~= "Pure White"))
            if curDark == nil then curDark = isDark end
            local curHov = curDark and Color3.fromRGB(230, 230, 235) or Color3.fromRGB(36, 40, 48)
            local anim = (self and self._theme and self._theme.AnimationFast) or theme.AnimationFast
            TweenService:Create(actionBtn, TweenInfo.new(anim), { BackgroundColor3 = curHov }):Play()
        end)
        local lConn = actionBtn.MouseLeave:Connect(function()
            local curDark = (self and self._theme and (self._theme.IsLight ~= true and self._theme.Name ~= "Pure White"))
            if curDark == nil then curDark = isDark end
            local curBg = curDark and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(18, 20, 24)
            local anim = (self and self._theme and self._theme.AnimationFast) or theme.AnimationFast
            TweenService:Create(actionBtn, TweenInfo.new(anim), { BackgroundColor3 = curBg }):Play()
        end)
        
        if cleanup then
            cleanup:Add(clickConn)
            cleanup:Add(hConn)
            cleanup:Add(lConn)
            cleanup:Add(rowContainer)
        end
        
        self = setmetatable({
            _container = rowContainer,
            _actionBtn = actionBtn,
            _theme = theme,
            _callback = callback,
            _conns = { clickConn, hConn, lConn },
        }, Button)
        return self
    end
    
    local text = options.Text or options.Name or "Button"
    local isDark = (theme.IsLight ~= true and theme.Name ~= "Pure White")
    local defaultBg, hoverBg, activeBg, txtColor
    if not isDark then
        defaultBg = Color3.fromRGB(18, 20, 24)
        hoverBg = Color3.fromRGB(36, 40, 48)
        activeBg = Color3.fromRGB(50, 56, 68)
        txtColor = Color3.fromRGB(255, 255, 255)
    else
        defaultBg = isPrimary and Color3.fromRGB(255, 255, 255) or theme.Element
        hoverBg = isPrimary and Color3.fromRGB(235, 235, 240) or theme.ElementHover
        activeBg = isPrimary and Color3.fromRGB(215, 215, 225) or theme.ElementActive
        txtColor = isPrimary and Color3.fromRGB(14, 14, 16) or theme.TextPrimary
    end
    
    local container = Instance.new("TextButton")
    container.Name = "Button_" .. text
    container.Size = UDim2.new(1, 0, 0, theme.SmallElementHeight or 32)
    container.BackgroundColor3 = defaultBg
    container.AutoButtonColor = false
    container.Text = ""
    container.BorderSizePixel = 0
    container.Active = true
    container.Parent = parent
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = theme.SmallCornerRadius or UDim.new(0, 5)
    corner.Parent = container
    
    if theme.UseStrokes and isDark and not isPrimary then
        local stroke = Instance.new("UIStroke")
        stroke.Name = "BorderStroke"
        stroke.Color = theme.Border
        stroke.Thickness = 1
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Parent = container
    end
    
    local label = Instance.new("TextLabel")
    label.Name = "Label"
    label.Size = UDim2.new(1, -16, 1, 0)
    label.Position = UDim2.new(0, 8, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = txtColor
    label.Font = theme.FontBold
    label.TextSize = theme.FontSizeRegular
    label.TextXAlignment = Enum.TextXAlignment.Center
    label.Active = false
    label.Parent = container
    
    self = setmetatable({
        _container = container,
        _label = label,
        _theme = theme,
        _isPrimary = isPrimary,
        _callback = callback,
        _disabled = false,
        _conns = {},
    }, Button)
    
    local hoverConn = container.MouseEnter:Connect(function()
        if self._disabled then return end
        local curDark = (self._theme.IsLight ~= true and self._theme.Name ~= "Pure White")
        local curHover = not curDark and Color3.fromRGB(36, 40, 48) or (self._isPrimary and Color3.fromRGB(235, 235, 240) or self._theme.ElementHover)
        TweenService:Create(container, TweenInfo.new(self._theme.AnimationFast), { BackgroundColor3 = curHover }):Play()
    end)
    local leaveConn = container.MouseLeave:Connect(function()
        if self._disabled then return end
        local curDark = (self._theme.IsLight ~= true and self._theme.Name ~= "Pure White")
        local curBg = not curDark and Color3.fromRGB(18, 20, 24) or (self._isPrimary and Color3.fromRGB(255, 255, 255) or self._theme.Element)
        TweenService:Create(container, TweenInfo.new(self._theme.AnimationFast), { BackgroundColor3 = curBg }):Play()
    end)
    local downConn = container.MouseButton1Down:Connect(function()
        if self._disabled then return end
        local curDark = (self._theme.IsLight ~= true and self._theme.Name ~= "Pure White")
        local curActive = not curDark and Color3.fromRGB(50, 56, 68) or (self._isPrimary and Color3.fromRGB(215, 215, 225) or self._theme.ElementActive)
        TweenService:Create(container, TweenInfo.new(self._theme.AnimationFast), { BackgroundColor3 = curActive }):Play()
    end)
    local upConn = container.MouseButton1Up:Connect(function()
        if self._disabled then return end
        local curDark = (self._theme.IsLight ~= true and self._theme.Name ~= "Pure White")
        local curHover = not curDark and Color3.fromRGB(36, 40, 48) or (self._isPrimary and Color3.fromRGB(235, 235, 240) or self._theme.ElementHover)
        TweenService:Create(container, TweenInfo.new(self._theme.AnimationFast), { BackgroundColor3 = curHover }):Play()
    end)
    
    local lastBtn = 0
    local function triggerBtn()
        local now = os.clock()
        if now - lastBtn < 0.12 then return end
        lastBtn = now
        if self._disabled then return end
        task.spawn(self._callback)
    end
    local clickConn = container.Activated:Connect(triggerBtn)
    
    self._conns = { hoverConn, leaveConn, downConn, upConn, clickConn }
    
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

function Button:SetText(text)
    if self._label then self._label.Text = text end
    if self._actionBtn then self._actionBtn.Text = text end
end

function Button:SetDisabled(state)
    self._disabled = state == true
    if self._container:IsA("TextButton") then
        self._container.AutoButtonColor = not self._disabled
    end
    if self._label then
        self._label.TextColor3 = self._disabled and self._theme.TextDisabled or (self._isPrimary and Color3.fromRGB(14, 14, 16) or self._theme.TextPrimary)
    end
end

function Button:Destroy()
    if self._conns then
        for _, c in ipairs(self._conns) do
            if c and c.Connected then c:Disconnect() end
        end
        self._conns = {}
    end
    if self._container then
        self._container:Destroy()
        self._container = nil
    end
end

return Button