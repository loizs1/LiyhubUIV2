local Input = nil
pcall(function()
    Input = require(script.Parent.Input)
end)

local InputGroup = {}
InputGroup.__index = InputGroup

function InputGroup.new(parent, options, theme, cleanup, inputModule)
    options = options or {}
    local inputCtor = inputModule or Input
    local isDown = options.Direction == "Down"
    
    local container = Instance.new("Frame")
    container.Name = "InputGroup"
    container.Size = UDim2.new(1, 0, 0, 0)
    container.AutomaticSize = Enum.AutomaticSize.Y
    container.BackgroundColor3 = theme.Card
    container.BorderSizePixel = 0
    container.Parent = parent
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = theme.CornerRadius
    corner.Parent = container

    if theme.UseStrokes then
        local stroke = Instance.new("UIStroke")
        stroke.Name = "BorderStroke"
        stroke.Color = theme.Border
        stroke.Thickness = 1
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Parent = container
    end
    
    local padding = Instance.new("UIPadding")
    padding.PaddingTop = UDim.new(0, 6)
    padding.PaddingBottom = UDim.new(0, 6)
    padding.PaddingLeft = UDim.new(0, 6)
    padding.PaddingRight = UDim.new(0, 6)
    padding.Parent = container
    
    local list = Instance.new("UIListLayout")
    list.FillDirection = isDown and Enum.FillDirection.Vertical or Enum.FillDirection.Horizontal
    list.SortOrder = Enum.SortOrder.LayoutOrder
    list.Padding = UDim.new(0, 6)
    list.Parent = container
    
    local self = setmetatable({
        _container = container,
        _inputs = {},
        _theme = theme,
        _cleanup = cleanup,
        _inputCtor = inputCtor,
        _isDown = isDown,
    }, InputGroup)
    
    if cleanup then
        cleanup:Add(container)
    end
    
    if options.Inputs and type(options.Inputs) == "table" then
        for _, iOpt in ipairs(options.Inputs) do
            self:AddInput(iOpt)
        end
    end
    
    return self
end

function InputGroup:_rebalanceSizes()
    local count = #self._inputs
    if count == 0 then return end
    local h = self._theme.SmallElementHeight or 34
    if self._isDown then
        for _, inp in ipairs(self._inputs) do
            inp._container.Size = UDim2.new(1, 0, 0, h)
        end
    else
        local gapTotal = (count - 1) * 6
        local widthScale = 1 / count
        for _, inp in ipairs(self._inputs) do
            inp._container.Size = UDim2.new(widthScale, -math.floor(gapTotal / count), 0, h)
        end
    end
end

function InputGroup:AddInput(options)
    local inp = self._inputCtor.new(self._container, options, self._theme, self._cleanup)
    table.insert(self._inputs, inp)
    self:_rebalanceSizes()
    return inp
end

function InputGroup:GetInputs()
    return self._inputs
end

function InputGroup:Destroy()
    if self._container then
        self._container:Destroy()
        self._container = nil
    end
end

return InputGroup
