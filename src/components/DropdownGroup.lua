local Dropdown = nil
pcall(function()
    Dropdown = require(script.Parent.Dropdown)
end)

local DropdownGroup = {}
DropdownGroup.__index = DropdownGroup

function DropdownGroup.new(parent, options, theme, cleanup, dropdownModule)
    options = options or {}
    local dropdownCtor = dropdownModule or Dropdown
    
    local row = Instance.new("Frame")
    row.Name = "DropdownGroup"
    row.Size = UDim2.new(1, 0, 0, 52)
    row.BackgroundTransparency = 1
    row.BorderSizePixel = 0
    row.Parent = parent
    
    local layout = Instance.new("UIListLayout")
    layout.FillDirection = Enum.FillDirection.Horizontal
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 8)
    layout.Parent = row
    
    local self = setmetatable({
        _container = row,
        _dropdowns = {},
        _theme = theme,
        _cleanup = cleanup,
        _dropdownCtor = dropdownCtor,
    }, DropdownGroup)
    
    if cleanup then
        cleanup:Add(row)
    end
    
    if options.Dropdowns and type(options.Dropdowns) == "table" then
        for _, dOpt in ipairs(options.Dropdowns) do
            self:AddDropdown(dOpt)
        end
    end
    
    return self
end

function DropdownGroup:_rebalanceSizes()
    local count = #self._dropdowns
    if count == 0 then return end
    local gapTotal = (count - 1) * 8
    local widthScale = 1 / count
    for _, d in ipairs(self._dropdowns) do
        d._container.Size = UDim2.new(widthScale, -math.floor(gapTotal / count), 1, 0)
    end
end

function DropdownGroup:AddDropdown(options)
    local d = self._dropdownCtor.new(self._container, options, self._theme, self._cleanup)
    table.insert(self._dropdowns, d)
    self:_rebalanceSizes()
    return d
end

function DropdownGroup:Destroy()
    if self._container then
        self._container:Destroy()
    end
end

return DropdownGroup
