local Toggle = nil
pcall(function()
    Toggle = require(script.Parent.Toggle)
end)

local ToggleGroup = {}
ToggleGroup.__index = ToggleGroup

function ToggleGroup.new(parent, options, theme, cleanup, toggleModule)
    options = options or {}
    local toggleCtor = toggleModule or Toggle
    
    local row = Instance.new("Frame")
    row.Name = "ToggleGroup"
    row.Size = UDim2.new(1, 0, 0, theme.SmallElementHeight or 34)
    row.BackgroundTransparency = 1
    row.BorderSizePixel = 0
    row.Parent = parent
    
    local layout = Instance.new("UIListLayout")
    layout.FillDirection = Enum.FillDirection.Horizontal
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 6)
    layout.Parent = row
    
    local self = setmetatable({
        _container = row,
        _toggles = {},
        _theme = theme,
        _cleanup = cleanup,
        _toggleCtor = toggleCtor,
    }, ToggleGroup)
    
    if cleanup then
        cleanup:Add(row)
    end
    
    if options.Toggles and type(options.Toggles) == "table" then
        for _, tOpt in ipairs(options.Toggles) do
            self:AddToggle(tOpt)
        end
    end
    
    return self
end

function ToggleGroup:_rebalanceSizes()
    local count = #self._toggles
    if count == 0 then return end
    local gapTotal = (count - 1) * 6
    local widthScale = 1 / count
    for _, t in ipairs(self._toggles) do
        t._container.Size = UDim2.new(widthScale, -math.floor(gapTotal / count), 1, 0)
    end
end

function ToggleGroup:AddToggle(options)
    local t = self._toggleCtor.new(self._container, options, self._theme, self._cleanup)
    table.insert(self._toggles, t)
    self:_rebalanceSizes()
    return t
end

function ToggleGroup:GetToggles()
    return self._toggles
end

function ToggleGroup:Destroy()
    if self._container then
        self._container:Destroy()
    end
end

return ToggleGroup
