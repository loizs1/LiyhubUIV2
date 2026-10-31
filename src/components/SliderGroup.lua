local Slider = nil
pcall(function()
    Slider = require(script.Parent.Slider)
end)

local SliderGroup = {}
SliderGroup.__index = SliderGroup

function SliderGroup.new(parent, options, theme, cleanup, sliderModule)
    options = options or {}
    local sliderCtor = sliderModule or Slider
    
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
    
    local padding = Instance.new("UIPadding")
    padding.PaddingTop = UDim.new(0, 6)
    padding.PaddingBottom = UDim.new(0, 6)
    padding.PaddingLeft = UDim.new(0, 6)
    padding.PaddingRight = UDim.new(0, 6)
    padding.Parent = container
    
    local list = Instance.new("UIListLayout")
    list.SortOrder = Enum.SortOrder.LayoutOrder
    list.Padding = UDim.new(0, 4)
    list.Parent = container
    
    local self = setmetatable({
        _container = container,
        _sliders = {},
        _theme = theme,
        _cleanup = cleanup,
        _sliderCtor = sliderCtor,
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

function SliderGroup:AddSlider(options)
    local s = self._sliderCtor.new(self._container, options, self._theme, self._cleanup)
    table.insert(self._sliders, s)
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
