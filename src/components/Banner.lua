--[[
    LiyHub UI - Banner Component
    A visual presentation card featuring an image header, title, and
    collapsible explanatory text supporting Asset IDs and Web URLs.
]]

local TweenService = game:GetService("TweenService")

local Banner = {}
Banner.__index = Banner

function Banner.new(parent, options, theme, cleanup)
    options = options or {}
    local title = options.Title or options.Name or "LiyHub Announcement"
    local text = options.Text or options.Description or "Welcome to LiyHub v2.2 Pure B&W! This banner supports Discord CDN links, Google/Web image URLs, or Roblox Asset IDs, complete with collapsible text paragraphs."
    local image = options.Image or options.AssetId or "rbxassetid://15634771265"
    local imageHeight = options.ImageHeight or 105
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
    
    local list = Instance.new("UIListLayout")
    list.SortOrder = Enum.SortOrder.LayoutOrder
    list.Padding = UDim.new(0, 6)
    list.Parent = container
    
    -- Banner Header (Title & Collapse Arrow)
    local header = Instance.new("TextButton")
    header.Name = "Header"
    header.Size = UDim2.new(1, 0, 0, 24)
    header.BackgroundTransparency = 1
    header.AutoButtonColor = false
    header.Text = ""
    header.Parent = container
    
    local hPad = Instance.new("UIPadding")
    hPad.PaddingLeft = UDim.new(0, 10)
    hPad.PaddingRight = UDim.new(0, 10)
    hPad.PaddingTop = UDim.new(0, 6)
    hPad.Parent = header
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(1, -24, 1, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = theme.TextPrimary
    titleLabel.Font = theme.FontBold
    titleLabel.TextSize = theme.FontSizeSection or 12
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = header
    
    local arrow = Instance.new("TextLabel")
    arrow.Name = "Arrow"
    arrow.Size = UDim2.new(0, 20, 1, 0)
    arrow.Position = UDim2.new(1, -20, 0, 0)
    arrow.BackgroundTransparency = 1
    arrow.Text = defaultCollapsed and "v" or "^"
    arrow.TextColor3 = theme.TextSecondary
    arrow.Font = theme.FontBold
    arrow.TextSize = 10
    arrow.Parent = header
    
    -- Content Box (Image + Description)
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
    
    local cbPad = Instance.new("UIPadding")
    cbPad.PaddingLeft = UDim.new(0, 8)
    cbPad.PaddingRight = UDim.new(0, 8)
    cbPad.PaddingBottom = UDim.new(0, 10)
    cbPad.Parent = contentBox
    
    -- Image container
    local imageLabel = Instance.new("ImageLabel")
    imageLabel.Name = "BannerImage"
    imageLabel.Size = UDim2.new(1, 0, 0, imageHeight)
    imageLabel.BackgroundColor3 = theme.Header
    imageLabel.Image = image
    imageLabel.ScaleType = Enum.ScaleType.Crop
    imageLabel.BorderSizePixel = 0
    imageLabel.Parent = contentBox
    
    local imgCorner = Instance.new("UICorner")
    imgCorner.CornerRadius = theme.CornerRadius
    imgCorner.Parent = imageLabel
    
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
    descLabel.Parent = contentBox
    
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
    
    local toggleConn = header.Activated:Connect(function()
        self:Toggle()
    end)

    if cleanup then
        cleanup:Add(toggleConn)
        cleanup:Add(container)
    end
    
    return self
end

function Banner:Toggle()
    self._collapsed = not self._collapsed
    self._contentBox.Visible = not self._collapsed
    self._arrow.Text = self._collapsed and "v" or "^"
end

function Banner:SetImage(imageId)
    self._imageLabel.Image = tostring(imageId)
end

function Banner:SetTitle(title)
    self._titleLabel.Text = tostring(title)
end

function Banner:SetText(text)
    self._descLabel.Text = tostring(text)
end

function Banner:Destroy()
    if self._container then
        self._container:Destroy()
        self._container = nil
    end
end

return Banner
