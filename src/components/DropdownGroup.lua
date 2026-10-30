--[[
    LiyHub UI - Dropdown Group Component
    Groups multiple dropdowns with independent expansion, state, and callbacks.
]]

local Dropdown = nil
pcall(function()
    Dropdown = require(script.Parent.Dropdown)
end)

local DropdownGroup = {}
DropdownGroup.__index = DropdownGroup

function DropdownGroup.new(parent, options, theme, cleanup, dropdownModule)
    options = options or {}
    local dropdownCtor = dropdownModule or Dropdown
    
    local container = Instance.new("Frame")
    container.Name = "DropdownGroup"
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
        _dropdowns = {},
        _theme = theme,
        _cleanup = cleanup,
        _dropdownCtor = dropdownCtor,
    }, DropdownGroup)
    
    if cleanup then
        cleanup:Add(container)
    end
    
    if options.Dropdowns and type(options.Dropdowns) == "table" then
        for _, dOpt in ipairs(options.Dropdowns) do
            self:AddDropdown(dOpt)
        end
    end
    
    return self
end

function DropdownGroup:AddDropdown(options)
    local d = self._dropdownCtor.new(self._container, options, self._theme, self._cleanup)
    table.insert(self._dropdowns, d)
    return d
end

function DropdownGroup:GetDropdowns()
    return self._dropdowns
end

function DropdownGroup:Destroy()
    if self._container then
        self._container:Destroy()
        self._container = nil
    end
end

return DropdownGroup

