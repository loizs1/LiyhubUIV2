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
local PureBlackWhite = {
    Name = "Pure Black & White",
    
    DefaultLogo = "rbxasset://textures/LiyhubLogo.png",
    DefaultBanner = "rbxassetid://97436813723523",
    FallbackLogo = "rbxasset://textures/LiyhubLogo.png",
    FallbackBanner = "rbxassetid://97436813723523",
    
    Background = Color3.fromRGB(13, 13, 15),
    Header = Color3.fromRGB(16, 16, 19),
    Sidebar = Color3.fromRGB(15, 15, 18),
    SidebarItem = Color3.fromRGB(20, 20, 24),
    SidebarItemActive = Color3.fromRGB(28, 28, 34),
    SectionHeader = Color3.fromRGB(18, 18, 22),
    Card = Color3.fromRGB(18, 18, 22),
    CardHover = Color3.fromRGB(24, 24, 29),
    Element = Color3.fromRGB(22, 22, 27),
    ElementHover = Color3.fromRGB(28, 28, 35),
    ElementActive = Color3.fromRGB(36, 36, 44),
    Scrollbar = Color3.fromRGB(50, 50, 60),
    Overlay = Color3.fromRGB(0, 0, 0),
    
    Border = Color3.fromRGB(34, 34, 40),
    BorderSubtle = Color3.fromRGB(28, 28, 34),
    BorderFocus = Color3.fromRGB(75, 75, 90),
    BorderWindow = Color3.fromRGB(42, 42, 50),
    
    TextPrimary = Color3.fromRGB(255, 255, 255),
    TextSecondary = Color3.fromRGB(160, 160, 172),
    TextMuted = Color3.fromRGB(110, 110, 122),
    TextDisabled = Color3.fromRGB(65, 65, 75),
    
    Accent = Color3.fromRGB(255, 255, 255),
    AccentStep = Color3.fromRGB(0, 174, 255),
    AccentStepInactive = Color3.fromRGB(38, 38, 46),
    ToggleActive = Color3.fromRGB(255, 255, 255),
    ToggleInactive = Color3.fromRGB(22, 22, 28),
    ToggleBorderInactive = Color3.fromRGB(55, 55, 66),
    ToggleKnob = Color3.fromRGB(14, 14, 16),
    ToggleKnobInactive = Color3.fromRGB(190, 190, 200),
    SliderTrack = Color3.fromRGB(34, 34, 42),
    SliderFill = Color3.fromRGB(255, 255, 255),
    
    Success = Color3.fromRGB(46, 204, 113),
    Warning = Color3.fromRGB(241, 196, 15),
    Error = Color3.fromRGB(231, 76, 60),
    Info = Color3.fromRGB(52, 152, 219),
    
    WindowCornerRadius = UDim.new(0, 10),
    CornerRadius = UDim.new(0, 7),
    SmallCornerRadius = UDim.new(0, 5),
    PillCornerRadius = UDim.new(1, 0),
    
    CardPadding = 10,
    ElementPadding = 8,
    ElementHeight = 36,
    SmallElementHeight = 30,
    
    FontTitle = Enum.Font.GothamBold,
    FontHeader = Enum.Font.GothamBold,
    FontRegular = Enum.Font.GothamMedium,
    FontBold = Enum.Font.GothamBold,
    
    FontSizeTitle = 15,
    FontSizeSubtitle = 11,
    FontSizeSection = 11,
    FontSizeRegular = 12,
    FontSizeSmall = 10,
    
    UseStrokes = true,
    StrokeThickness = 1,
    
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
local PureBlackWhite = nil
local success, result = pcall(function()
    return require(script.Parent.PureBlackWhite)
end)
if success then
    PureBlackWhite = result
else
    PureBlackWhite = {
        Name = "Pure Black & White",
        DefaultLogo = "rbxasset://textures/LiyhubLogo.png",
        DefaultBanner = "rbxassetid://97436813723523",
        Background = Color3.fromRGB(13, 13, 15),
        Header = Color3.fromRGB(16, 16, 19),
        Sidebar = Color3.fromRGB(15, 15, 18),
        SidebarItem = Color3.fromRGB(20, 20, 24),
        SidebarItemActive = Color3.fromRGB(28, 28, 34),
        SectionHeader = Color3.fromRGB(18, 18, 22),
        Card = Color3.fromRGB(18, 18, 22),
        CardHover = Color3.fromRGB(24, 24, 29),
        Element = Color3.fromRGB(22, 22, 27),
        ElementHover = Color3.fromRGB(28, 28, 35),
        ElementActive = Color3.fromRGB(36, 36, 44),
        Scrollbar = Color3.fromRGB(50, 50, 60),
        Overlay = Color3.fromRGB(0, 0, 0),
        Border = Color3.fromRGB(34, 34, 40),
        BorderSubtle = Color3.fromRGB(28, 28, 34),
        BorderFocus = Color3.fromRGB(75, 75, 90),
        BorderWindow = Color3.fromRGB(42, 42, 50),
        TextPrimary = Color3.fromRGB(255, 255, 255),
        TextSecondary = Color3.fromRGB(160, 160, 172),
        TextMuted = Color3.fromRGB(110, 110, 122),
        TextDisabled = Color3.fromRGB(65, 65, 75),
        Accent = Color3.fromRGB(255, 255, 255),
        AccentStep = Color3.fromRGB(0, 174, 255),
        AccentStepInactive = Color3.fromRGB(38, 38, 46),
        ToggleActive = Color3.fromRGB(255, 255, 255),
        ToggleInactive = Color3.fromRGB(22, 22, 28),
        ToggleBorderInactive = Color3.fromRGB(55, 55, 66),
        ToggleKnob = Color3.fromRGB(14, 14, 16),
        ToggleKnobInactive = Color3.fromRGB(190, 190, 200),
        SliderTrack = Color3.fromRGB(34, 34, 42),
        SliderFill = Color3.fromRGB(255, 255, 255),
        Success = Color3.fromRGB(46, 204, 113),
        Warning = Color3.fromRGB(241, 196, 15),
        Error = Color3.fromRGB(231, 76, 60),
        Info = Color3.fromRGB(52, 152, 219),
        WindowCornerRadius = UDim.new(0, 10),
        CornerRadius = UDim.new(0, 7),
        SmallCornerRadius = UDim.new(0, 5),
        PillCornerRadius = UDim.new(1, 0),
        CardPadding = 10,
        ElementPadding = 8,
        ElementHeight = 36,
        SmallElementHeight = 30,
        FontTitle = Enum.Font.GothamBold,
        FontHeader = Enum.Font.GothamBold,
        FontRegular = Enum.Font.GothamMedium,
        FontBold = Enum.Font.GothamBold,
        FontSizeTitle = 15,
        FontSizeSubtitle = 11,
        FontSizeSection = 11,
        FontSizeRegular = 12,
        FontSizeSmall = 10,
        UseStrokes = true,
        StrokeThickness = 1,
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

-- Module: src/size/PC
_modules["src/size/PC"] = function()
local PC = {
    Name = "PC",
    Scale = 1.00,
    DefaultSize = UDim2.fromOffset(740, 490),
    MinSize = Vector2.new(480, 340),
    MaxSize = Vector2.new(1280, 840),
    SidebarWidth = 190,
    HeaderHeight = 48,
    ModalWidth = 340,
    SmallElementHeight = 34,
    NormalElementHeight = 46,
    Padding = 10,
    CornerRadius = 7,
}

return PC


end

-- Module: src/size/Android
_modules["src/size/Android"] = function()
local Android = {
    Name = "Android",
    Scale = 1.10,
    DefaultSize = UDim2.fromOffset(580, 410),
    MinSize = Vector2.new(380, 270),
    MaxSize = Vector2.new(780, 520),
    SidebarWidth = 155,
    HeaderHeight = 44,
    ModalWidth = 290,
    SmallElementHeight = 38,
    NormalElementHeight = 50,
    Padding = 6,
    CornerRadius = 8,
}

return Android


end

-- Module: src/size/Tablet
_modules["src/size/Tablet"] = function()
local Tablet = {
    Name = "Tablet",
    Scale = 1.05,
    DefaultSize = UDim2.fromOffset(640, 440),
    MinSize = Vector2.new(430, 310),
    MaxSize = Vector2.new(920, 640),
    SidebarWidth = 170,
    HeaderHeight = 46,
    ModalWidth = 320,
    SmallElementHeight = 36,
    NormalElementHeight = 48,
    Padding = 8,
    CornerRadius = 7,
}

return Tablet


end

-- Module: src/size/SizeManager
_modules["src/size/SizeManager"] = function()
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local GuiService = game:GetService("GuiService")

local PC = nil
local Tablet = nil
local Android = nil

local okPc, resPc = pcall(function() return require(script.Parent.PC) end)
PC = okPc and resPc or {
    Name = "PC",
    Scale = 1.00,
    DefaultSize = UDim2.fromOffset(740, 490),
    MinSize = Vector2.new(480, 340),
    MaxSize = Vector2.new(1280, 840),
    SidebarWidth = 190,
    HeaderHeight = 48,
    ModalWidth = 340,
    SmallElementHeight = 34,
    NormalElementHeight = 46,
    Padding = 10,
    CornerRadius = 7,
}

local okTab, resTab = pcall(function() return require(script.Parent.Tablet) end)
Tablet = okTab and resTab or {
    Name = "Tablet",
    Scale = 1.05,
    DefaultSize = UDim2.fromOffset(640, 440),
    MinSize = Vector2.new(430, 310),
    MaxSize = Vector2.new(920, 640),
    SidebarWidth = 170,
    HeaderHeight = 46,
    ModalWidth = 320,
    SmallElementHeight = 36,
    NormalElementHeight = 48,
    Padding = 8,
    CornerRadius = 7,
}

local okAnd, resAnd = pcall(function() return require(script.Parent.Android) end)
Android = okAnd and resAnd or {
    Name = "Android",
    Scale = 1.10,
    DefaultSize = UDim2.fromOffset(580, 410),
    MinSize = Vector2.new(380, 270),
    MaxSize = Vector2.new(780, 520),
    SidebarWidth = 155,
    HeaderHeight = 44,
    ModalWidth = 290,
    SmallElementHeight = 38,
    NormalElementHeight = 50,
    Padding = 6,
    CornerRadius = 8,
}

local SizePresets = {
    Small = 0.85,
    Normal = 1.00,
    Large = 1.15,
}

local SizeManager = {
    PC = PC,
    Tablet = Tablet,
    Android = Android,
    SizePresets = SizePresets,
    _currentPreset = PC,
}

function SizeManager.DetectDevice()
    local isTouch = UserInputService.TouchEnabled
    local isKeyboard = UserInputService.KeyboardEnabled
    local cam = Workspace.CurrentCamera
    local vp = cam and cam.ViewportSize or Vector2.new(1280, 720)
    
    if not isTouch then
        return "PC"
    end
    
    if isTouch and not isKeyboard then
        if vp.X < 740 or vp.Y < 480 then
            return "Android"
        else
            return "Tablet"
        end
    end
    
    if isTouch and isKeyboard then
        if vp.X < 860 or vp.Y < 520 then
            return "Android"
        elseif vp.X < 1100 then
            return "Tablet"
        else
            return "PC"
        end
    end
    
    return "PC"
end

function SizeManager.GetPreset(name)
    if type(name) == "table" and name.DefaultSize then
        return name
    end
    if type(name) == "string" then
        local lower = string.lower(name)
        if lower == "android" or lower == "mobile" or lower == "phone" then
            return Android
        elseif lower == "tablet" or lower == "ipad" then
            return Tablet
        else
            return PC
        end
    end
    local detected = SizeManager.DetectDevice()
    if detected == "Android" then
        return Android
    elseif detected == "Tablet" then
        return Tablet
    end
    return PC
end

function SizeManager.GetScaleMultiplier(scaleOrPreset)
    if type(scaleOrPreset) == "number" then
        return math.clamp(scaleOrPreset, 0.5, 1.5)
    end
    if type(scaleOrPreset) == "string" and SizePresets[scaleOrPreset] then
        return SizePresets[scaleOrPreset]
    end
    return 1.0
end

return SizeManager

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
    
    local uiScaleVal = options.Scale
    if not uiScaleVal then
        local mf = parentScreenGui:FindFirstChild("MainFrame")
        local ws = mf and mf:FindFirstChild("WindowScale")
        if ws and ws:IsA("UIScale") then
            uiScaleVal = ws.Scale
        end
    end
    if uiScaleVal and uiScaleVal ~= 1 then
        local oScale = Instance.new("UIScale")
        oScale.Scale = uiScaleVal
        oScale.Parent = overlay
    end
    
    local dialog = Instance.new("Frame")
    dialog.Name = "Dialog"
    dialog.AnchorPoint = Vector2.new(0.5, 0.5)
    dialog.Position = UDim2.new(0.5, 0, 0.5, 0)
    dialog.Size = UDim2.new(0.85, 0, 0, 0)
    dialog.AutomaticSize = Enum.AutomaticSize.Y
    dialog.BackgroundColor3 = theme.Header
    dialog.BorderSizePixel = 0
    dialog.ZIndex = 101
    dialog.Parent = overlay
    
    local dConstraint = Instance.new("UISizeConstraint")
    dConstraint.MinSize = Vector2.new(280, 130)
    dConstraint.MaxSize = Vector2.new(420, 500)
    dConstraint.Parent = dialog
    
    local dPad = Instance.new("UIPadding")
    dPad.PaddingTop = UDim.new(0, 14)
    dPad.PaddingBottom = UDim.new(0, 14)
    dPad.PaddingLeft = UDim.new(0, 16)
    dPad.PaddingRight = UDim.new(0, 16)
    dPad.Parent = dialog
    
    local dList = Instance.new("UIListLayout")
    dList.SortOrder = Enum.SortOrder.LayoutOrder
    dList.Padding = UDim.new(0, 10)
    dList.Parent = dialog
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = theme.CornerRadius
    corner.Parent = dialog
    
    if theme.UseStrokes then
        local stroke = Instance.new("UIStroke")
        stroke.Name = "DialogStroke"
        stroke.Color = theme.BorderWindow or theme.Border
        stroke.Thickness = 1
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Parent = dialog
    end
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(1, 0, 0, 22)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = theme.TextPrimary
    titleLabel.Font = theme.FontBold
    titleLabel.TextSize = theme.FontSizeTitle
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.TextTruncate = Enum.TextTruncate.AtEnd
    titleLabel.LayoutOrder = 1
    titleLabel.ZIndex = 102
    titleLabel.Parent = dialog
    
    local msgLabel = Instance.new("TextLabel")
    msgLabel.Name = "Message"
    msgLabel.Size = UDim2.new(1, 0, 0, 0)
    msgLabel.AutomaticSize = Enum.AutomaticSize.Y
    msgLabel.BackgroundTransparency = 1
    msgLabel.Text = message
    msgLabel.TextColor3 = theme.TextSecondary
    msgLabel.Font = theme.FontRegular
    msgLabel.TextSize = theme.FontSizeRegular
    msgLabel.TextXAlignment = Enum.TextXAlignment.Left
    msgLabel.TextYAlignment = Enum.TextYAlignment.Top
    msgLabel.TextWrapped = true
    msgLabel.LayoutOrder = 2
    msgLabel.ZIndex = 102
    msgLabel.Parent = dialog
    
    local btnRow = Instance.new("Frame")
    btnRow.Name = "Buttons"
    btnRow.Size = UDim2.new(1, 0, 0, 32)
    btnRow.BackgroundTransparency = 1
    btnRow.LayoutOrder = 3
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
    
    TweenService:Create(overlay, TweenInfo.new(theme.AnimationFast), {
        BackgroundTransparency = 0.5
    }):Play()
    
    local isClosing = false
    local function close(callback)
        if isClosing then return end
        isClosing = true
        local t = TweenService:Create(overlay, TweenInfo.new(theme.AnimationFast), {
            BackgroundTransparency = 1
        })
        t:Play()
        t.Completed:Connect(function()
            if overlay and overlay.Parent then
                overlay:Destroy()
            end
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
    local duration = options.Duration or 3.0
    
    local holder = parentScreenGui:FindFirstChild("NotificationHolder")
    if not holder then
        holder = Instance.new("Frame")
        holder.Name = "NotificationHolder"
        holder.Size = UDim2.new(0, 260, 1, -20)
        holder.Position = UDim2.new(1, -270, 0, 10)
        holder.BackgroundTransparency = 1
        holder.ZIndex = 90
        holder.Parent = parentScreenGui
        
        local hList = Instance.new("UIListLayout")
        hList.VerticalAlignment = Enum.VerticalAlignment.Bottom
        hList.HorizontalAlignment = Enum.HorizontalAlignment.Right
        hList.SortOrder = Enum.SortOrder.LayoutOrder
        hList.Padding = UDim.new(0, 6)
        hList.Parent = holder
    end
    
    local toast = Instance.new("Frame")
    toast.Name = "Toast"
    toast.Size = UDim2.new(1, 0, 0, 48)
    toast.Position = UDim2.new(1, 300, 0, 0)
    toast.BackgroundColor3 = theme.Header
    toast.BorderSizePixel = 0
    toast.ClipsDescendants = true
    toast.ZIndex = 91
    toast.Parent = holder
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = theme.CornerRadius or UDim.new(0, 7)
    corner.Parent = toast
    
    if theme.UseStrokes then
        local stroke = Instance.new("UIStroke")
        stroke.Name = "ToastStroke"
        stroke.Color = theme.BorderWindow or theme.Border
        stroke.Thickness = 1
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Parent = toast
    end
    
    local bar = Instance.new("Frame")
    bar.Name = "Bar"
    bar.Size = UDim2.new(0, 3, 1, -12)
    bar.Position = UDim2.new(0, 5, 0, 6)
    bar.BackgroundColor3 = theme.Accent
    bar.BorderSizePixel = 0
    bar.ZIndex = 92
    bar.Parent = toast
    
    local bCorner = Instance.new("UICorner")
    bCorner.CornerRadius = UDim.new(1, 0)
    bCorner.Parent = bar
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(1, -20, 0, 16)
    titleLabel.Position = UDim2.new(0, 14, 0, 8)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = theme.TextPrimary
    titleLabel.Font = theme.FontBold
    titleLabel.TextSize = theme.FontSizeSmall
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.TextTruncate = Enum.TextTruncate.AtEnd
    titleLabel.ZIndex = 92
    titleLabel.Parent = toast
    
    local msgLabel = Instance.new("TextLabel")
    msgLabel.Name = "Message"
    msgLabel.Size = UDim2.new(1, -20, 0, 14)
    msgLabel.Position = UDim2.new(0, 14, 0, 26)
    msgLabel.BackgroundTransparency = 1
    msgLabel.Text = message
    msgLabel.TextColor3 = theme.TextSecondary
    msgLabel.Font = theme.FontRegular
    msgLabel.TextSize = 10
    msgLabel.TextXAlignment = Enum.TextXAlignment.Left
    msgLabel.TextTruncate = Enum.TextTruncate.AtEnd
    msgLabel.ZIndex = 92
    msgLabel.Parent = toast
    
    TweenService:Create(toast, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Position = UDim2.new(0, 0, 0, 0)
    }):Play()
    
    local isDismissed = false
    task.delay(duration, function()
        if isDismissed then return end
        isDismissed = true
        if toast and toast.Parent then
            local t = TweenService:Create(toast, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                Position = UDim2.new(1, 300, 0, 0)
            })
            t:Play()
            t.Completed:Connect(function()
                if toast and toast.Parent then
                    toast:Destroy()
                end
            end)
        end
    end)
end

return Modal

end

-- Module: src/components/MobilePin
_modules["src/components/MobilePin"] = function()
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local MobilePin = {}
MobilePin.__index = MobilePin

function MobilePin.new(screenGui, window, options, theme, cleanup)
    options = options or {}
    local titleText = options.Title or "LiyHub"
    local openSubText = options.OpenText or "Tap to Open"
    local closeSubText = options.CloseText or "Tap to Close"
    local logoAsset = options.Logo or options.Icon or theme.DefaultLogo or "rbxasset://textures/LiyhubLogo.png"
    local initialPos = options.Position or UDim2.new(0.5, -60, 0, 14)
    
    local container = Instance.new("TextButton")
    container.Name = "LiyHub_MobilePin"
    container.Size = UDim2.new(0, 120, 0, 36)
    container.Position = initialPos
    container.BackgroundColor3 = theme.Header or Color3.fromRGB(16, 16, 19)
    container.AutoButtonColor = false
    container.Text = ""
    container.BorderSizePixel = 0
    container.ZIndex = 999999
    container.Active = true
    container.Modal = false
    container.Parent = screenGui
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(1, 0)
    corner.Parent = container
    
    if theme.UseStrokes then
        local stroke = Instance.new("UIStroke")
        stroke.Name = "BorderStroke"
        stroke.Color = theme.BorderWindow or Color3.fromRGB(45, 45, 55)
        stroke.Thickness = 1
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Parent = container
    end
    
    local iconBg = Instance.new("Frame")
    iconBg.Name = "IconBg"
    iconBg.Size = UDim2.new(0, 24, 0, 24)
    iconBg.Position = UDim2.new(0, 8, 0.5, -12)
    iconBg.BackgroundColor3 = theme.Element or Color3.fromRGB(24, 24, 29)
    iconBg.BorderSizePixel = 0
    iconBg.ZIndex = 1000000
    iconBg.ClipsDescendants = true
    iconBg.Active = false
    iconBg.Parent = container
    
    local ibCorner = Instance.new("UICorner")
    ibCorner.CornerRadius = UDim.new(1, 0)
    ibCorner.Parent = iconBg
    
    local iconImg = Instance.new("ImageLabel")
    iconImg.Name = "Logo"
    iconImg.Size = UDim2.new(1, 0, 1, 0)
    iconImg.BackgroundTransparency = 1
    iconImg.Image = logoAsset
    iconImg.ScaleType = Enum.ScaleType.Fit
    iconImg.Active = false
    iconImg.ZIndex = 1000001
    iconImg.Parent = iconBg
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(1, -40, 0, 16)
    titleLabel.Position = UDim2.new(0, 38, 0, 4)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = titleText
    titleLabel.TextColor3 = theme.TextPrimary
    titleLabel.Font = theme.FontBold
    titleLabel.TextSize = 12
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Active = false
    titleLabel.ZIndex = 1000001
    titleLabel.Parent = container
    
    local subLabel = Instance.new("TextLabel")
    subLabel.Name = "Subtitle"
    subLabel.Size = UDim2.new(1, -40, 0, 12)
    subLabel.Position = UDim2.new(0, 38, 0, 18)
    subLabel.BackgroundTransparency = 1
    subLabel.Text = closeSubText
    subLabel.TextColor3 = theme.TextMuted
    subLabel.Font = theme.FontRegular
    subLabel.TextSize = 9
    subLabel.TextXAlignment = Enum.TextXAlignment.Left
    subLabel.Active = false
    subLabel.ZIndex = 1000001
    subLabel.Parent = container
    
    local self = setmetatable({
        _container = container,
        _window = window,
        _titleLabel = titleLabel,
        _subLabel = subLabel,
        _openText = openSubText,
        _closeText = closeSubText,
        _theme = theme,
        _dragging = false,
    }, MobilePin)
    
    local dragStart, startPos, dragMoved = nil, nil, false
    local downConn = container.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            self._dragging = true
            dragMoved = false
            dragStart = input.Position
            startPos = container.Position
        end
    end)
    
    local moveConn = UserInputService.InputChanged:Connect(function(input)
        if self._dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            if delta.Magnitude > 3 then
                dragMoved = true
            end
            container.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)
    
    local upConn = UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            if self._dragging then
                self._dragging = false
                if not dragMoved and window then
                    window:Toggle()
                end
            end
        end
    end)
    
    if cleanup then
        cleanup:Add(downConn)
        cleanup:Add(moveConn)
        cleanup:Add(upConn)
        cleanup:Add(container)
    end
    
    return self
