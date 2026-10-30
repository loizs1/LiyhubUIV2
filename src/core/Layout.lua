--[[
    LiyHub UI - Layout System
    Manages Single-column and Dual-column layouts for tabs and sections.
]]

local Layout = {}
Layout.__index = Layout

function Layout.new(container, options)
    options = options or {}
    local isTwoColumns = options.TwoColumns == true
    
    local self = setmetatable({
        _container = container,
        _twoColumns = isTwoColumns,
        _leftColumn = nil,
        _rightColumn = nil,
        _singleColumn = nil,
        _sections = {},
    }, Layout)
    
    self:_initialize()
    return self
end

function Layout:_initialize()
    if self._twoColumns then
        -- Create dual-column layout containers
        local columnContainer = Instance.new("Frame")
        columnContainer.Name = "DualColumnContainer"
        columnContainer.BackgroundTransparency = 1
        columnContainer.Size = UDim2.new(1, 0, 1, 0)
        columnContainer.Parent = self._container
        
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
        leftCol.Parent = columnContainer
        
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
        rightCol.Parent = columnContainer
        
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
        
        self._leftColumn = leftCol
        self._rightColumn = rightCol
    else
        -- Single-column layout container
        local singleCol = Instance.new("ScrollingFrame")
        singleCol.Name = "SingleColumn"
        singleCol.BackgroundTransparency = 1
        singleCol.BorderSizePixel = 0
        singleCol.Size = UDim2.new(1, 0, 1, 0)
        singleCol.ScrollBarThickness = 3
        singleCol.ScrollBarImageColor3 = Color3.fromRGB(50, 50, 60)
        singleCol.AutomaticCanvasSize = Enum.AutomaticSize.Y
        singleCol.CanvasSize = UDim2.new(0, 0, 0, 0)
        singleCol.Parent = self._container
        
        local listLayout = Instance.new("UIListLayout")
        listLayout.SortOrder = Enum.SortOrder.LayoutOrder
        listLayout.Padding = UDim.new(0, 8)
        listLayout.Parent = singleCol
        
        local padding = Instance.new("UIPadding")
        padding.PaddingTop = UDim.new(0, 4)
        padding.PaddingBottom = UDim.new(0, 10)
        padding.PaddingLeft = UDim.new(0, 2)
        padding.PaddingRight = UDim.new(0, 6)
        padding.Parent = singleCol
        
        self._singleColumn = singleCol
    end
end

function Layout:GetSectionParent(sectionOptions)
    if not self._twoColumns then
        return self._singleColumn
    end
    
    local side = "Left"
    if sectionOptions and sectionOptions.Side then
        side = sectionOptions.Side
    end
    
    if string.lower(side) == "right" then
        return self._rightColumn
    else
        return self._leftColumn
    end
end

function Layout:IsTwoColumns()
    return self._twoColumns
end

return Layout

