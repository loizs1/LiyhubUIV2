--[[
    LiyHub UI - Complete Standalone Distribution Bundle
    Pure Black & White Minimalist Edition
]]

local _modules = {}
local _cache = {}

local function _require(name)
    if _cache[name] then
        return _cache[name]
    end
    local loader = _modules[name]
    if not loader then
        error("Module '" .. tostring(name) .. "' not found in bundle")
    end
    local result = loader()
    _cache[name] = result
    return result
end

-- Module: src/themes/PureBlackWhite
_modules["src/themes/PureBlackWhite"] = function()
--[[
    LiyHub UI - Pure Black & White Minimalist Theme
    A modern, high-contrast, distraction-free aesthetic with matte dark surfaces
    and crisp typography. Strict rule: No UI strokes in this theme.
]]

local PureBlackWhite = {
    Name = "Pure Black & White",
    
    -- Official LiyHub Assets
    DefaultLogo = "rbxasset://textures/LiyhubLogo.png",
    DefaultBanner = "rbxasset://textures/LiyhubBanner.png",
    FallbackLogo = "rbxassetid://6031075936",
    FallbackBanner = "rbxassetid://15634771265",
    
    -- Surface Colors
    Background = Color3.fromRGB(14, 14, 16),
    Header = Color3.fromRGB(18, 18, 21),
    Sidebar = Color3.fromRGB(16, 16, 19),
    SidebarItem = Color3.fromRGB(22, 22, 26),
    SidebarItemActive = Color3.fromRGB(32, 32, 38),
    SectionHeader = Color3.fromRGB(20, 20, 24),
    Card = Color3.fromRGB(22, 22, 26),
    CardHover = Color3.fromRGB(28, 28, 33),
    Element = Color3.fromRGB(26, 26, 31),
    ElementHover = Color3.fromRGB(35, 35, 42),
    ElementActive = Color3.fromRGB(44, 44, 53),
    Scrollbar = Color3.fromRGB(50, 50, 60),
    Overlay = Color3.fromRGB(0, 0, 0),
    
    -- Typography & Text Colors
    TextPrimary = Color3.fromRGB(255, 255, 255),
    TextSecondary = Color3.fromRGB(160, 160, 172),
    TextMuted = Color3.fromRGB(95, 95, 108),
    TextDisabled = Color3.fromRGB(65, 65, 75),
    
    -- Accents & Indicators
    Accent = Color3.fromRGB(255, 255, 255),
    AccentStep = Color3.fromRGB(0, 174, 255),
    AccentStepInactive = Color3.fromRGB(45, 45, 54),
    ToggleActive = Color3.fromRGB(255, 255, 255),
    ToggleInactive = Color3.fromRGB(38, 38, 46),
    ToggleKnob = Color3.fromRGB(14, 14, 16),
    ToggleKnobInactive = Color3.fromRGB(120, 120, 130),
    SliderTrack = Color3.fromRGB(38, 38, 46),
    SliderFill = Color3.fromRGB(255, 255, 255),
    
    -- Status Colors
    Success = Color3.fromRGB(46, 204, 113),
    Warning = Color3.fromRGB(241, 196, 15),
    Error = Color3.fromRGB(231, 76, 60),
    Info = Color3.fromRGB(52, 152, 219),
    
    -- Geometry & Sizing
    CornerRadius = UDim.new(0, 7),
    SmallCornerRadius = UDim.new(0, 5),
    CardPadding = 10,
    ElementPadding = 8,
    ElementHeight = 36,
    SmallElementHeight = 30,
    
    -- Typography Fonts
    FontTitle = Enum.Font.GothamBold,
    FontHeader = Enum.Font.GothamBold,
    FontRegular = Enum.Font.GothamMedium,
    FontBold = Enum.Font.GothamBold,
    
    -- Font Sizes
    FontSizeTitle = 16,
    FontSizeSubtitle = 11,
    FontSizeSection = 12,
    FontSizeRegular = 13,
    FontSizeSmall = 11,
    
    -- Strict rule: No UI strokes in the intended theme
    UseStrokes = false,
    
    -- Animation Timings
    AnimationFast = 0.15,
    AnimationMedium = 0.25,
    AnimationSlow = 0.35,
    EasingStyle = Enum.EasingStyle.Quad,
    EasingDirection = Enum.EasingDirection.Out,
}

return PureBlackWhite

end

-- Module: src/themes/ThemeManager
_modules["src/themes/ThemeManager"] = function()
--[[
    LiyHub UI - Theme Manager
    Manages active theme tokens, theme switching, and notifies subscribers.
]]

local PureBlackWhite = nil
local success, result = pcall(function()
    return require(script.Parent.PureBlackWhite)
end)
if success then
    PureBlackWhite = result
else
    -- Fallback inline if required differently
    PureBlackWhite = {
        Background = Color3.fromRGB(14, 14, 16),
        Header = Color3.fromRGB(18, 18, 21),
        Sidebar = Color3.fromRGB(16, 16, 19),
        SidebarItem = Color3.fromRGB(22, 22, 26),
        SidebarItemActive = Color3.fromRGB(32, 32, 38),
        SectionHeader = Color3.fromRGB(20, 20, 24),
        Card = Color3.fromRGB(22, 22, 26),
        CardHover = Color3.fromRGB(28, 28, 33),
        Element = Color3.fromRGB(26, 26, 31),
        ElementHover = Color3.fromRGB(35, 35, 42),
        ElementActive = Color3.fromRGB(44, 44, 53),
        Scrollbar = Color3.fromRGB(50, 50, 60),
        Overlay = Color3.fromRGB(0, 0, 0),
        TextPrimary = Color3.fromRGB(255, 255, 255),
        TextSecondary = Color3.fromRGB(160, 160, 172),
        TextMuted = Color3.fromRGB(95, 95, 108),
        TextDisabled = Color3.fromRGB(65, 65, 75),
        Accent = Color3.fromRGB(255, 255, 255),
        AccentStep = Color3.fromRGB(0, 174, 255),
        AccentStepInactive = Color3.fromRGB(45, 45, 54),
        ToggleActive = Color3.fromRGB(255, 255, 255),
        ToggleInactive = Color3.fromRGB(38, 38, 46),
        ToggleKnob = Color3.fromRGB(14, 14, 16),
        ToggleKnobInactive = Color3.fromRGB(120, 120, 130),
        SliderTrack = Color3.fromRGB(38, 38, 46),
        SliderFill = Color3.fromRGB(255, 255, 255),
        Success = Color3.fromRGB(46, 204, 113),
        Warning = Color3.fromRGB(241, 196, 15),
        Error = Color3.fromRGB(231, 76, 60),
        Info = Color3.fromRGB(52, 152, 219),
        CornerRadius = UDim.new(0, 7),
        SmallCornerRadius = UDim.new(0, 5),
        CardPadding = 10,
        ElementPadding = 8,
        ElementHeight = 36,
        SmallElementHeight = 30,
        FontTitle = Enum.Font.GothamBold,
        FontHeader = Enum.Font.GothamBold,
        FontRegular = Enum.Font.GothamMedium,
        FontBold = Enum.Font.GothamBold,
        FontSizeTitle = 16,
        FontSizeSubtitle = 11,
        FontSizeSection = 12,
        FontSizeRegular = 13,
        FontSizeSmall = 11,
        UseStrokes = false,
        AnimationFast = 0.15,
        AnimationMedium = 0.25,
        AnimationSlow = 0.35,
        EasingStyle = Enum.EasingStyle.Quad,
        EasingDirection = Enum.EasingDirection.Out,
    }
end

local ThemeManager = {
    CurrentTheme = PureBlackWhite,
    Themes = {
        ["Pure Black & White"] = PureBlackWhite,
        ["Default"] = PureBlackWhite,
    },
    _subscribers = {},
}

function ThemeManager:GetTheme()
    return self.CurrentTheme
end

function ThemeManager:RegisterTheme(name, themeTable)
    assert(type(name) == "string", "Theme name must be a string")
    assert(type(themeTable) == "table", "Theme definition must be a table")
    self.Themes[name] = themeTable
end

function ThemeManager:SetTheme(nameOrTable)
    local target = nil
    if type(nameOrTable) == "string" then
        target = self.Themes[nameOrTable]
        assert(target, "Theme '" .. tostring(nameOrTable) .. "' is not registered")
    elseif type(nameOrTable) == "table" then
        target = nameOrTable
    else
        error("Invalid theme argument: expected string or table")
    end
    
    self.CurrentTheme = target
    for callback, _ in pairs(self._subscribers) do
        task.spawn(callback, target)
    end
end

function ThemeManager:Subscribe(callback)
    assert(type(callback) == "function", "Callback must be a function")
    self._subscribers[callback] = true
    return function()
        self._subscribers[callback] = nil
    end
end

return ThemeManager


end

-- Module: src/core/Signals
_modules["src/core/Signals"] = function()
--[[
    LiyHub UI - Signals
    Lightweight, high-performance event / signal implementation in Luau.
]]

local Signal = {}
Signal.__index = Signal

local Connection = {}
Connection.__index = Connection

function Connection.new(signal, fn)
    return setmetatable({
        _signal = signal,
        _fn = fn,
        Connected = true,
    }, Connection)
end

function Connection:Disconnect()
    if not self.Connected then return end
    self.Connected = false
    if self._signal and self._signal._connections then
        for i, conn in ipairs(self._signal._connections) do
            if conn == self then
                table.remove(self._signal._connections, i)
                break
            end
        end
    end
    self._signal = nil
    self._fn = nil
end

Connection.Destroy = Connection.Disconnect

function Signal.new()
    return setmetatable({
        _connections = {},
        _destroyed = false,
    }, Signal)
end

function Signal:Connect(fn)
    assert(type(fn) == "function", "Signal:Connect expected a function")
    if self._destroyed then
        error("Cannot connect to a destroyed Signal")
    end
    local conn = Connection.new(self, fn)
    table.insert(self._connections, conn)
    return conn
end

function Signal:Fire(...)
    if self._destroyed then return end
    local connections = table.clone(self._connections)
    for _, conn in ipairs(connections) do
        if conn.Connected and conn._fn then
            task.spawn(conn._fn, ...)
        end
    end
end

function Signal:Wait()
    if self._destroyed then return nil end
    local runningThread = coroutine.running()
    local conn
    conn = self:Connect(function(...)
        conn:Disconnect()
        task.spawn(runningThread, ...)
    end)
    return coroutine.yield()
end

function Signal:Destroy()
    if self._destroyed then return end
    self._destroyed = true
    for _, conn in ipairs(self._connections) do
        conn.Connected = false
        conn._signal = nil
        conn._fn = nil
    end
    table.clear(self._connections)
end

return Signal


end

-- Module: src/core/Cleanup
_modules["src/core/Cleanup"] = function()
--[[
    LiyHub UI - Cleanup (Maid / Janitor)
    Handles deterministic lifecycle tracking, connection disconnection,
    instance destruction, task cancellation, and safe repeated destruction.
]]

local Cleanup = {}
Cleanup.__index = Cleanup

function Cleanup.new()
    return setmetatable({
        _tasks = {},
        _destroyed = false,
    }, Cleanup)
end

function Cleanup:Add(taskItem)
    if self._destroyed then
        self:_cleanupItem(taskItem)
        return nil
    end
    table.insert(self._tasks, taskItem)
    return taskItem
end

function Cleanup:Remove(taskItem)
    for i, item in ipairs(self._tasks) do
        if item == taskItem then
            table.remove(self._tasks, i)
            return item
        end
    end
    return nil
end

function Cleanup:_cleanupItem(item)
    if item == nil then return end
    
    local itemType = typeof(item)
    if itemType == "RBXScriptConnection" then
        if item.Connected then
            item:Disconnect()
        end
    elseif itemType == "Instance" then
        pcall(function()
            item:Destroy()
        end)
    elseif itemType == "thread" then
        pcall(function()
            task.cancel(item)
        end)
    elseif itemType == "function" then
        pcall(item)
    elseif itemType == "table" then
        if typeof(item.Disconnect) == "function" then
            pcall(function() item:Disconnect() end)
        elseif typeof(item.destroy) == "function" then
            pcall(function() item:destroy() end)
        elseif typeof(item.Destroy) == "function" then
            pcall(function() item:Destroy() end)
        elseif typeof(item.Cancel) == "function" then
            pcall(function() item:Cancel() end)
        elseif typeof(item.cancel) == "function" then
            pcall(function() item:cancel() end)
        end
    end
end

function Cleanup:Clean()
    local tasks = self._tasks
    self._tasks = {}
    for i = #tasks, 1, -1 do
        self:_cleanupItem(tasks[i])
    end
end

function Cleanup:Destroy()
    if self._destroyed then return end
    self._destroyed = true
    self:Clean()
end

return Cleanup


end

-- Module: src/core/Tween
_modules["src/core/Tween"] = function()
--[[
    LiyHub UI - Tween Utility
    Provides standardized animation curves, timing, and cancellation safety.
]]

local TweenService = game:GetService("TweenService")

local TweenUtil = {}

function TweenUtil.Tween(instance, duration, properties, easingStyle, easingDirection)
    if not instance or not instance.Parent then return nil end
    local info = TweenInfo.new(
        duration or 0.2,
        easingStyle or Enum.EasingStyle.Quad,
        easingDirection or Enum.EasingDirection.Out
    )
    local tween = TweenService:Create(instance, info, properties)
    tween:Play()
    return tween
end

function TweenUtil.Color(instance, propertyName, targetColor, duration)
    return TweenUtil.Tween(instance, duration or 0.2, { [propertyName] = targetColor })
end

function TweenUtil.Transparency(instance, propertyName, targetTransparency, duration)
    return TweenUtil.Tween(instance, duration or 0.2, { [propertyName] = targetTransparency })
end

function TweenUtil.Size(instance, targetSize, duration)
    return TweenUtil.Tween(instance, duration or 0.2, { Size = targetSize })
end

function TweenUtil.Position(instance, targetPosition, duration)
    return TweenUtil.Tween(instance, duration or 0.2, { Position = targetPosition })
end

return TweenUtil


end

-- Module: src/core/Layout
_modules["src/core/Layout"] = function()
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


end

-- Module: src/components/Modal
_modules["src/components/Modal"] = function()
--[[
    LiyHub UI - Modal & Notification Component
    Provides interactive confirmation modals and floating toast notifications.
]]

local TweenService = game:GetService("TweenService")

local Modal = {}

function Modal.ShowConfirmation(parentScreenGui, options, theme, cleanup)
    options = options or {}
    local title = options.Title or "Confirmation"
    local message = options.Message or options.Text or "Are you sure you want to proceed?"
    local confirmText = options.ConfirmText or "Confirm"
    local cancelText = options.CancelText or "Cancel"
    local onConfirm = options.OnConfirm or function() end
    local onCancel = options.OnCancel or function() end
    
    local overlay = Instance.new("TextButton")
    overlay.Name = "ModalOverlay"
    overlay.Size = UDim2.new(1, 0, 1, 0)
    overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    overlay.BackgroundTransparency = 1
    overlay.AutoButtonColor = false
    overlay.Text = ""
    overlay.ZIndex = 100
    overlay.Parent = parentScreenGui
    
    local dialog = Instance.new("Frame")
    dialog.Name = "Dialog"
    dialog.Size = UDim2.new(0, 320, 0, 160)
    dialog.Position = UDim2.new(0.5, -160, 0.5, -80)
    dialog.BackgroundColor3 = theme.Header
    dialog.BorderSizePixel = 0
    dialog.ZIndex = 101
    dialog.Parent = overlay
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = theme.CornerRadius
    corner.Parent = dialog
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(1, -24, 0, 24)
    titleLabel.Position = UDim2.new(0, 12, 0, 12)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = theme.TextPrimary
    titleLabel.Font = theme.FontBold
    titleLabel.TextSize = theme.FontSizeTitle
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.ZIndex = 102
    titleLabel.Parent = dialog
    
    local msgLabel = Instance.new("TextLabel")
    msgLabel.Name = "Message"
    msgLabel.Size = UDim2.new(1, -24, 0, 60)
    msgLabel.Position = UDim2.new(0, 12, 0, 40)
    msgLabel.BackgroundTransparency = 1
    msgLabel.Text = message
    msgLabel.TextColor3 = theme.TextSecondary
    msgLabel.Font = theme.FontRegular
    msgLabel.TextSize = theme.FontSizeRegular
    msgLabel.TextXAlignment = Enum.TextXAlignment.Left
    msgLabel.TextYAlignment = Enum.TextYAlignment.Top
    msgLabel.TextWrapped = true
    msgLabel.ZIndex = 102
    msgLabel.Parent = dialog
    
    local btnRow = Instance.new("Frame")
    btnRow.Name = "Buttons"
    btnRow.Size = UDim2.new(1, -24, 0, 32)
    btnRow.Position = UDim2.new(0, 12, 1, -44)
    btnRow.BackgroundTransparency = 1
    btnRow.ZIndex = 102
    btnRow.Parent = dialog
    
    local btnLayout = Instance.new("UIListLayout")
    btnLayout.FillDirection = Enum.FillDirection.Horizontal
    btnLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
    btnLayout.Padding = UDim.new(0, 8)
    btnLayout.Parent = btnRow
    
    local cancelBtn = Instance.new("TextButton")
    cancelBtn.Name = "CancelButton"
    cancelBtn.Size = UDim2.new(0, 90, 1, 0)
    cancelBtn.BackgroundColor3 = theme.Element
    cancelBtn.AutoButtonColor = false
    cancelBtn.Text = cancelText
    cancelBtn.TextColor3 = theme.TextSecondary
    cancelBtn.Font = theme.FontBold
    cancelBtn.TextSize = theme.FontSizeSmall
    cancelBtn.BorderSizePixel = 0
    cancelBtn.ZIndex = 103
    cancelBtn.Parent = btnRow
    
    local cCorner = Instance.new("UICorner")
    cCorner.CornerRadius = theme.SmallCornerRadius
    cCorner.Parent = cancelBtn
    
    local confirmBtn = Instance.new("TextButton")
    confirmBtn.Name = "ConfirmButton"
    confirmBtn.Size = UDim2.new(0, 90, 1, 0)
    confirmBtn.BackgroundColor3 = theme.ElementActive
    confirmBtn.AutoButtonColor = false
    confirmBtn.Text = confirmText
    confirmBtn.TextColor3 = theme.TextPrimary
    confirmBtn.Font = theme.FontBold
    confirmBtn.TextSize = theme.FontSizeSmall
    confirmBtn.BorderSizePixel = 0
    confirmBtn.ZIndex = 103
    confirmBtn.Parent = btnRow
    
    local cfCorner = Instance.new("UICorner")
    cfCorner.CornerRadius = theme.SmallCornerRadius
    cfCorner.Parent = confirmBtn
    
    -- Animate In
    TweenService:Create(overlay, TweenInfo.new(theme.AnimationFast), {
        BackgroundTransparency = 0.5
    }):Play()
    
    local function close(callback)
        local t = TweenService:Create(overlay, TweenInfo.new(theme.AnimationFast), {
            BackgroundTransparency = 1
        })
        t:Play()
        t.Completed:Connect(function()
            overlay:Destroy()
            if callback then
                task.spawn(callback)
            end
        end)
    end
    
    local cfConn = confirmBtn.Activated:Connect(function()
        close(onConfirm)
    end)
    local ccConn = cancelBtn.Activated:Connect(function()
        close(onCancel)
    end)
    
    if cleanup then
        cleanup:Add(cfConn)
        cleanup:Add(ccConn)
        cleanup:Add(overlay)
    end