end

function MobilePin:SetVisible(visible)
    self._container.Visible = visible == true
end

function MobilePin:SetOpenState(isOpen)
    self._subLabel.Text = isOpen and self._closeText or self._openText
end

function MobilePin:Destroy()
    if self._container then
        self._container:Destroy()
    end
end

return MobilePin

end

-- Module: src/components/Button
_modules["src/components/Button"] = function()
local TweenService = game:GetService("TweenService")

local Button = {}
Button.__index = Button

function Button.new(parent, options, theme, cleanup)
    options = options or {}
    local isActionRow = (options.ButtonText ~= nil) or (options.Description ~= nil and options.Title ~= nil)
    local callback = options.Callback or options.OnClick or function() end
    local isPrimary = options.Variant == "Primary" or options.Primary == true or (options.ButtonText ~= nil)
    
    if isActionRow then
        local titleText = options.Title or options.Name or "Action"
        local descText = options.Description or options.Desc or ""
        local btnText = options.ButtonText or options.Text or "Click"
        
        local rowContainer = Instance.new("Frame")
        rowContainer.Name = "ActionRow_" .. titleText
        rowContainer.Size = UDim2.new(1, 0, 0, descText ~= "" and 46 or 36)
        rowContainer.BackgroundColor3 = theme.Element
        rowContainer.BorderSizePixel = 0
        rowContainer.Parent = parent
        
        local rCorner = Instance.new("UICorner")
        rCorner.CornerRadius = theme.SmallCornerRadius or UDim.new(0, 5)
        rCorner.Parent = rowContainer
        
        if theme.UseStrokes then
            local stroke = Instance.new("UIStroke")
            stroke.Name = "BorderStroke"
            stroke.Color = theme.Border
            stroke.Thickness = 1
            stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            stroke.Parent = rowContainer
        end
        
        local titleLabel = Instance.new("TextLabel")
        titleLabel.Name = "Title"
        titleLabel.Size = UDim2.new(1, -90, 0, 18)
        titleLabel.Position = UDim2.new(0, 10, 0, descText ~= "" and 6 or 9)
        titleLabel.BackgroundTransparency = 1
        titleLabel.Text = titleText
        titleLabel.TextColor3 = theme.TextPrimary
        titleLabel.Font = theme.FontBold
        titleLabel.TextSize = theme.FontSizeRegular
        titleLabel.TextXAlignment = Enum.TextXAlignment.Left
        titleLabel.Active = false
        titleLabel.Parent = rowContainer
        
        if descText ~= "" then
            local descLabel = Instance.new("TextLabel")
            descLabel.Name = "Description"
            descLabel.Size = UDim2.new(1, -90, 0, 14)
            descLabel.Position = UDim2.new(0, 10, 0, 25)
            descLabel.BackgroundTransparency = 1
            descLabel.Text = descText
            descLabel.TextColor3 = theme.TextMuted
            descLabel.Font = theme.FontRegular
            descLabel.TextSize = theme.FontSizeSmall
            descLabel.TextXAlignment = Enum.TextXAlignment.Left
            descLabel.TextTruncate = Enum.TextTruncate.AtEnd
            descLabel.Active = false
            descLabel.Parent = rowContainer
        end
        
        local actionBtn = Instance.new("TextButton")
        actionBtn.Name = "ActionButton"
        actionBtn.Size = UDim2.new(0, 68, 0, 26)
        actionBtn.Position = UDim2.new(1, -78, 0.5, -13)
        actionBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        actionBtn.AutoButtonColor = false
        actionBtn.Text = btnText
        actionBtn.TextColor3 = Color3.fromRGB(14, 14, 16)
        actionBtn.Font = theme.FontBold
        actionBtn.TextSize = theme.FontSizeSmall
        actionBtn.BorderSizePixel = 0
        actionBtn.Active = true
        actionBtn.ZIndex = 5
        actionBtn.Parent = rowContainer
        
        local abCorner = Instance.new("UICorner")
        abCorner.CornerRadius = theme.SmallCornerRadius or UDim.new(0, 4)
        abCorner.Parent = actionBtn
        
        local lastTrigger = 0
        local function trigger()
            local now = os.clock()
            if now - lastTrigger < 0.12 then return end
            lastTrigger = now
            task.spawn(callback)
        end
        local clickConn = actionBtn.Activated:Connect(trigger)
        
        local hConn = actionBtn.MouseEnter:Connect(function()
            TweenService:Create(actionBtn, TweenInfo.new(theme.AnimationFast), { BackgroundColor3 = Color3.fromRGB(230, 230, 235) }):Play()
        end)
        local lConn = actionBtn.MouseLeave:Connect(function()
            TweenService:Create(actionBtn, TweenInfo.new(theme.AnimationFast), { BackgroundColor3 = Color3.fromRGB(255, 255, 255) }):Play()
        end)
        
        if cleanup then
            cleanup:Add(clickConn)
            cleanup:Add(hConn)
            cleanup:Add(lConn)
            cleanup:Add(rowContainer)
        end
        
        return setmetatable({
            _container = rowContainer,
            _actionBtn = actionBtn,
            _theme = theme,
            _callback = callback,
        }, Button)
    end
    
    local text = options.Text or options.Name or "Button"
    
    local container = Instance.new("TextButton")
    container.Name = "Button_" .. text
    container.Size = UDim2.new(1, 0, 0, theme.SmallElementHeight or 32)
    container.BackgroundColor3 = isPrimary and Color3.fromRGB(255, 255, 255) or theme.Element
    container.AutoButtonColor = false
    container.Text = ""
    container.BorderSizePixel = 0
    container.Active = true
    container.Parent = parent
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = theme.SmallCornerRadius or UDim.new(0, 5)
    corner.Parent = container
    
    if theme.UseStrokes and not isPrimary then
        local stroke = Instance.new("UIStroke")
        stroke.Name = "BorderStroke"
        stroke.Color = theme.Border
        stroke.Thickness = 1
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Parent = container
    end
    
    local label = Instance.new("TextLabel")
    label.Name = "Label"
    label.Size = UDim2.new(1, -16, 1, 0)
    label.Position = UDim2.new(0, 8, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = isPrimary and Color3.fromRGB(14, 14, 16) or theme.TextPrimary
    label.Font = theme.FontBold
    label.TextSize = theme.FontSizeRegular
    label.TextXAlignment = Enum.TextXAlignment.Center
    label.Active = false
    label.Parent = container
    
    local self = setmetatable({
        _container = container,
        _label = label,
        _theme = theme,
        _isPrimary = isPrimary,
        _callback = callback,
        _disabled = false,
    }, Button)
    
    local defaultBg = isPrimary and Color3.fromRGB(255, 255, 255) or theme.Element
    local hoverBg = isPrimary and Color3.fromRGB(235, 235, 240) or theme.ElementHover
    local activeBg = isPrimary and Color3.fromRGB(215, 215, 225) or theme.ElementActive
    
    local hoverConn = container.MouseEnter:Connect(function()
        if self._disabled then return end
        TweenService:Create(container, TweenInfo.new(theme.AnimationFast), { BackgroundColor3 = hoverBg }):Play()
    end)
    local leaveConn = container.MouseLeave:Connect(function()
        if self._disabled then return end
        TweenService:Create(container, TweenInfo.new(theme.AnimationFast), { BackgroundColor3 = defaultBg }):Play()
    end)
    local downConn = container.MouseButton1Down:Connect(function()
        if self._disabled then return end
        TweenService:Create(container, TweenInfo.new(theme.AnimationFast), { BackgroundColor3 = activeBg }):Play()
    end)
    local upConn = container.MouseButton1Up:Connect(function()
        if self._disabled then return end
        TweenService:Create(container, TweenInfo.new(theme.AnimationFast), { BackgroundColor3 = hoverBg }):Play()
    end)
    
    local lastBtn = 0
    local function triggerBtn()
        local now = os.clock()
        if now - lastBtn < 0.12 then return end
        lastBtn = now
        if self._disabled then return end
        task.spawn(self._callback)
    end
    local clickConn = container.Activated:Connect(triggerBtn)
    
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

function Button:SetText(text)
    if self._label then self._label.Text = text end
    if self._actionBtn then self._actionBtn.Text = text end
end

function Button:SetDisabled(state)
    self._disabled = state == true
    if self._container:IsA("TextButton") then
        self._container.AutoButtonColor = not self._disabled
    end
    if self._label then
        self._label.TextColor3 = self._disabled and self._theme.TextDisabled or (self._isPrimary and Color3.fromRGB(14, 14, 16) or self._theme.TextPrimary)
    end
end

function Button:Destroy()
    if self._container then
        self._container:Destroy()
    end
end

return Button

end

-- Module: src/components/ButtonGroup
_modules["src/components/ButtonGroup"] = function()
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

end

-- Module: src/components/Toggle
_modules["src/components/Toggle"] = function()
local TweenService = game:GetService("TweenService")

local Toggle = {}
Toggle.__index = Toggle

function Toggle.new(parent, options, theme, cleanup)
    options = options or {}
    local text = options.Text or options.Name or "Toggle"
    local desc = options.Desc or options.Description
    local defaultState = options.Default == true
    local callback = options.Callback or options.OnChange or function() end
    
    local container = Instance.new("TextButton")
    container.Name = "Toggle_" .. text
    container.Size = UDim2.new(1, 0, 0, desc and 46 or (theme.SmallElementHeight or 34))
    container.BackgroundColor3 = theme.Element
    container.AutoButtonColor = false
    container.Text = ""
    container.BorderSizePixel = 0
    container.Active = true
    container.Parent = parent
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = theme.SmallCornerRadius or UDim.new(0, 5)
    corner.Parent = container
    
    if theme.UseStrokes then
        local stroke = Instance.new("UIStroke")
        stroke.Name = "BorderStroke"
        stroke.Color = theme.Border
        stroke.Thickness = 1
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Parent = container
    end
    
    local label = Instance.new("TextLabel")
    label.Name = "Label"
    label.Size = UDim2.new(1, -44, 0, 18)
    label.Position = UDim2.new(0, 10, 0, desc and 6 or 8)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = theme.TextPrimary
    label.Font = theme.FontBold
    label.TextSize = 11
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Active = false
    label.Parent = container
    
    local descLabel = nil
    if desc then
        descLabel = Instance.new("TextLabel")
        descLabel.Name = "Description"
        descLabel.Size = UDim2.new(1, -44, 0, 14)
        descLabel.Position = UDim2.new(0, 10, 0, 26)
        descLabel.BackgroundTransparency = 1
        descLabel.Text = desc
        descLabel.TextColor3 = theme.TextMuted
        descLabel.Font = theme.FontRegular
        descLabel.TextSize = theme.FontSizeSmall
        descLabel.TextXAlignment = Enum.TextXAlignment.Left
        descLabel.TextTruncate = Enum.TextTruncate.AtEnd
        descLabel.Active = false
        descLabel.Parent = container
    end
    
    local switch = Instance.new("Frame")
    switch.Name = "Switch"
    switch.Size = UDim2.new(0, 32, 0, 16)
    switch.Position = UDim2.new(1, -40, 0.5, -8)
    switch.BackgroundColor3 = defaultState and theme.ToggleActive or theme.ToggleInactive
    switch.BorderSizePixel = 0
    switch.Active = false
    switch.Parent = container
    
    local switchCorner = Instance.new("UICorner")
    switchCorner.CornerRadius = UDim.new(1, 0)
    switchCorner.Parent = switch
    
    local switchStroke = Instance.new("UIStroke")
    switchStroke.Name = "SwitchStroke"
    switchStroke.Color = defaultState and theme.ToggleActive or theme.ToggleBorderInactive
    switchStroke.Thickness = 1
    switchStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    switchStroke.Parent = switch
    
    local knob = Instance.new("Frame")
    knob.Name = "Knob"
    knob.Size = UDim2.new(0, 12, 0, 12)
    knob.Position = defaultState and UDim2.new(1, -14, 0.5, -6) or UDim2.new(0, 2, 0.5, -6)
    knob.BackgroundColor3 = defaultState and theme.ToggleKnob or theme.ToggleKnobInactive
    knob.BorderSizePixel = 0
    knob.Active = false
    knob.Parent = switch
    
    local knobCorner = Instance.new("UICorner")
    knobCorner.CornerRadius = UDim.new(1, 0)
    knobCorner.Parent = knob
    
    local self = setmetatable({
        _container = container,
        _label = label,
        _switch = switch,
        _switchStroke = switchStroke,
        _knob = knob,
        _theme = theme,
        _state = defaultState,
        _callback = callback,
        _disabled = false,
    }, Toggle)
    
    local function updateVisual(animate)
        local animTime = animate and theme.AnimationFast or 0
        local targetSwitchColor = self._state and theme.ToggleActive or theme.ToggleInactive
        local targetStrokeColor = self._state and theme.ToggleActive or theme.ToggleBorderInactive
        local targetKnobColor = self._state and theme.ToggleKnob or theme.ToggleKnobInactive
        local targetKnobPos = self._state and UDim2.new(1, -14, 0.5, -6) or UDim2.new(0, 2, 0.5, -6)
        
        if animTime > 0 then
            TweenService:Create(switch, TweenInfo.new(animTime), { BackgroundColor3 = targetSwitchColor }):Play()
            TweenService:Create(switchStroke, TweenInfo.new(animTime), { Color = targetStrokeColor }):Play()
            TweenService:Create(knob, TweenInfo.new(animTime), {
                BackgroundColor3 = targetKnobColor,
                Position = targetKnobPos,
            }):Play()
        else
            switch.BackgroundColor3 = targetSwitchColor
            switchStroke.Color = targetStrokeColor
            knob.BackgroundColor3 = targetKnobColor
            knob.Position = targetKnobPos
        end
    end
    
    local lastToggle = 0
    local function toggleState()
        local now = os.clock()
        if now - lastToggle < 0.12 then return end
        lastToggle = now
        if self._disabled then return end
        self._state = not self._state
        updateVisual(true)
        task.spawn(self._callback, self._state)
    end
    
    local clickConn = container.Activated:Connect(toggleState)
    
    if cleanup then
        cleanup:Add(clickConn)
        cleanup:Add(container)
    end
    
    return self
end

function Toggle:SetValue(state)
    self._state = state == true
    local animTime = self._theme.AnimationFast or 0.15
    local targetSwitchColor = self._state and self._theme.ToggleActive or self._theme.ToggleInactive
    local targetStrokeColor = self._state and self._theme.ToggleActive or self._theme.ToggleBorderInactive
    local targetKnobColor = self._state and self._theme.ToggleKnob or self._theme.ToggleKnobInactive
    local targetKnobPos = self._state and UDim2.new(1, -14, 0.5, -6) or UDim2.new(0, 2, 0.5, -6)
    
    TweenService:Create(self._switch, TweenInfo.new(animTime), { BackgroundColor3 = targetSwitchColor }):Play()
    TweenService:Create(self._switchStroke, TweenInfo.new(animTime), { Color = targetStrokeColor }):Play()
    TweenService:Create(self._knob, TweenInfo.new(animTime), {
        BackgroundColor3 = targetKnobColor,
        Position = targetKnobPos,
    }):Play()
    task.spawn(self._callback, self._state)
end

function Toggle:GetValue()
    return self._state
end

function Toggle:Destroy()
    if self._container then
        self._container:Destroy()
    end
end

return Toggle

end

-- Module: src/components/ToggleGroup
_modules["src/components/ToggleGroup"] = function()
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

end

-- Module: src/components/Slider
_modules["src/components/Slider"] = function()
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
    container.ClipsDescendants = false
    container.Parent = parent
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = theme.SmallCornerRadius or UDim.new(0, 5)
    corner.Parent = container
    
    if theme.UseStrokes then
        local stroke = Instance.new("UIStroke")
        stroke.Name = "BorderStroke"
        stroke.Color = theme.Border
        stroke.Thickness = 1
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Parent = container
    end
    
    local label = Instance.new("TextLabel")
    label.Name = "Label"
    label.Size = UDim2.new(0.65, 0, 0, 18)
    label.Position = UDim2.new(0, 10, 0, 7)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = theme.TextPrimary
    label.Font = theme.FontBold
    label.TextSize = theme.FontSizeRegular
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = container
    
    local valueBadge = Instance.new("Frame")
    valueBadge.Name = "ValueBadge"
    valueBadge.Size = UDim2.new(0, 36, 0, 18)
    valueBadge.Position = UDim2.new(1, -46, 0, 7)
    valueBadge.BackgroundColor3 = theme.Card
    valueBadge.BorderSizePixel = 0
    valueBadge.Parent = container
    
    local vbCorner = Instance.new("UICorner")
    vbCorner.CornerRadius = theme.SmallCornerRadius or UDim.new(0, 4)
    vbCorner.Parent = valueBadge
    
    if theme.UseStrokes then
        local vbStroke = Instance.new("UIStroke")
        vbStroke.Color = theme.BorderSubtle
        vbStroke.Thickness = 1
        vbStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        vbStroke.Parent = valueBadge
    end
    
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
    
    local track = Instance.new("TextButton")
    track.Name = "Track"
    track.Size = UDim2.new(1, -20, 0, 5)
    track.Position = UDim2.new(0, 10, 0, 32)
    track.BackgroundColor3 = theme.SliderTrack
    track.AutoButtonColor = false
    track.Text = ""
    track.BorderSizePixel = 0
    track.Parent = container
    
    local trackCorner = Instance.new("UICorner")
    trackCorner.CornerRadius = UDim.new(1, 0)
    trackCorner.Parent = track
    
    local fill = Instance.new("Frame")
    fill.Name = "Fill"
    fill.Size = UDim2.new(0, 0, 1, 0)
    fill.BackgroundColor3 = theme.SliderFill
    fill.BorderSizePixel = 0
    fill.Parent = track
    
    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(1, 0)
    fillCorner.Parent = fill
    
    local knob = Instance.new("Frame")
    knob.Name = "Knob"
    knob.Size = UDim2.new(0, 14, 0, 14)
    knob.Position = UDim2.new(1, -7, 0.5, -7)
    knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    knob.BorderSizePixel = 0
    knob.ZIndex = 5
    knob.Parent = fill
    
    local knobCorner = Instance.new("UICorner")
    knobCorner.CornerRadius = UDim.new(1, 0)
    knobCorner.Parent = knob
    
    local tooltip = Instance.new("Frame")
    tooltip.Name = "Tooltip"
    tooltip.Size = UDim2.new(0, 30, 0, 18)
    tooltip.Position = UDim2.new(0.5, -15, 0, -22)
    tooltip.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tooltip.BorderSizePixel = 0
    tooltip.Visible = false
    tooltip.ZIndex = 15
    tooltip.Parent = knob
    
    local ttCorner = Instance.new("UICorner")
    ttCorner.CornerRadius = UDim.new(0, 4)
    ttCorner.Parent = tooltip
    
    local ttText = Instance.new("TextLabel")
    ttText.Name = "Text"
    ttText.Size = UDim2.new(1, 0, 1, 0)
    ttText.BackgroundTransparency = 1
    ttText.Text = tostring(defaultVal)
    ttText.TextColor3 = Color3.fromRGB(14, 14, 16)
    ttText.Font = theme.FontBold
    ttText.TextSize = 10
    ttText.ZIndex = 16
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
        local trackAbsWidth = track.AbsoluteSize.X
        if trackAbsWidth <= 0 then return end
        
        local rel = math.clamp((inputX - trackAbsPos) / trackAbsWidth, 0, 1)
        local rawVal = self._min + (self._max - self._min) * rel
        local quantized = math.floor((rawVal - self._min) / self._step + 0.5) * self._step + self._min
        quantized = math.clamp(quantized, self._min, self._max)
        
        self._value = quantized
        local finalRel = (quantized - self._min) / (self._max - self._min)
        fill.Size = UDim2.new(finalRel, 0, 1, 0)
        valueLabel.Text = tostring(quantized) .. self._suffix
        ttText.Text = tostring(quantized)
        task.spawn(self._callback, quantized)
    end
    
    local initRel = math.clamp((defaultVal - minVal) / (maxVal - minVal), 0, 1)
    fill.Size = UDim2.new(initRel, 0, 1, 0)
    
    local trackDown = track.MouseButton1Down:Connect(function()
        if self._disabled then return end
        self._dragging = true
        tooltip.Visible = true
        local mousePos = UserInputService:GetMouseLocation()
        updateFromInput(mousePos.X)
    end)
    
    local moveConn = UserInputService.InputChanged:Connect(function(input)
        if self._dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            updateFromInput(input.Position.X)
        end
    end)
    
    local upConn = UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            if self._dragging then
                self._dragging = false
                tooltip.Visible = false
            end
        end
    end)
    
    if cleanup then
        cleanup:Add(trackDown)
        cleanup:Add(moveConn)
        cleanup:Add(upConn)
        cleanup:Add(container)
    end
    
    return self
