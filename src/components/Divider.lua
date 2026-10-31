local Divider = {}
Divider.__index = Divider

function Divider.new(parent, options, theme, cleanup)
    local container = Instance.new("Frame")
    container.Name = "Divider"
    container.Size = UDim2.new(1, 0, 0, 1)
    container.BackgroundColor3 = theme.SidebarItem
    container.BorderSizePixel = 0
    container.Parent = parent
    
    local self = setmetatable({
        _container = container,
        _theme = theme,
    }, Divider)
    
    if cleanup then
        cleanup:Add(container)
    end
    
    return self
end

function Divider:Destroy()
    if self._container then
        self._container:Destroy()
        self._container = nil
    end
end

return Divider