end

function Modal.Notify(parentScreenGui, options, theme, cleanup)
    options = options or {}
    local title = options.Title or "Notification"
    local message = options.Content or options.Message or ""
    local duration = options.Duration or 3.5
    
    -- Notification Container Frame in bottom-right corner
    local holder = parentScreenGui:FindFirstChild("NotificationHolder")
    if not holder then
        holder = Instance.new("Frame")
        holder.Name = "NotificationHolder"
        holder.Size = UDim2.new(0, 280, 1, -20)
        holder.Position = UDim2.new(1, -290, 0, 10)
        holder.BackgroundTransparency = 1
        holder.ZIndex = 90
        holder.Parent = parentScreenGui
        
        local hList = Instance.new("UIListLayout")
        hList.VerticalAlignment = Enum.VerticalAlignment.Bottom
        hList.SortOrder = Enum.SortOrder.LayoutOrder
        hList.Padding = UDim.new(0, 8)
        hList.Parent = holder
    end
    
    local toast = Instance.new("Frame")
    toast.Name = "Toast"
    toast.Size = UDim2.new(1, 0, 0, 60)
    toast.Position = UDim2.new(1, 300, 0, 0)
    toast.BackgroundColor3 = theme.Header
    toast.BorderSizePixel = 0
    toast.ZIndex = 91
    toast.Parent = holder
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = theme.CornerRadius
    corner.Parent = toast
    
    -- Accent line on the left edge
    local bar = Instance.new("Frame")
    bar.Name = "Bar"
    bar.Size = UDim2.new(0, 3, 1, -12)
    bar.Position = UDim2.new(0, 6, 0, 6)
    bar.BackgroundColor3 = theme.Accent
    bar.BorderSizePixel = 0
    bar.ZIndex = 92
    bar.Parent = toast
    
    local bCorner = Instance.new("UICorner")
    bCorner.CornerRadius = UDim.new(1, 0)
    bCorner.Parent = bar
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(1, -24, 0, 20)
    titleLabel.Position = UDim2.new(0, 16, 0, 8)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = theme.TextPrimary
    titleLabel.Font = theme.FontBold
    titleLabel.TextSize = theme.FontSizeSmall
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.ZIndex = 92
    titleLabel.Parent = toast
    
    local msgLabel = Instance.new("TextLabel")
    msgLabel.Name = "Message"
    msgLabel.Size = UDim2.new(1, -24, 0, 24)
    msgLabel.Position = UDim2.new(0, 16, 0, 28)
    msgLabel.BackgroundTransparency = 1
    msgLabel.Text = message
    msgLabel.TextColor3 = theme.TextSecondary
    msgLabel.Font = theme.FontRegular
    msgLabel.TextSize = 10
    msgLabel.TextXAlignment = Enum.TextXAlignment.Left
    msgLabel.TextWrapped = true
    msgLabel.ZIndex = 92
    msgLabel.Parent = toast
    
    -- Slide In
    toast.Position = UDim2.new(1, 0, 0, 0)
    TweenService:Create(toast, TweenInfo.new(theme.AnimationMedium), {
        Position = UDim2.new(0, 0, 0, 0)
    }):Play()
    
    -- Auto Dismiss
    task.delay(duration, function()
        if toast and toast.Parent then
            local t = TweenService:Create(toast, TweenInfo.new(theme.AnimationFast), {
                Position = UDim2.new(1, 50, 0, 0)
            })
            t:Play()
            t.Completed:Connect(function()
                toast:Destroy()
            end)
        end
    end)
end

return Modal


end

-- Module: src/components/MobilePin
_modules["src/components/MobilePin"] = function()
--[[
    LiyHub UI - Mobile Pin Tab Component
    A floating, draggable capsule pill button designed for mobile & desktop touch.
    Enables quick toggling of the main window with smooth tween animations.
]]

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local GuiService = game:GetService("GuiService")

local MobilePin = {}
MobilePin.__index = MobilePin

function MobilePin.new(screenGui, window, options, theme, cleanup)
    options = options or {}
    local titleText = options.Title or "LiyHub"
    local openSubText = options.OpenText or "Tap to Open"
    local closeSubText = options.CloseText or "Tap to Close"
    local logoAsset = options.Logo or options.Icon or "rbxassetid://6031075936" -- Sparkle / Logo
    local initialPos = options.Position or UDim2.new(0.5, -70, 0, 18)
    
    local container = Instance.new("TextButton")
    container.Name = "LiyHub_MobilePin"
    container.Size = UDim2.new(0, 140, 0, 38)
    container.Position = initialPos
    container.BackgroundColor3 = theme.Header or Color3.fromRGB(18, 18, 22)
    container.AutoButtonColor = false
    container.Text = ""
    container.BorderSizePixel = 0
    container.ZIndex = 200
    container.Active = true
    container.Modal = true
    container.Parent = screenGui
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(1, 0) -- Fully rounded capsule pill
    corner.Parent = container
    
    -- Logo Icon on left
    local iconBg = Instance.new("Frame")
    iconBg.Name = "IconBg"
    iconBg.Size = UDim2.new(0, 26, 0, 26)
    iconBg.Position = UDim2.new(0, 8, 0.5, -13)
    iconBg.BackgroundColor3 = theme.Element or Color3.fromRGB(26, 26, 31)
    iconBg.BorderSizePixel = 0
    iconBg.ZIndex = 201
    iconBg.Parent = container
    
    local ibCorner = Instance.new("UICorner")
    ibCorner.CornerRadius = UDim.new(1, 0)
    ibCorner.Parent = iconBg
    
    local iconImg = Instance.new("ImageLabel")
    iconImg.Name = "Logo"
    iconImg.Size = UDim2.new(0, 16, 0, 16)
    iconImg.Position = UDim2.new(0.5, -8, 0.5, -8)
    iconImg.BackgroundTransparency = 1
    iconImg.Image = logoAsset
    iconImg.ImageColor3 = theme.TextPrimary
    iconImg.ZIndex = 202
    iconImg.Parent = iconBg
    
    -- Text Container
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(1, -44, 0, 15)
    titleLabel.Position = UDim2.new(0, 40, 0, 5)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = titleText
    titleLabel.TextColor3 = theme.TextPrimary
    titleLabel.Font = theme.FontBold
    titleLabel.TextSize = 12
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.ZIndex = 201
    titleLabel.Parent = container
    
    local subLabel = Instance.new("TextLabel")
    subLabel.Name = "Subtitle"
    subLabel.Size = UDim2.new(1, -44, 0, 13)
    subLabel.Position = UDim2.new(0, 40, 0, 20)
    subLabel.BackgroundTransparency = 1
    subLabel.Text = openSubText
    subLabel.TextColor3 = theme.TextSecondary
    subLabel.Font = theme.FontRegular
    subLabel.TextSize = 10
    subLabel.TextXAlignment = Enum.TextXAlignment.Left
    subLabel.ZIndex = 201
    subLabel.Parent = container
    
    local self = setmetatable({
        _container = container,
        _iconImg = iconImg,
        _titleLabel = titleLabel,
        _subLabel = subLabel,
        _window = window,
        _theme = theme,
        _openSubText = openSubText,
        _closeSubText = closeSubText,
        _dragging = false,
        _hasDragged = false,
        _visible = true,
    }, MobilePin)
    
    -- Dragging with Boundary Clamping
    local dragStart = Vector3.zero
    local startPos = container.Position
    local isDragging = false
    local wasDragged = false
    
    local inputBeganConn = container.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            isDragging = true
            wasDragged = false
            dragStart = input.Position
            startPos = container.Position
        end
    end)
    
    local inputChangedConn = UserInputService.InputChanged:Connect(function(input)
        if isDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            if math.abs(delta.X) > 6 or math.abs(delta.Y) > 6 then
                wasDragged = true
                local newX = startPos.X.Offset + delta.X
                local newY = startPos.Y.Offset + delta.Y
                
                -- Clamp to viewport bounds
                local camera = workspace.CurrentCamera
                if camera then
                    local vpSize = camera.ViewportSize
                    newX = math.clamp(newX, 0, math.max(0, vpSize.X - container.AbsoluteSize.X))
                    newY = math.clamp(newY, 0, math.max(0, vpSize.Y - container.AbsoluteSize.Y))
                end
                
                container.Position = UDim2.new(0, newX, 0, newY)
            end
        end
    end)
    
    local inputEndedConn = UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            isDragging = false
            task.delay(0.08, function()
                wasDragged = false
            end)
        end
    end)
    
    -- Universal Activated Event (Modern cross-platform click + tap)
    local clickConn = container.Activated:Connect(function()
        if wasDragged then
            wasDragged = false
            return
        end
        
        -- Bounce animation
        TweenService:Create(container, TweenInfo.new(0.08, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 146, 0, 40)
        }):Play()
        task.delay(0.08, function()
            if container and container.Parent then
                TweenService:Create(container, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    Size = UDim2.new(0, 140, 0, 38)
                }):Play()
            end
        end)
        
        if self._window then
            self._window:Toggle()
            self:UpdateState()
        end
    end)
    
    if cleanup then
        cleanup:Add(inputBeganConn)
        cleanup:Add(inputChangedConn)
        cleanup:Add(inputEndedConn)
        cleanup:Add(clickConn)
        cleanup:Add(container)
    end
    
    self:UpdateState()
    return self
end

function MobilePin:UpdateState()
    if not self._window or not self._window._mainFrame then return end
    local isWinVisible = self._window._mainFrame.Visible
    self._subLabel.Text = isWinVisible and self._closeSubText or self._openSubText
end

function MobilePin:SetVisible(visible)
    self._visible = visible == true
    self._container.Visible = self._visible
end

function MobilePin:SetText(title, subtitle)
    if title then self._titleLabel.Text = tostring(title) end
    if subtitle then self._subLabel.Text = tostring(subtitle) end
end

function MobilePin:SetLogo(assetId)
    self._iconImg.Image = tostring(assetId)
end

function MobilePin:Destroy()
    if self._container then
        self._container:Destroy()
        self._container = nil
    end
end

return MobilePin


end

-- Module: src/components/Button
_modules["src/components/Button"] = function()
--[[
    LiyHub UI - Button Component
    A sleek, matte interactive button with smooth hover and click animations.
]]

local TweenService = game:GetService("TweenService")

local Button = {}
Button.__index = Button

function Button.new(parent, options, theme, cleanup)
    options = options or {}
    local text = options.Text or options.Name or "Button"
    local callback = options.Callback or options.OnClick or function() end
    local icon = options.Icon
    
    local container = Instance.new("TextButton")
    container.Name = "Button_" .. text
    container.Size = UDim2.new(1, 0, 0, theme.ElementHeight or 34)
    container.BackgroundColor3 = theme.Element
    container.AutoButtonColor = false
    container.Text = ""
    container.BorderSizePixel = 0
    container.Parent = parent
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = theme.CornerRadius
    corner.Parent = container
    
    local label = Instance.new("TextLabel")
    label.Name = "Label"
    label.Size = UDim2.new(1, -20, 1, 0)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = theme.TextPrimary
    label.Font = theme.FontBold
    label.TextSize = theme.FontSizeRegular
    label.TextXAlignment = Enum.TextXAlignment.Center
    label.Parent = container
    
    local self = setmetatable({
        _container = container,
        _label = label,
        _theme = theme,
        _callback = callback,
        _disabled = false,
    }, Button)
    
    -- Hover / Click animations
    local hoverConn = container.MouseEnter:Connect(function()
        if self._disabled then return end
        TweenService:Create(container, TweenInfo.new(theme.AnimationFast), {
            BackgroundColor3 = theme.ElementHover
        }):Play()
    end)
    
    local leaveConn = container.MouseLeave:Connect(function()
        if self._disabled then return end
        TweenService:Create(container, TweenInfo.new(theme.AnimationFast), {
            BackgroundColor3 = theme.Element
        }):Play()
    end)
    
    local downConn = container.MouseButton1Down:Connect(function()
        if self._disabled then return end
        TweenService:Create(container, TweenInfo.new(theme.AnimationFast), {
            BackgroundColor3 = theme.ElementActive
        }):Play()
    end)
    
    local upConn = container.MouseButton1Up:Connect(function()
        if self._disabled then return end
        TweenService:Create(container, TweenInfo.new(theme.AnimationFast), {
            BackgroundColor3 = theme.ElementHover
        }):Play()
    end)
    
    local clickConn = container.Activated:Connect(function()
        if self._disabled then return end
        task.spawn(self._callback)
    end)
    
    if cleanup then
        cleanup:Add(hoverConn)
        cleanup:Add(leaveConn)
        cleanup:Add(downConn)
        cleanup:Add(upConn)
        cleanup:Add(clickConn)
        cleanup:Add(container)
    end
    
    return self
end

function Button:SetText(newText)
    self._label.Text = tostring(newText)
end

function Button:SetCallback(newCallback)
    assert(type(newCallback) == "function", "Callback must be a function")
    self._callback = newCallback
end

function Button:SetDisabled(state)
    self._disabled = state == true
    if self._disabled then
        self._container.BackgroundColor3 = self._theme.Element
        self._label.TextColor3 = self._theme.TextDisabled
    else
        self._label.TextColor3 = self._theme.TextPrimary
    end
end

function Button:Destroy()
    if self._container then
        self._container:Destroy()
        self._container = nil
    end
end

return Button


end

-- Module: src/components/ButtonGroup
_modules["src/components/ButtonGroup"] = function()
--[[
    LiyHub UI - Button Group Component
    Places multiple buttons side by side horizontally with balanced spacing.
]]

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
    row.Size = UDim2.new(1, 0, 0, theme.ElementHeight or 34)
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
    
    -- If initial buttons list is provided
    if options.Buttons and type(options.Buttons) == "table" then
        for _, btnOpt in ipairs(options.Buttons) do
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
    local btn = self._buttonCtor.new(self._container, options, self._theme, self._cleanup)
    table.insert(self._buttons, btn)
    self:_rebalanceSizes()
    return btn
end

function ButtonGroup:GetButtons()
    return self._buttons
end

function ButtonGroup:Destroy()
    if self._container then
        self._container:Destroy()
        self._container = nil
    end
end

return ButtonGroup


end

-- Module: src/components/Toggle
_modules["src/components/Toggle"] = function()
--[[
    LiyHub UI - Toggle Component
    An animated switch toggle with synchronized internal state, GetValue, and SetValue.
]]

local TweenService = game:GetService("TweenService")

local Toggle = {}
Toggle.__index = Toggle