end

function Slider:SetValue(val)
    val = math.clamp(val, self._min, self._max)
    self._value = val
    local rel = (val - self._min) / (self._max - self._min)
    self._fill.Size = UDim2.new(rel, 0, 1, 0)
    self._valueLabel.Text = tostring(val) .. self._suffix
    self._ttText.Text = tostring(val)
    task.spawn(self._callback, val)
end

function Slider:GetValue()
    return self._value
end

function Slider:Destroy()
    if self._container then
        self._container:Destroy()
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
    label.Font = theme.FontBold
    label.TextSize = theme.FontSizeRegular
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = container
    
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
local TweenService = game:GetService("TweenService")

local Dropdown = {}
Dropdown.__index = Dropdown

function Dropdown.new(parent, options, theme, cleanup)
    options = options or {}
    local text = options.Title or options.Name or options.Text or "Dropdown"
    local rawOptions = options.Values or options.Options or {}
    local isMulti = options.MultiSelect == true or options.Multi == true
    local defaultVal = options.Default
    local callback = options.Callback or options.OnChange or function() end
    
    local container = Instance.new("Frame")
    container.Name = "Dropdown_" .. text
    container.Size = UDim2.new(1, 0, 0, 0)
    container.AutomaticSize = Enum.AutomaticSize.Y
    container.BackgroundTransparency = 1
    container.BorderSizePixel = 0
    container.ClipsDescendants = false
    container.Parent = parent
    
    local cList = Instance.new("UIListLayout")
    cList.SortOrder = Enum.SortOrder.LayoutOrder
    cList.Padding = UDim.new(0, 4)
    cList.Parent = container
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(1, 0, 0, 16)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = text
    titleLabel.TextColor3 = theme.TextPrimary
    titleLabel.Font = theme.FontBold
    titleLabel.TextSize = theme.FontSizeSmall or 11
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Active = false
    titleLabel.Parent = container
    
    local selectBox = Instance.new("TextButton")
    selectBox.Name = "SelectBox"
    selectBox.Size = UDim2.new(1, 0, 0, theme.SmallElementHeight or 32)
    selectBox.BackgroundColor3 = theme.Element
    selectBox.AutoButtonColor = false
    selectBox.Text = ""
    selectBox.BorderSizePixel = 0
    selectBox.Active = true
    selectBox.ZIndex = 5
    selectBox.Parent = container
    
    local sbCorner = Instance.new("UICorner")
    sbCorner.CornerRadius = theme.SmallCornerRadius or UDim.new(0, 5)
    sbCorner.Parent = selectBox
    
    if theme.UseStrokes then
        local stroke = Instance.new("UIStroke")
        stroke.Name = "BorderStroke"
        stroke.Color = theme.Border
        stroke.Thickness = 1
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Parent = selectBox
    end
    
    local selectionLabel = Instance.new("TextLabel")
    selectionLabel.Name = "SelectionLabel"
    selectionLabel.Size = UDim2.new(1, -34, 1, 0)
    selectionLabel.Position = UDim2.new(0, 10, 0, 0)
    selectionLabel.BackgroundTransparency = 1
    selectionLabel.Text = "Select..."
    selectionLabel.TextColor3 = theme.TextSecondary
    selectionLabel.Font = theme.FontRegular
    selectionLabel.TextSize = theme.FontSizeSmall
    selectionLabel.TextXAlignment = Enum.TextXAlignment.Left
    selectionLabel.TextTruncate = Enum.TextTruncate.AtEnd
    selectionLabel.Active = false
    selectionLabel.ZIndex = 6
    selectionLabel.Parent = selectBox
    
    local chevron = Instance.new("ImageLabel")
    chevron.Name = "Chevron"
    chevron.Size = UDim2.fromOffset(12, 12)
    chevron.Position = UDim2.new(1, -20, 0.5, -6)
    chevron.BackgroundTransparency = 1
    chevron.Image = "rbxassetid://10709790948"
    chevron.ImageColor3 = theme.TextMuted
    chevron.Active = false
    chevron.ZIndex = 6
    chevron.Parent = selectBox
    
    local listContainer = Instance.new("Frame")
    listContainer.Name = "ListContainer"
    listContainer.Size = UDim2.new(1, 0, 0, 0)
    listContainer.BackgroundColor3 = theme.Header
    listContainer.BorderSizePixel = 0
    listContainer.Visible = false
    listContainer.ClipsDescendants = true
    listContainer.ZIndex = 25
    listContainer.Parent = container
    
    local lcCorner = Instance.new("UICorner")
    lcCorner.CornerRadius = theme.SmallCornerRadius or UDim.new(0, 5)
    lcCorner.Parent = listContainer
    
    if theme.UseStrokes then
        local lcStroke = Instance.new("UIStroke")
        lcStroke.Name = "BorderStroke"
        lcStroke.Color = theme.Border
        lcStroke.Thickness = 1
        lcStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        lcStroke.Parent = listContainer
    end
    
    local lcList = Instance.new("UIListLayout")
    lcList.SortOrder = Enum.SortOrder.LayoutOrder
    lcList.Padding = UDim.new(0, 4)
    lcList.Parent = listContainer
    
    local lcPad = Instance.new("UIPadding")
    lcPad.PaddingTop = UDim.new(0, 4)
    lcPad.PaddingBottom = UDim.new(0, 4)
    lcPad.PaddingLeft = UDim.new(0, 4)
    lcPad.PaddingRight = UDim.new(0, 4)
    lcPad.Parent = listContainer
    
    local actionsBar = nil
    if isMulti and #rawOptions >= 3 then
        actionsBar = Instance.new("Frame")
        actionsBar.Name = "ActionsBar"
        actionsBar.Size = UDim2.new(1, 0, 0, 22)
        actionsBar.BackgroundTransparency = 1
        actionsBar.ZIndex = 26
        actionsBar.Parent = listContainer
        
        local abLayout = Instance.new("UIListLayout")
        abLayout.FillDirection = Enum.FillDirection.Horizontal
        abLayout.SortOrder = Enum.SortOrder.LayoutOrder
        abLayout.Padding = UDim.new(0, 6)
        abLayout.Parent = actionsBar
        
        local selectAllBtn = Instance.new("TextButton")
        selectAllBtn.Name = "SelectAll"
        selectAllBtn.Size = UDim2.new(0.5, -3, 1, 0)
        selectAllBtn.BackgroundColor3 = theme.Element
        selectAllBtn.AutoButtonColor = false
        selectAllBtn.Text = "Select All"
        selectAllBtn.TextColor3 = theme.TextPrimary
        selectAllBtn.Font = theme.FontBold
        selectAllBtn.TextSize = 10
        selectAllBtn.BorderSizePixel = 0
        selectAllBtn.ZIndex = 27
        selectAllBtn.Parent = actionsBar
        local saCorner = Instance.new("UICorner")
        saCorner.CornerRadius = UDim.new(0, 4)
        saCorner.Parent = selectAllBtn
        
        local clearBtn = Instance.new("TextButton")
        clearBtn.Name = "Clear"
        clearBtn.Size = UDim2.new(0.5, -3, 1, 0)
        clearBtn.BackgroundColor3 = theme.Element
        clearBtn.AutoButtonColor = false
        clearBtn.Text = "Clear"
        clearBtn.TextColor3 = theme.TextMuted
        clearBtn.Font = theme.FontBold
        clearBtn.TextSize = 10
        clearBtn.BorderSizePixel = 0
        clearBtn.ZIndex = 27
        clearBtn.Parent = actionsBar
        local clCorner = Instance.new("UICorner")
        clCorner.CornerRadius = UDim.new(0, 4)
        clCorner.Parent = clearBtn
    end
    
    local scrollFrame = Instance.new("ScrollingFrame")
    scrollFrame.Name = "Scroll"
    scrollFrame.Size = UDim2.new(1, 0, 0, 100)
    scrollFrame.BackgroundTransparency = 1
    scrollFrame.BorderSizePixel = 0
    scrollFrame.ScrollBarThickness = 3
    scrollFrame.ScrollBarImageColor3 = theme.Scrollbar
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    scrollFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
    scrollFrame.ZIndex = 26
    scrollFrame.Parent = listContainer
    
    local sfList = Instance.new("UIListLayout")
    sfList.SortOrder = Enum.SortOrder.LayoutOrder
    sfList.Padding = UDim.new(0, 2)
    sfList.Parent = scrollFrame
    
    local self = setmetatable({
        _container = container,
        _selectBox = selectBox,
        _selectionLabel = selectionLabel,
        _chevron = chevron,
        _listContainer = listContainer,
        _scrollFrame = scrollFrame,
        _actionsBar = actionsBar,
        _theme = theme,
        _options = rawOptions,
        _isMulti = isMulti,
        _selected = isMulti and {} or nil,
        _callback = callback,
        _open = false,
        _optionButtons = {},
        _cleanup = cleanup,
    }, Dropdown)
    
    if isMulti then
        if type(defaultVal) == "table" then
            for _, item in ipairs(defaultVal) do
                self._selected[item] = true
            end
        elseif defaultVal ~= nil then
            self._selected[defaultVal] = true
        end
    else
        self._selected = defaultVal or rawOptions[1]
    end
    
    local function updateSelectionSummary()
        if self._isMulti then
            local activeList = {}
            for _, opt in ipairs(self._options) do
                if self._selected[opt] then
                    table.insert(activeList, tostring(opt))
                end
            end
            if #activeList == 0 then
                self._selectionLabel.Text = "Select..."
                self._selectionLabel.TextColor3 = self._theme.TextSecondary
            elseif #activeList == 1 then
                self._selectionLabel.Text = activeList[1]
                self._selectionLabel.TextColor3 = self._theme.TextPrimary
            elseif #activeList == 2 then
                self._selectionLabel.Text = activeList[1] .. ", " .. activeList[2]
                self._selectionLabel.TextColor3 = self._theme.TextPrimary
            else
                self._selectionLabel.Text = tostring(#activeList) .. " Selected"
                self._selectionLabel.TextColor3 = self._theme.TextPrimary
            end
        else
            if self._selected ~= nil then
                self._selectionLabel.Text = tostring(self._selected)
                self._selectionLabel.TextColor3 = self._theme.TextPrimary
            else
                self._selectionLabel.Text = "Select..."
                self._selectionLabel.TextColor3 = self._theme.TextSecondary
            end
        end
    end
    
    function self:_rebuildOptions()
        for _, btn in ipairs(self._optionButtons) do
            btn:Destroy()
        end
        self._optionButtons = {}
        
        for _, opt in ipairs(self._options) do
            local optStr = tostring(opt)
            local isChecked = false
            if self._isMulti then
                isChecked = self._selected[opt] == true
            else
                isChecked = self._selected == opt
            end
            
            local optBtn = Instance.new("TextButton")
            optBtn.Name = "Opt_" .. optStr
            optBtn.Size = UDim2.new(1, 0, 0, 26)
            optBtn.BackgroundColor3 = isChecked and self._theme.ElementActive or self._theme.Element
            optBtn.AutoButtonColor = false
            optBtn.Text = ""
            optBtn.BorderSizePixel = 0
            optBtn.Active = true
            optBtn.ZIndex = 27
            optBtn.Parent = self._scrollFrame
            
            local obCorner = Instance.new("UICorner")
            obCorner.CornerRadius = UDim.new(0, 4)
            obCorner.Parent = optBtn
            
            local optLabel = Instance.new("TextLabel")
            optLabel.Name = "Label"
            optLabel.Size = UDim2.new(1, -30, 1, 0)
            optLabel.Position = UDim2.new(0, 8, 0, 0)
            optLabel.BackgroundTransparency = 1
            optLabel.Text = optStr
            optLabel.TextColor3 = isChecked and self._theme.TextPrimary or self._theme.TextSecondary
            optLabel.Font = isChecked and self._theme.FontBold or self._theme.FontRegular
            optLabel.TextSize = self._theme.FontSizeSmall
            optLabel.TextXAlignment = Enum.TextXAlignment.Left
            optLabel.TextTruncate = Enum.TextTruncate.AtEnd
            optLabel.Active = false
            optLabel.ZIndex = 28
            optLabel.Parent = optBtn
            
            local checkIcon = Instance.new("ImageLabel")
            checkIcon.Name = "Checkmark"
            checkIcon.Size = UDim2.fromOffset(12, 12)
            checkIcon.Position = UDim2.new(1, -20, 0.5, -6)
            checkIcon.BackgroundTransparency = 1
            checkIcon.Image = "rbxassetid://10709790644"
            checkIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
            checkIcon.Visible = isChecked
            checkIcon.Active = false
            checkIcon.ZIndex = 28
            checkIcon.Parent = optBtn
            
            local lastOptClick = 0
            local function onOptionClicked()
                local now = os.clock()
                if now - lastOptClick < 0.1 then return end
                lastOptClick = now
                
                if self._isMulti then
                    self._selected[opt] = not self._selected[opt]
                    local activeList = {}
                    for _, item in ipairs(self._options) do
                        if self._selected[item] then
                            table.insert(activeList, item)
                        end
                    end
                    updateSelectionSummary()
                    self:_rebuildOptions()
                    task.spawn(self._callback, activeList)
                else
                    self._selected = opt
                    updateSelectionSummary()
                    self:Close()
                    task.spawn(self._callback, opt)
                end
            end
            
            local optClick = optBtn.Activated:Connect(onOptionClicked)
            if self._cleanup then
                self._cleanup:Add(optClick)
            end
            table.insert(self._optionButtons, optBtn)
        end
    end
    
    if actionsBar then
        local saBtn = actionsBar:FindFirstChild("SelectAll")
        if saBtn then
            saBtn.Activated:Connect(function()
                for _, item in ipairs(self._options) do
                    self._selected[item] = true
                end
                updateSelectionSummary()
                self:_rebuildOptions()
                local outList = {}
                for _, item in ipairs(self._options) do
                    table.insert(outList, item)
                end
                task.spawn(self._callback, outList)
            end)
        end
        local clBtn = actionsBar:FindFirstChild("Clear")
        if clBtn then
            clBtn.Activated:Connect(function()
                self._selected = {}
                updateSelectionSummary()
                self:_rebuildOptions()
                task.spawn(self._callback, {})
            end)
        end
    end
    
    updateSelectionSummary()
    self:_rebuildOptions()
    
    local lastHeader = 0
    local function toggleDropdown()
        local now = os.clock()
        if now - lastHeader < 0.15 then return end
        lastHeader = now
        if self._open then
            self:Close()
        else
            self:Open()
        end
    end
    local headerClick = selectBox.Activated:Connect(toggleDropdown)
    
    if cleanup then
        cleanup:Add(headerClick)
        cleanup:Add(container)
    end
    
    return self
end

function Dropdown:Open()
    self._open = true
    self._chevron.Rotation = 180
    self._listContainer.Visible = true
    local itemCount = #self._options
    local scrollHeight = math.clamp(itemCount * 28 + (itemCount - 1) * 2, 28, 140)
    self._scrollFrame.Size = UDim2.new(1, 0, 0, scrollHeight)
    local totalHeight = scrollHeight + 8 + (self._actionsBar and 26 or 0)
    
    TweenService:Create(self._listContainer, TweenInfo.new(self._theme.AnimationFast), {
        Size = UDim2.new(1, 0, 0, totalHeight)
    }):Play()
end

function Dropdown:Close()
    self._open = false
    self._chevron.Rotation = 0
    local t = TweenService:Create(self._listContainer, TweenInfo.new(self._theme.AnimationFast), {
        Size = UDim2.new(1, 0, 0, 0)
    })
    t:Play()
    t.Completed:Connect(function()
        if not self._open then
            self._listContainer.Visible = false
        end
    end)
end

function Dropdown:Toggle()
    if self._open then self:Close() else self:Open() end
end

function Dropdown:SetValue(value)
    if self._isMulti then
        self._selected = {}
        if type(value) == "table" then
            for _, item in ipairs(value) do
                self._selected[item] = true
            end
        elseif value ~= nil then
            self._selected[value] = true
        end
    else
        self._selected = value
    end
    self:_updateSummary()
    self:_rebuildOptions()
end

function Dropdown:GetValue()
    if self._isMulti then
        local out = {}
        for _, opt in ipairs(self._options) do
            if self._selected[opt] then
                table.insert(out, opt)
            end
        end
        return out
    end
    return self._selected
end

function Dropdown:SetOptions(newOptions)
    self._options = newOptions or {}
    if not self._isMulti then
        local found = false
        for _, v in ipairs(self._options) do
            if v == self._selected then
                found = true
                break
            end
        end
        if not found then
            self._selected = self._options[1]
        end
    else
        for k in pairs(self._selected) do
            local found = false
            for _, v in ipairs(self._options) do
                if v == k then found = true break end
            end
            if not found then self._selected[k] = nil end
        end
    end
    self:_updateSummary()
    self:_rebuildOptions()
    if self._open then
        local itemCount = #self._options
        local scrollHeight = math.clamp(itemCount * 28 + (itemCount - 1) * 2, 28, 140)
        self._scrollFrame.Size = UDim2.new(1, 0, 0, scrollHeight)
        local totalHeight = scrollHeight + 8 + (self._actionsBar and 26 or 0)
        self._listContainer.Size = UDim2.new(1, 0, 0, totalHeight)
    end
end

function Dropdown:_updateSummary()
    if self._isMulti then
        local activeList = {}
        for _, opt in ipairs(self._options) do
            if self._selected[opt] then
                table.insert(activeList, tostring(opt))
            end
        end
        if #activeList == 0 then
            self._selectionLabel.Text = "Select..."
            self._selectionLabel.TextColor3 = self._theme.TextSecondary
        elseif #activeList == 1 then
            self._selectionLabel.Text = activeList[1]
            self._selectionLabel.TextColor3 = self._theme.TextPrimary
        elseif #activeList == 2 then
            self._selectionLabel.Text = activeList[1] .. ", " .. activeList[2]
            self._selectionLabel.TextColor3 = self._theme.TextPrimary
        else
            self._selectionLabel.Text = tostring(#activeList) .. " Selected"
            self._selectionLabel.TextColor3 = self._theme.TextPrimary
        end
    else
        if self._selected ~= nil then
            self._selectionLabel.Text = tostring(self._selected)
            self._selectionLabel.TextColor3 = self._theme.TextPrimary
        else
            self._selectionLabel.Text = "Select..."
            self._selectionLabel.TextColor3 = self._theme.TextSecondary
        end
    end
end

function Dropdown:Destroy()
    if self._container then
        self._container:Destroy()
    end
end

return Dropdown

end

-- Module: src/components/DropdownGroup
_modules["src/components/DropdownGroup"] = function()
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

end

-- Module: src/components/Keybind
_modules["src/components/Keybind"] = function()
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
    label.Font = theme.FontBold
    label.TextSize = theme.FontSizeRegular
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = container
    
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
local TweenService = game:GetService("TweenService")

local Banner = {}
Banner.__index = Banner

local function resolveAsset(asset)
    if not asset or asset == "" then
        return "rbxassetid://97436813723523"
    end
    if typeof(asset) == "number" or tonumber(asset) then
        return "rbxassetid://" .. tostring(asset)
    end
    if string.find(asset, "rbxassetid://") or string.find(asset, "rbxasset://") or string.find(asset, "http://") or string.find(asset, "https://") then
        return asset
    end
    local okG, getAsset = pcall(function() return getcustomasset or getsynasset end)
    if okG and typeof(getAsset) == "function" then
        local pOk, res = pcall(getAsset, asset)
        if pOk and res then return res end
    end
    return asset
end

function Banner.new(parent, options, theme, cleanup)
    options = options or {}
    local title = options.Title or options.Name
    local showHeader = options.ShowHeader ~= false and (title ~= nil and title ~= "")
    local titleText = title or "LiyHub Announcement"
    local text = options.Text or options.Description or "Welcome to LiyHub v2.2 Pure B&W!"
    local image = options.Image or options.AssetId or theme.DefaultBanner or "rbxassetid://97436813723523"
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
    
    if theme.UseStrokes then
        local stroke = Instance.new("UIStroke")
        stroke.Name = "BorderStroke"
        stroke.Color = theme.Border
        stroke.Thickness = theme.StrokeThickness or 1
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Parent = container
    end
    
    local list = Instance.new("UIListLayout")
    list.SortOrder = Enum.SortOrder.LayoutOrder
    list.Padding = UDim.new(0, 0)
    list.Parent = container
    
    local header = nil
    local titleLabel = nil
    local arrow = nil
    
    if showHeader then
        header = Instance.new("TextButton")
        header.Name = "Header"
        header.Size = UDim2.new(1, 0, 0, 28)
        header.BackgroundTransparency = 1
        header.AutoButtonColor = false
        header.Text = ""
        header.Active = true
        header.Parent = container
        
        local hPad = Instance.new("UIPadding")
        hPad.PaddingLeft = UDim.new(0, 10)
        hPad.PaddingRight = UDim.new(0, 10)
        hPad.PaddingTop = UDim.new(0, 6)
        hPad.Parent = header
        
        titleLabel = Instance.new("TextLabel")
        titleLabel.Name = "Title"
        titleLabel.Size = UDim2.new(1, -24, 1, 0)
        titleLabel.BackgroundTransparency = 1
        titleLabel.Text = titleText
        titleLabel.TextColor3 = theme.TextPrimary
        titleLabel.Font = theme.FontBold
        titleLabel.TextSize = theme.FontSizeSection or 11
        titleLabel.TextXAlignment = Enum.TextXAlignment.Left
        titleLabel.Active = false
        titleLabel.Parent = header
        
        arrow = Instance.new("ImageLabel")
        arrow.Name = "Arrow"
        arrow.Size = UDim2.fromOffset(12, 12)
        arrow.Position = UDim2.new(1, -20, 0.5, -6)
        arrow.BackgroundTransparency = 1
        arrow.Image = "rbxassetid://10709790948"
        arrow.ImageColor3 = theme.TextMuted
        arrow.Rotation = defaultCollapsed and 0 or 180
        arrow.Active = false
        arrow.Parent = header
    end
    
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
    
    local imageFrame = Instance.new("Frame")
    imageFrame.Name = "ImageFrame"
    imageFrame.Size = UDim2.new(1, 0, 0, 140)
    imageFrame.BackgroundColor3 = theme.Header
    imageFrame.BorderSizePixel = 0
    imageFrame.ClipsDescendants = true
    imageFrame.Parent = contentBox
    
    local imgFrameCorner = Instance.new("UICorner")
    imgFrameCorner.CornerRadius = showHeader and theme.SmallCornerRadius or theme.CornerRadius
    imgFrameCorner.Parent = imageFrame
    
    local imageLabel = Instance.new("ImageLabel")
    imageLabel.Name = "BannerImage"
    imageLabel.Size = UDim2.new(1, 0, 1, 0)
    imageLabel.BackgroundTransparency = 1
    imageLabel.Image = resolveAsset(image)
    imageLabel.ScaleType = Enum.ScaleType.Crop
    imageLabel.BorderSizePixel = 0
    imageLabel.Parent = imageFrame
    
    local function updateBannerHeight()
        local width = imageFrame.AbsoluteSize.X
        if width > 40 then
            local targetH = math.clamp(math.floor(width / (2572 / 1012)), 60, 320)
            if math.abs(imageFrame.Size.Y.Offset - targetH) > 1 then
                imageFrame.Size = UDim2.new(1, 0, 0, targetH)
            end
        end
    end
    local absConn = imageFrame:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateBannerHeight)
    task.defer(updateBannerHeight)
    
    local textContainer = Instance.new("Frame")
    textContainer.Name = "TextContainer"
    textContainer.Size = UDim2.new(1, 0, 0, 0)
    textContainer.AutomaticSize = Enum.AutomaticSize.Y
    textContainer.BackgroundTransparency = 1
    textContainer.Parent = contentBox
    
    local tPad = Instance.new("UIPadding")
    tPad.PaddingLeft = UDim.new(0, 10)
    tPad.PaddingRight = UDim.new(0, 10)
    tPad.PaddingTop = UDim.new(0, 2)
    tPad.PaddingBottom = UDim.new(0, 8)
    tPad.Parent = textContainer
    
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
    descLabel.Active = false
    descLabel.Parent = textContainer
    
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
    
    if header then
        local lastToggle = 0
        local function doToggle()
            local now = os.clock()
            if now - lastToggle < 0.15 then return end
            lastToggle = now
            self:Toggle()
        end
        local toggleConn = header.Activated:Connect(doToggle)
        if cleanup then
            cleanup:Add(toggleConn)
        end
    end
    
    if cleanup then
        cleanup:Add(absConn)
        cleanup:Add(container)
    end
    
    return self
end

function Banner:Toggle()
    self._collapsed = not self._collapsed
    self._contentBox.Visible = not self._collapsed
    if self._arrow then
        TweenService:Create(self._arrow, TweenInfo.new(self._theme.AnimationFast or 0.15), {
            Rotation = self._collapsed and 0 or 180
        }):Play()
    end
end

function Banner:SetImage(assetId)
    self._imageLabel.Image = resolveAsset(assetId)
end

function Banner:SetText(text)
    self._descLabel.Text = text
end

function Banner:Destroy()
    if self._container then
        self._container:Destroy()
    end
end

return Banner

end

-- Module: src/components/Progression
_modules["src/components/Progression"] = function()
local TweenService = game:GetService("TweenService")

local Progression = {}
Progression.__index = Progression

local DEFAULT_STEP_ICONS = {
    [1] = "rbxassetid://6031075931",
    [2] = "rbxassetid://6031075929",
    [3] = "rbxassetid://6031094678",
    [4] = "rbxassetid://6031091004",
    [5] = "rbxassetid://6031075936",
}

function Progression.new(parent, options, theme, cleanup)
    options = options or {}
    local titleText = options.Title or options.Name or "Progression"
    local subtitleText = options.Subtitle or "Step workflow progression"
    local steps = options.Steps or {
        { Label = "Accept" },
        { Label = "Teleport" },
        { Label = "Farm" },
        { Label = "Boss" },
        { Label = "Reward" },
    }
    local initialStep = math.clamp(options.CurrentStep or options.Default or 1, 1, #steps)
    local onStepChanged = options.OnStepChanged or options.Callback or function() end
    
    local container = Instance.new("Frame")
    container.Name = "Progression_" .. titleText
    container.Size = UDim2.new(1, 0, 0, 0)
    container.AutomaticSize = Enum.AutomaticSize.Y
    container.BackgroundColor3 = theme.Card
    container.BorderSizePixel = 0
    container.ClipsDescendants = true
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
    padding.PaddingTop = UDim.new(0, 10)
    padding.PaddingBottom = UDim.new(0, 12)
    padding.PaddingLeft = UDim.new(0, 12)
    padding.PaddingRight = UDim.new(0, 12)
    padding.Parent = container
    
    local list = Instance.new("UIListLayout")
    list.SortOrder = Enum.SortOrder.LayoutOrder
    list.Padding = UDim.new(0, 8)
    list.Parent = container
    
    local headerFrame = Instance.new("Frame")
    headerFrame.Name = "Header"
    headerFrame.Size = UDim2.new(1, 0, 0, 32)
    headerFrame.BackgroundTransparency = 1
    headerFrame.Parent = container
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(1, 0, 0, 16)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = titleText
    titleLabel.TextColor3 = theme.TextPrimary
    titleLabel.Font = theme.FontBold
    titleLabel.TextSize = theme.FontSizeRegular
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Active = false
    titleLabel.Parent = headerFrame
    
    local subLabel = Instance.new("TextLabel")
    subLabel.Name = "Subtitle"
    subLabel.Size = UDim2.new(1, 0, 0, 14)
    subLabel.Position = UDim2.new(0, 0, 0, 17)
    subLabel.BackgroundTransparency = 1
    subLabel.Text = subtitleText
    subLabel.TextColor3 = theme.TextMuted
    subLabel.Font = theme.FontRegular
    subLabel.TextSize = theme.FontSizeSmall
    subLabel.TextXAlignment = Enum.TextXAlignment.Left
    subLabel.Active = false
    subLabel.Parent = headerFrame
    
    local stepperFrame = Instance.new("Frame")
    stepperFrame.Name = "Stepper"
    stepperFrame.Size = UDim2.new(1, 0, 0, 52)
    stepperFrame.BackgroundTransparency = 1
    stepperFrame.Parent = container
    
    local margin = 32
    local lineBg = Instance.new("Frame")
    lineBg.Name = "LineBg"
    lineBg.AnchorPoint = Vector2.new(0, 0.5)
    lineBg.Size = UDim2.new(1, -margin * 2, 0, 2)
    lineBg.Position = UDim2.new(0, margin, 0, 14)
    lineBg.BackgroundColor3 = theme.SliderTrack
    lineBg.BorderSizePixel = 0
    lineBg.ZIndex = 1
    lineBg.Parent = stepperFrame
    
    local stepNodes = {}
    local numSteps = #steps
    
    for i, stepData in ipairs(steps) do
        local t = numSteps > 1 and ((i - 1) / (numSteps - 1)) or 0.5
        local xOffset = math.floor((1 - 2 * t) * margin)
        
        local nodeBtn = Instance.new("TextButton")
        nodeBtn.Name = "Node_" .. tostring(i)
        nodeBtn.AnchorPoint = Vector2.new(0.5, 0.5)
        nodeBtn.Size = UDim2.new(0, 28, 0, 28)
        nodeBtn.Position = UDim2.new(t, xOffset, 0, 14)
        nodeBtn.BackgroundColor3 = (i == initialStep) and theme.AccentStep or theme.SliderTrack
        nodeBtn.AutoButtonColor = false
        nodeBtn.Text = ""
        nodeBtn.BorderSizePixel = 0
        nodeBtn.Active = true
        nodeBtn.ZIndex = 2
        nodeBtn.Parent = stepperFrame
        
        local nbCorner = Instance.new("UICorner")
        nbCorner.CornerRadius = UDim.new(1, 0)
        nbCorner.Parent = nodeBtn
        
        local icon = Instance.new("ImageLabel")
        icon.Name = "Icon"
        icon.Size = UDim2.new(0, 14, 0, 14)
        icon.Position = UDim2.new(0.5, -7, 0.5, -7)
        icon.BackgroundTransparency = 1
        icon.Image = stepData.Icon or DEFAULT_STEP_ICONS[i] or DEFAULT_STEP_ICONS[1]
        icon.ImageColor3 = (i == initialStep) and Color3.fromRGB(255, 255, 255) or theme.TextMuted
        icon.Active = false
        icon.ZIndex = 3
        icon.Parent = nodeBtn
        
        local stepLbl = Instance.new("TextLabel")
        stepLbl.Name = "Label"
        stepLbl.AnchorPoint = Vector2.new(0.5, 0)
        stepLbl.Size = UDim2.new(0, 60, 0, 14)
        stepLbl.Position = UDim2.new(t, xOffset, 0, 32)
        stepLbl.TextTruncate = Enum.TextTruncate.AtEnd
        stepLbl.BackgroundTransparency = 1
        stepLbl.Text = stepData.Label or ("Step " .. tostring(i))
        stepLbl.TextColor3 = (i == initialStep) and theme.AccentStep or theme.TextMuted
        stepLbl.Font = (i == initialStep) and theme.FontBold or theme.FontRegular
        stepLbl.TextSize = 10
        stepLbl.TextXAlignment = Enum.TextXAlignment.Center
        stepLbl.Active = false
        stepLbl.ZIndex = 2
        stepLbl.Parent = stepperFrame
        
        stepNodes[i] = {
            Button = nodeBtn,
            Icon = icon,
            Label = stepLbl,
        }
    end
    
    local self = setmetatable({
        _container = container,
        _stepNodes = stepNodes,
        _currentStep = initialStep,
        _steps = steps,
        _theme = theme,
        _callback = onStepChanged,
    }, Progression)
    
    local lastStep = 0
    for i, node in ipairs(stepNodes) do
        local function clickStep()
            local now = os.clock()
            if now - lastStep < 0.1 then return end
            lastStep = now
            self:SetStep(i)
        end
        local conn = node.Button.Activated:Connect(clickStep)
        if cleanup then
            cleanup:Add(conn)
        end
    end
    
    if cleanup then cleanup:Add(container) end
    return self
end

function Progression:SetStep(stepIndex)
    self._currentStep = math.clamp(stepIndex, 1, #self._steps)
    for i, node in ipairs(self._stepNodes) do
        local isActive = (i == self._currentStep)
        local targetColor = isActive and self._theme.AccentStep or self._theme.SliderTrack
        local targetIconColor = isActive and Color3.fromRGB(255, 255, 255) or self._theme.TextMuted
        local targetLabelColor = isActive and self._theme.AccentStep or self._theme.TextMuted
        
        TweenService:Create(node.Button, TweenInfo.new(self._theme.AnimationFast), {
            BackgroundColor3 = targetColor
        }):Play()
        node.Icon.ImageColor3 = targetIconColor
        node.Label.TextColor3 = targetLabelColor
        node.Label.Font = isActive and self._theme.FontBold or self._theme.FontRegular
    end
    task.spawn(self._callback, self._currentStep)
end

function Progression:GetStep()
    return self._currentStep
end

function Progression:Destroy()
    if self._container then
        self._container:Destroy()
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
    
    local SizeManager = deps.SizeManager
    if not SizeManager then
        local sOk, sRes = pcall(function() return require(script.Parent.Parent.size.SizeManager) end)
        SizeManager = sOk and sRes
    end
    
    local detectedDevice = SizeManager and SizeManager.DetectDevice() or "PC"
    local deviceName = options.Device or detectedDevice
    local sizePreset = SizeManager and SizeManager.GetPreset(deviceName) or {
        Name = "PC",
        Scale = 1.00,
        DefaultSize = UDim2.fromOffset(740, 490),
        MinSize = Vector2.new(480, 340),
        MaxSize = Vector2.new(1280, 840),
        SidebarWidth = 190,
        HeaderHeight = 48,
        ModalWidth = 340,
    }

    local titleText = options.Title or "LiyHub"
    local subtitleText = options.Subtitle or "v2.2 Black & White Edition"
    local defaultSize = options.Size
    if not defaultSize then
        defaultSize = sizePreset.DefaultSize
    elseif options.Device == nil and detectedDevice ~= "PC" then
        if defaultSize == UDim2.fromOffset(740, 490) or defaultSize == UDim2.new(0, 740, 0, 490) or defaultSize == UDim2.new(0, 680, 0, 460) then
            defaultSize = sizePreset.DefaultSize
        end
    end
    local toggleKey = options.ToggleKey or Enum.KeyCode.RightControl
    local enableMobilePin = options.MobilePin ~= false -- Default enabled
    local logoAsset = options.Logo or "rbxassetid://6031075936"
    local function resolveParentGui(customParent)
        if customParent then return customParent end
        local okH, h = pcall(function() return gethui and gethui() end)
        if okH and h then return h end
        local okCg, cg = pcall(function() return game:GetService("CoreGui") end)
        if okCg and cg then
            local test = Instance.new("Folder")
            local pOk = pcall(function()
                test.Parent = cg
                test:Destroy()
            end)
            if pOk then return cg end
        end
        local lp = Players.LocalPlayer
        if lp then
            local pg = lp:FindFirstChild("PlayerGui") or lp:WaitForChild("PlayerGui", 5)
            if pg then return pg end
        end
        return game:GetService("StarterGui")
    end

    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "LiyHubUI_" .. titleText
    screenGui.ResetOnSpawn = false
    screenGui.DisplayOrder = 2147483647
    screenGui.IgnoreGuiInset = true
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    if typeof(syn) == "table" and typeof(syn.protect_gui) == "function" then
        pcall(syn.protect_gui, screenGui)
    elseif typeof(protect_gui) == "function" then
        pcall(protect_gui, screenGui)
    elseif typeof(protectgui) == "function" then
        pcall(protectgui, screenGui)
    end
    screenGui.Parent = resolveParentGui(options.Parent)
    
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
    
    local windowScale = Instance.new("UIScale")
    windowScale.Name = "WindowScale"
    windowScale.Scale = sizePreset.Scale or 1.0
    windowScale.Parent = mainFrame

    local mainCorner = Instance.new("UICorner")
    mainCorner.CornerRadius = theme.WindowCornerRadius or theme.CornerRadius
    mainCorner.Parent = mainFrame
    
    if theme.UseStrokes then
        local mainStroke = Instance.new("UIStroke")
        mainStroke.Name = "WindowStroke"
        mainStroke.Color = theme.BorderWindow or Color3.fromRGB(42, 42, 50)
        mainStroke.Thickness = 1
        mainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        mainStroke.Parent = mainFrame
    end
    

    
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
    
    local logoImg = Instance.new("ImageLabel")
    logoImg.Name = "Logo"
    logoImg.Size = UDim2.new(0, 26, 0, 26)
    logoImg.Position = UDim2.new(0, 14, 0.5, -13)
    logoImg.BackgroundTransparency = 1
    logoImg.Image = logoAsset or theme.DefaultLogo or "rbxasset://textures/LiyhubLogo.png"
    logoImg.ScaleType = Enum.ScaleType.Fit
    logoImg.Parent = header
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(1, -130, 0, 18)
    titleLabel.Position = UDim2.new(0, 46, 0, 7)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = titleText
    titleLabel.TextColor3 = theme.TextPrimary
    titleLabel.Font = theme.FontTitle
    titleLabel.TextSize = theme.FontSizeTitle
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.TextTruncate = Enum.TextTruncate.AtEnd
    titleLabel.Parent = header
    
    local subLabel = Instance.new("TextLabel")
    subLabel.Name = "Subtitle"
    subLabel.Size = UDim2.new(1, -130, 0, 14)
    subLabel.Position = UDim2.new(0, 46, 0, 25)
    subLabel.BackgroundTransparency = 1
    subLabel.Text = subtitleText
    subLabel.TextColor3 = theme.TextMuted
    subLabel.Font = theme.FontRegular
    subLabel.TextSize = theme.FontSizeSubtitle
    subLabel.TextXAlignment = Enum.TextXAlignment.Left
    subLabel.TextTruncate = Enum.TextTruncate.AtEnd
    subLabel.Parent = header
    
    -- Header Controls: Minimize & Close
    local controlsFrame = Instance.new("Frame")
    controlsFrame.Name = "Controls"
    controlsFrame.Size = UDim2.new(0, 70, 0, 28)
    controlsFrame.Position = UDim2.new(1, -78, 0, 10)
    controlsFrame.BackgroundTransparency = 1
    controlsFrame.ZIndex = 20
    controlsFrame.Parent = mainFrame
    
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
    minBtn.ZIndex = 21
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
    closeBtn.ZIndex = 21
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
    
    if theme.UseStrokes then
        local profStroke = Instance.new("UIStroke")
        profStroke.Name = "ProfileStroke"
        profStroke.Color = theme.Border
        profStroke.Thickness = 1
        profStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        profStroke.Parent = profileCard
    end
    
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
    
    local resizeGrip = Instance.new("TextButton")
    resizeGrip.Name = "ResizeGrip"
    resizeGrip.Text = ""
    resizeGrip.AutoButtonColor = false
    resizeGrip.BackgroundTransparency = 1
    resizeGrip.Size = UDim2.fromOffset(24, 24)
    resizeGrip.AnchorPoint = Vector2.new(1, 1)
    resizeGrip.Position = UDim2.new(1, -2, 1, -2)
    resizeGrip.ZIndex = 50
    resizeGrip.Parent = mainFrame

    local gripIcon = Instance.new("ImageLabel")
    gripIcon.Name = "GripIcon"
    gripIcon.Size = UDim2.fromOffset(12, 12)
    gripIcon.AnchorPoint = Vector2.new(1, 1)
    gripIcon.Position = UDim2.new(1, -4, 1, -4)
    gripIcon.BackgroundTransparency = 1
    gripIcon.Image = "rbxassetid://10709791523"
    gripIcon.Rotation = 45
    gripIcon.ImageColor3 = Color3.fromRGB(140, 155, 180)
    gripIcon.ImageTransparency = 0.45
    gripIcon.ZIndex = 51
    gripIcon.Active = false
    gripIcon.Parent = resizeGrip
    
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
        _sizeManager = SizeManager,
        _sizePreset = sizePreset,
        _currentDevice = sizePreset.Name,
        _baseScale = sizePreset.Scale or 1.0,
        _uiScale = windowScale,
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
            local mousePos = input.Position
            local cPos = controlsFrame.AbsolutePosition
            local cSize = controlsFrame.AbsoluteSize
            if mousePos.X >= cPos.X and mousePos.X <= cPos.X + cSize.X and mousePos.Y >= cPos.Y and mousePos.Y <= cPos.Y + cSize.Y then
                return
            end
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
    
    local lastMin = 0
    local function doMin()
        local now = os.clock()
        if now - lastMin < 0.15 then return end
        lastMin = now
        self:ToggleMinimize()
    end
    local minClick = minBtn.Activated:Connect(doMin)
    
    local lastClose = 0
    local function doClose()
        local now = os.clock()
        if now - lastClose < 0.15 then return end
        lastClose = now
        self:ShowModal({
            Title = "Close " .. titleText .. "?",
            Message = "Are you sure you want to unload and close " .. titleText .. "?",
            ConfirmText = "Close UI",
            CancelText = "Cancel",
            OnConfirm = function()
                self:Destroy()
            end,
        })
    end
    local closeClick = closeBtn.Activated:Connect(doClose)
    
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
        self._mobilePin:SetVisible(false)
    end

    local isResizing = false
    local resizeStartMouse = Vector2.zero
    local resizeStartSize = Vector2.zero

    local gripEnter = resizeGrip.MouseEnter:Connect(function()
        TweenService:Create(gripIcon, TweenInfo.new(0.15), {
            ImageColor3 = Color3.fromRGB(255, 255, 255),
            ImageTransparency = 0
        }):Play()
    end)
    local gripLeave = resizeGrip.MouseLeave:Connect(function()
        if not isResizing then
            TweenService:Create(gripIcon, TweenInfo.new(0.15), {
                ImageColor3 = Color3.fromRGB(140, 155, 180),
                ImageTransparency = 0.45
            }):Play()
        end
    end)

    local resizeBegan = resizeGrip.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            isResizing = true
            resizeStartMouse = Vector2.new(input.Position.X, input.Position.Y)
            resizeStartSize = Vector2.new(mainFrame.AbsoluteSize.X, mainFrame.AbsoluteSize.Y)
            TweenService:Create(gripIcon, TweenInfo.new(0.1), {
                ImageColor3 = Color3.fromRGB(255, 255, 255),
                ImageTransparency = 0
            }):Play()

            local moveConn, endConn
            moveConn = UserInputService.InputChanged:Connect(function(moveInput)
                if not isResizing then return end
                if moveInput.UserInputType == Enum.UserInputType.MouseMovement or moveInput.UserInputType == Enum.UserInputType.Touch then
                    local activeScale = windowScale.Scale > 0 and windowScale.Scale or 1.0
                    local delta = (Vector2.new(moveInput.Position.X, moveInput.Position.Y) - resizeStartMouse) / activeScale
                    local curCam = workspace.CurrentCamera
                    local curVp = Vector2.new(1920, 1080)
                    if curCam and curCam.ViewportSize.X > 0 then
                        curVp = curCam.ViewportSize
                    end
                    local minW = sizePreset.MinSize and sizePreset.MinSize.X or 440
                    local minH = sizePreset.MinSize and sizePreset.MinSize.Y or 300
                    local maxW = math.max(curVp.X - 20, 600)
                    local maxH = math.max(curVp.Y - 20, 400)
                    local newW = math.clamp(math.floor(resizeStartSize.X + delta.X), minW, maxW)
                    local newH = math.clamp(math.floor(resizeStartSize.Y + delta.Y), minH, maxH)
                    mainFrame.Size = UDim2.fromOffset(newW, newH)
                    self._originalSize = mainFrame.Size
                end
            end)

            endConn = UserInputService.InputEnded:Connect(function(endInput)
                if endInput.UserInputType == Enum.UserInputType.MouseButton1 or endInput.UserInputType == Enum.UserInputType.Touch then
                    isResizing = false
                    if moveConn then moveConn:Disconnect() end
                    if endConn then endConn:Disconnect() end
                    TweenService:Create(gripIcon, TweenInfo.new(0.2), {
                        ImageColor3 = Color3.fromRGB(140, 155, 180),
                        ImageTransparency = 0.45
                    }):Play()
                end
            end)
        end
    end)

    if cleanup then
        cleanup:Add(gripEnter)
        cleanup:Add(gripLeave)
        cleanup:Add(resizeBegan)
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

    local function updateWindowScale()
        pcall(function()
            if not screenGui or not screenGui.Parent or not windowScale or not windowScale.Parent then return end
            local curCam = workspace.CurrentCamera
            local vp = curCam and curCam.ViewportSize
            if not vp or vp.X <= 0 or vp.Y <= 0 then
                local sz = screenGui.AbsoluteSize
                if sz and sz.X > 0 and sz.Y > 0 then
                    vp = sz
                end
            end
            if not vp or vp.X <= 0 or vp.Y <= 0 then return end
            local baseW = mainFrame.Size.X.Offset
            local baseH = mainFrame.Size.Y.Offset
            if baseW <= 0 or baseH <= 0 then return end
            local pad = (detectedDevice ~= "PC") and 24 or 32
            local scaleX = (vp.X - pad) / baseW
            local scaleY = (vp.Y - pad) / baseH
            local fitScale = math.min(scaleX, scaleY)
            local userScale = self._baseScale or sizePreset.Scale or 1.0
            if fitScale < 1.0 then
                windowScale.Scale = math.clamp(fitScale * userScale, 0.45, userScale)
            else
                windowScale.Scale = userScale
            end
        end)
    end
    updateWindowScale()
    local vpConn = workspace.CurrentCamera and workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(updateWindowScale)
    local guiConn = screenGui:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateWindowScale)
    if cleanup then
        if vpConn then cleanup:Add(vpConn) end
        cleanup:Add(guiConn)
    end

    self:_initUniversalTabs(options)
    
    return self
end

function Window:Minimize()
    self._minimized = true
    self._mainFrame.Visible = false
    if self._mobilePin then
        self._mobilePin:SetVisible(true)
        self._mobilePin:SetOpenState(false)
    end
end

function Window:Open()
    self._minimized = false
    self._mainFrame.Visible = true
    if self._mobilePin then
        self._mobilePin:SetVisible(false)
        self._mobilePin:SetOpenState(true)
    end
end

function Window:ToggleMinimize()
    if self._mainFrame.Visible then
        self:Minimize()
    else
        self:Open()
    end
end

function Window:Toggle()
    self:ToggleMinimize()
end

function Window:SetDevice(deviceType)
    if not self._sizeManager then return end
    local preset = self._sizeManager.GetPreset(deviceType)
    if not preset then return end
    self._sizePreset = preset
    self._currentDevice = preset.Name
    self._baseScale = preset.Scale
    self._uiScale.Scale = preset.Scale
    self._mainFrame.Size = preset.DefaultSize
    self._originalSize = preset.DefaultSize
    local sbW = preset.SidebarWidth or 190
    if self._sidebar then
        self._sidebar.Size = UDim2.new(0, sbW, 1, 0)
    end
    if self._contentArea then
        self._contentArea.Size = UDim2.new(1, -sbW, 1, 0)
        self._contentArea.Position = UDim2.new(0, sbW, 0, 0)
    end
end

function Window:SetScale(scaleFactor)
    local num = math.clamp(tonumber(scaleFactor) or 1.0, 0.5, 1.5)
    self._baseScale = num
    self._uiScale.Scale = num
end

function Window:SetSizePreset(presetName)
    local mult = self._sizeManager and self._sizeManager.GetScaleMultiplier(presetName) or 1.0
    self:SetScale(mult)
end

function Window:GetDevice()
    return self._currentDevice or "PC"
end

function Window:GetScale()
    return self._uiScale and self._uiScale.Scale or 1.0
end

function Window:GetUniversalGroup()
    return self._universalGroup
end

function Window:GetInformationTab()
    return self._infoTab
end

function Window:GetSettingsTab()
    return self._settingsTab
end

function Window:_initUniversalTabs(options)
    if options.UniversalGroup == false then return end

    local discordUrl = options.Discord or options.DiscordLink or "https://discord.gg/Nr56tQJeJh"
    local bannerImage = options.Banner or options.BannerImage or "rbxassetid://97436813723523"
    local bannerTitle = options.BannerTitle or "LiyHub Announcement"
    local bannerDesc = options.BannerDesc or "Universal high-performance script framework engineered by Than & aeris. Minimalist pure B&W design, vector typography, and native stealth architecture."

    local univGroup = self:CreateTabGroup("Universal")
    self._universalGroup = univGroup

    local infoTab = univGroup:CreateTab({
        Name = "Information",
        Icon = "rbxassetid://6031075931",
    })
    self._infoTab = infoTab

    infoTab:CreateBanner({
        Title = bannerTitle,
        Image = bannerImage,
        Description = bannerDesc,
    })

    local commSec = infoTab:CreateSection("Community & Support")
    commSec:CreateButton({
        Name = "Discord Community",
        Desc = discordUrl,
        ButtonText = "Copy Invite",
        Callback = function()
            pcall(function()
                if setclipboard then
                    setclipboard(discordUrl)
                elseif toclipboard then
                    toclipboard(discordUrl)
                end
            end)
            self:Notify({
                Title = "Success",
                Content = "Discord invite copied to clipboard!",
                Duration = 2.5,
            })
        end
    })

    local settingsTab = univGroup:CreateTab({
        Name = "Setting UI",
        Icon = "rbxassetid://6031075936",
    })
    self._settingsTab = settingsTab

    local cfgSec = settingsTab:CreateSection("Configurations")
    cfgSec:CreateInput({
        Name = "Profile Name",
        Placeholder = "Enter config name...",
        Default = "DefaultConfig",
        Callback = function(text) end
    })
    cfgSec:CreateDropdown({
        Name = "Select Saved Config",
        Options = { "Default", "Legit", "Rage", "Farming" },
        Default = "Default",
        Callback = function(val) end
    })
    cfgSec:CreateButtonGroup({
        Buttons = {
            {
                Name = "Save",
                Callback = function()
                    self:Notify({ Title = "Config Saved", Content = "Profile saved successfully.", Duration = 2 })
                end
            },
            {
                Name = "Load",
                Callback = function()
                    self:Notify({ Title = "Config Loaded", Content = "Configuration applied cleanly.", Duration = 2 })
                end
            },
            {
                Name = "Delete",
                Callback = function()
                    self:Notify({ Title = "Config Deleted", Content = "Configuration removed.", Duration = 2 })
                end
            }
        }
    })

    local devSec = settingsTab:CreateSection("Device Layout Presets")
    devSec:CreateButtonGroup({
        Buttons = {
            {
                Name = "PC Layout",
                Callback = function()
                    self:SetDevice("PC")
                    self:Notify({ Title = "Device Switch", Content = "Layout updated to PC (1.00x)", Duration = 2 })
                end
            },
            {
                Name = "Tablet Layout",
                Callback = function()
                    self:SetDevice("Tablet")
                    self:Notify({ Title = "Device Switch", Content = "Layout updated to Tablet (1.05x)", Duration = 2 })
                end
            },
            {
                Name = "Android Layout",
                Callback = function()
                    self:SetDevice("Android")
                    self:Notify({ Title = "Device Switch", Content = "Layout updated to Android (1.10x)", Duration = 2 })
                end
            }
        }
    })
    devSec:CreateSlider({
        Name = "UI Scale Multiplier",
        Min = 70,
        Max = 140,
        Default = 100,
        Unit = "%",
        Callback = function(val)
            self:SetScale(val / 100)
        end
    })

    local ifSec = settingsTab:CreateSection("Interface Management")
    ifSec:CreateKeybind({
        Name = "Menu Toggle Keybind",
        Default = Enum.KeyCode.RightControl,
        Callback = function(key)
            self:Notify({ Title = "Keybind Updated", Content = "Toggle key set to " .. tostring(key.Name), Duration = 2 })
        end
    })
    ifSec:CreateButton({
        Name = "Unload / Close Liyhub",
        Desc = "Unloads all GUI elements and terminates hooks.",
        ButtonText = "Unload",
        Callback = function()
            self:ShowModal({
                Title = "Unload Liyhub?",
                Message = "Are you sure you want to completely unload and destroy Liyhub?",
                ConfirmText = "Unload",
                CancelText = "Cancel",
                OnConfirm = function()
                    self:Destroy()
                end
            })
        end
    })

    self:_setActiveTab(infoTab)
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
    
    local gArrow = Instance.new("ImageLabel")
    gArrow.Name = "Arrow"
    gArrow.Size = UDim2.fromOffset(12, 12)
    gArrow.Position = UDim2.new(1, -16, 0.5, -6)
    gArrow.BackgroundTransparency = 1
    gArrow.Image = "rbxassetid://10709790948"
    gArrow.ImageColor3 = self._theme.TextMuted
    gArrow.Rotation = 180
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
    
    local lastGroupToggle = 0
    local function toggleGroup()
        local now = os.clock()
        if now - lastGroupToggle < 0.15 then return end
        lastGroupToggle = now
        tabGroupObj._collapsed = not tabGroupObj._collapsed
        tabsFrame.Visible = not tabGroupObj._collapsed
        TweenService:Create(gArrow, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Rotation = tabGroupObj._collapsed and 0 or 180
        }):Play()
    end
    local toggleClick = gHeader.Activated:Connect(toggleGroup)
    
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

