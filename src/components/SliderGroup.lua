local Slider = nil
pcall(function()
    Slider = require(script.Parent.Slider)
end)

local SliderGroup = {}
SliderGroup.__index = SliderGroup

function SliderGroup.new(parent, options, theme, cleanup, sliderModule)
    options = options or {}
    local sliderCtor = sliderModule or Slider
    local isDown = options.Direction == "Down"
    
    local container = Instance.new("Frame")
    container.Name = "SliderGroup"
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
        _sliders = {},
        _theme = theme,
        _cleanup = cleanup,
        _sliderCtor = sliderCtor,
        _isDown = isDown,
    }, SliderGroup)
    
    if cleanup then
        cleanup:Add(container)
    end
    
    if options.Sliders and type(options.Sliders) == "table" then
        for _, sOpt in ipairs(options.Sliders) do
            self:AddSlider(sOpt)
        end
    end
    
    return self
end

function SliderGroup:_rebalanceSizes()
    local count = #self._sliders
    if count == 0 then return end
    if self._isDown then
        for _, s in ipairs(self._sliders) do
            s._container.Size = UDim2.new(1, 0, 0, 56)
        end
    else
        local gapTotal = (count - 1) * 6
        local widthScale = 1 / count
        for _, s in ipairs(self._sliders) do
            s._container.Size = UDim2.new(widthScale, -math.floor(gapTotal / count), 0, 56)
        end
    end
end

function SliderGroup:AddSlider(options)
    local s = self._sliderCtor.new(self._container, options, self._theme, self._cleanup)
    table.insert(self._sliders, s)
    self:_rebalanceSizes()
    return s
end

function SliderGroup:GetSliders()
    return self._sliders
end

function SliderGroup:Destroy()
    if self._container then
        self._container:Destroy()
        self._container = nil
    end
end

return SliderGroup
