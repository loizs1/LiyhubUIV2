local Paragraph = {}
Paragraph.__index = Paragraph

function Paragraph.new(parent, options, theme, cleanup)
    options = options or {}
    local titleText = options.Title or options.Name or "Information"
    local contentText = options.Content or options.Text or ""
    
    local container = Instance.new("Frame")
    container.Name = "Paragraph_" .. titleText
    container.Size = UDim2.new(1, 0, 0, 0)
    container.AutomaticSize = Enum.AutomaticSize.Y
    container.BackgroundColor3 = theme.Element
    container.BorderSizePixel = 0
    container.Parent = parent
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = theme.CornerRadius
    corner.Parent = container
    
    local padding = Instance.new("UIPadding")
    padding.PaddingTop = UDim.new(0, 10)
    padding.PaddingBottom = UDim.new(0, 10)
    padding.PaddingLeft = UDim.new(0, 12)
    padding.PaddingRight = UDim.new(0, 12)
    padding.Parent = container
    
    local list = Instance.new("UIListLayout")
    list.SortOrder = Enum.SortOrder.LayoutOrder
    list.Padding = UDim.new(0, 4)
    list.Parent = container
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(1, 0, 0, 18)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = titleText
    titleLabel.TextColor3 = theme.TextPrimary
    titleLabel.Font = theme.FontBold
    titleLabel.TextSize = theme.FontSizeRegular
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = container
    
    local contentLabel = Instance.new("TextLabel")
    contentLabel.Name = "Content"
    contentLabel.Size = UDim2.new(1, 0, 0, 0)
    contentLabel.AutomaticSize = Enum.AutomaticSize.Y
    contentLabel.BackgroundTransparency = 1
    contentLabel.Text = contentText
    contentLabel.TextColor3 = theme.TextSecondary
    contentLabel.Font = theme.FontRegular
    contentLabel.TextSize = theme.FontSizeSmall
    contentLabel.TextXAlignment = Enum.TextXAlignment.Left
    contentLabel.TextWrapped = true
    contentLabel.Parent = container
    
    local self = setmetatable({
        _container = container,
        _titleLabel = titleLabel,
        _contentLabel = contentLabel,
        _theme = theme,
    }, Paragraph)
    
    if cleanup then
        cleanup:Add(container)
    end
    
    return self
end

function Paragraph:SetTitle(title)
    self._titleLabel.Text = tostring(title)
end

function Paragraph:SetContent(content)
    self._contentLabel.Text = tostring(content)
end

function Paragraph:Destroy()
    if self._container then
        self._container:Destroy()
        self._container = nil
    end
end

return Paragraph