function Window:CreateTab(options, icon)
    if not self._defaultTabGroup then
        self._defaultTabGroup = self:CreateTabGroup("Tabs")
    end
    if type(options) == "string" then
        options = { Name = options, Icon = icon }
    end
    return self._defaultTabGroup:CreateTab(options)
end
Window.AddTab = Window.CreateTab

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
    tabBtn.BackgroundColor3 = self._window._theme.SidebarItemActive
    tabBtn.BackgroundTransparency = 1
    tabBtn.AutoButtonColor = false
    tabBtn.Text = ""
    tabBtn.BorderSizePixel = 0
    tabBtn.Parent = self._tabsFrame
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = self._window._theme.SmallCornerRadius
    corner.Parent = tabBtn
    
    local activeBar = Instance.new("Frame")
    activeBar.Name = "ActiveBar"
    activeBar.Size = UDim2.new(0, 3, 0, 18)
    activeBar.Position = UDim2.new(0, 0, 0.5, -9)
    activeBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
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
    titleLabel.Font = self._window._theme.FontBold
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
    
    local lastTabSelect = 0
    local function selectTab()
        local now = os.clock()
        if now - lastTabSelect < 0.1 then return end
        lastTabSelect = now
        self._window:_setActiveTab(tabObj)
    end
    local btnClick = tabBtn.Activated:Connect(selectTab)
    
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
    self._button.BackgroundTransparency = 0
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
    self._button.BackgroundTransparency = 1
    self._titleLabel.TextColor3 = self._window._theme.TextSecondary
    self._titleLabel.Font = self._window._theme.FontBold
    self._activeBar.Visible = false
    if self._iconLabel then
        self._iconLabel.ImageColor3 = self._window._theme.TextSecondary
    end
    self._contentContainer.Visible = false
