local Button = nil
pcall(function()
    Button = require(script.Parent.Button)
end)

local ButtonGroup = {}
ButtonGroup.__index = ButtonGroup

function ButtonGroup.new(parent, options, theme, cleanup, buttonModule)
    options = options or {}
    local buttonCtor = buttonModule or Button
    
    local row = Instance.new("Frame")
    row.Name = "ButtonGroup"
    row.Size = UDim2.new(1, 0, 0, theme.SmallElementHeight or 32)
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
        _buttons = {},
        _theme = theme,
        _cleanup = cleanup,
        _buttonCtor = buttonCtor,
    }, ButtonGroup)
    
    if cleanup then
        cleanup:Add(row)
    end
    
    if options.Buttons and type(options.Buttons) == "table" then
        for i, btnOpt in ipairs(options.Buttons) do
            if btnOpt.Primary == nil and btnOpt.Variant == nil then
                if i == 1 then
                    btnOpt.Primary = true
                end
            end
            self:AddButton(btnOpt)
        end
    end
    
    return self
end

function ButtonGroup:_rebalanceSizes()
    local count = #self._buttons
    if count == 0 then return end
    local gapTotal = (count - 1) * 6
    local widthScale = 1 / count
    for _, btn in ipairs(self._buttons) do
        btn._container.Size = UDim2.new(widthScale, -math.floor(gapTotal / count), 1, 0)
    end
end

function ButtonGroup:AddButton(options)
    options = options or {}
    if options.Primary == nil and options.Variant == nil and #self._buttons == 0 then
        options.Primary = true
    end
    local btn = self._buttonCtor.new(self._container, options, self._theme, self._cleanup)
    table.insert(self._buttons, btn)
    self:_rebalanceSizes()
    return btn
end

function ButtonGroup:Destroy()
    if self._container then
        self._container:Destroy()
    end
end

return ButtonGroup
