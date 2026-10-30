local TweenService = game:GetService("TweenService")

local Banner = {}
Banner.__index = Banner

function Banner.new(parent, options, theme, cleanup)
    options = options or {}
    local title = options.Title or options.Name
    local showHeader = options.ShowHeader ~= false and (title ~= nil and title ~= "")
    local titleText = title or "LiyHub Announcement"
    local text = options.Text or options.Description or "Welcome to LiyHub v2.2 Pure B&W!"
    local image = options.Image or options.AssetId or theme.DefaultBanner or "rbxasset://textures/LiyhubBanner.png"
    local defaultCollapsed = options.Collapsed == true
    
    local container = Instance.new("Frame")
    container.Name = "Banner"
    container.Size = UDim2.new(1, 0, 0, 0)
    container.AutomaticSize = Enum.AutomaticSize.Y
    container.BackgroundColor3 = theme.Card
    container.BorderSizePixel = 0
    container.ClipsDescendants = true
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
        header.Active = true
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
    imageLabel.Image = image
    imageLabel.ScaleType = Enum.ScaleType.Fit
    imageLabel.BorderSizePixel = 0
    imageLabel.Parent = imageFrame
    
    local function updateBannerHeight()
        local width = imageFrame.AbsoluteSize.X
        if width > 40 then
            local targetH = math.clamp(math.floor(width / (1108 / 432)), 60, 300)
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
    tPad.PaddingBottom = UDim.new(0, 8)
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
    }, Banner)
    
    if header then
        local lastToggle = 0
        local function doToggle()
            local now = os.clock()
            if now - lastToggle < 0.15 then return end
            lastToggle = now
            self:Toggle()
        end
        local toggleConn = header.Activated:Connect(doToggle)
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
    self._imageLabel.Image = assetId
end

function Banner:SetText(text)
    self._descLabel.Text = text
end

function Banner:Destroy()
    if self._container then
        self._container:Destroy()
    end
end

return Banner