end

function Tab:CreateBanner(options)
    local parent = self._layoutEngine:GetSectionParent(options)
    local banner = self._window._components.Banner.new(
        parent,
        options,
        self._window._theme,
        self._window._cleanup
    )
    return banner
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
    
    if self._window._theme.UseStrokes then
        local secStroke = Instance.new("UIStroke")
        secStroke.Name = "SectionStroke"
        secStroke.Color = self._window._theme.Border
        secStroke.Thickness = 1
        secStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        secStroke.Parent = sectionCard
    end
    
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
    
    local sArrow = Instance.new("ImageLabel")
    sArrow.Name = "Arrow"
    sArrow.Size = UDim2.fromOffset(12, 12)
    sArrow.Position = UDim2.new(1, -16, 0.5, -6)
    sArrow.BackgroundTransparency = 1
    sArrow.Image = "rbxassetid://10709790948"
    sArrow.ImageColor3 = self._window._theme.TextSecondary
    sArrow.Rotation = 180
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
    
    local lastSecToggle = 0
    local function toggleSec()
        local now = os.clock()
        if now - lastSecToggle < 0.15 then return end
        lastSecToggle = now
        sectionObj._collapsed = not sectionObj._collapsed
        sBody.Visible = not sectionObj._collapsed
        TweenService:Create(sArrow, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Rotation = sectionObj._collapsed and 0 or 180
        }):Play()
    end
    local toggleConn = sHeader.Activated:Connect(toggleSec)
    
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

