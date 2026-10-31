local TweenService = game:GetService("TweenService")

local Banner = {}
Banner.__index = Banner

local function resolveAsset(asset)
    if not asset or asset == "" then
        return "rbxassetid://108339444679489"
    end
    if typeof(asset) == "number" or tonumber(asset) then
        return "rbxassetid://" .. tostring(asset)
    end
    if string.find(asset, "rbxassetid://") or string.find(asset, "rbxasset://") or string.find(asset, "http://") or string.find(asset, "https://") then
        return asset
    end
    local okG, getAsset = pcall(function() return getcustomasset or getsynasset end)
    if okG and typeof(getAsset) == "function" then
        local pOk, res = pcall(getAsset, asset)
        if pOk and res then return res end
    end
    return asset
end

function Banner.new(parent, options, theme, cleanup)
    options = options or {}
    local title = options.Title or options.Name
    local showHeader = options.ShowHeader ~= false and (title ~= nil and title ~= "")
    local titleText = title or "LiyHub Announcement"
    local text = options.Content or options.Text or options.Description or "Welcome to LiyHub v2.2 Pure B&W!"
    local image = options.Image or options.AssetId or theme.DefaultBanner or "rbxassetid://108339444679489"
    local isCollapsible = options.Collapsible ~= false
    local defaultCollapsed = options.Collapsed == true or (options.Default == false and isCollapsible)
    local buttons = options.Buttons
    
    local container = Instance.new("Frame")
    container.Name = "Banner"
    container.Size = UDim2.new(1, 0, 0, 0)
    container.AutomaticSize = Enum.AutomaticSize.Y
    container.BackgroundColor3 = theme.Card
    container.BorderSizePixel = 0
    container.ClipsDescendants = false
    container.Parent = parent
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = theme.CornerRadius
    corner.Parent = container
    
    if theme.UseStrokes then
        local stroke = Instance.new("UIStroke")
        stroke.Name = "BorderStroke"
        stroke.Color = theme.Border
        stroke.Thickness = theme.StrokeThickness or 1
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Parent = container
    end
    
    local list = Instance.new("UIListLayout")
    list.SortOrder = Enum.SortOrder.LayoutOrder
    list.Padding = UDim.new(0, 0)
    list.Parent = container
    
    local header = nil
    local titleLabel = nil
    local arrow = nil
    
    if showHeader then
        header = Instance.new("TextButton")
        header.Name = "Header"
        header.Size = UDim2.new(1, 0, 0, 28)
        header.BackgroundTransparency = 1
        header.AutoButtonColor = false
        header.Text = ""
        header.Active = isCollapsible
        header.Parent = container
        
        local hPad = Instance.new("UIPadding")
        hPad.PaddingLeft = UDim.new(0, 10)
        hPad.PaddingRight = UDim.new(0, 10)
        hPad.PaddingTop = UDim.new(0, 6)
        hPad.Parent = header
        
        titleLabel = Instance.new("TextLabel")
        titleLabel.Name = "Title"
        titleLabel.Size = UDim2.new(1, -24, 1, 0)
        titleLabel.BackgroundTransparency = 1
        titleLabel.Text = titleText
        titleLabel.TextColor3 = theme.TextPrimary
        titleLabel.Font = theme.FontBold
        titleLabel.TextSize = theme.FontSizeSection or 11
        titleLabel.TextXAlignment = Enum.TextXAlignment.Left
        titleLabel.Active = false
        titleLabel.Parent = header
        
        if isCollapsible then
            arrow = Instance.new("ImageLabel")
            arrow.Name = "Arrow"
            arrow.Size = UDim2.fromOffset(12, 12)
            arrow.Position = UDim2.new(1, -20, 0.5, -6)
            arrow.BackgroundTransparency = 1
            arrow.Image = "rbxassetid://10709790948"
            arrow.ImageColor3 = theme.TextMuted
            arrow.Rotation = defaultCollapsed and 0 or 180
            arrow.Active = false
            arrow.Parent = header
        end
    end
    
    local contentBox = Instance.new("Frame")
    contentBox.Name = "ContentBox"
    contentBox.Size = UDim2.new(1, 0, 0, 0)
    contentBox.AutomaticSize = Enum.AutomaticSize.Y
    contentBox.BackgroundTransparency = 1
    contentBox.Visible = not defaultCollapsed
    contentBox.Parent = container
    
    local cbList = Instance.new("UIListLayout")
    cbList.SortOrder = Enum.SortOrder.LayoutOrder
    cbList.Padding = UDim.new(0, 6)
    cbList.Parent = contentBox
    
    local imageFrame = Instance.new("Frame")
    imageFrame.Name = "ImageFrame"
    imageFrame.Size = UDim2.new(1, 0, 0, 140)
    imageFrame.BackgroundColor3 = theme.Header
    imageFrame.BorderSizePixel = 0
    imageFrame.ClipsDescendants = true
    imageFrame.Parent = contentBox
    
    local imgFrameCorner = Instance.new("UICorner")
    imgFrameCorner.CornerRadius = showHeader and theme.SmallCornerRadius or theme.CornerRadius
    imgFrameCorner.Parent = imageFrame
    
    local imageLabel = Instance.new("ImageLabel")
    imageLabel.Name = "BannerImage"
    imageLabel.Size = UDim2.new(1, 0, 1, 0)
    imageLabel.BackgroundTransparency = 1
    imageLabel.Image = resolveAsset(image)
    imageLabel.ScaleType = Enum.ScaleType.Fit
    imageLabel.BorderSizePixel = 0
    imageLabel.Parent = imageFrame
    
    local function updateBannerHeight()
        local width = imageFrame.AbsoluteSize.X
        if width > 40 then
            local targetH = math.clamp(math.floor(width / (643 / 253)), 60, 320)
            if math.abs(imageFrame.Size.Y.Offset - targetH) > 1 then
                imageFrame.Size = UDim2.new(1, 0, 0, targetH)
            end
        end
    end
    local absConn = imageFrame:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateBannerHeight)
    task.defer(updateBannerHeight)
    
    local textContainer = Instance.new("Frame")
    textContainer.Name = "TextContainer"
    textContainer.Size = UDim2.new(1, 0, 0, 0)
    textContainer.AutomaticSize = Enum.AutomaticSize.Y
    textContainer.BackgroundTransparency = 1
    textContainer.Parent = contentBox
    
    local tPad = Instance.new("UIPadding")
    tPad.PaddingLeft = UDim.new(0, 10)
    tPad.PaddingRight = UDim.new(0, 10)
    tPad.PaddingTop = UDim.new(0, 2)
    tPad.PaddingBottom = UDim.new(0, (buttons and #buttons > 0) and 2 or 8)
    tPad.Parent = textContainer
    
    local descLabel = Instance.new("TextLabel")
    descLabel.Name = "Description"
    descLabel.Size = UDim2.new(1, 0, 0, 0)
    descLabel.AutomaticSize = Enum.AutomaticSize.Y
    descLabel.BackgroundTransparency = 1
    descLabel.Text = text
    descLabel.TextColor3 = theme.TextSecondary
    descLabel.Font = theme.FontRegular
    descLabel.TextSize = theme.FontSizeSmall
    descLabel.TextXAlignment = Enum.TextXAlignment.Left
    descLabel.TextWrapped = true
    descLabel.Active = false
    descLabel.Parent = textContainer
    
    local btnConns = {}
    if buttons and type(buttons) == "table" and #buttons > 0 then
        local btnRow = Instance.new("Frame")
        btnRow.Name = "ButtonRow"
        btnRow.Size = UDim2.new(1, -20, 0, 28)
        btnRow.Position = UDim2.new(0, 10, 0, 0)
        btnRow.BackgroundTransparency = 1
        btnRow.Parent = contentBox
        
        local bPad = Instance.new("UIPadding")
        bPad.PaddingBottom = UDim.new(0, 8)
        bPad.Parent = btnRow
        
        local bList = Instance.new("UIListLayout")
        bList.FillDirection = Enum.FillDirection.Horizontal
        bList.SortOrder = Enum.SortOrder.LayoutOrder
        bList.Padding = UDim.new(0, 8)
        bList.Parent = btnRow
        
        local isDark = (theme.IsLight ~= true and theme.Name ~= "Pure White")
        local count = #buttons
        local gapTotal = (count - 1) * 8
        local widthScale = 1 / count
        
        for _, bData in ipairs(buttons) do
            local bTitle = bData.Title or bData.Text or bData.Name or "Action"
            local bCallback = bData.Callback or function() end
            local isAccent = bData.Accent == true
            
            local bAction = Instance.new("TextButton")
            bAction.Name = "Btn_" .. bTitle
            bAction.Size = UDim2.new(widthScale, -math.floor(gapTotal / count), 1, 0)
            bAction.BackgroundColor3 = isAccent and (isDark and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(18, 20, 24)) or (isDark and Color3.fromRGB(22, 22, 27) or Color3.fromRGB(236, 238, 243))
            bAction.TextColor3 = isAccent and (isDark and Color3.fromRGB(18, 20, 24) or Color3.fromRGB(255, 255, 255)) or (isDark and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(18, 20, 24))
            bAction.Font = theme.FontBold
            bAction.Text = bTitle
            bAction.TextSize = theme.FontSizeSmall
            bAction.AutoButtonColor = false
            bAction.Parent = btnRow
            
            local bCorner = Instance.new("UICorner")
            bCorner.CornerRadius = theme.SmallCornerRadius or UDim.new(0, 4)
            bCorner.Parent = bAction
            
            local bStroke = Instance.new("UIStroke")
            bStroke.Name = "ButtonStroke"
            bStroke.Color = isDark and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(18, 20, 24)
            bStroke.Thickness = 1
            bStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            bStroke.Parent = bAction
            
            local bConn = bAction.Activated:Connect(function()
                task.spawn(bCallback)
            end)
            table.insert(btnConns, bConn)
            if cleanup then cleanup:Add(bConn) end
        end
    end
    
    local self = setmetatable({
        _container = container,
        _header = header,
        _titleLabel = titleLabel,
        _arrow = arrow,
        _contentBox = contentBox,
        _imageLabel = imageLabel,
        _descLabel = descLabel,
        _theme = theme,
        _collapsed = defaultCollapsed,
        _toggleConn = nil,
        _absConn = absConn,
        _btnConns = btnConns,
    }, Banner)
    
    if header and isCollapsible then
        local lastToggle = 0
        local function doToggle()
            local now = os.clock()
            if now - lastToggle < 0.15 then return end
            lastToggle = now
            self:Toggle()
        end
        local toggleConn = header.Activated:Connect(doToggle)
        self._toggleConn = toggleConn
        if cleanup then
            cleanup:Add(toggleConn)
        end
    end
    
    if cleanup then
        cleanup:Add(absConn)
        cleanup:Add(container)
    end
    
    return self
end

function Banner:Toggle()
    self._collapsed = not self._collapsed
    self._contentBox.Visible = not self._collapsed
    if self._arrow then
        TweenService:Create(self._arrow, TweenInfo.new(self._theme.AnimationFast or 0.15), {
            Rotation = self._collapsed and 0 or 180
        }):Play()
    end
end

function Banner:SetImage(assetId)
    self._imageLabel.Image = resolveAsset(assetId)
end

function Banner:SetText(text)
    self._descLabel.Text = text
end

function Banner:Destroy()
    if self._toggleConn and self._toggleConn.Connected then
        self._toggleConn:Disconnect()
        self._toggleConn = nil
    end
    if self._absConn and self._absConn.Connected then
        self._absConn:Disconnect()
        self._absConn = nil
    end
    if self._btnConns then
        for _, c in ipairs(self._btnConns) do
            if c and c.Connected then c:Disconnect() end
        end
        self._btnConns = {}
    end
    if self._container then
        self._container:Destroy()
        self._container = nil
    end
end

return Banner
