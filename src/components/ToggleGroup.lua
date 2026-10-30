--[[
    LiyHub UI - Toggle Group Component
    Groups multiple toggles in a shared card with isolated states and callbacks.
]]

local Toggle = nil
pcall(function()
    Toggle = require(script.Parent.Toggle)
end)

local ToggleGroup = {}
ToggleGroup.__index = ToggleGroup

function ToggleGroup.new(parent, options, theme, cleanup, toggleModule)
    options = options or {}
    local toggleCtor = toggleModule or Toggle
    
    local container = Instance.new("Frame")
    container.Name = "ToggleGroup"
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
        _toggles = {},
        _theme = theme,
        _cleanup = cleanup,
        _toggleCtor = toggleCtor,
    }, ToggleGroup)
    
    if cleanup then
        cleanup:Add(container)
    end
    
    if options.Toggles and type(options.Toggles) == "table" then
        for _, tOpt in ipairs(options.Toggles) do
            self:AddToggle(tOpt)
        end
    end
    
    return self
end

function ToggleGroup:AddToggle(options)
    local t = self._toggleCtor.new(self._container, options, self._theme, self._cleanup)
    table.insert(self._toggles, t)
    return t
end

function ToggleGroup:GetToggles()
    return self._toggles
end

function ToggleGroup:Destroy()
    if self._container then
        self._container:Destroy()
        self._container = nil
    end
end

return ToggleGroup

