local Layout = {}
Layout.__index = Layout

function Layout.new(container, options)
    options = options or {}
    local initialTwoColumns = options.TwoColumns
    if initialTwoColumns == nil then
        initialTwoColumns = true
    end
    
    local self = setmetatable({
        _container = container,
        _twoColumns = initialTwoColumns,
        _dualContainer = nil,
        _leftColumn = nil,
        _rightColumn = nil,
        _singleColumn = nil,
        _sections = {},
        _sectionCount = 0,
        _cardMeta = {},
    }, Layout)
    
    self:_initialize()
    return self
end

function Layout:_initialize()
    local dualContainer = Instance.new("Frame")
    dualContainer.Name = "DualColumnContainer"
    dualContainer.BackgroundTransparency = 1
    dualContainer.Size = UDim2.new(1, 0, 1, 0)
    dualContainer.Visible = self._twoColumns
    dualContainer.Parent = self._container
    
    local leftCol = Instance.new("ScrollingFrame")
    leftCol.Name = "LeftColumn"
    leftCol.BackgroundTransparency = 1
    leftCol.BorderSizePixel = 0
    leftCol.Size = UDim2.new(0.5, -6, 1, 0)
    leftCol.Position = UDim2.new(0, 0, 0, 0)
    leftCol.ScrollBarThickness = 3
    leftCol.ScrollBarImageColor3 = Color3.fromRGB(50, 50, 60)
    leftCol.AutomaticCanvasSize = Enum.AutomaticSize.Y
    leftCol.CanvasSize = UDim2.new(0, 0, 0, 0)
    leftCol.Parent = dualContainer
    
    local leftList = Instance.new("UIListLayout")
    leftList.SortOrder = Enum.SortOrder.LayoutOrder
    leftList.Padding = UDim.new(0, 8)
    leftList.Parent = leftCol
    
    local leftPadding = Instance.new("UIPadding")
    leftPadding.PaddingTop = UDim.new(0, 4)
    leftPadding.PaddingBottom = UDim.new(0, 8)
    leftPadding.PaddingLeft = UDim.new(0, 2)
    leftPadding.PaddingRight = UDim.new(0, 4)
    leftPadding.Parent = leftCol
    
    local rightCol = Instance.new("ScrollingFrame")
    rightCol.Name = "RightColumn"
    rightCol.BackgroundTransparency = 1
    rightCol.BorderSizePixel = 0
    rightCol.Size = UDim2.new(0.5, -6, 1, 0)
    rightCol.Position = UDim2.new(0.5, 6, 0, 0)
    rightCol.ScrollBarThickness = 3
    rightCol.ScrollBarImageColor3 = Color3.fromRGB(50, 50, 60)
    rightCol.AutomaticCanvasSize = Enum.AutomaticSize.Y
    rightCol.CanvasSize = UDim2.new(0, 0, 0, 0)
    rightCol.Parent = dualContainer
    
    local rightList = Instance.new("UIListLayout")
    rightList.SortOrder = Enum.SortOrder.LayoutOrder
    rightList.Padding = UDim.new(0, 8)
    rightList.Parent = rightCol
    
    local rightPadding = Instance.new("UIPadding")
    rightPadding.PaddingTop = UDim.new(0, 4)
    rightPadding.PaddingBottom = UDim.new(0, 8)
    rightPadding.PaddingLeft = UDim.new(0, 4)
    rightPadding.PaddingRight = UDim.new(0, 2)
    rightPadding.Parent = rightCol
    
    local singleCol = Instance.new("ScrollingFrame")
    singleCol.Name = "SingleColumn"
    singleCol.BackgroundTransparency = 1
    singleCol.BorderSizePixel = 0
    singleCol.Size = UDim2.new(1, 0, 1, 0)
    singleCol.ScrollBarThickness = 3
    singleCol.ScrollBarImageColor3 = Color3.fromRGB(50, 50, 60)
    singleCol.AutomaticCanvasSize = Enum.AutomaticSize.Y
    singleCol.CanvasSize = UDim2.new(0, 0, 0, 0)
    singleCol.Visible = not self._twoColumns
    singleCol.Parent = self._container
    
    local singleList = Instance.new("UIListLayout")
    singleList.SortOrder = Enum.SortOrder.LayoutOrder
    singleList.Padding = UDim.new(0, 8)
    singleList.Parent = singleCol
    
    local singlePadding = Instance.new("UIPadding")
    singlePadding.PaddingTop = UDim.new(0, 4)
    singlePadding.PaddingBottom = UDim.new(0, 10)
    singlePadding.PaddingLeft = UDim.new(0, 2)
    singlePadding.PaddingRight = UDim.new(0, 6)
    singlePadding.Parent = singleCol
    
    self._dualContainer = dualContainer
    self._leftColumn = leftCol
    self._rightColumn = rightCol
    self._singleColumn = singleCol