function Toggle.new(parent, options, theme, cleanup)
    options = options or {}
    local text = options.Text or options.Name or "Toggle"
    local defaultState = options.Default == true
    local callback = options.Callback or options.OnChange or function() end
    
    local container = Instance.new("TextButton")
    container.Name = "Toggle_" .. text
    container.Size = UDim2.new(1, 0, 0, theme.ElementHeight or 36)
    container.BackgroundColor3 = theme.Element
    container.AutoButtonColor = false
    container.Text = ""
    container.BorderSizePixel = 0
    container.Parent = parent
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = theme.CornerRadius
    corner.Parent = container
    
    local label = Instance.new("TextLabel")
    label.Name = "Label"
    label.Size = UDim2.new(1, -60, 1, 0)
    label.Position = UDim2.new(0, 12, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = theme.TextPrimary
    label.Font = theme.FontRegular
    label.TextSize = theme.FontSizeRegular
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = container
    
    -- Switch Pill Container
    local switch = Instance.new("Frame")
    switch.Name = "Switch"
    switch.Size = UDim2.new(0, 40, 0, 20)
    switch.Position = UDim2.new(1, -50, 0.5, -10)
    switch.BackgroundColor3 = defaultState and theme.ToggleActive or theme.ToggleInactive
    switch.BorderSizePixel = 0
    switch.Parent = container
    
    local switchCorner = Instance.new("UICorner")
    switchCorner.CornerRadius = UDim.new(1, 0)
    switchCorner.Parent = switch
    
    -- Switch Knob
    local knob = Instance.new("Frame")
    knob.Name = "Knob"
    knob.Size = UDim2.new(0, 14, 0, 14)
    knob.Position = defaultState and UDim2.new(1, -17, 0.5, -7) or UDim2.new(0, 3, 0.5, -7)
    knob.BackgroundColor3 = defaultState and theme.ToggleKnob or theme.ToggleKnobInactive
    knob.BorderSizePixel = 0
    knob.Parent = switch
    
    local knobCorner = Instance.new("UICorner")
    knobCorner.CornerRadius = UDim.new(1, 0)
    knobCorner.Parent = knob
    
    local self = setmetatable({
        _container = container,
        _label = label,
        _switch = switch,
        _knob = knob,
        _theme = theme,
        _state = defaultState,
        _callback = callback,
        _disabled = false,
    }, Toggle)
    
    local function updateVisual(animate)
        local animTime = animate and theme.AnimationFast or 0
        local targetSwitchColor = self._state and theme.ToggleActive or theme.ToggleInactive
        local targetKnobColor = self._state and theme.ToggleKnob or theme.ToggleKnobInactive
        local targetKnobPos = self._state and UDim2.new(1, -17, 0.5, -7) or UDim2.new(0, 3, 0.5, -7)
        
        if animTime > 0 then
            TweenService:Create(switch, TweenInfo.new(animTime), {
                BackgroundColor3 = targetSwitchColor
            }):Play()
            TweenService:Create(knob, TweenInfo.new(animTime), {
                BackgroundColor3 = targetKnobColor,
                Position = targetKnobPos,
            }):Play()
        else
            switch.BackgroundColor3 = targetSwitchColor
            knob.BackgroundColor3 = targetKnobColor
            knob.Position = targetKnobPos
        end
    end
    
    -- Hover effect
    local hoverConn = container.MouseEnter:Connect(function()
        if self._disabled then return end
        TweenService:Create(container, TweenInfo.new(theme.AnimationFast), {
            BackgroundColor3 = theme.ElementHover
        }):Play()
    end)
    
    local leaveConn = container.MouseLeave:Connect(function()
        if self._disabled then return end
        TweenService:Create(container, TweenInfo.new(theme.AnimationFast), {
            BackgroundColor3 = theme.Element
        }):Play()
    end)
    
    local clickConn = container.Activated:Connect(function()
        if self._disabled then return end
        self:SetValue(not self._state, true)
    end)
    
    if cleanup then
        cleanup:Add(hoverConn)
        cleanup:Add(leaveConn)
        cleanup:Add(clickConn)
        cleanup:Add(container)
    end
    
    return self
end

function Toggle:GetValue()
    return self._state
end

function Toggle:SetValue(value, fireCallback)
    value = (value == true)
    if self._state == value and fireCallback == nil then return end
    
    self._state = value
    local targetSwitchColor = self._state and self._theme.ToggleActive or self._theme.ToggleInactive
    local targetKnobColor = self._state and self._theme.ToggleKnob or self._theme.ToggleKnobInactive
    local targetKnobPos = self._state and UDim2.new(1, -17, 0.5, -7) or UDim2.new(0, 3, 0.5, -7)
    
    TweenService:Create(self._switch, TweenInfo.new(self._theme.AnimationFast), {
        BackgroundColor3 = targetSwitchColor
    }):Play()
    TweenService:Create(self._knob, TweenInfo.new(self._theme.AnimationFast), {
        BackgroundColor3 = targetKnobColor,
        Position = targetKnobPos,
    }):Play()
    
    if fireCallback ~= false then
        task.spawn(self._callback, self._state)
    end
end

function Toggle:SetText(text)
    self._label.Text = tostring(text)
end

function Toggle:SetDisabled(state)
    self._disabled = state == true
    if self._disabled then
        self._label.TextColor3 = self._theme.TextDisabled
    else
        self._label.TextColor3 = self._theme.TextPrimary
    end
end

function Toggle:Destroy()
    if self._container then
        self._container:Destroy()
        self._container = nil
    end
end

return Toggle


end

-- Module: src/components/ToggleGroup
_modules["src/components/ToggleGroup"] = function()
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


end

-- Module: src/components/Slider
_modules["src/components/Slider"] = function()
--[[
    LiyHub UI - Slider Component
    A precision numeric slider with drag tracking, bounds clamping, step quantization,
    real-time tooltip value bubble, and reliable callback execution.
]]

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local Slider = {}
Slider.__index = Slider

function Slider.new(parent, options, theme, cleanup)
    options = options or {}
    local text = options.Text or options.Name or "Slider"
    local minVal = options.Min or 0
    local maxVal = options.Max or 100
    if maxVal <= minVal then
        maxVal = minVal + 1
    end
    local stepVal = options.Step or 1
    local defaultVal = options.Default or minVal
    local suffix = options.Suffix or ""
    local callback = options.Callback or options.OnChange or function() end
    
    local container = Instance.new("Frame")
    container.Name = "Slider_" .. text
    container.Size = UDim2.new(1, 0, 0, 48)
    container.BackgroundColor3 = theme.Element
    container.BorderSizePixel = 0
    container.Parent = parent
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = theme.CornerRadius
    corner.Parent = container
    
    -- Title Label
    local label = Instance.new("TextLabel")
    label.Name = "Label"
    label.Size = UDim2.new(0.65, 0, 0, 20)
    label.Position = UDim2.new(0, 12, 0, 6)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = theme.TextPrimary
    label.Font = theme.FontRegular
    label.TextSize = theme.FontSizeRegular
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = container
    
    -- Static Value Display Badge on right
    local valueBadge = Instance.new("Frame")
    valueBadge.Name = "ValueBadge"
    valueBadge.Size = UDim2.new(0, 38, 0, 20)
    valueBadge.Position = UDim2.new(1, -50, 0, 6)
    valueBadge.BackgroundColor3 = theme.Card
    valueBadge.BorderSizePixel = 0
    valueBadge.Parent = container
    
    local vbCorner = Instance.new("UICorner")
    vbCorner.CornerRadius = theme.SmallCornerRadius
    vbCorner.Parent = valueBadge
    
    local valueLabel = Instance.new("TextLabel")
    valueLabel.Name = "ValueLabel"
    valueLabel.Size = UDim2.new(1, 0, 1, 0)
    valueLabel.BackgroundTransparency = 1
    valueLabel.Text = tostring(defaultVal) .. suffix
    valueLabel.TextColor3 = theme.TextPrimary
    valueLabel.Font = theme.FontBold
    valueLabel.TextSize = theme.FontSizeSmall
    valueLabel.TextXAlignment = Enum.TextXAlignment.Center
    valueLabel.Parent = valueBadge
    
    -- Track
    local track = Instance.new("TextButton")
    track.Name = "Track"
    track.Size = UDim2.new(1, -24, 0, 6)
    track.Position = UDim2.new(0, 12, 0, 32)
    track.BackgroundColor3 = theme.SliderTrack
    track.AutoButtonColor = false
    track.Text = ""
    track.BorderSizePixel = 0
    track.Parent = container
    
    local trackCorner = Instance.new("UICorner")
    trackCorner.CornerRadius = UDim.new(1, 0)
    trackCorner.Parent = track
    
    -- Fill Bar
    local fill = Instance.new("Frame")
    fill.Name = "Fill"
    fill.Size = UDim2.new(0, 0, 1, 0)
    fill.BackgroundColor3 = theme.SliderFill
    fill.BorderSizePixel = 0
    fill.Parent = track
    
    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(1, 0)
    fillCorner.Parent = fill
    
    -- Knob Handle
    local knob = Instance.new("Frame")
    knob.Name = "Knob"
    knob.Size = UDim2.new(0, 14, 0, 14)
    knob.Position = UDim2.new(1, -7, 0.5, -7)
    knob.BackgroundColor3 = theme.TextPrimary
    knob.BorderSizePixel = 0
    knob.Parent = fill
    
    local knobCorner = Instance.new("UICorner")
    knobCorner.CornerRadius = UDim.new(1, 0)
    knobCorner.Parent = knob
    
    -- Floating Tooltip Bubble above knob (active during drag)
    local tooltip = Instance.new("Frame")
    tooltip.Name = "Tooltip"
    tooltip.Size = UDim2.new(0, 32, 0, 18)
    tooltip.Position = UDim2.new(0.5, -16, 0, -22)
    tooltip.BackgroundColor3 = theme.TextPrimary
    tooltip.BorderSizePixel = 0
    tooltip.Visible = false
    tooltip.ZIndex = 10
    tooltip.Parent = knob
    
    local ttCorner = Instance.new("UICorner")
    ttCorner.CornerRadius = UDim.new(0, 4)
    ttCorner.Parent = tooltip
    
    local ttText = Instance.new("TextLabel")
    ttText.Name = "Text"
    ttText.Size = UDim2.new(1, 0, 1, 0)
    ttText.BackgroundTransparency = 1
    ttText.Text = tostring(defaultVal)
    ttText.TextColor3 = theme.Background
    ttText.Font = theme.FontBold
    ttText.TextSize = 10
    ttText.ZIndex = 11
    ttText.Parent = tooltip
    
    local self = setmetatable({
        _container = container,
        _label = label,
        _valueLabel = valueLabel,
        _track = track,
        _fill = fill,
        _knob = knob,
        _tooltip = tooltip,
        _ttText = ttText,
        _theme = theme,
        _min = minVal,
        _max = maxVal,
        _step = stepVal,
        _suffix = suffix,
        _value = defaultVal,
        _callback = callback,
        _dragging = false,
        _disabled = false,
    }, Slider)
    
    local function updateFromInput(inputX)
        local trackAbsPos = track.AbsolutePosition.X
        local trackAbsSize = track.AbsoluteSize.X
        if trackAbsSize <= 0 then return end
        
        local ratio = math.clamp((inputX - trackAbsPos) / trackAbsSize, 0, 1)
        local rawVal = self._min + (ratio * (self._max - self._min))
        self:SetValue(rawVal, true)
    end
    
    local trackDown = track.MouseButton1Down:Connect(function()
        if self._disabled then return end
        self._dragging = true
        self._tooltip.Visible = true
        local mousePos = UserInputService:GetMouseLocation().X
        updateFromInput(mousePos)
    end)
    
    local inputChangedConn = UserInputService.InputChanged:Connect(function(input)
        if self._dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            updateFromInput(input.Position.X)
        end
    end)
    
    local inputEndedConn = UserInputService.InputEnded:Connect(function(input)
        if self._dragging and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
            self._dragging = false
            self._tooltip.Visible = false
        end
    end)
    
    if cleanup then
        cleanup:Add(trackDown)
        cleanup:Add(inputChangedConn)
        cleanup:Add(inputEndedConn)
        cleanup:Add(container)
    end
    
    self:SetValue(defaultVal, false)
    return self
end

function Slider:GetValue()
    return self._value
end

function Slider:SetValue(val, fireCallback)
    local clamped = math.clamp(val, self._min, self._max)
    if self._step > 0 then
        local steps = math.round((clamped - self._min) / self._step)
        clamped = self._min + (steps * self._step)
    end
    clamped = math.clamp(clamped, self._min, self._max)
    
    self._value = clamped
    
    local ratio = (self._value - self._min) / (self._max - self._min)
    if self._max == self._min then ratio = 1 end
    
    self._fill.Size = UDim2.new(ratio, 0, 1, 0)
    
    local displayStr
    if self._step >= 1 then
        displayStr = string.format("%d", math.round(self._value))
    else
        displayStr = string.format("%.2f", self._value)
    end
    self._valueLabel.Text = displayStr .. self._suffix
    self._ttText.Text = displayStr
    
    if fireCallback ~= false then
        task.spawn(self._callback, self._value)
    end
end

function Slider:SetText(text)
    self._label.Text = tostring(text)
end

function Slider:Destroy()
    if self._container then
        self._container:Destroy()
        self._container = nil
    end
end

return Slider

end

-- Module: src/components/SliderGroup
_modules["src/components/SliderGroup"] = function()
--[[
    LiyHub UI - Slider Group Component
    Groups multiple sliders in a shared card with isolated states and callbacks.
]]

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


end

-- Module: src/components/Input
_modules["src/components/Input"] = function()
--[[
    LiyHub UI - Input Component
    A text entry box with placeholder support, focus effects, GetValue, and SetValue.
]]

local TweenService = game:GetService("TweenService")

local Input = {}
Input.__index = Input

function Input.new(parent, options, theme, cleanup)
    options = options or {}
    local text = options.Text or options.Name or "Input"
    local placeholder = options.Placeholder or "Type here..."
    local defaultText = options.Default or ""
    local clearOnFocus = options.ClearOnFocus == true
    local callback = options.Callback or options.OnChange or function() end
    local onSubmit = options.OnSubmit or options.OnEnter or function() end
    
    local container = Instance.new("Frame")
    container.Name = "Input_" .. text
    container.Size = UDim2.new(1, 0, 0, theme.ElementHeight or 36)
    container.BackgroundColor3 = theme.Element
    container.BorderSizePixel = 0
    container.Parent = parent
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = theme.CornerRadius
    corner.Parent = container
    
    local label = Instance.new("TextLabel")
    label.Name = "Label"
    label.Size = UDim2.new(0.45, 0, 1, 0)
    label.Position = UDim2.new(0, 12, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = theme.TextPrimary
    label.Font = theme.FontRegular
    label.TextSize = theme.FontSizeRegular
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = container
    
    -- TextBox container
    local boxBg = Instance.new("Frame")
    boxBg.Name = "BoxBackground"
    boxBg.Size = UDim2.new(0.55, -20, 0, 26)
    boxBg.Position = UDim2.new(0.45, 8, 0.5, -13)
    boxBg.BackgroundColor3 = theme.Card
    boxBg.BorderSizePixel = 0
    boxBg.Parent = container
    
    local boxCorner = Instance.new("UICorner")
    boxCorner.CornerRadius = theme.SmallCornerRadius
    boxCorner.Parent = boxBg
    
    local textBox = Instance.new("TextBox")
    textBox.Name = "TextBox"
    textBox.Size = UDim2.new(1, -12, 1, 0)
    textBox.Position = UDim2.new(0, 6, 0, 0)
    textBox.BackgroundTransparency = 1
    textBox.Text = defaultText
    textBox.PlaceholderText = placeholder
    textBox.PlaceholderColor3 = theme.TextMuted
    textBox.TextColor3 = theme.TextPrimary
    textBox.Font = theme.FontRegular
    textBox.TextSize = theme.FontSizeSmall
    textBox.ClearTextOnFocus = clearOnFocus
    textBox.TextXAlignment = Enum.TextXAlignment.Left
    textBox.Parent = boxBg
    
    local self = setmetatable({
        _container = container,
        _label = label,
        _boxBg = boxBg,
        _textBox = textBox,
        _theme = theme,
        _value = defaultText,
        _callback = callback,
        _onSubmit = onSubmit,
        _disabled = false,
    }, Input)
    
    -- Focus in/out animations
    local focusInConn = textBox.Focused:Connect(function()
        if self._disabled then return end
        TweenService:Create(boxBg, TweenInfo.new(theme.AnimationFast), {
            BackgroundColor3 = theme.ElementActive
        }):Play()
    end)
    
    local focusLostConn = textBox.FocusLost:Connect(function(enterPressed)
        if self._disabled then return end
        TweenService:Create(boxBg, TweenInfo.new(theme.AnimationFast), {
            BackgroundColor3 = theme.Card
        }):Play()
        
        self._value = textBox.Text
        task.spawn(self._callback, self._value)
        if enterPressed then
            task.spawn(self._onSubmit, self._value)
        end
    end)
    
    if cleanup then
        cleanup:Add(focusInConn)
        cleanup:Add(focusLostConn)
        cleanup:Add(container)
    end
    
    return self
end

function Input:GetValue()
    return self._value
end

function Input:SetValue(val, fireCallback)
    self._value = tostring(val or "")
    self._textBox.Text = self._value
    if fireCallback ~= false then
        task.spawn(self._callback, self._value)
    end
end

function Input:SetPlaceholder(text)
    self._textBox.PlaceholderText = tostring(text)
end

function Input:Destroy()
    if self._container then
        self._container:Destroy()
        self._container = nil
    end
end

return Input


end

-- Module: src/components/InputGroup
_modules["src/components/InputGroup"] = function()
--[[
    LiyHub UI - Input Group Component
    Groups multiple text inputs in a shared card with isolated states and callbacks.
]]

local Input = nil
pcall(function()
    Input = require(script.Parent.Input)
end)

local InputGroup = {}
InputGroup.__index = InputGroup

function InputGroup.new(parent, options, theme, cleanup, inputModule)
    options = options or {}
    local inputCtor = inputModule or Input
    
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
        _inputs = {},
        _theme = theme,
        _cleanup = cleanup,
        _inputCtor = inputCtor,
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

function InputGroup:AddInput(options)
    local inp = self._inputCtor.new(self._container, options, self._theme, self._cleanup)
    table.insert(self._inputs, inp)
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


end

-- Module: src/components/Dropdown
_modules["src/components/Dropdown"] = function()
--[[
    LiyHub UI - Dropdown Component
    Supports Single-select and Multi-select modes, expandable animated list,
    options update, and synchronized state.
]]

local TweenService = game:GetService("TweenService")

local Dropdown = {}
Dropdown.__index = Dropdown

function Dropdown.new(parent, options, theme, cleanup)
    options = options or {}
    local text = options.Text or options.Name or "Dropdown"
    local rawOptions = options.Options or {}
    local isMulti = options.MultiSelect == true
    local defaultVal = options.Default
    local callback = options.Callback or options.OnChange or function() end
    
    local container = Instance.new("Frame")
    container.Name = "Dropdown_" .. text
    container.Size = UDim2.new(1, 0, 0, theme.ElementHeight or 36)
    container.BackgroundColor3 = theme.Element
    container.ClipsDescendants = true
    container.BorderSizePixel = 0
    container.Parent = parent
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = theme.CornerRadius
    corner.Parent = container
    
    -- Header button (toggles open/closed)
    local header = Instance.new("TextButton")
    header.Name = "Header"
    header.Size = UDim2.new(1, 0, 0, theme.ElementHeight or 36)
    header.BackgroundTransparency = 1
    header.AutoButtonColor = false
    header.Text = ""
    header.Parent = container
    
    local label = Instance.new("TextLabel")
    label.Name = "Label"
    label.Size = UDim2.new(0.5, 0, 1, 0)
    label.Position = UDim2.new(0, 12, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = theme.TextPrimary
    label.Font = theme.FontRegular
    label.TextSize = theme.FontSizeRegular
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = header
    
    local selectionLabel = Instance.new("TextLabel")
    selectionLabel.Name = "SelectionLabel"
    selectionLabel.Size = UDim2.new(0.5, -45, 1, 0)
    selectionLabel.Position = UDim2.new(0.5, 5, 0, 0)
    selectionLabel.BackgroundTransparency = 1
    selectionLabel.Text = "Select..."
    selectionLabel.TextColor3 = theme.TextSecondary
    selectionLabel.Font = theme.FontRegular
    selectionLabel.TextSize = theme.FontSizeSmall
    selectionLabel.TextXAlignment = Enum.TextXAlignment.Right
    selectionLabel.TextTruncate = Enum.TextTruncate.AtEnd
    selectionLabel.Parent = header
    
    local arrow = Instance.new("TextLabel")
    arrow.Name = "Arrow"
    arrow.Size = UDim2.new(0, 20, 0, 20)
    arrow.Position = UDim2.new(1, -30, 0.5, -10)
    arrow.BackgroundTransparency = 1
    arrow.Text = "v"
    arrow.TextColor3 = theme.TextSecondary
    arrow.Font = theme.FontBold
    arrow.TextSize = 11
    arrow.Parent = header
    
    -- Options List Container
    local listFrame = Instance.new("Frame")
    listFrame.Name = "OptionsList"
    listFrame.Size = UDim2.new(1, -12, 0, 0)
    listFrame.Position = UDim2.new(0, 6, 0, (theme.ElementHeight or 36) + 2)
    listFrame.BackgroundTransparency = 1
    listFrame.BorderSizePixel = 0
    listFrame.Parent = container
    
    local listLayout = Instance.new("UIListLayout")
    listLayout.SortOrder = Enum.SortOrder.LayoutOrder
    listLayout.Padding = UDim.new(0, 3)
    listLayout.Parent = listFrame
    
    local self = setmetatable({
        _container = container,
        _header = header,
        _label = label,
        _selectionLabel = selectionLabel,
        _arrow = arrow,
        _listFrame = listFrame,
        _theme = theme,
        _isMulti = isMulti,
        _options = rawOptions,
        _selected = isMulti and {} or nil,
        _isOpen = false,
        _callback = callback,
        _optionButtons = {},
        _cleanup = cleanup,
    }, Dropdown)
    
    local headerClick = header.Activated:Connect(function()
        self:ToggleOpen()
    end)
    
    if cleanup then
        cleanup:Add(headerClick)
        cleanup:Add(container)
    end
    
    self:SetOptions(rawOptions)
    if defaultVal ~= nil then
        self:SetValue(defaultVal, false)
    end
    
    return self
end

function Dropdown:_recalculateHeight()
    local itemHeight = 28
    local headerH = self._theme.ElementHeight or 36
    if self._isOpen then
        local count = #self._options
        local totalListH = count * (itemHeight + 3) + 6
        self._listFrame.Size = UDim2.new(1, -12, 0, totalListH)
        TweenService:Create(self._container, TweenInfo.new(self._theme.AnimationFast), {
            Size = UDim2.new(1, 0, 0, headerH + totalListH + 4)
        }):Play()
        self._arrow.Text = "^"
    else
        TweenService:Create(self._container, TweenInfo.new(self._theme.AnimationFast), {
            Size = UDim2.new(1, 0, 0, headerH)
        }):Play()
        self._arrow.Text = "v"
    end
end

function Dropdown:ToggleOpen()
    self._isOpen = not self._isOpen
    self:_recalculateHeight()
end

function Dropdown:SetOpen(state)
    self._isOpen = state == true
    self:_recalculateHeight()
end

function Dropdown:SetOptions(newOptions)
    self._options = newOptions or {}
    for _, btn in pairs(self._optionButtons) do
        btn:Destroy()
    end
    self._optionButtons = {}
    
    for i, opt in ipairs(self._options) do
        local optName = tostring(opt)
        local optBtn = Instance.new("TextButton")
        optBtn.Name = "Option_" .. optName
        optBtn.Size = UDim2.new(1, 0, 0, 28)
        optBtn.BackgroundColor3 = self._theme.Card
        optBtn.AutoButtonColor = false
        optBtn.Text = ""
        optBtn.BorderSizePixel = 0
        optBtn.Parent = self._listFrame
        
        local corner = Instance.new("UICorner")
        corner.CornerRadius = self._theme.SmallCornerRadius
        corner.Parent = optBtn
        
        local optLabel = Instance.new("TextLabel")
        optLabel.Name = "Label"
        optLabel.Size = UDim2.new(1, -30, 1, 0)
        optLabel.Position = UDim2.new(0, 10, 0, 0)
        optLabel.BackgroundTransparency = 1
        optLabel.Text = optName
        optLabel.TextColor3 = self._theme.TextSecondary
        optLabel.Font = self._theme.FontRegular
        optLabel.TextSize = self._theme.FontSizeSmall
        optLabel.TextXAlignment = Enum.TextXAlignment.Left
        optLabel.Parent = optBtn
        
        local check = Instance.new("TextLabel")
        check.Name = "Check"
        check.Size = UDim2.new(0, 20, 1, 0)
        check.Position = UDim2.new(1, -25, 0, 0)
        check.BackgroundTransparency = 1
        check.Text = ""
        check.TextColor3 = self._theme.TextPrimary
        check.Font = self._theme.FontBold
        check.TextSize = 12
        check.Parent = optBtn
        
        optBtn.Activated:Connect(function()
            if self._isMulti then
                local exists = false
                for idx, v in ipairs(self._selected) do
                    if v == optName then
                        table.remove(self._selected, idx)
                        exists = true
                        break
                    end
                end
                if not exists then
                    table.insert(self._selected, optName)
                end
                self:_updateMultiDisplay()
                task.spawn(self._callback, table.clone(self._selected))
            else
                self._selected = optName
                self._selectionLabel.Text = optName
                self:SetOpen(false)
                self:_updateSingleDisplay()
                task.spawn(self._callback, self._selected)
            end
        end)
        
        self._optionButtons[optName] = optBtn
    end
    
    if self._isMulti then
        self:_updateMultiDisplay()
    else
        self:_updateSingleDisplay()
    end
    if self._isOpen then
        self:_recalculateHeight()
    end
end

function Dropdown.Refresh(self, newOptions)
    self:SetOptions(newOptions)
end

function Dropdown:_updateSingleDisplay()
    for optName, btn in pairs(self._optionButtons) do
        local check = btn:FindFirstChild("Check")
        local optLabel = btn:FindFirstChild("Label")
        if optName == self._selected then
            btn.BackgroundColor3 = self._theme.ElementHover
            if check then check.Text = "X" end
            if optLabel then optLabel.TextColor3 = self._theme.TextPrimary end
        else
            btn.BackgroundColor3 = self._theme.Card
            if check then check.Text = "" end
            if optLabel then optLabel.TextColor3 = self._theme.TextSecondary end
        end
    end
    self._selectionLabel.Text = self._selected or "Select..."
end

function Dropdown:_updateMultiDisplay()
    local selectedMap = {}
    for _, v in ipairs(self._selected or {}) do
        selectedMap[v] = true
    end
    
    for optName, btn in pairs(self._optionButtons) do
        local check = btn:FindFirstChild("Check")
        local optLabel = btn:FindFirstChild("Label")
        if selectedMap[optName] then
            btn.BackgroundColor3 = self._theme.ElementHover
            if check then check.Text = "X" end
            if optLabel then optLabel.TextColor3 = self._theme.TextPrimary end
        else
            btn.BackgroundColor3 = self._theme.Card
            if check then check.Text = "" end
            if optLabel then optLabel.TextColor3 = self._theme.TextSecondary end
        end
    end
    
    local count = #self._selected
    if count == 0 then
        self._selectionLabel.Text = "None selected"
    elseif count == 1 then
        self._selectionLabel.Text = self._selected[1]
    else
        self._selectionLabel.Text = tostring(count) .. " selected"
    end
end

function Dropdown:GetValue()
    if self._isMulti then
        return table.clone(self._selected)
    else
        return self._selected
    end
end

function Dropdown:SetValue(val, fireCallback)
    if self._isMulti then
        if type(val) == "table" then
            self._selected = table.clone(val)
        else
            self._selected = { tostring(val) }
        end
        self:_updateMultiDisplay()
        if fireCallback ~= false then
            task.spawn(self._callback, table.clone(self._selected))
        end
    else
        self._selected = tostring(val)
        self:_updateSingleDisplay()
        if fireCallback ~= false then
            task.spawn(self._callback, self._selected)
        end
    end
end

function Dropdown:SetText(text)
    self._label.Text = tostring(text)
end

function Dropdown:Destroy()
    if self._container then
        self._container:Destroy()
        self._container = nil
    end
end

return Dropdown


end

-- Module: src/components/DropdownGroup
_modules["src/components/DropdownGroup"] = function()
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


end

-- Module: src/components/Keybind
_modules["src/components/Keybind"] = function()
--[[
    LiyHub UI - Keybind Component
    An interactive keybind component that listens for key presses and triggers callbacks.
]]

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local Keybind = {}
Keybind.__index = Keybind

function Keybind.new(parent, options, theme, cleanup)
    options = options or {}
    local text = options.Text or options.Name or "Keybind"
    local defaultKey = options.Default or Enum.KeyCode.RightControl
    local callback = options.Callback or options.OnChange or function() end
    local onTrigger = options.OnTrigger or function() end
    
    local container = Instance.new("Frame")
    container.Name = "Keybind_" .. text
    container.Size = UDim2.new(1, 0, 0, theme.ElementHeight or 36)
    container.BackgroundColor3 = theme.Element
    container.BorderSizePixel = 0
    container.Parent = parent
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = theme.CornerRadius
    corner.Parent = container
    
    local label = Instance.new("TextLabel")
    label.Name = "Label"
    label.Size = UDim2.new(0.6, 0, 1, 0)
    label.Position = UDim2.new(0, 12, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = theme.TextPrimary
    label.Font = theme.FontRegular
    label.TextSize = theme.FontSizeRegular
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = container
    
    -- Keybind Button Badge
    local keyButton = Instance.new("TextButton")
    keyButton.Name = "KeyButton"
    keyButton.Size = UDim2.new(0.4, -20, 0, 24)
    keyButton.Position = UDim2.new(0.6, 10, 0.5, -12)
    keyButton.BackgroundColor3 = theme.Card
    keyButton.AutoButtonColor = false
    keyButton.Text = defaultKey.Name
    keyButton.TextColor3 = theme.TextPrimary
    keyButton.Font = theme.FontBold
    keyButton.TextSize = theme.FontSizeSmall
    keyButton.BorderSizePixel = 0
    keyButton.Parent = container
    
    local keyCorner = Instance.new("UICorner")
    keyCorner.CornerRadius = theme.SmallCornerRadius
    keyCorner.Parent = keyButton
    
    local self = setmetatable({
        _container = container,
        _label = label,
        _keyButton = keyButton,
        _theme = theme,
        _key = defaultKey,
        _listening = false,
        _callback = callback,
        _onTrigger = onTrigger,
        _disabled = false,
    }, Keybind)
    
    local keyClickConn = keyButton.Activated:Connect(function()
        if self._disabled then return end
        self._listening = true
        self._keyButton.Text = "..."
        TweenService:Create(self._keyButton, TweenInfo.new(theme.AnimationFast), {
            BackgroundColor3 = theme.ElementActive
        }):Play()
    end)
    
    local inputBeganConn = UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if self._listening then
            if input.UserInputType == Enum.UserInputType.Keyboard then
                self._listening = false
                if input.KeyCode ~= Enum.KeyCode.Unknown then
                    self:SetValue(input.KeyCode, true)
                else
                    self:SetValue(self._key, false)
                end
                TweenService:Create(self._keyButton, TweenInfo.new(theme.AnimationFast), {
                    BackgroundColor3 = theme.Card
                }):Play()
            end
        else
            if not gameProcessed and input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == self._key then
                task.spawn(self._onTrigger)
            end
        end
    end)
    
    if cleanup then
        cleanup:Add(keyClickConn)
        cleanup:Add(inputBeganConn)
        cleanup:Add(container)
    end
    
    return self
end

function Keybind:GetValue()
    return self._key
end

function Keybind:SetValue(keyCode, fireCallback)
    if typeof(keyCode) == "EnumItem" and keyCode.EnumType == Enum.KeyCode then
        self._key = keyCode
        self._keyButton.Text = keyCode.Name
        if fireCallback ~= false then
            task.spawn(self._callback, self._key)
        end
    end
end

function Keybind:SetText(text)
    self._label.Text = tostring(text)
end

function Keybind:Destroy()
    if self._container then
        self._container:Destroy()
        self._container = nil
    end
end

return Keybind


end

-- Module: src/components/Paragraph
_modules["src/components/Paragraph"] = function()
--[[
    LiyHub UI - Paragraph Component
    An informative text card supporting dynamic content and titles.
]]

local Paragraph = {}
Paragraph.__index = Paragraph

function Paragraph.new(parent, options, theme, cleanup)
    options = options or {}
    local titleText = options.Title or options.Name or "Information"
    local contentText = options.Content or options.Text or ""
    
    local container = Instance.new("Frame")
    container.Name = "Paragraph_" .. titleText
    container.Size = UDim2.new(1, 0, 0, 0)
    container.AutomaticSize = Enum.AutomaticSize.Y
    container.BackgroundColor3 = theme.Element
    container.BorderSizePixel = 0
    container.Parent = parent
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = theme.CornerRadius
    corner.Parent = container
    
    local padding = Instance.new("UIPadding")
    padding.PaddingTop = UDim.new(0, 10)
    padding.PaddingBottom = UDim.new(0, 10)
    padding.PaddingLeft = UDim.new(0, 12)
    padding.PaddingRight = UDim.new(0, 12)
    padding.Parent = container
    
    local list = Instance.new("UIListLayout")
    list.SortOrder = Enum.SortOrder.LayoutOrder
    list.Padding = UDim.new(0, 4)
    list.Parent = container
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(1, 0, 0, 18)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = titleText
    titleLabel.TextColor3 = theme.TextPrimary
    titleLabel.Font = theme.FontBold
    titleLabel.TextSize = theme.FontSizeRegular
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = container
    
    local contentLabel = Instance.new("TextLabel")
    contentLabel.Name = "Content"
    contentLabel.Size = UDim2.new(1, 0, 0, 0)
    contentLabel.AutomaticSize = Enum.AutomaticSize.Y
    contentLabel.BackgroundTransparency = 1
    contentLabel.Text = contentText
    contentLabel.TextColor3 = theme.TextSecondary
    contentLabel.Font = theme.FontRegular
    contentLabel.TextSize = theme.FontSizeSmall
    contentLabel.TextXAlignment = Enum.TextXAlignment.Left
    contentLabel.TextWrapped = true
    contentLabel.Parent = container
    
    local self = setmetatable({
        _container = container,
        _titleLabel = titleLabel,
        _contentLabel = contentLabel,
        _theme = theme,
    }, Paragraph)
    
    if cleanup then
        cleanup:Add(container)
    end
    
    return self
end

function Paragraph:SetTitle(title)
    self._titleLabel.Text = tostring(title)
end

function Paragraph:SetContent(content)
    self._contentLabel.Text = tostring(content)
end

function Paragraph:Destroy()
    if self._container then
        self._container:Destroy()
        self._container = nil
    end
end

return Paragraph


end

-- Module: src/components/Divider
_modules["src/components/Divider"] = function()
--[[
    LiyHub UI - Divider Component
    A subtle horizontal separator line.
]]

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


end

-- Module: src/components/Banner
_modules["src/components/Banner"] = function()
--[[
    LiyHub UI - Banner Component
    A visual presentation card featuring an image header, title, and
    collapsible explanatory text supporting Asset IDs and Web URLs.
]]

local TweenService = game:GetService("TweenService")

local Banner = {}
Banner.__index = Banner

function Banner.new(parent, options, theme, cleanup)
    options = options or {}
    local title = options.Title or options.Name or "LiyHub Announcement"
    local text = options.Text or options.Description or "Welcome to LiyHub v2.2 Pure B&W! This banner supports Discord CDN links, Google/Web image URLs, or Roblox Asset IDs, complete with collapsible text paragraphs."
    local image = options.Image or options.AssetId or "rbxassetid://15634771265"
    local imageHeight = options.ImageHeight or 105
    local defaultCollapsed = options.Collapsed == true
    
    local container = Instance.new("Frame")
    container.Name = "Banner"
    container.Size = UDim2.new(1, 0, 0, 0)
    container.AutomaticSize = Enum.AutomaticSize.Y
    container.BackgroundColor3 = theme.Card
    container.BorderSizePixel = 0
    container.ClipsDescendants = true
    container.Parent = parent
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = theme.CornerRadius
    corner.Parent = container
    
    local list = Instance.new("UIListLayout")
    list.SortOrder = Enum.SortOrder.LayoutOrder
    list.Padding = UDim.new(0, 6)
    list.Parent = container
    
    -- Banner Header (Title & Collapse Arrow)
    local header = Instance.new("TextButton")
    header.Name = "Header"
    header.Size = UDim2.new(1, 0, 0, 24)
    header.BackgroundTransparency = 1
    header.AutoButtonColor = false
    header.Text = ""
    header.Parent = container
    
    local hPad = Instance.new("UIPadding")
    hPad.PaddingLeft = UDim.new(0, 10)
    hPad.PaddingRight = UDim.new(0, 10)
    hPad.PaddingTop = UDim.new(0, 6)
    hPad.Parent = header
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(1, -24, 1, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = theme.TextPrimary
    titleLabel.Font = theme.FontBold
    titleLabel.TextSize = theme.FontSizeSection or 12
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = header
    
    local arrow = Instance.new("TextLabel")
    arrow.Name = "Arrow"
    arrow.Size = UDim2.new(0, 20, 1, 0)
    arrow.Position = UDim2.new(1, -20, 0, 0)
    arrow.BackgroundTransparency = 1
    arrow.Text = defaultCollapsed and "v" or "^"
    arrow.TextColor3 = theme.TextSecondary
    arrow.Font = theme.FontBold
    arrow.TextSize = 10
    arrow.Parent = header
    
    -- Content Box (Image + Description)
    local contentBox = Instance.new("Frame")
    contentBox.Name = "ContentBox"
    contentBox.Size = UDim2.new(1, 0, 0, 0)
    contentBox.AutomaticSize = Enum.AutomaticSize.Y
    contentBox.BackgroundTransparency = 1
    contentBox.Visible = not defaultCollapsed
    contentBox.Parent = container
    
    local cbList = Instance.new("UIListLayout")
    cbList.SortOrder = Enum.SortOrder.LayoutOrder
    cbList.Padding = UDim.new(0, 6)
    cbList.Parent = contentBox
    
    local cbPad = Instance.new("UIPadding")
    cbPad.PaddingLeft = UDim.new(0, 8)
    cbPad.PaddingRight = UDim.new(0, 8)
    cbPad.PaddingBottom = UDim.new(0, 10)
    cbPad.Parent = contentBox
    
    -- Image container
    local imageLabel = Instance.new("ImageLabel")
    imageLabel.Name = "BannerImage"
    imageLabel.Size = UDim2.new(1, 0, 0, imageHeight)
    imageLabel.BackgroundColor3 = theme.Header
    imageLabel.Image = image
    imageLabel.ScaleType = Enum.ScaleType.Crop
    imageLabel.BorderSizePixel = 0
    imageLabel.Parent = contentBox
    
    local imgCorner = Instance.new("UICorner")
    imgCorner.CornerRadius = theme.CornerRadius
    imgCorner.Parent = imageLabel
    
    local descLabel = Instance.new("TextLabel")
    descLabel.Name = "Description"
    descLabel.Size = UDim2.new(1, 0, 0, 0)
    descLabel.AutomaticSize = Enum.AutomaticSize.Y
    descLabel.BackgroundTransparency = 1
    descLabel.Text = text
    descLabel.TextColor3 = theme.TextSecondary
    descLabel.Font = theme.FontRegular
    descLabel.TextSize = theme.FontSizeSmall
    descLabel.TextXAlignment = Enum.TextXAlignment.Left
    descLabel.TextWrapped = true
    descLabel.Parent = contentBox
    
    local self = setmetatable({
        _container = container,
        _header = header,
        _titleLabel = titleLabel,
        _arrow = arrow,
        _contentBox = contentBox,
        _imageLabel = imageLabel,
        _descLabel = descLabel,
        _theme = theme,
        _collapsed = defaultCollapsed,
    }, Banner)
    
    local toggleConn = header.Activated:Connect(function()
        self:Toggle()
    end)

    if cleanup then
        cleanup:Add(toggleConn)
        cleanup:Add(container)
    end
    
    return self
end

function Banner:Toggle()
    self._collapsed = not self._collapsed
    self._contentBox.Visible = not self._collapsed
    self._arrow.Text = self._collapsed and "v" or "^"
end

function Banner:SetImage(imageId)
    self._imageLabel.Image = tostring(imageId)
end

function Banner:SetTitle(title)
    self._titleLabel.Text = tostring(title)
end

function Banner:SetText(text)
    self._descLabel.Text = tostring(text)
end

function Banner:Destroy()
    if self._container then
        self._container:Destroy()
        self._container = nil
    end
end

return Banner

end

-- Module: src/components/Progression
_modules["src/components/Progression"] = function()
--[[
    LiyHub UI - Progression Component
    A visual step workflow with step nodes, connection lines, status badges,
    step navigation buttons, and step-specific content containers.
]]

local TweenService = game:GetService("TweenService")

local Progression = {}
Progression.__index = Progression

-- Common Builder / Lucide icon asset IDs or symbol fallbacks
local DEFAULT_STEP_ICONS = {
    [1] = "rbxassetid://6031075931", -- Home
    [2] = "rbxassetid://6031075929", -- User
    [3] = "rbxassetid://6031094678", -- Check / Target
    [4] = "rbxassetid://6031091004", -- Play / Swords
    [5] = "rbxassetid://6031075936", -- Reward / Star
}

function Progression.new(parent, options, theme, cleanup)
    options = options or {}
    local titleText = options.Title or options.Name or "Progression"
    local subtitleText = options.Subtitle or "Step workflow progression"
    local steps = options.Steps or {
        { Label = "Step 1" },
        { Label = "Step 2" },
        { Label = "Step 3" },
    }
    local initialStep = math.clamp(options.CurrentStep or options.Default or 1, 1, #steps)
    local onStepChanged = options.OnStepChanged or options.Callback or function() end
    
    local container = Instance.new("Frame")
    container.Name = "Progression_" .. titleText
    container.Size = UDim2.new(1, 0, 0, 0)
    container.AutomaticSize = Enum.AutomaticSize.Y
    container.BackgroundColor3 = theme.Card
    container.BorderSizePixel = 0
    container.Parent = parent
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = theme.CornerRadius
    corner.Parent = container
    
    local padding = Instance.new("UIPadding")
    padding.PaddingTop = UDim.new(0, 12)
    padding.PaddingBottom = UDim.new(0, 12)
    padding.PaddingLeft = UDim.new(0, 14)
    padding.PaddingRight = UDim.new(0, 14)
    padding.Parent = container
    
    local list = Instance.new("UIListLayout")
    list.SortOrder = Enum.SortOrder.LayoutOrder
    list.Padding = UDim.new(0, 10)
    list.Parent = container
    
    -- Title & Subtitle
    local headerFrame = Instance.new("Frame")
    headerFrame.Name = "Header"
    headerFrame.Size = UDim2.new(1, 0, 0, 36)
    headerFrame.BackgroundTransparency = 1
    headerFrame.Parent = container
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(1, 0, 0, 20)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = titleText
    titleLabel.TextColor3 = theme.TextPrimary
    titleLabel.Font = theme.FontBold
    titleLabel.TextSize = theme.FontSizeRegular
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = headerFrame
    
    local subLabel = Instance.new("TextLabel")
    subLabel.Name = "Subtitle"
    subLabel.Size = UDim2.new(1, 0, 0, 16)
    subLabel.Position = UDim2.new(0, 0, 0, 20)
    subLabel.BackgroundTransparency = 1
    subLabel.Text = subtitleText
    subLabel.TextColor3 = theme.TextSecondary
    subLabel.Font = theme.FontRegular
    subLabel.TextSize = theme.FontSizeSmall
    subLabel.TextXAlignment = Enum.TextXAlignment.Left
    subLabel.Parent = headerFrame
    
    -- Stepper Line Container
    local stepperFrame = Instance.new("Frame")
    stepperFrame.Name = "StepperFrame"
    stepperFrame.Size = UDim2.new(1, 0, 0, 56)
    stepperFrame.BackgroundTransparency = 1
    stepperFrame.Parent = container
    
    -- Stepper Nodes and Connectors
    local nodeElements = {}
    local lineElements = {}
    local stepCount = #steps
    
    -- Background track lines between nodes
    for i = 1, stepCount - 1 do
        local line = Instance.new("Frame")
        line.Name = "Line_" .. i
        line.BorderSizePixel = 0
        line.BackgroundColor3 = theme.AccentStepInactive
        line.Parent = stepperFrame
        table.insert(lineElements, line)
    end
    
    -- Node circles and labels
    for i, stepInfo in ipairs(steps) do
        local stepLabelText = type(stepInfo) == "table" and (stepInfo.Label or stepInfo.Name) or tostring(stepInfo)
        local stepIcon = type(stepInfo) == "table" and stepInfo.Icon or DEFAULT_STEP_ICONS[i]
        
        local nodeFrame = Instance.new("Frame")
        nodeFrame.Name = "Node_" .. i
        nodeFrame.Size = UDim2.new(0, 32, 0, 32)
        nodeFrame.BackgroundTransparency = 1
        nodeFrame.Parent = stepperFrame
        
        local circle = Instance.new("TextButton")
        circle.Name = "Circle"
        circle.Size = UDim2.new(0, 30, 0, 30)
        circle.Position = UDim2.new(0.5, -15, 0, 0)
        circle.BackgroundColor3 = theme.AccentStepInactive
        circle.AutoButtonColor = false
        circle.Text = ""
        circle.BorderSizePixel = 0
        circle.Parent = nodeFrame
        
        local cCorner = Instance.new("UICorner")
        cCorner.CornerRadius = UDim.new(1, 0)
        cCorner.Parent = circle
        
        local icon = Instance.new("ImageLabel")
        icon.Name = "Icon"
        icon.Size = UDim2.new(0, 16, 0, 16)
        icon.Position = UDim2.new(0.5, -8, 0.5, -8)
        icon.BackgroundTransparency = 1
        icon.Image = stepIcon or ""
        icon.ImageColor3 = theme.TextPrimary
        icon.Parent = circle
        
        -- Text fallback if image not loaded
        local numText = Instance.new("TextLabel")
        numText.Name = "Number"
        numText.Size = UDim2.new(1, 0, 1, 0)
        numText.BackgroundTransparency = 1
        numText.Text = (stepIcon and #stepIcon > 0) and "" or tostring(i)
        numText.TextColor3 = theme.TextPrimary
        numText.Font = theme.FontBold
        numText.TextSize = 12
        numText.Parent = circle
        
        local label = Instance.new("TextLabel")
        label.Name = "Label"
        label.Size = UDim2.new(0, 70, 0, 16)
        label.Position = UDim2.new(0.5, -35, 0, 34)
        label.BackgroundTransparency = 1
        label.Text = stepLabelText
        label.TextColor3 = theme.TextMuted
        label.Font = theme.FontRegular
        label.TextSize = 10
        label.TextXAlignment = Enum.TextXAlignment.Center
        label.Parent = nodeFrame
        
        table.insert(nodeElements, {
            Frame = nodeFrame,
            Circle = circle,
            Icon = icon,
            Label = label,
        })
    end
    
    -- Buttons Frame: Next Step & Prev Step
    local buttonRow = Instance.new("Frame")
    buttonRow.Name = "ButtonRow"
    buttonRow.Size = UDim2.new(1, 0, 0, 34)
    buttonRow.BackgroundTransparency = 1
    buttonRow.Parent = container
    
    local btnLayout = Instance.new("UIListLayout")
    btnLayout.FillDirection = Enum.FillDirection.Horizontal
    btnLayout.SortOrder = Enum.SortOrder.LayoutOrder
    btnLayout.Padding = UDim.new(0, 8)
    btnLayout.Parent = buttonRow
    
    local nextBtn = Instance.new("TextButton")
    nextBtn.Name = "NextStepButton"
    nextBtn.Size = UDim2.new(0.5, -4, 1, 0)
    nextBtn.BackgroundColor3 = theme.Element
    nextBtn.AutoButtonColor = false
    nextBtn.Text = options.NextText or "Next Step (Maju)"
    nextBtn.TextColor3 = theme.TextPrimary
    nextBtn.Font = theme.FontBold
    nextBtn.TextSize = theme.FontSizeSmall
    nextBtn.BorderSizePixel = 0
    nextBtn.Parent = buttonRow
    
    local nextCorner = Instance.new("UICorner")
    nextCorner.CornerRadius = theme.SmallCornerRadius
    nextCorner.Parent = nextBtn
    
    local prevBtn = Instance.new("TextButton")
    prevBtn.Name = "PrevStepButton"
    prevBtn.Size = UDim2.new(0.5, -4, 1, 0)
    prevBtn.BackgroundColor3 = theme.Element
    prevBtn.AutoButtonColor = false
    prevBtn.Text = options.PrevText or "Prev Step (Mundur)"
    prevBtn.TextColor3 = theme.TextPrimary
    prevBtn.Font = theme.FontBold
    prevBtn.TextSize = theme.FontSizeSmall
    prevBtn.BorderSizePixel = 0
    prevBtn.Parent = buttonRow
    
    local prevCorner = Instance.new("UICorner")
    prevCorner.CornerRadius = theme.SmallCornerRadius
    prevCorner.Parent = prevBtn
    
    local self = setmetatable({
        _container = container,
        _titleLabel = titleLabel,
        _subLabel = subLabel,
        _stepperFrame = stepperFrame,
        _nodeElements = nodeElements,
        _lineElements = lineElements,
        _nextBtn = nextBtn,
        _prevBtn = prevBtn,
        _theme = theme,
        _steps = steps,
        _currentStep = initialStep,
        _onStepChanged = onStepChanged,
    }, Progression)
    
    local function layoutNodes()
        local count = #nodeElements
        if count == 0 then return end
        
        for i, node in ipairs(nodeElements) do
            local xRatio = (count == 1) and 0.5 or ((i - 1) / (count - 1))
            node.Frame.Position = UDim2.new(xRatio, -16, 0, 0)
            
            -- Position connection line to next node
            if i < count and lineElements[i] then
                local nextXRatio = i / (count - 1)
                lineElements[i].Position = UDim2.new(xRatio, 16, 0, 14)
                lineElements[i].Size = UDim2.new(nextXRatio - xRatio, -32, 0, 3)
            end
        end
    end
    layoutNodes()
    
    -- Node click handlers
    for i, node in ipairs(nodeElements) do
        local conn = node.Circle.Activated:Connect(function()
            self:SetStep(i, true)
        end)
        if cleanup then cleanup:Add(conn) end
    end
    
    -- Next / Prev button events
    local nextConn = nextBtn.Activated:Connect(function()
        self:NextStep()
    end)
    local prevConn = prevBtn.Activated:Connect(function()
        self:PrevStep()
    end)
    
    if cleanup then
        cleanup:Add(nextConn)
        cleanup:Add(prevConn)
        cleanup:Add(container)
    end
    
    self:SetStep(initialStep, false)
    return self
end

function Progression:GetStep()
    return self._currentStep
end

function Progression:GetValue()
    return self._currentStep
end

function Progression:SetStep(stepIndex, fireCallback)
    stepIndex = math.clamp(stepIndex, 1, #self._steps)
    self._currentStep = stepIndex
    
    for i, node in ipairs(self._nodeElements) do
        if i <= stepIndex then
            -- Active or Completed
            node.Circle.BackgroundColor3 = self._theme.AccentStep
            node.Icon.ImageColor3 = Color3.fromRGB(255, 255, 255)
            node.Label.TextColor3 = (i == stepIndex) and self._theme.AccentStep or self._theme.TextPrimary
        else
            -- Inactive
            node.Circle.BackgroundColor3 = self._theme.AccentStepInactive
            node.Icon.ImageColor3 = self._theme.TextMuted
            node.Label.TextColor3 = self._theme.TextMuted
        end
    end
    
    for i, line in ipairs(self._lineElements) do
        if i < stepIndex then
            line.BackgroundColor3 = self._theme.AccentStep
        else
            line.BackgroundColor3 = self._theme.AccentStepInactive
        end
    end
    
    if fireCallback ~= false then
        task.spawn(self._onStepChanged, self._currentStep, self._steps[self._currentStep])
    end
end

function Progression:SetValue(stepIndex, fireCallback)
    self:SetStep(stepIndex, fireCallback)
end

function Progression:NextStep()
    if self._currentStep < #self._steps then
        self:SetStep(self._currentStep + 1, true)
    end
end

function Progression:PrevStep()
    if self._currentStep > 1 then
        self:SetStep(self._currentStep - 1, true)
    end
end

function Progression:Destroy()
    if self._container then
        self._container:Destroy()
        self._container = nil
    end
end

return Progression


end

-- Module: src/services/ConfigService
_modules["src/services/ConfigService"] = function()
--[[
    LiyHub UI - Config Service
    Provides safe persistent configuration storage, serialization, validation,
    import/export, and in-memory fallback for standard Roblox Studio runtime.
]]

local HttpService = game:GetService("HttpService")

local ConfigService = {}
ConfigService.__index = ConfigService

function ConfigService.new(options)
    options = options or {}
    local folderName = options.FolderName or "LiyHubUI"
    local fileName = options.FileName or "default_config.json"
    
    local self = setmetatable({
        _folderName = folderName,
        _fileName = fileName,
        _cache = {},
        _hasFileSystem = (typeof(writefile) == "function" and typeof(readfile) == "function"),
    }, ConfigService)
    
    return self
end

function ConfigService:Set(key, value)
    assert(type(key) == "string", "Config key must be a string")
    self._cache[key] = value
end

function ConfigService:Get(key, defaultValue)
    if self._cache[key] ~= nil then
        return self._cache[key]
    end
    return defaultValue
end

function ConfigService:GetAll()
    return table.clone(self._cache)
end

function ConfigService:SetAll(data)
    assert(type(data) == "table", "Config data must be a table")
    self._cache = table.clone(data)
end

function ConfigService:ExportJSON()
    local success, json = pcall(function()
        return HttpService:JSONEncode(self._cache)
    end)
    if success then
        return json
    end
    return "{}"
end

function ConfigService:ImportJSON(jsonString)
    if type(jsonString) ~= "string" or #jsonString == 0 then
        return false, "Invalid JSON string"
    end
    local success, decoded = pcall(function()
        return HttpService:JSONDecode(jsonString)
    end)
    if success and type(decoded) == "table" then
        self._cache = decoded
        return true
    end
    return false, "Failed to parse JSON"
end

function ConfigService:Save()
    local json = self:ExportJSON()
    if self._hasFileSystem then
        local pcallOk, err = pcall(function()
            if typeof(makefolder) == "function" and typeof(isfolder) == "function" then
                if not isfolder(self._folderName) then
                    makefolder(self._folderName)
                end
            end
            writefile(self._folderName .. "/" .. self._fileName, json)
        end)
        if pcallOk then
            return true
        else
            return false, tostring(err)
        end
    end
    -- In-memory / Studio environment
    return true
end

function ConfigService:Load()
    if self._hasFileSystem then
        local filePath = self._folderName .. "/" .. self._fileName
        local pcallOk, content = pcall(function()
            if typeof(isfile) == "function" and not isfile(filePath) then
                return nil
            end
            return readfile(filePath)
        end)
        if pcallOk and content and #content > 0 then
            return self:ImportJSON(content)
        end
    end
    return true
end

return ConfigService


end

-- Module: src/services/ProfileService
_modules["src/services/ProfileService"] = function()
--[[
    LiyHub UI - Profile Service
    Manages named configuration profiles (e.g. Default, Farming, PvP).
]]

local ProfileService = {}
ProfileService.__index = ProfileService

function ProfileService.new(configService)
    local self = setmetatable({
        _configService = configService,
        _profiles = {
            ["Default"] = {},
        },
        _activeProfile = "Default",
    }, ProfileService)
    
    return self
end

function ProfileService:GetProfiles()
    local list = {}
    for name, _ in pairs(self._profiles) do
        table.insert(list, name)
    end
    table.sort(list)
    return list
end

function ProfileService:GetActiveProfile()
    return self._activeProfile
end

function ProfileService:CreateProfile(name)
    assert(type(name) == "string" and #name > 0, "Profile name must be a non-empty string")
    if not self._profiles[name] then
        self._profiles[name] = {}
    end
    return true
end

function ProfileService:DeleteProfile(name)
    if name == "Default" then
        return false, "Cannot delete Default profile"
    end
    if self._profiles[name] then
        self._profiles[name] = nil
        if self._activeProfile == name then
            self:SwitchProfile("Default")
        end
        return true
    end
    return false, "Profile does not exist"
end

function ProfileService:SwitchProfile(name)
    if not self._profiles[name] then
        return false, "Profile does not exist"
    end
    -- Save current config into active profile
    if self._configService then
        self._profiles[self._activeProfile] = self._configService:GetAll()
        -- Load target profile into config service
        self._configService:SetAll(self._profiles[name])
    end
    self._activeProfile = name
    return true
end

function ProfileService:SaveActiveProfile()
    if self._configService then
        self._profiles[self._activeProfile] = self._configService:GetAll()
        return self._configService:Save()
    end
    return true
end

return ProfileService


end

-- Module: src/core/Window
_modules["src/core/Window"] = function()
--[[
    LiyHub UI - Window & Core Navigation System
    Implements main window frame, dragging, minimize/close, profile card,
    collapsible tab groups, tabs, sections, layouts, mobile pin tab, and complete resource cleanup.
]]

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local Window = {}
Window.__index = Window

local TabGroup = {}
TabGroup.__index = TabGroup

local Tab = {}
Tab.__index = Tab

local Section = {}
Section.__index = Section

function Window.new(options, dependencies)
    options = options or {}
    local deps = dependencies or {}
    local theme = deps.Theme
    local cleanup = deps.Cleanup
    local Layout = deps.Layout
    local Modal = deps.Modal
    local MobilePin = deps.MobilePin
    
    -- Load component modules
    local Button = deps.Button
    local ButtonGroup = deps.ButtonGroup
    local Toggle = deps.Toggle
    local ToggleGroup = deps.ToggleGroup
    local Slider = deps.Slider
    local SliderGroup = deps.SliderGroup
    local InputComp = deps.Input
    local InputGroup = deps.InputGroup
    local Dropdown = deps.Dropdown
    local DropdownGroup = deps.DropdownGroup
    local Keybind = deps.Keybind
    local Paragraph = deps.Paragraph
    local Divider = deps.Divider
    local Banner = deps.Banner
    local Progression = deps.Progression
    
    local titleText = options.Title or "LiyHub"
    local subtitleText = options.Subtitle or "v2.2 Black & White Edition"
    local defaultSize = options.Size or UDim2.new(0, 680, 0, 460)
    local toggleKey = options.ToggleKey or Enum.KeyCode.RightControl
    local enableMobilePin = options.MobilePin ~= false -- Default enabled
    local logoAsset = options.Logo or "rbxassetid://6031075936"
    local parentGui = options.Parent
    
    if not parentGui then
        local localPlayer = Players.LocalPlayer
        if localPlayer then
            parentGui = localPlayer:WaitForChild("PlayerGui", 5)
        end
    end
    
    -- Main ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "LiyHubUI_" .. titleText
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    pcall(function()
        if typeof(syn) == "table" and syn.protect_gui then
            syn.protect_gui(screenGui)
        end
    end)
    screenGui.Parent = parentGui or game:GetService("CoreGui")
    
    -- Main Frame
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = defaultSize
    mainFrame.Position = options.Position or UDim2.new(0.5, -defaultSize.X.Offset / 2, 0.5, -defaultSize.Y.Offset / 2)
    mainFrame.BackgroundColor3 = theme.Background
    mainFrame.BorderSizePixel = 0
    mainFrame.ClipsDescendants = true
    mainFrame.Active = true
    mainFrame.Parent = screenGui
    
    local mainCorner = Instance.new("UICorner")
    mainCorner.CornerRadius = theme.CornerRadius
    mainCorner.Parent = mainFrame
    
    -- Cursor unlocker for PC interaction
    local modalUnlocker = Instance.new("TextButton")
    modalUnlocker.Name = "ModalUnlocker"
    modalUnlocker.BackgroundTransparency = 1
    modalUnlocker.Text = ""
    modalUnlocker.Size = UDim2.new(0, 0, 0, 0)
    modalUnlocker.Visible = true
    modalUnlocker.Modal = true
    modalUnlocker.Active = false
    modalUnlocker.Parent = mainFrame
    
    -- Header Bar
    local header = Instance.new("Frame")
    header.Name = "Header"
    header.Size = UDim2.new(1, 0, 0, 48)
    header.BackgroundColor3 = theme.Header
    header.BorderSizePixel = 0
    header.Parent = mainFrame
    
    local headerCorner = Instance.new("UICorner")
    headerCorner.CornerRadius = theme.CornerRadius
    headerCorner.Parent = header
    
    local headerFlatBottom = Instance.new("Frame")
    headerFlatBottom.Name = "FlatBottom"
    headerFlatBottom.Size = UDim2.new(1, 0, 0, 10)
    headerFlatBottom.Position = UDim2.new(0, 0, 1, -10)
    headerFlatBottom.BackgroundColor3 = theme.Header
    headerFlatBottom.BorderSizePixel = 0
    headerFlatBottom.Parent = header
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(0.5, 0, 0, 20)
    titleLabel.Position = UDim2.new(0, 16, 0, 8)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = titleText
    titleLabel.TextColor3 = theme.TextPrimary
    titleLabel.Font = theme.FontTitle
    titleLabel.TextSize = theme.FontSizeTitle
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = header
    
    local subLabel = Instance.new("TextLabel")
    subLabel.Name = "Subtitle"
    subLabel.Size = UDim2.new(0.5, 0, 0, 14)
    subLabel.Position = UDim2.new(0, 16, 0, 28)
    subLabel.BackgroundTransparency = 1
    subLabel.Text = subtitleText
    subLabel.TextColor3 = theme.TextSecondary
    subLabel.Font = theme.FontRegular
    subLabel.TextSize = theme.FontSizeSubtitle
    subLabel.TextXAlignment = Enum.TextXAlignment.Left
    subLabel.Parent = header
    
    -- Header Controls: Minimize & Close
    local controlsFrame = Instance.new("Frame")
    controlsFrame.Name = "Controls"
    controlsFrame.Size = UDim2.new(0, 70, 0, 28)
    controlsFrame.Position = UDim2.new(1, -80, 0.5, -14)
    controlsFrame.BackgroundTransparency = 1
    controlsFrame.Parent = header
    
    local controlsLayout = Instance.new("UIListLayout")
    controlsLayout.FillDirection = Enum.FillDirection.Horizontal
    controlsLayout.SortOrder = Enum.SortOrder.LayoutOrder
    controlsLayout.Padding = UDim.new(0, 6)
    controlsLayout.Parent = controlsFrame
    
    local minBtn = Instance.new("TextButton")
    minBtn.Name = "Minimize"
    minBtn.Size = UDim2.new(0, 28, 0, 28)
    minBtn.BackgroundColor3 = theme.Element
    minBtn.AutoButtonColor = true
    minBtn.Text = "-"
    minBtn.TextColor3 = theme.TextPrimary
    minBtn.Font = Enum.Font.GothamBold
    minBtn.TextSize = 16
    minBtn.BorderSizePixel = 0
    minBtn.Active = true
    minBtn.ZIndex = 14
    minBtn.Parent = controlsFrame
    
    local minCorner = Instance.new("UICorner")
    minCorner.CornerRadius = theme.SmallCornerRadius
    minCorner.Parent = minBtn
    
    local closeBtn = Instance.new("TextButton")
    closeBtn.Name = "Close"
    closeBtn.Size = UDim2.new(0, 28, 0, 28)
    closeBtn.BackgroundColor3 = theme.Element
    closeBtn.AutoButtonColor = true
    closeBtn.Text = "X"
    closeBtn.TextColor3 = theme.TextPrimary
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.TextSize = 13
    closeBtn.BorderSizePixel = 0
    closeBtn.Active = true
    closeBtn.ZIndex = 14
    closeBtn.Parent = controlsFrame
    
    local closeCorner = Instance.new("UICorner")
    closeCorner.CornerRadius = theme.SmallCornerRadius
    closeCorner.Parent = closeBtn
    
    -- Body container
    local body = Instance.new("Frame")
    body.Name = "Body"
    body.Size = UDim2.new(1, 0, 1, -48)
    body.Position = UDim2.new(0, 0, 0, 48)
    body.BackgroundTransparency = 1
    body.Parent = mainFrame
    
    -- Left Sidebar
    local sidebar = Instance.new("Frame")
    sidebar.Name = "Sidebar"
    sidebar.Size = UDim2.new(0, 190, 1, 0)
    sidebar.BackgroundColor3 = theme.Sidebar
    sidebar.BorderSizePixel = 0
    sidebar.Parent = body
    
    -- Sidebar Tab Groups Container (Scrollable)
    local tabGroupsScroll = Instance.new("ScrollingFrame")
    tabGroupsScroll.Name = "TabGroupsScroll"
    tabGroupsScroll.Size = UDim2.new(1, 0, 1, -58)
    tabGroupsScroll.BackgroundTransparency = 1
    tabGroupsScroll.BorderSizePixel = 0
    tabGroupsScroll.ScrollBarThickness = 2
    tabGroupsScroll.ScrollBarImageColor3 = theme.Scrollbar
    tabGroupsScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
    tabGroupsScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    tabGroupsScroll.Parent = sidebar
    
    local tabGroupsList = Instance.new("UIListLayout")
    tabGroupsList.SortOrder = Enum.SortOrder.LayoutOrder
    tabGroupsList.Padding = UDim.new(0, 8)
    tabGroupsList.Parent = tabGroupsScroll
    
    local tabGroupsPadding = Instance.new("UIPadding")
    tabGroupsPadding.PaddingTop = UDim.new(0, 8)
    tabGroupsPadding.PaddingBottom = UDim.new(0, 8)
    tabGroupsPadding.PaddingLeft = UDim.new(0, 8)
    tabGroupsPadding.PaddingRight = UDim.new(0, 8)
    tabGroupsPadding.Parent = tabGroupsScroll
    
    -- Profile Card at Bottom of Sidebar
    local profileCard = Instance.new("Frame")
    profileCard.Name = "ProfileCard"
    profileCard.Size = UDim2.new(1, -16, 0, 46)
    profileCard.Position = UDim2.new(0, 8, 1, -52)
    profileCard.BackgroundColor3 = theme.SidebarItem
    profileCard.BorderSizePixel = 0
    profileCard.Parent = sidebar
    
    local profCorner = Instance.new("UICorner")
    profCorner.CornerRadius = theme.SmallCornerRadius
    profCorner.Parent = profileCard
    
    local avatarImg = Instance.new("ImageLabel")
    avatarImg.Name = "Avatar"
    avatarImg.Size = UDim2.new(0, 32, 0, 32)
    avatarImg.Position = UDim2.new(0, 7, 0.5, -16)
    avatarImg.BackgroundColor3 = theme.Header
    avatarImg.BorderSizePixel = 0
    avatarImg.Parent = profileCard
    
    local avCorner = Instance.new("UICorner")
    avCorner.CornerRadius = UDim.new(1, 0)
    avCorner.Parent = avatarImg
    
    task.spawn(function()
        local player = Players.LocalPlayer
        if player then
            local thumb, isReady = Players:GetUserThumbnailAsync(
                player.UserId,
                Enum.ThumbnailType.HeadShot,
                Enum.ThumbnailSize.Size100x100
            )
            if thumb and avatarImg and avatarImg.Parent then
                avatarImg.Image = thumb
            end
        end
    end)
    
    local localUser = Players.LocalPlayer
    local dispNameText = localUser and localUser.DisplayName or "User"
    local rawNameText = localUser and ("@" .. localUser.Name) or "@user"
    
    local profDisplayName = Instance.new("TextLabel")
    profDisplayName.Name = "DisplayName"
    profDisplayName.Size = UDim2.new(1, -48, 0, 16)
    profDisplayName.Position = UDim2.new(0, 45, 0, 7)
    profDisplayName.BackgroundTransparency = 1
    profDisplayName.Text = dispNameText
    profDisplayName.TextColor3 = theme.TextPrimary
    profDisplayName.Font = theme.FontBold
    profDisplayName.TextSize = theme.FontSizeSmall
    profDisplayName.TextXAlignment = Enum.TextXAlignment.Left
    profDisplayName.TextTruncate = Enum.TextTruncate.AtEnd
    profDisplayName.Parent = profileCard
    
    local profUsername = Instance.new("TextLabel")
    profUsername.Name = "Username"
    profUsername.Size = UDim2.new(1, -48, 0, 14)
    profUsername.Position = UDim2.new(0, 45, 0, 23)
    profUsername.BackgroundTransparency = 1
    profUsername.Text = rawNameText
    profUsername.TextColor3 = theme.TextSecondary
    profUsername.Font = theme.FontRegular
    profUsername.TextSize = 10
    profUsername.TextXAlignment = Enum.TextXAlignment.Left
    profUsername.TextTruncate = Enum.TextTruncate.AtEnd
    profUsername.Parent = profileCard
    
    -- Right Content Area
    local contentArea = Instance.new("Frame")
    contentArea.Name = "ContentArea"
    contentArea.Size = UDim2.new(1, -190, 1, 0)
    contentArea.Position = UDim2.new(0, 190, 0, 0)
    contentArea.BackgroundTransparency = 1
    contentArea.BorderSizePixel = 0
    contentArea.ClipsDescendants = true
    contentArea.Parent = body
    
    local contentPadding = Instance.new("UIPadding")
    contentPadding.PaddingTop = UDim.new(0, 10)
    contentPadding.PaddingBottom = UDim.new(0, 10)
    contentPadding.PaddingLeft = UDim.new(0, 10)
    contentPadding.PaddingRight = UDim.new(0, 10)
    contentPadding.Parent = contentArea
    
    -- Resize Grip in bottom right
    local resizeGrip = Instance.new("TextLabel")
    resizeGrip.Name = "ResizeGrip"
    resizeGrip.Size = UDim2.new(0, 16, 0, 16)
    resizeGrip.Position = UDim2.new(1, -18, 1, -18)
    resizeGrip.BackgroundTransparency = 1
    resizeGrip.Text = ""
    resizeGrip.TextColor3 = theme.TextMuted
    resizeGrip.Font = theme.FontBold
    resizeGrip.TextSize = 14
    resizeGrip.ZIndex = 50
    resizeGrip.Parent = mainFrame
    
    local self = setmetatable({
        _screenGui = screenGui,
        _mainFrame = mainFrame,
        _header = header,
        _sidebar = sidebar,
        _tabGroupsScroll = tabGroupsScroll,
        _contentArea = contentArea,
        _profileCard = profileCard,
        _theme = theme,
        _cleanup = cleanup,
        _layoutCtor = Layout,
        _modal = Modal,
        _mobilePin = nil,
        _components = {
            Button = Button,
            ButtonGroup = ButtonGroup,
            Toggle = Toggle,
            ToggleGroup = ToggleGroup,
            Slider = Slider,
            SliderGroup = SliderGroup,
            Input = InputComp,
            InputGroup = InputGroup,
            Dropdown = Dropdown,
            DropdownGroup = DropdownGroup,
            Keybind = Keybind,
            Paragraph = Paragraph,
            Divider = Divider,
            Banner = Banner,
            Progression = Progression,
            MobilePin = MobilePin,
        },
        _tabGroups = {},
        _activeTab = nil,
        _toggleKey = toggleKey,
        _minimized = false,
        _originalSize = defaultSize,
        _destroyed = false,
    }, Window)
    
    -- Window Dragging Implementation
    local dragging = false
    local dragInput, dragStart, startPos
    
    local dragBegan = header.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = mainFrame.Position
        end
    end)
    
    local dragChanged = header.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    
    local dragUpdate = UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            mainFrame.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)
    
    local dragEnded = UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
    
    local minClick = minBtn.Activated:Connect(function()
        self:ToggleMinimize()
    end)
    
    local closeClick = closeBtn.Activated:Connect(function()
        self:ShowModal({
            Title = "Close " .. titleText .. "?",
            Message = "Are you sure you want to unload and close " .. titleText .. "?",
            ConfirmText = "Close UI",
            CancelText = "Cancel",
            OnConfirm = function()
                self:Destroy()
            end,
        })
    end)
    
    local keyToggleConn = UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if not gameProcessed and input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == self._toggleKey then
            self:Toggle()
        end
    end)
    
    -- Create Mobile Pin Tab if enabled
    if enableMobilePin and MobilePin then
        self._mobilePin = MobilePin.new(screenGui, self, {
            Title = titleText,
            Logo = logoAsset,
        }, theme, cleanup)
    end
    
    if cleanup then
        cleanup:Add(dragBegan)
        cleanup:Add(dragChanged)
        cleanup:Add(dragUpdate)
        cleanup:Add(dragEnded)
        cleanup:Add(minClick)
        cleanup:Add(closeClick)
        cleanup:Add(keyToggleConn)
        cleanup:Add(screenGui)
    end
    
    return self
end

function Window:ToggleMinimize()
    self._minimized = not self._minimized
    if self._minimized then
        TweenService:Create(self._mainFrame, TweenInfo.new(self._theme.AnimationFast), {
            Size = UDim2.new(self._originalSize.X.Scale, self._originalSize.X.Offset, 0, 48)
        }):Play()
    else
        TweenService:Create(self._mainFrame, TweenInfo.new(self._theme.AnimationFast), {
            Size = self._originalSize
        }):Play()
    end
end

function Window:Toggle()
    local targetVisible = not self._mainFrame.Visible
    self._mainFrame.Visible = targetVisible
    if self._mobilePin then
        self._mobilePin:UpdateState()
    end
end

function Window:SetTransparency(value)
    value = math.clamp(value or 0, 0, 1)
    self._mainFrame.BackgroundTransparency = value
    self._header.BackgroundTransparency = value
    self._sidebar.BackgroundTransparency = value
end

function Window:SetGroupTransparency(value)
    value = math.clamp(value or 0, 0, 1)
    self._mainFrame.GroupTransparency = value
end

function Window:SetToggleKey(keyCode)
    if typeof(keyCode) == "EnumItem" and keyCode.EnumType == Enum.KeyCode then
        self._toggleKey = keyCode
    end
end

function Window:SetMobilePin(visible)
    if self._mobilePin then
        self._mobilePin:SetVisible(visible)
    end
end

function Window:GetMobilePin()
    return self._mobilePin
end

function Window:Notify(options)
    if self._modal then
        self._modal.Notify(self._screenGui, options, self._theme, self._cleanup)
    end
end

function Window:ShowModal(options)
    if self._modal then
        self._modal.ShowConfirmation(self._screenGui, options, self._theme, self._cleanup)
    end
end

function Window:CreateTabGroup(name)
    assert(type(name) == "string", "TabGroup name must be a string")
    
    local groupContainer = Instance.new("Frame")
    groupContainer.Name = "TabGroup_" .. name
    groupContainer.Size = UDim2.new(1, 0, 0, 0)
    groupContainer.AutomaticSize = Enum.AutomaticSize.Y
    groupContainer.BackgroundTransparency = 1
    groupContainer.Parent = self._tabGroupsScroll
    
    local gList = Instance.new("UIListLayout")
    gList.SortOrder = Enum.SortOrder.LayoutOrder
    gList.Padding = UDim.new(0, 3)
    gList.Parent = groupContainer
    
    -- Header button (collapsible)
    local gHeader = Instance.new("TextButton")
    gHeader.Name = "Header"
    gHeader.Size = UDim2.new(1, 0, 0, 22)
    gHeader.BackgroundTransparency = 1
    gHeader.AutoButtonColor = false
    gHeader.Text = ""
    gHeader.Parent = groupContainer
    
    local gTitle = Instance.new("TextLabel")
    gTitle.Name = "Title"
    gTitle.Size = UDim2.new(1, -20, 1, 0)
    gTitle.Position = UDim2.new(0, 6, 0, 0)
    gTitle.BackgroundTransparency = 1
    gTitle.Text = string.upper(name)
    gTitle.TextColor3 = self._theme.TextMuted
    gTitle.Font = self._theme.FontBold
    gTitle.TextSize = 10
    gTitle.TextXAlignment = Enum.TextXAlignment.Left
    gTitle.Parent = gHeader
    
    local gArrow = Instance.new("TextLabel")
    gArrow.Name = "Arrow"
    gArrow.Size = UDim2.new(0, 16, 1, 0)
    gArrow.Position = UDim2.new(1, -18, 0, 0)
    gArrow.BackgroundTransparency = 1
    gArrow.Text = "^"
    gArrow.TextColor3 = self._theme.TextMuted
    gArrow.Font = self._theme.FontBold
    gArrow.TextSize = 10
    gArrow.Parent = gHeader
    
    -- Tabs Frame
    local tabsFrame = Instance.new("Frame")
    tabsFrame.Name = "Tabs"
    tabsFrame.Size = UDim2.new(1, 0, 0, 0)
    tabsFrame.AutomaticSize = Enum.AutomaticSize.Y
    tabsFrame.BackgroundTransparency = 1
    tabsFrame.Parent = groupContainer
    
    local tList = Instance.new("UIListLayout")
    tList.SortOrder = Enum.SortOrder.LayoutOrder
    tList.Padding = UDim.new(0, 3)
    tList.Parent = tabsFrame
    
    local tabGroupObj = setmetatable({
        _window = self,
        _container = groupContainer,
        _tabsFrame = tabsFrame,
        _arrow = gArrow,
        _collapsed = false,
        _tabs = {},
    }, TabGroup)
    
    local toggleClick = gHeader.Activated:Connect(function()
        tabGroupObj._collapsed = not tabGroupObj._collapsed
        tabsFrame.Visible = not tabGroupObj._collapsed
        gArrow.Text = tabGroupObj._collapsed and "v" or "^"
    end)
    
    if self._cleanup then
        self._cleanup:Add(toggleClick)
        self._cleanup:Add(groupContainer)
    end
    
    table.insert(self._tabGroups, tabGroupObj)
    return tabGroupObj
end

function Window:_setActiveTab(tab)
    if self._activeTab == tab then return end
    
    if self._activeTab then
        self._activeTab:_deactivate()
    end
    self._activeTab = tab
    if self._activeTab then
        self._activeTab:_activate()
    end
end

function Window:Destroy()
    if self._destroyed then return end
    self._destroyed = true
    if self._cleanup then
        self._cleanup:Destroy()
    end
    if self._screenGui then
        self._screenGui:Destroy()
        self._screenGui = nil
    end
end

-- ============================================================================
-- TabGroup Methods
-- ============================================================================

function TabGroup:CreateTab(options)
    local name = type(options) == "table" and (options.Name or options.Text) or tostring(options)
    local iconId = type(options) == "table" and (options.Icon or options.Image) or nil
    local twoColumns = type(options) == "table" and options.TwoColumns == true or false
    
    -- Tab Sidebar Button
    local tabBtn = Instance.new("TextButton")
    tabBtn.Name = "Tab_" .. name
    tabBtn.Size = UDim2.new(1, 0, 0, 32)
    tabBtn.BackgroundColor3 = self._window._theme.SidebarItem
    tabBtn.AutoButtonColor = false
    tabBtn.Text = ""
    tabBtn.BorderSizePixel = 0
    tabBtn.Parent = self._tabsFrame
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = self._window._theme.SmallCornerRadius
    corner.Parent = tabBtn
    
    local activeBar = Instance.new("Frame")
    activeBar.Name = "ActiveBar"
    activeBar.Size = UDim2.new(0, 3, 1, -10)
    activeBar.Position = UDim2.new(0, 3, 0, 5)
    activeBar.BackgroundColor3 = self._window._theme.Accent
    activeBar.BorderSizePixel = 0
    activeBar.Visible = false
    activeBar.Parent = tabBtn
    
    local barCorner = Instance.new("UICorner")
    barCorner.CornerRadius = UDim.new(1, 0)
    barCorner.Parent = activeBar
    
    local iconLabel = nil
    local labelOffset = 10
    if iconId then
        iconLabel = Instance.new("ImageLabel")
        iconLabel.Name = "Icon"
        iconLabel.Size = UDim2.new(0, 16, 0, 16)
        iconLabel.Position = UDim2.new(0, 10, 0.5, -8)
        iconLabel.BackgroundTransparency = 1
        iconLabel.Image = iconId
        iconLabel.ImageColor3 = self._window._theme.TextSecondary
        iconLabel.Parent = tabBtn
        labelOffset = 32
    end
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(1, -labelOffset - 6, 1, 0)
    titleLabel.Position = UDim2.new(0, labelOffset, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = name
    titleLabel.TextColor3 = self._window._theme.TextSecondary
    titleLabel.Font = self._window._theme.FontRegular
    titleLabel.TextSize = self._window._theme.FontSizeSmall
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = tabBtn
    
    -- Tab Content Container
    local contentContainer = Instance.new("Frame")
    contentContainer.Name = "TabContent_" .. name
    contentContainer.Size = UDim2.new(1, 0, 1, 0)
    contentContainer.BackgroundTransparency = 1
    contentContainer.Visible = false
    contentContainer.Parent = self._window._contentArea
    
    local layoutEngine = self._window._layoutCtor.new(contentContainer, {
        TwoColumns = twoColumns,
    })
    
    local tabObj = setmetatable({
        _window = self._window,
        _tabGroup = self,
        _button = tabBtn,
        _activeBar = activeBar,
        _titleLabel = titleLabel,
        _iconLabel = iconLabel,
        _contentContainer = contentContainer,
        _layoutEngine = layoutEngine,
        _sections = {},
    }, Tab)
    
    local btnClick = tabBtn.Activated:Connect(function()
        self._window:_setActiveTab(tabObj)
    end)
    
    if self._window._cleanup then
        self._window._cleanup:Add(btnClick)
        self._window._cleanup:Add(tabBtn)
        self._window._cleanup:Add(contentContainer)
    end
    
    table.insert(self._tabs, tabObj)
    
    if not self._window._activeTab then
        self._window:_setActiveTab(tabObj)
    end
    
    return tabObj
end

-- ============================================================================
-- Tab Methods
-- ============================================================================

function Tab:_activate()
    self._button.BackgroundColor3 = self._window._theme.SidebarItemActive
    self._titleLabel.TextColor3 = self._window._theme.TextPrimary
    self._titleLabel.Font = self._window._theme.FontBold
    self._activeBar.Visible = true
    if self._iconLabel then
        self._iconLabel.ImageColor3 = self._window._theme.TextPrimary
    end
    self._contentContainer.Visible = true
end

function Tab:_deactivate()
    self._button.BackgroundColor3 = self._window._theme.SidebarItem
    self._titleLabel.TextColor3 = self._window._theme.TextSecondary
    self._titleLabel.Font = self._window._theme.FontRegular
    self._activeBar.Visible = false
    if self._iconLabel then
        self._iconLabel.ImageColor3 = self._window._theme.TextSecondary
    end
    self._contentContainer.Visible = false
end

function Tab:CreateSection(nameOrOptions)
    local sectionName = type(nameOrOptions) == "table" and (nameOrOptions.Name or nameOrOptions.Text) or tostring(nameOrOptions)
    local sectionOptions = type(nameOrOptions) == "table" and nameOrOptions or {}
    
    local sectionParent = self._layoutEngine:GetSectionParent(sectionOptions)
    
    local sectionCard = Instance.new("Frame")
    sectionCard.Name = "Section_" .. sectionName
    sectionCard.Size = UDim2.new(1, 0, 0, 0)
    sectionCard.AutomaticSize = Enum.AutomaticSize.Y
    sectionCard.BackgroundColor3 = self._window._theme.Card
    sectionCard.BorderSizePixel = 0
    sectionCard.Parent = sectionParent
    
    local sCorner = Instance.new("UICorner")
    sCorner.CornerRadius = self._window._theme.CornerRadius
    sCorner.Parent = sectionCard
    
    local sPadding = Instance.new("UIPadding")
    sPadding.PaddingTop = UDim.new(0, 8)
    sPadding.PaddingBottom = UDim.new(0, 10)
    sPadding.PaddingLeft = UDim.new(0, 10)
    sPadding.PaddingRight = UDim.new(0, 10)
    sPadding.Parent = sectionCard
    
    local sList = Instance.new("UIListLayout")
    sList.SortOrder = Enum.SortOrder.LayoutOrder
    sList.Padding = UDim.new(0, 8)
    sList.Parent = sectionCard
    
    -- Section Header (Title & Collapsible Arrow)
    local sHeader = Instance.new("TextButton")
    sHeader.Name = "Header"
    sHeader.Size = UDim2.new(1, 0, 0, 22)
    sHeader.BackgroundTransparency = 1
    sHeader.AutoButtonColor = false
    sHeader.Text = ""
    sHeader.Parent = sectionCard
    
    local sTitle = Instance.new("TextLabel")
    sTitle.Name = "Title"
    sTitle.Size = UDim2.new(1, -24, 1, 0)
    sTitle.BackgroundTransparency = 1
    sTitle.Text = string.upper(sectionName)
    sTitle.TextColor3 = self._window._theme.TextPrimary
    sTitle.Font = self._window._theme.FontBold
    sTitle.TextSize = self._window._theme.FontSizeSection
    sTitle.TextXAlignment = Enum.TextXAlignment.Left
    sTitle.Parent = sHeader
    
    local sArrow = Instance.new("TextLabel")
    sArrow.Name = "Arrow"
    sArrow.Size = UDim2.new(0, 20, 1, 0)
    sArrow.Position = UDim2.new(1, -20, 0, 0)
    sArrow.BackgroundTransparency = 1
    sArrow.Text = "^"
    sArrow.TextColor3 = self._window._theme.TextSecondary
    sArrow.Font = self._window._theme.FontBold
    sArrow.TextSize = 11
    sArrow.Parent = sHeader
    
    -- Section Body (Holds components)
    local sBody = Instance.new("Frame")
    sBody.Name = "Body"
    sBody.Size = UDim2.new(1, 0, 0, 0)
    sBody.AutomaticSize = Enum.AutomaticSize.Y
    sBody.BackgroundTransparency = 1
    sBody.Parent = sectionCard
    
    local bList = Instance.new("UIListLayout")
    bList.SortOrder = Enum.SortOrder.LayoutOrder
    bList.Padding = UDim.new(0, 6)
    bList.Parent = sBody
    
    local sectionObj = setmetatable({
        _tab = self,
        _window = self._window,
        _container = sectionCard,
        _body = sBody,
        _arrow = sArrow,
        _collapsed = false,
        _components = {},
    }, Section)
    
    local toggleConn = sHeader.Activated:Connect(function()
        sectionObj._collapsed = not sectionObj._collapsed
        sBody.Visible = not sectionObj._collapsed
        sArrow.Text = sectionObj._collapsed and "v" or "^"
    end)
    
    if self._window._cleanup then
        self._window._cleanup:Add(toggleConn)
        self._window._cleanup:Add(sectionCard)
    end
    
    table.insert(self._sections, sectionObj)
    return sectionObj
end

-- ============================================================================
-- Section Component Constructors
-- ============================================================================

function Section:CreateButton(options)
    local btn = self._window._components.Button.new(
        self._body,
        options,
        self._window._theme,
        self._window._cleanup
    )
    table.insert(self._components, btn)
    return btn
end

function Section:CreateButtonGroup(options)
    local grp = self._window._components.ButtonGroup.new(
        self._body,
        options,
        self._window._theme,
        self._window._cleanup,
        self._window._components.Button
    )
    table.insert(self._components, grp)
    return grp
end

function Section:CreateToggle(options)
    local tog = self._window._components.Toggle.new(
        self._body,
        options,
        self._window._theme,
        self._window._cleanup
    )
    table.insert(self._components, tog)
    return tog
end

function Section:CreateToggleGroup(options)
    local grp = self._window._components.ToggleGroup.new(
        self._body,
        options,
        self._window._theme,
        self._window._cleanup,
        self._window._components.Toggle
    )
    table.insert(self._components, grp)
    return grp
end

function Section:CreateSlider(options)
    local sld = self._window._components.Slider.new(
        self._body,
        options,
        self._window._theme,
        self._window._cleanup
    )
    table.insert(self._components, sld)
    return sld
end

function Section:CreateSliderGroup(options)
    local grp = self._window._components.SliderGroup.new(
        self._body,
        options,
        self._window._theme,
        self._window._cleanup,
        self._window._components.Slider
    )
    table.insert(self._components, grp)
    return grp
end

function Section:CreateInput(options)
    local inp = self._window._components.Input.new(
        self._body,
        options,
        self._window._theme,
        self._window._cleanup
    )
    table.insert(self._components, inp)
    return inp
end

function Section:CreateInputGroup(options)
    local grp = self._window._components.InputGroup.new(
        self._body,
        options,
        self._window._theme,
        self._window._cleanup,
        self._window._components.Input
    )
    table.insert(self._components, grp)
    return grp
end

function Section:CreateDropdown(options)
    local drp = self._window._components.Dropdown.new(
        self._body,
        options,
        self._window._theme,
        self._window._cleanup
    )
    table.insert(self._components, drp)
    return drp
end

function Section:CreateDropdownGroup(options)
    local grp = self._window._components.DropdownGroup.new(
        self._body,
        options,
        self._window._theme,
        self._window._cleanup,
        self._window._components.Dropdown
    )
    table.insert(self._components, grp)
    return grp
end

function Section:CreateKeybind(options)
    local key = self._window._components.Keybind.new(
        self._body,
        options,
        self._window._theme,
        self._window._cleanup
    )
    table.insert(self._components, key)
    return key
end

function Section:CreateParagraph(options)
    local par = self._window._components.Paragraph.new(
        self._body,
        options,
        self._window._theme,
        self._window._cleanup
    )
    table.insert(self._components, par)
    return par
end

function Section:CreateDivider(options)
    local div = self._window._components.Divider.new(
        self._body,
        options,
        self._window._theme,
        self._window._cleanup
    )
    table.insert(self._components, div)
    return div
end

function Section:CreateBanner(options)
    local ban = self._window._components.Banner.new(
        self._body,
        options,
        self._window._theme,
        self._window._cleanup
    )
    table.insert(self._components, ban)
    return ban
end

function Section:CreateProgression(options)
    local prg = self._window._components.Progression.new(
        self._body,
        options,
        self._window._theme,
        self._window._cleanup
    )
    table.insert(self._components, prg)
    return prg
end

return Window

end

-- Module: tests/UnitTests
_modules["tests/UnitTests"] = function()
--[[
    LiyHub UI - Complete Automated Unit Test Suite
    Covers all verification test specifications including Mobile Pin Tab.
]]

local UnitTests = {}

function UnitTests.Run(LiyHubUI)
    local results = {}
    local passedCount = 0
    local failedCount = 0
    local notRunCount = 0
    
    local function test(name, fn)
        local ok, err = pcall(fn)
        if ok then
            passedCount = passedCount + 1
            table.insert(results, { Name = name, Status = "PASSED", Error = nil })
        else
            failedCount = failedCount + 1
            table.insert(results, { Name = name, Status = "FAILED", Error = tostring(err) })
        end
    end
    
    -- Test 1: Initialization
    test("1. Initialization", function()
        assert(LiyHubUI ~= nil, "LiyHubUI library failed to load")
        assert(type(LiyHubUI.CreateWindow) == "function", "CreateWindow is not a function")
        assert(LiyHubUI.Name == "LiyHub UI", "Library name mismatch")
    end)
    
    -- Test 2: Window creation and destruction
    test("2. Window creation and destruction", function()
        local win = LiyHubUI:CreateWindow({ Title = "Test Window" })
        assert(win ~= nil, "Failed to create window")
        assert(win._screenGui ~= nil, "ScreenGui not created")
        assert(win._screenGui.Parent ~= nil, "ScreenGui not parented")
        win:Destroy()
        assert(win._destroyed == true, "Window destroyed flag not set")
    end)
    
    -- Test 3: Tabs and sections
    test("3. Tabs and sections", function()
        local win = LiyHubUI:CreateWindow({ Title = "Tabs Test" })
        local group = win:CreateTabGroup("Test Group")
        assert(group ~= nil, "TabGroup creation failed")
        local tab1 = group:CreateTab({ Name = "Tab 1" })
        local tab2 = group:CreateTab({ Name = "Tab 2" })
        assert(tab1 ~= nil and tab2 ~= nil, "Tab creation failed")
        
        local sec = tab1:CreateSection("Section 1")
        assert(sec ~= nil, "Section creation failed")
        assert(#tab1._sections == 1, "Section not registered on tab")
        win:Destroy()
    end)
    
    -- Test 4: Single-column layout
    test("4. Single-column layout", function()
        local win = LiyHubUI:CreateWindow({ Title = "Single Column Test" })
        local group = win:CreateTabGroup("Group")
        local tab = group:CreateTab({ Name = "Single", TwoColumns = false })
        assert(tab._layoutEngine:IsTwoColumns() == false, "Layout should be single-column")
        local secParent = tab._layoutEngine:GetSectionParent()
        assert(secParent ~= nil and secParent.Name == "SingleColumn", "Single column parent invalid")
        win:Destroy()
    end)
    
    -- Test 5: Dual-column layout
    test("5. Dual-column layout", function()
        local win = LiyHubUI:CreateWindow({ Title = "Dual Column Test" })
        local group = win:CreateTabGroup("Group")
        local tab = group:CreateTab({ Name = "Dual", TwoColumns = true })
        assert(tab._layoutEngine:IsTwoColumns() == true, "Layout should be dual-column")
        local leftSecParent = tab._layoutEngine:GetSectionParent({ Side = "Left" })
        local rightSecParent = tab._layoutEngine:GetSectionParent({ Side = "Right" })
        assert(leftSecParent.Name == "LeftColumn", "Left column parent mismatch")
        assert(rightSecParent.Name == "RightColumn", "Right column parent mismatch")
        win:Destroy()
    end)
    
    -- Test 6: All component constructors
    test("6. All component constructors", function()
        local win = LiyHubUI:CreateWindow({ Title = "Components Test" })
        local grp = win:CreateTabGroup("Grp")
        local tab = grp:CreateTab({ Name = "Tab" })
        local sec = tab:CreateSection("Sec")
        
        local btn = sec:CreateButton({ Text = "Btn" })
        local btnGrp = sec:CreateButtonGroup({ Buttons = {{ Text = "B1" }} })
        local tog = sec:CreateToggle({ Name = "Tog" })
        local togGrp = sec:CreateToggleGroup({ Toggles = {{ Name = "T1" }} })
        local sld = sec:CreateSlider({ Name = "Sld", Min = 0, Max = 100 })
        local sldGrp = sec:CreateSliderGroup({ Sliders = {{ Name = "S1" }} })
        local inp = sec:CreateInput({ Name = "Inp" })
        local inpGrp = sec:CreateInputGroup({ Inputs = {{ Name = "I1" }} })
        local drp = sec:CreateDropdown({ Name = "Drp", Options = { "A", "B" } })
        local drpGrp = sec:CreateDropdownGroup({ Dropdowns = {{ Name = "D1" }} })
        local key = sec:CreateKeybind({ Name = "Key" })
        local par = sec:CreateParagraph({ Title = "P", Content = "C" })
        local div = sec:CreateDivider()
        local ban = sec:CreateBanner({ Title = "Ban", Description = "Desc" })
        local prg = sec:CreateProgression({ Title = "Prg", Steps = { { Label = "1" }, { Label = "2" } } })
        
        assert(btn and btnGrp and tog and togGrp and sld and sldGrp and inp and inpGrp and drp and drpGrp and key and par and div and ban and prg, "One or more component constructors failed")
        win:Destroy()
    end)
    
    -- Test 7: Callback execution
    test("7. Callback execution", function()
        local win = LiyHubUI:CreateWindow({ Title = "Callback Test" })
        local grp = win:CreateTabGroup("Grp")
        local tab = grp:CreateTab({ Name = "Tab" })
        local sec = tab:CreateSection("Sec")
        
        local clicked = false
        local btn = sec:CreateButton({
            Text = "Click",
            Callback = function()
                clicked = true
            end
        })
        btn._callback()
        assert(clicked == true, "Button callback was not executed")
        win:Destroy()
    end)
    
    -- Test 8: Toggle state synchronization
    test("8. Toggle state synchronization", function()
        local win = LiyHubUI:CreateWindow({ Title = "Toggle Sync Test" })
        local grp = win:CreateTabGroup("Grp")
        local tab = grp:CreateTab({ Name = "Tab" })
        local sec = tab:CreateSection("Sec")
        
        local recordedVal = nil
        local tog = sec:CreateToggle({
            Name = "SyncToggle",
            Default = false,
            Callback = function(v) recordedVal = v end
        })
        assert(tog:GetValue() == false, "Initial toggle state incorrect")
        tog:SetValue(true, true)
        assert(tog:GetValue() == true, "Toggle GetValue did not match SetValue(true)")
        assert(recordedVal == true, "Toggle callback did not receive synchronized value")
        tog:SetValue(false, true)
        assert(tog:GetValue() == false, "Toggle GetValue did not match SetValue(false)")
        win:Destroy()
    end)
    
    -- Test 9: Slider bounds
    test("9. Slider bounds", function()
        local win = LiyHubUI:CreateWindow({ Title = "Slider Bounds Test" })
        local grp = win:CreateTabGroup("Grp")
        local tab = grp:CreateTab({ Name = "Tab" })
        local sec = tab:CreateSection("Sec")
        
        local sld = sec:CreateSlider({
            Name = "BoundedSlider",
            Min = 10,
            Max = 50,
            Step = 5,
            Default = 20,
        })
        assert(sld:GetValue() == 20, "Slider initial default incorrect")
        sld:SetValue(100, false)
        assert(sld:GetValue() == 50, "Slider failed to clamp to upper bound 50")
        sld:SetValue(-10, false)
        assert(sld:GetValue() == 10, "Slider failed to clamp to lower bound 10")
        sld:SetValue(23, false)
        assert(sld:GetValue() == 25, "Slider failed to quantize to nearest step 25")
        win:Destroy()
    end)
    
    -- Test 10: Input defaults
    test("10. Input defaults", function()
        local win = LiyHubUI:CreateWindow({ Title = "Input Defaults Test" })
        local grp = win:CreateTabGroup("Grp")
        local tab = grp:CreateTab({ Name = "Tab" })
        local sec = tab:CreateSection("Sec")
        
        local inp = sec:CreateInput({
            Name = "TestInput",
            Default = "InitialValue",
            Placeholder = "Type..."
        })
        assert(inp:GetValue() == "InitialValue", "Input initial default mismatch")
        inp:SetValue("UpdatedValue", false)
        assert(inp:GetValue() == "UpdatedValue", "Input SetValue failed")
        win:Destroy()
    end)
    
    -- Test 11: Dropdown selection
    test("11. Dropdown selection", function()
        local win = LiyHubUI:CreateWindow({ Title = "Dropdown Test" })
        local grp = win:CreateTabGroup("Grp")
        local tab = grp:CreateTab({ Name = "Tab" })
        local sec = tab:CreateSection("Sec")
        
        local drp = sec:CreateDropdown({
            Name = "Fruit",
            Options = { "Apple", "Banana", "Cherry" },
            Default = "Apple"
        })
        assert(drp:GetValue() == "Apple", "Dropdown initial value mismatch")
        drp:SetValue("Cherry", false)
        assert(drp:GetValue() == "Cherry", "Dropdown SetValue failed")
        win:Destroy()
    end)
    
    -- Test 12: Multi-selection
    test("12. Multi-selection", function()
        local win = LiyHubUI:CreateWindow({ Title = "Multi Select Test" })
        local grp = win:CreateTabGroup("Grp")
        local tab = grp:CreateTab({ Name = "Tab" })
        local sec = tab:CreateSection("Sec")
        
        local drp = sec:CreateDropdown({
            Name = "Tags",
            Options = { "Tag1", "Tag2", "Tag3" },
            MultiSelect = true,
            Default = { "Tag1", "Tag2" }
        })
        local val = drp:GetValue()
        assert(type(val) == "table", "MultiSelect dropdown must return a table")
        assert(#val == 2, "MultiSelect dropdown returned incorrect item count")
        assert(table.find(val, "Tag1") and table.find(val, "Tag2"), "MultiSelect items mismatch")
        win:Destroy()
    end)
    
    -- Test 13: Group state isolation
    test("13. Group state isolation", function()
        local win = LiyHubUI:CreateWindow({ Title = "Group Isolation Test" })
        local grp = win:CreateTabGroup("Grp")
        local tab = grp:CreateTab({ Name = "Tab" })
        local sec = tab:CreateSection("Sec")
        
        local togGrp = sec:CreateToggleGroup()
        local t1 = togGrp:AddToggle({ Name = "T1", Default = false })
        local t2 = togGrp:AddToggle({ Name = "T2", Default = false })
        
        t1:SetValue(true, false)
        assert(t1:GetValue() == true, "T1 should be true")
        assert(t2:GetValue() == false, "T2 must remain false (state isolation)")
        win:Destroy()
    end)
    
    -- Test 14: Progression navigation
    test("14. Progression navigation", function()
        local win = LiyHubUI:CreateWindow({ Title = "Progression Test" })
        local grp = win:CreateTabGroup("Grp")
        local tab = grp:CreateTab({ Name = "Tab" })
        local sec = tab:CreateSection("Sec")
        
        local prg = sec:CreateProgression({
            Title = "Quest",
            Steps = { { Label = "S1" }, { Label = "S2" }, { Label = "S3" } },
            CurrentStep = 1,
        })
        assert(prg:GetStep() == 1, "Initial step should be 1")
        prg:NextStep()
        assert(prg:GetStep() == 2, "NextStep failed")
        prg:NextStep()
        assert(prg:GetStep() == 3, "NextStep to max failed")
        prg:NextStep()
        assert(prg:GetStep() == 3, "Step exceeded maximum")
        prg:PrevStep()
        assert(prg:GetStep() == 2, "PrevStep failed")
        win:Destroy()
    end)
    
    -- Test 15: Configuration validation
    test("15. Configuration validation", function()
        local cfg = LiyHubUI:CreateConfigService({ FolderName = "TestConfigs", FileName = "test.json" })
        assert(cfg ~= nil, "ConfigService creation failed")
        cfg:Set("TestKey", 12345)
        assert(cfg:Get("TestKey") == 12345, "ConfigService Get/Set failed")
        local json = cfg:ExportJSON()
        assert(type(json) == "string" and #json > 2, "ExportJSON failed")
        local ok, _ = cfg:ImportJSON('{"ImportedKey": "Val"}')
        assert(ok == true, "ImportJSON failed")
        assert(cfg:Get("ImportedKey") == "Val", "Imported value not accessible")
    end)
    
    -- Test 16: Repeated destruction
    test("16. Repeated destruction", function()
        local win = LiyHubUI:CreateWindow({ Title = "Destruction Test" })
        win:Destroy()
        local ok, _ = pcall(function() win:Destroy() end)
        assert(ok == true, "Repeated destruction threw an error")
    end)
    
    -- Test 17: Invalid arguments
    test("17. Invalid arguments", function()
        local win = LiyHubUI:CreateWindow({ Title = "Validation Test" })
        local ok1, _ = pcall(function() win:CreateTabGroup(12345) end)
        assert(ok1 == false, "Window:CreateTabGroup should reject non-string name")
        win:Destroy()
    end)
    
    -- Test 18: Backward compatibility
    test("18. Backward compatibility", function()
        assert(type(LiyHubUI.Create) == "function", "LiyHubUI.Create alias missing")
        local win = LiyHubUI:Create({ Title = "Compat Test" })
        assert(win ~= nil, "LiyHubUI.Create failed to create window")
        win:Destroy()
    end)
    
    -- Test 19: Mobile Pin Tab
    test("19. Mobile Pin Tab", function()
        local win = LiyHubUI:CreateWindow({ Title = "Pin Test", MobilePin = true })
        assert(win:GetMobilePin() ~= nil, "MobilePin instance not created")
        assert(win._mobilePin._container ~= nil, "MobilePin container missing")
        win:Toggle()
        assert(win._mobilePin._subLabel.Text == "Tap to Open", "Mobile pin subtitle did not update on window hide")
        win:Toggle()
        assert(win._mobilePin._subLabel.Text == "Tap to Close", "Mobile pin subtitle did not update on window show")
        win:Destroy()
    end)
    
    return {
        Total = #results,
        Passed = passedCount,
        Failed = failedCount,
        NotRun = notRunCount,
        Results = results,
    }
end

return UnitTests

end

-- Module: tests/TestRunner
_modules["tests/TestRunner"] = function()
--[[
    LiyHub UI - Test Runner
    Executes all verification tests and outputs formatted results.
]]

local TestRunner = {}

function TestRunner.Execute(LiyHubUI, UnitTestsModule)
    local UnitTests = UnitTestsModule or require(script.Parent.UnitTests)
    local report = UnitTests.Run(LiyHubUI)
    
    print("\n" .. string.rep("=", 60))
    print("           LIYHUB UI AUTOMATED VERIFICATION REPORT")
    print(string.rep("=", 60))
    
    for _, res in ipairs(report.Results) do
        local tag = "[" .. res.Status .. "]"
        if res.Status == "PASSED" then
            print(string.format("%-10s %s", tag, res.Name))
        else
            print(string.format("%-10s %s (Error: %s)", tag, res.Name, tostring(res.Error)))
        end
    end
    
    print(string.rep("-", 60))
    print(string.format("SUMMARY: Total: %d | PASSED: %d | FAILED: %d | NOT RUN: %d",
        report.Total, report.Passed, report.Failed, report.NotRun))
    print(string.rep("=", 60) .. "\n")
    
    return report
end

return TestRunner


end

-- Direct references for top-level LiyHubUI
local PureBlackWhite = _require("src/themes/PureBlackWhite")
local ThemeManager = _require("src/themes/ThemeManager")
local Cleanup = _require("src/core/Cleanup")
local Signals = _require("src/core/Signals")
local TweenUtil = _require("src/core/Tween")
local Layout = _require("src/core/Layout")
local Window = _require("src/core/Window")
local ConfigService = _require("src/services/ConfigService")
local ProfileService = _require("src/services/ProfileService")

local Button = _require("src/components/Button")
local ButtonGroup = _require("src/components/ButtonGroup")
local Toggle = _require("src/components/Toggle")
local ToggleGroup = _require("src/components/ToggleGroup")
local Slider = _require("src/components/Slider")
local SliderGroup = _require("src/components/SliderGroup")
local InputComp = _require("src/components/Input")
local InputGroup = _require("src/components/InputGroup")
local Dropdown = _require("src/components/Dropdown")
local DropdownGroup = _require("src/components/DropdownGroup")
local Keybind = _require("src/components/Keybind")
local Paragraph = _require("src/components/Paragraph")
local Divider = _require("src/components/Divider")
local Banner = _require("src/components/Banner")
local Progression = _require("src/components/Progression")
local Modal = _require("src/components/Modal")
local MobilePin = _require("src/components/MobilePin")

local LiyHubUI = {
    Version = "2.2.0",
    Name = "LiyHub UI",
    _activeWindows = {},
    _themeManager = ThemeManager,
    _require = _require,
}

function LiyHubUI:CreateWindow(options)
    options = options or {}
    local cleanup = Cleanup and Cleanup.new()
    local theme = options.Theme or (ThemeManager and ThemeManager:GetTheme())
    
    local deps = {
        Theme = theme,
        Cleanup = cleanup,
        Layout = Layout,
        Modal = Modal,
        MobilePin = MobilePin,
        Button = Button,
        ButtonGroup = ButtonGroup,
        Toggle = Toggle,
        ToggleGroup = ToggleGroup,
        Slider = Slider,
        SliderGroup = SliderGroup,
        Input = InputComp,
        InputGroup = InputGroup,
        Dropdown = Dropdown,
        DropdownGroup = DropdownGroup,
        Keybind = Keybind,
        Paragraph = Paragraph,
        Divider = Divider,
        Banner = Banner,
        Progression = Progression,
    }
    
    local win = Window.new(options, deps)
    table.insert(self._activeWindows, win)
    return win
end

function LiyHubUI:GetThemeManager()
    return self._themeManager or ThemeManager
end

function LiyHubUI:CreateConfigService(options)
    if ConfigService then
        return ConfigService.new(options)
    end
    return nil
end

function LiyHubUI:CreateProfileService(configService)
    if ProfileService then
        return ProfileService.new(configService)
    end
    return nil
end

function LiyHubUI:Notify(options)
    if Modal then
        local Players = game:GetService("Players")
        local player = Players.LocalPlayer
        local pgui = player and player:FindFirstChildOfClass("PlayerGui")
        if pgui then
            local theme = ThemeManager and ThemeManager:GetTheme()
            Modal.Notify(pgui, options, theme)
        end
    end
end

LiyHubUI.Create = LiyHubUI.CreateWindow

return LiyHubUI