function Section:CreateMultiDropdown(options)
    options = options or {}
    options.Multi = true
    return self:CreateDropdown(options)
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

TabGroup.AddTab = TabGroup.CreateTab
Tab.AddSection = Tab.CreateSection
Tab.AddBanner = Tab.CreateBanner

Section.AddButton = Section.CreateButton
Section.AddButtonGroup = Section.CreateButtonGroup
Section.AddToggle = Section.CreateToggle
Section.AddToggleGroup = Section.CreateToggleGroup
Section.AddSlider = Section.CreateSlider
Section.AddSliderGroup = Section.CreateSliderGroup
Section.AddInput = Section.CreateInput
Section.AddInputGroup = Section.CreateInputGroup
Section.AddDropdown = Section.CreateDropdown
Section.AddDropdownGroup = Section.CreateDropdownGroup
Section.AddMultiDropdown = Section.CreateMultiDropdown
Section.AddKeybind = Section.CreateKeybind
Section.AddParagraph = Section.CreateParagraph
Section.AddDivider = Section.CreateDivider
Section.AddBanner = Section.CreateBanner
Section.AddProgression = Section.CreateProgression

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
local PC = _require("src/size/PC")
local Android = _require("src/size/Android")
local Tablet = _require("src/size/Tablet")
local SizeManager = _require("src/size/SizeManager")

local LiyHubUI = {
    Version = "2.2.0",
    Name = "LiyHub UI",
    _activeWindows = {},
    _themeManager = ThemeManager,
    _sizeManager = SizeManager,
    Sizes = {
        PC = PC,
        Android = Android,
        Tablet = Tablet,
    },
    _require = _require,
}

function LiyHubUI:CreateWindow(options)
    local hub = (type(self) == "table" and self._activeWindows and self) or LiyHubUI
    if type(self) == "table" and not self._activeWindows and options == nil then
        options = self
    end
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
        SizeManager = SizeManager,
    }
    
    local win = Window.new(options, deps)
    table.insert(hub._activeWindows, win)
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