end

function Layout:GetSectionParent(sectionOptions)
    self._sectionCount = self._sectionCount + 1
    local order = self._sectionCount
    local side = nil
    if sectionOptions and sectionOptions.Side then
        side = sectionOptions.Side
    end
    if not side then
        side = (order % 2 == 1) and "Left" or "Right"
    end
    
    local targetParent = nil
    if self._twoColumns then
        targetParent = (string.lower(side) == "right") and self._rightColumn or self._leftColumn
    else
        targetParent = self._singleColumn
    end
    
    local sectionEntry = {
        Side = side,
        Order = order,
        SectionCard = nil,
    }
    table.insert(self._sections, sectionEntry)
    
    return targetParent
end

function Layout:RegisterSectionInstance(sectionCard)
    for _, sec in ipairs(self._sections) do
        if sec.SectionCard == nil then
            sec.SectionCard = sectionCard
            local side = sec.Side or "Left"
            self._cardMeta[sectionCard] = { Side = side, Order = sec.Order or 1 }
            sectionCard.LayoutOrder = sec.Order or 1
            break
        end
    end
end

function Layout:SetTwoColumns(enabled)
    if self._twoColumns == enabled then return end
    self._twoColumns = enabled
    
    local allCards = {}
    local seen = {}
    
    local function collectFrom(container)
        if not container then return end
        for _, child in ipairs(container:GetChildren()) do
            if child:IsA("GuiObject") and not child:IsA("UIListLayout") and not child:IsA("UIPadding") then
                if not seen[child] then
                    seen[child] = true
                    table.insert(allCards, child)
                end
            end
        end
    end
    
    collectFrom(self._leftColumn)
    collectFrom(self._rightColumn)
    collectFrom(self._singleColumn)
    
    table.sort(allCards, function(a, b)
        local metaA = self._cardMeta[a]
        local metaB = self._cardMeta[b]
        local ordA = metaA and metaA.Order or a.LayoutOrder or 0
        local ordB = metaB and metaB.Order or b.LayoutOrder or 0
        return ordA < ordB
    end)
    
    if enabled then
        for _, card in ipairs(allCards) do
            local meta = self._cardMeta[card]
            local side = meta and meta.Side or "Left"
            if string.lower(side) == "right" then
                card.Parent = self._rightColumn
            else
                card.Parent = self._leftColumn
            end
        end
        self._dualContainer.Visible = true
        self._singleColumn.Visible = false
        if self._leftColumn then
            self._leftColumn.CanvasPosition = Vector2.new(0, 0)
        end
        if self._rightColumn then
            self._rightColumn.CanvasPosition = Vector2.new(0, 0)
        end
    else
        for _, card in ipairs(allCards) do
            card.Parent = self._singleColumn
        end
        self._dualContainer.Visible = false
        self._singleColumn.Visible = true
        if self._singleColumn then
            self._singleColumn.CanvasPosition = Vector2.new(0, 0)
        end
    end
end

function Layout:IsTwoColumns()
    return self._twoColumns
end

function Layout:UpdateForDevice(deviceName, isMinimized, forceOverride)
    if forceOverride ~= nil then
        self:SetTwoColumns(forceOverride)
        return
    end
    local dev = string.lower(deviceName or "pc")
    if dev == "pc" or dev == "tablet" then
        self:SetTwoColumns(true)
    elseif dev == "android" then
        if isMinimized then
            self:SetTwoColumns(true)
        else
            self:SetTwoColumns(false)
        end
    end
end

return Layout