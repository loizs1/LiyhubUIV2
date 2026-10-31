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
_modules["src/themes/PureBlackWhite"] = function()
local PureBlackWhite = {
Name = "Pure Black & White",
IsDark = true,
IsLight = false,
DefaultLogo = "rbxassetid://126257104774952",
DefaultBanner = "rbxassetid://108339444679489",
FallbackLogo = "rbxassetid://126257104774952",
FallbackBanner = "rbxassetid://108339444679489",
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
_modules["src/themes/PureWhite"] = function()
local PureBlackWhite = nil
pcall(function()
PureBlackWhite = _require("src/themes/PureBlackWhite")
end)
if not PureBlackWhite then
pcall(function()
PureBlackWhite = require(script.Parent.PureBlackWhite)
end)
end
local PureWhite = table.clone(PureBlackWhite or {})
PureWhite.Name = "Pure White"
PureWhite.IsDark = false
PureWhite.IsLight = true
PureWhite.Background = Color3.fromRGB(244, 245, 248)
PureWhite.Header = Color3.fromRGB(255, 255, 255)
PureWhite.Sidebar = Color3.fromRGB(238, 240, 244)
PureWhite.SidebarItem = Color3.fromRGB(228, 231, 237)
PureWhite.SidebarItemActive = Color3.fromRGB(255, 255, 255)
PureWhite.SectionHeader = Color3.fromRGB(255, 255, 255)
PureWhite.Card = Color3.fromRGB(255, 255, 255)
PureWhite.CardHover = Color3.fromRGB(248, 249, 252)
PureWhite.Element = Color3.fromRGB(236, 238, 243)
PureWhite.ElementHover = Color3.fromRGB(226, 229, 236)
PureWhite.ElementActive = Color3.fromRGB(216, 220, 228)
PureWhite.Scrollbar = Color3.fromRGB(195, 200, 210)
PureWhite.Border = Color3.fromRGB(218, 222, 230)
PureWhite.BorderSubtle = Color3.fromRGB(228, 231, 238)
PureWhite.BorderFocus = Color3.fromRGB(140, 145, 160)
PureWhite.BorderWindow = Color3.fromRGB(210, 215, 224)
PureWhite.TextPrimary = Color3.fromRGB(18, 20, 24)
PureWhite.TextSecondary = Color3.fromRGB(80, 85, 96)
PureWhite.TextMuted = Color3.fromRGB(130, 136, 148)
PureWhite.TextDisabled = Color3.fromRGB(180, 185, 195)
PureWhite.Accent = Color3.fromRGB(20, 22, 26)
PureWhite.AccentStep = Color3.fromRGB(0, 130, 220)
PureWhite.AccentStepInactive = Color3.fromRGB(215, 220, 228)
PureWhite.ToggleActive = Color3.fromRGB(20, 22, 26)
PureWhite.ToggleInactive = Color3.fromRGB(215, 218, 225)
PureWhite.ToggleBorderInactive = Color3.fromRGB(190, 195, 205)
PureWhite.SliderTrack = Color3.fromRGB(220, 224, 232)
PureWhite.SliderFill = Color3.fromRGB(20, 22, 26)
PureWhite.Button = Color3.fromRGB(236, 238, 243)
PureWhite.ButtonText = Color3.fromRGB(18, 20, 24)
PureWhite.ButtonHover = Color3.fromRGB(226, 229, 236)
PureWhite.ButtonActive = Color3.fromRGB(216, 220, 228)
PureWhite.ButtonSecondary = Color3.fromRGB(236, 238, 243)
PureWhite.ButtonSecondaryText = Color3.fromRGB(18, 20, 24)
PureWhite.ButtonSecondaryHover = Color3.fromRGB(226, 229, 236)
return PureWhite
end
_modules["src/themes/ThemeManager"] = function()
local PureBlackWhite = nil
pcall(function()
PureBlackWhite = _require("src/themes/PureBlackWhite")
end)
if not PureBlackWhite then
pcall(function()
PureBlackWhite = require(script.Parent.PureBlackWhite)
end)
end
local PureWhite = nil
pcall(function()
PureWhite = _require("src/themes/PureWhite")
end)
if not PureWhite then
pcall(function()
PureWhite = require(script.Parent.PureWhite)
end)
end
local ThemeManager = {
CurrentTheme = PureBlackWhite,
Themes = {
["Pure Black & White"] = PureBlackWhite,
["Default"] = PureBlackWhite,
["Dark"] = PureBlackWhite,
["Pure White"] = PureWhite,
["Light"] = PureWhite,
["White"] = PureWhite,
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
_modules["src/core/Signals"] = function()
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
_modules["src/core/Cleanup"] = function()
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
_modules["src/core/Tween"] = function()
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
_modules["src/core/Layout"] = function()
local Layout = {}
Layout.__index = Layout
function Layout.new(container, options)
options = options or {}
local initialTwoColumns = options.TwoColumns
if initialTwoColumns == nil then
initialTwoColumns = true
end
local self = setmetatable({
_container = container,
_twoColumns = initialTwoColumns,
_dualContainer = nil,
_leftColumn = nil,
_rightColumn = nil,
_singleColumn = nil,
_sections = {},
_sectionCount = 0,
_cardMeta = {},
}, Layout)
self:_initialize()
return self
end
function Layout:_initialize()
local dualContainer = Instance.new("Frame")
dualContainer.Name = "DualColumnContainer"
dualContainer.BackgroundTransparency = 1
dualContainer.Size = UDim2.new(1, 0, 1, 0)
dualContainer.Visible = self._twoColumns
dualContainer.Parent = self._container
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
leftCol.Parent = dualContainer
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
rightCol.Parent = dualContainer
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
local singleCol = Instance.new("ScrollingFrame")
singleCol.Name = "SingleColumn"
singleCol.BackgroundTransparency = 1
singleCol.BorderSizePixel = 0
singleCol.Size = UDim2.new(1, 0, 1, 0)
singleCol.ScrollBarThickness = 3
singleCol.ScrollBarImageColor3 = Color3.fromRGB(50, 50, 60)
singleCol.AutomaticCanvasSize = Enum.AutomaticSize.Y
singleCol.CanvasSize = UDim2.new(0, 0, 0, 0)
singleCol.Visible = not self._twoColumns
singleCol.Parent = self._container
local singleList = Instance.new("UIListLayout")
singleList.SortOrder = Enum.SortOrder.LayoutOrder
singleList.Padding = UDim.new(0, 8)
singleList.Parent = singleCol
local singlePadding = Instance.new("UIPadding")
singlePadding.PaddingTop = UDim.new(0, 4)
singlePadding.PaddingBottom = UDim.new(0, 10)
singlePadding.PaddingLeft = UDim.new(0, 2)
singlePadding.PaddingRight = UDim.new(0, 6)
singlePadding.Parent = singleCol
self._dualContainer = dualContainer
self._leftColumn = leftCol
self._rightColumn = rightCol
self._singleColumn = singleCol
end
function Layout:GetSectionParent(sectionOptions)
self._sectionCount = self._sectionCount + 1
local order = self._sectionCount
local side = nil
if sectionOptions and sectionOptions.Side then
side = sectionOptions.Side
end
if not side then
side = (order % 2 == 1) and "Left" or "Right"
end
local targetParent = nil
if self._twoColumns then
targetParent = (string.lower(side) == "right") and self._rightColumn or self._leftColumn
else
targetParent = self._singleColumn
end
local sectionEntry = {
Side = side,
Order = order,
SectionCard = nil,
}
table.insert(self._sections, sectionEntry)
return targetParent
end
function Layout:RegisterSectionInstance(sectionCard)
for _, sec in ipairs(self._sections) do
if sec.SectionCard == nil then
sec.SectionCard = sectionCard
local side = sec.Side or "Left"
self._cardMeta[sectionCard] = { Side = side, Order = sec.Order or 1 }
sectionCard.LayoutOrder = sec.Order or 1
break
end
end
end
function Layout:SetTwoColumns(enabled)
if self._twoColumns == enabled then return end
self._twoColumns = enabled
local allCards = {}
local seen = {}
local function collectFrom(container)
if not container then return end
for _, child in ipairs(container:GetChildren()) do
if child:IsA("GuiObject") and not child:IsA("UIListLayout") and not child:IsA("UIPadding") then
if not seen[child] then
seen[child] = true
table.insert(allCards, child)
end
end
end
end
collectFrom(self._leftColumn)
collectFrom(self._rightColumn)
collectFrom(self._singleColumn)
table.sort(allCards, function(a, b)
local metaA = self._cardMeta[a]
local metaB = self._cardMeta[b]
local ordA = metaA and metaA.Order or a.LayoutOrder or 0
local ordB = metaB and metaB.Order or b.LayoutOrder or 0
return ordA < ordB
end)
if enabled then
for _, card in ipairs(allCards) do
local meta = self._cardMeta[card]
local side = meta and meta.Side or "Left"
if string.lower(side) == "right" then
card.Parent = self._rightColumn
else
card.Parent = self._leftColumn
end
end
self._dualContainer.Visible = true
self._singleColumn.Visible = false
if self._leftColumn then
self._leftColumn.CanvasPosition = Vector2.new(0, 0)
end
if self._rightColumn then
self._rightColumn.CanvasPosition = Vector2.new(0, 0)
end
else
for _, card in ipairs(allCards) do
card.Parent = self._singleColumn
end
self._dualContainer.Visible = false
self._singleColumn.Visible = true
if self._singleColumn then
self._singleColumn.CanvasPosition = Vector2.new(0, 0)
end
end
end
function Layout:IsTwoColumns()
return self._twoColumns
end
function Layout:UpdateForDevice(deviceName, isMinimized, forceOverride)
if forceOverride ~= nil then
self:SetTwoColumns(forceOverride)
return
end
local dev = string.lower(deviceName or "pc")
if dev == "pc" or dev == "tablet" then
self:SetTwoColumns(true)
elseif dev == "android" then
if isMinimized then
self:SetTwoColumns(true)
else
self:SetTwoColumns(false)
end
end
end
return Layout
end
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
if uiScaleVal and uiScaleVal ~= 1 then
local oScale = Instance.new("UIScale")
oScale.Scale = uiScaleVal
oScale.Parent = dialog
end
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
local isDark = (theme.IsLight ~= true and theme.Name ~= "Pure White")
local cancelBtn = Instance.new("TextButton")
cancelBtn.Name = "CancelButton"
cancelBtn.Size = UDim2.new(0, 90, 1, 0)
cancelBtn.BackgroundColor3 = isDark and theme.Element or Color3.fromRGB(236, 238, 243)
cancelBtn.AutoButtonColor = false
cancelBtn.Text = cancelText
cancelBtn.TextColor3 = isDark and theme.TextSecondary or Color3.fromRGB(18, 20, 24)
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
confirmBtn.BackgroundColor3 = isDark and theme.ElementActive or Color3.fromRGB(18, 20, 24)
confirmBtn.AutoButtonColor = false
confirmBtn.Text = confirmText
confirmBtn.TextColor3 = isDark and theme.TextPrimary or Color3.fromRGB(255, 255, 255)
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
local initialPos = options.Position or UDim2.new(0.5, -70, 0, 14)
local userText = options.User or ""
local isDark = (theme.IsLight ~= true and theme.Name ~= "Pure White")
local container = Instance.new("TextButton")
container.Name = "LiyHub_MobilePin"
container.Size = UDim2.new(0, 0, 0, 32)
container.AutomaticSize = Enum.AutomaticSize.X
container.Position = initialPos
container.BackgroundColor3 = isDark and Color3.fromRGB(16, 17, 20) or Color3.fromRGB(255, 255, 255)
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
local sizeConstraint = Instance.new("UISizeConstraint")
sizeConstraint.MinSize = Vector2.new(110, 32)
sizeConstraint.MaxSize = Vector2.new(240, 36)
sizeConstraint.Parent = container
local pinScale = Instance.new("UIScale")
pinScale.Name = "PinScale"
pinScale.Scale = 1.0
pinScale.Parent = container
local stroke = Instance.new("UIStroke")
stroke.Name = "BorderStroke"
stroke.Color = isDark and Color3.fromRGB(36, 38, 46) or Color3.fromRGB(220, 224, 232)
stroke.Thickness = 1
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
stroke.Parent = container
local iconImg = Instance.new("ImageLabel")
iconImg.Name = "Logo"
iconImg.Size = UDim2.fromOffset(20, 20)
iconImg.Position = UDim2.new(0, 6, 0.5, -10)
iconImg.BackgroundTransparency = 1
iconImg.Image = options.Logo or theme.DefaultLogo or "rbxassetid://126257104774952"
iconImg.ScaleType = Enum.ScaleType.Fit
iconImg.BorderSizePixel = 0
iconImg.Active = false
iconImg.ZIndex = 1000001
iconImg.Parent = container
local iconCorner = Instance.new("UICorner")
iconCorner.CornerRadius = UDim.new(0, 5)
iconCorner.Parent = iconImg
local logoStroke = Instance.new("UIStroke")
logoStroke.Name = "LogoStroke"
logoStroke.Color = isDark and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(18, 20, 24)
logoStroke.Thickness = 1
logoStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
logoStroke.Parent = iconImg
local textContainer = Instance.new("Frame")
textContainer.Name = "TextContainer"
textContainer.Size = UDim2.new(0, 0, 1, 0)
textContainer.AutomaticSize = Enum.AutomaticSize.X
textContainer.Position = UDim2.new(0, 32, 0, 0)
textContainer.BackgroundTransparency = 1
textContainer.Parent = container
local pad = Instance.new("UIPadding")
pad.PaddingRight = UDim.new(0, 12)
pad.Parent = textContainer
local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "Title"
titleLabel.Size = UDim2.new(0, 0, 0, 15)
titleLabel.AutomaticSize = Enum.AutomaticSize.X
titleLabel.Position = UDim2.new(0, 0, 0, 2)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = titleText
titleLabel.TextColor3 = isDark and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(18, 20, 24)
titleLabel.Font = theme.FontBold
titleLabel.TextSize = 11
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Active = false
titleLabel.ZIndex = 1000001
titleLabel.Parent = textContainer
local subLabel = Instance.new("TextLabel")
subLabel.Name = "Subtitle"
subLabel.Size = UDim2.new(0, 0, 0, 12)
subLabel.AutomaticSize = Enum.AutomaticSize.X
subLabel.Position = UDim2.new(0, 0, 0, 16)
subLabel.BackgroundTransparency = 1
subLabel.Text = closeSubText
subLabel.TextColor3 = isDark and Color3.fromRGB(130, 140, 160) or Color3.fromRGB(130, 136, 148)
subLabel.Font = theme.FontRegular
subLabel.TextSize = 9
subLabel.TextXAlignment = Enum.TextXAlignment.Left
subLabel.Active = false
subLabel.ZIndex = 1000001
subLabel.Parent = textContainer
local self = setmetatable({
_container = container,
_window = window,
_titleLabel = titleLabel,
_subLabel = subLabel,
_pinScale = pinScale,
_openText = openSubText,
_closeText = closeSubText,
_userText = userText,
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
self._downConn = downConn
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
self._moveConn = moveConn
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
self._upConn = upConn
if cleanup then
cleanup:Add(downConn)
cleanup:Add(moveConn)
cleanup:Add(upConn)
cleanup:Add(container)
end
return self
end
function MobilePin:SetTheme(targetTheme, isDark)
self._theme = targetTheme
if self._container then
self._container.BackgroundColor3 = isDark and Color3.fromRGB(16, 17, 20) or Color3.fromRGB(255, 255, 255)
local stroke = self._container:FindFirstChildOfClass("UIStroke")
if stroke then
stroke.Color = isDark and Color3.fromRGB(36, 38, 46) or Color3.fromRGB(220, 224, 232)
end
local logo = self._container:FindFirstChild("Logo")
local lStroke = logo and logo:FindFirstChildOfClass("UIStroke")
if lStroke then
lStroke.Color = isDark and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(18, 20, 24)
end
end
if self._titleLabel then
self._titleLabel.TextColor3 = isDark and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(18, 20, 24)
end
if self._subLabel then
self._subLabel.TextColor3 = isDark and Color3.fromRGB(130, 140, 160) or Color3.fromRGB(130, 136, 148)
end
end
function MobilePin:SetVisible(visible)
self._container.Visible = visible == true
end
function MobilePin:SetUserText(userText)
self._userText = userText or ""
self:SetOpenState(not self._container.Visible)
end
function MobilePin:SetScale(scaleFactor)
local s = tonumber(scaleFactor) or 1.0
if self._pinScale then
self._pinScale.Scale = math.clamp(s, 0.7, 1.5)
end
end
function MobilePin:SetOpenState(isOpen)
if isOpen then
self._subLabel.Text = self._closeText
else
if self._userText and self._userText ~= "" then
self._subLabel.Text = self._userText .. " | " .. self._openText
else
self._subLabel.Text = self._openText
end
end
end
function MobilePin:Destroy()
if self._downConn then
pcall(function() self._downConn:Disconnect() end)
self._downConn = nil
end
if self._moveConn then
pcall(function() self._moveConn:Disconnect() end)
self._moveConn = nil
end
if self._upConn then
pcall(function() self._upConn:Disconnect() end)
self._upConn = nil
end
if self._container then
self._container:Destroy()
self._container = nil
end
end
return MobilePin
end
_modules["src/components/Button"] = function()
local TweenService = game:GetService("TweenService")
local Button = {}
Button.__index = Button
function Button.new(parent, options, theme, cleanup)
local self
options = options or {}
local isActionRow = (options.ButtonText ~= nil) or (options.Description ~= nil and options.Title ~= nil)
local callback = options.Callback or options.OnClick or function() end
local isDark = (theme.IsLight ~= true and theme.Name ~= "Pure White")
local defaultBg = isDark and Color3.fromRGB(22, 22, 27) or Color3.fromRGB(236, 238, 243)
local defaultHover = isDark and Color3.fromRGB(30, 30, 38) or Color3.fromRGB(224, 226, 234)
local defaultActive = isDark and Color3.fromRGB(38, 38, 48) or Color3.fromRGB(212, 215, 224)
local defaultTextCol = isDark and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(18, 20, 24)
local defaultBorderCol = isDark and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(18, 20, 24)
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
actionBtn.BackgroundColor3 = defaultBg
actionBtn.AutoButtonColor = false
actionBtn.Text = btnText
actionBtn.TextColor3 = defaultTextCol
actionBtn.Font = theme.FontBold
actionBtn.TextSize = theme.FontSizeSmall
actionBtn.BorderSizePixel = 0
actionBtn.Active = true
actionBtn.ZIndex = 5
actionBtn.Parent = rowContainer
local abCorner = Instance.new("UICorner")
abCorner.CornerRadius = theme.SmallCornerRadius or UDim.new(0, 4)
abCorner.Parent = actionBtn
local abStroke = Instance.new("UIStroke")
abStroke.Name = "ButtonStroke"
abStroke.Color = defaultBorderCol
abStroke.Thickness = 1
abStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
abStroke.Parent = actionBtn
local lastTrigger = 0
local function trigger()
local now = os.clock()
if now - lastTrigger < 0.12 then return end
lastTrigger = now
task.spawn(callback)
end
local clickConn = actionBtn.Activated:Connect(trigger)
local hConn = actionBtn.MouseEnter:Connect(function()
local curDark = (self and self._theme and (self._theme.IsLight ~= true and self._theme.Name ~= "Pure White"))
if curDark == nil then curDark = isDark end
local curHov = curDark and Color3.fromRGB(30, 30, 38) or Color3.fromRGB(224, 226, 234)
local anim = (self and self._theme and self._theme.AnimationFast) or theme.AnimationFast
TweenService:Create(actionBtn, TweenInfo.new(anim), { BackgroundColor3 = curHov }):Play()
end)
local lConn = actionBtn.MouseLeave:Connect(function()
local curDark = (self and self._theme and (self._theme.IsLight ~= true and self._theme.Name ~= "Pure White"))
if curDark == nil then curDark = isDark end
local curBg = curDark and Color3.fromRGB(22, 22, 27) or Color3.fromRGB(236, 238, 243)
local anim = (self and self._theme and self._theme.AnimationFast) or theme.AnimationFast
TweenService:Create(actionBtn, TweenInfo.new(anim), { BackgroundColor3 = curBg }):Play()
end)
if cleanup then
cleanup:Add(clickConn)
cleanup:Add(hConn)
cleanup:Add(lConn)
cleanup:Add(rowContainer)
end
self = setmetatable({
_container = rowContainer,
_actionBtn = actionBtn,
_actionStroke = abStroke,
_theme = theme,
_callback = callback,
_conns = { clickConn, hConn, lConn },
}, Button)
return self
end
local text = options.Text or options.Name or "Button"
local container = Instance.new("TextButton")
container.Name = "Button_" .. text
container.Size = UDim2.new(1, 0, 0, theme.SmallElementHeight or 32)
container.BackgroundColor3 = defaultBg
container.AutoButtonColor = false
container.Text = ""
container.BorderSizePixel = 0
container.Active = true
container.Parent = parent
local corner = Instance.new("UICorner")
corner.CornerRadius = theme.SmallCornerRadius or UDim.new(0, 5)
corner.Parent = container
local stroke = Instance.new("UIStroke")
stroke.Name = "ButtonStroke"
stroke.Color = defaultBorderCol
stroke.Thickness = 1
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
stroke.Parent = container
local label = Instance.new("TextLabel")
label.Name = "Label"
label.Size = UDim2.new(1, -16, 1, 0)
label.Position = UDim2.new(0, 8, 0, 0)
label.BackgroundTransparency = 1
label.Text = text
label.TextColor3 = defaultTextCol
label.Font = theme.FontBold
label.TextSize = theme.FontSizeRegular
label.TextXAlignment = Enum.TextXAlignment.Center
label.Active = false
label.Parent = container
self = setmetatable({
_container = container,
_label = label,
_stroke = stroke,
_theme = theme,
_callback = callback,
_disabled = false,
_conns = {},
}, Button)
local hoverConn = container.MouseEnter:Connect(function()
if self._disabled then return end
local curDark = (self._theme.IsLight ~= true and self._theme.Name ~= "Pure White")
local curHover = curDark and Color3.fromRGB(30, 30, 38) or Color3.fromRGB(224, 226, 234)
TweenService:Create(container, TweenInfo.new(self._theme.AnimationFast), { BackgroundColor3 = curHover }):Play()
end)
local leaveConn = container.MouseLeave:Connect(function()
if self._disabled then return end
local curDark = (self._theme.IsLight ~= true and self._theme.Name ~= "Pure White")
local curBg = curDark and Color3.fromRGB(22, 22, 27) or Color3.fromRGB(236, 238, 243)
TweenService:Create(container, TweenInfo.new(self._theme.AnimationFast), { BackgroundColor3 = curBg }):Play()
end)
local downConn = container.MouseButton1Down:Connect(function()
if self._disabled then return end
local curDark = (self._theme.IsLight ~= true and self._theme.Name ~= "Pure White")
local curActive = curDark and Color3.fromRGB(38, 38, 48) or Color3.fromRGB(212, 215, 224)
TweenService:Create(container, TweenInfo.new(self._theme.AnimationFast), { BackgroundColor3 = curActive }):Play()
end)
local upConn = container.MouseButton1Up:Connect(function()
if self._disabled then return end
local curDark = (self._theme.IsLight ~= true and self._theme.Name ~= "Pure White")
local curHover = curDark and Color3.fromRGB(30, 30, 38) or Color3.fromRGB(224, 226, 234)
TweenService:Create(container, TweenInfo.new(self._theme.AnimationFast), { BackgroundColor3 = curHover }):Play()
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
self._conns = { hoverConn, leaveConn, downConn, upConn, clickConn }
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
self._label.TextColor3 = self._disabled and self._theme.TextDisabled or (self._theme.IsLight and Color3.fromRGB(18, 20, 24) or Color3.fromRGB(255, 255, 255))
end
end
function Button:Destroy()
if self._conns then
for _, c in ipairs(self._conns) do
if c and c.Connected then c:Disconnect() end
end
self._conns = {}
end
if self._container then
self._container:Destroy()
self._container = nil
end
end
return Button
end
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
options = options or {}
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
_clickConn = nil,
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
self._clickConn = clickConn
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
if self._clickConn and self._clickConn.Connected then
self._clickConn:Disconnect()
self._clickConn = nil
end
if self._container then
self._container:Destroy()
self._container = nil
end
end
return Toggle
end
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
_modules["src/components/Slider"] = function()
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Slider = {}
Slider.__index = Slider
local function formatValue(val, step, suffix, decimals)
local dec = decimals
if not dec then
local stepStr = tostring(step)
local dot = string.find(stepStr, "%.")
if dot then
dec = #stepStr - dot
else
dec = 0
end
end
local formatted = (dec > 0) and string.format("%." .. dec .. "f", val) or tostring(math.floor(val + 0.5))
local sfx = suffix or ""
if sfx ~= "" and string.sub(sfx, 1, 1) ~= "%" and string.sub(sfx, 1, 1) ~= " " then
sfx = " " .. sfx
end
return formatted .. sfx
end
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
local suffix = options.Suffix or options.Unit or ""
local decimals = options.Decimals
local callback = options.Callback or options.OnChange or function() end
local customGradient = options.Gradient
local container = Instance.new("Frame")
container.Name = "Slider_" .. text
container.Size = UDim2.new(1, 0, 0, 56)
container.BackgroundColor3 = theme.Element
container.BorderSizePixel = 0
container.ClipsDescendants = false
container.Parent = parent
local corner = Instance.new("UICorner")
corner.CornerRadius = theme.SmallCornerRadius or UDim.new(0, 6)
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
label.Size = UDim2.new(1, -20, 0, 16)
label.Position = UDim2.new(0, 10, 0, 5)
label.BackgroundTransparency = 1
label.Text = text
label.TextColor3 = theme.TextPrimary
label.Font = theme.FontBold
label.TextSize = theme.FontSizeSmall or 12
label.TextXAlignment = Enum.TextXAlignment.Left
label.Parent = container
local track = Instance.new("TextButton")
track.Name = "Track"
track.Size = UDim2.new(1, -20, 0, 24)
track.Position = UDim2.new(0, 10, 0, 25)
track.BackgroundColor3 = Color3.fromRGB(20, 22, 30)
track.AutoButtonColor = false
track.Text = ""
track.BorderSizePixel = 0
track.ClipsDescendants = true
track.Parent = container
local trackCorner = Instance.new("UICorner")
trackCorner.CornerRadius = UDim.new(0, 6)
trackCorner.Parent = track
local trackStroke = Instance.new("UIStroke")
trackStroke.Name = "TrackStroke"
trackStroke.Color = Color3.fromRGB(36, 40, 56)
trackStroke.Thickness = 1
trackStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
trackStroke.Parent = track
local fill = Instance.new("Frame")
fill.Name = "Fill"
fill.Size = UDim2.new(0, 0, 1, 0)
fill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
fill.BorderSizePixel = 0
fill.ZIndex = 2
fill.Parent = track
local fillCorner = Instance.new("UICorner")
fillCorner.CornerRadius = UDim.new(0, 6)
fillCorner.Parent = fill
local fillGrad = Instance.new("UIGradient")
fillGrad.Name = "FillGradient"
fillGrad.Color = customGradient or ColorSequence.new({
ColorSequenceKeypoint.new(0, Color3.fromRGB(215, 220, 235)),
ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255)),
})
fillGrad.Parent = fill
local initRel = math.clamp((defaultVal - minVal) / (maxVal - minVal), 0, 1)
local valueLabel = Instance.new("TextLabel")
valueLabel.Name = "ValueLabel"
valueLabel.Size = UDim2.new(0, 100, 1, 0)
valueLabel.Position = UDim2.new(1, -12, 0.5, 0)
valueLabel.AnchorPoint = Vector2.new(1, 0.5)
valueLabel.BackgroundTransparency = 1
valueLabel.Text = formatValue(defaultVal, stepVal, suffix, decimals)
valueLabel.TextColor3 = (initRel > 0.72) and Color3.fromRGB(16, 17, 24) or Color3.fromRGB(240, 245, 255)
valueLabel.Font = theme.FontBold
valueLabel.TextSize = 12
valueLabel.TextXAlignment = Enum.TextXAlignment.Right
valueLabel.ZIndex = 10
valueLabel.Parent = track
local self = setmetatable({
_container = container,
_label = label,
_valueLabel = valueLabel,
_track = track,
_fill = fill,
_theme = theme,
_min = minVal,
_max = maxVal,
_step = stepVal,
_suffix = suffix,
_decimals = decimals,
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
valueLabel.Text = formatValue(quantized, self._step, self._suffix, self._decimals)
valueLabel.TextColor3 = (finalRel > 0.72) and Color3.fromRGB(16, 17, 24) or Color3.fromRGB(240, 245, 255)
task.spawn(self._callback, quantized)
end
fill.Size = UDim2.new(initRel, 0, 1, 0)
local trackDown = track.MouseButton1Down:Connect(function()
if self._disabled then return end
self._dragging = true
local mousePos = UserInputService:GetMouseLocation()
updateFromInput(mousePos.X)
end)
self._trackDown = trackDown
local moveConn = UserInputService.InputChanged:Connect(function(input)
if self._dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
updateFromInput(input.Position.X)
end
end)
self._moveConn = moveConn
local upConn = UserInputService.InputEnded:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
if self._dragging then
self._dragging = false
end
end
end)
self._upConn = upConn
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
self._valueLabel.Text = formatValue(val, self._step, self._suffix, self._decimals)
self._valueLabel.TextColor3 = (rel > 0.72) and Color3.fromRGB(16, 17, 24) or Color3.fromRGB(240, 245, 255)
task.spawn(self._callback, val)
end
function Slider:GetValue()
return self._value
end
function Slider:Destroy()
if self._trackDown then
pcall(function() self._trackDown:Disconnect() end)
self._trackDown = nil
end
if self._moveConn then
pcall(function() self._moveConn:Disconnect() end)
self._moveConn = nil
end
if self._upConn then
pcall(function() self._upConn:Disconnect() end)
self._upConn = nil
end
if self._container then
self._container:Destroy()
self._container = nil
end
end
return Slider
end
_modules["src/components/SliderGroup"] = function()
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
_focusInConn = nil,
_focusLostConn = nil,
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
self._focusInConn = focusInConn
self._focusLostConn = focusLostConn
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
if self._focusInConn and self._focusInConn.Connected then
self._focusInConn:Disconnect()
self._focusInConn = nil
end
if self._focusLostConn and self._focusLostConn.Connected then
self._focusLostConn:Disconnect()
self._focusLostConn = nil
end
if self._container then
self._container:Destroy()
self._container = nil
end
end
return Input
end
_modules["src/components/InputGroup"] = function()
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
_modules["src/components/Dropdown"] = function()
local TweenService = game:GetService("TweenService")
local Dropdown = {}
Dropdown.__index = Dropdown
local LucideSheet = "rbxassetid://136111683851629"
local ChevronRectSize = Vector2.new(24, 24)
local ChevronRectOffset = Vector2.new(625, 25)
local CheckRectSize = Vector2.new(24, 24)
local CheckRectOffset = Vector2.new(175, 450)
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
chevron.Size = UDim2.fromOffset(14, 14)
chevron.Position = UDim2.new(1, -22, 0.5, -7)
chevron.BackgroundTransparency = 1
chevron.Image = LucideSheet
chevron.ImageRectSize = ChevronRectSize
chevron.ImageRectOffset = ChevronRectOffset
chevron.ImageColor3 = theme.TextMuted
chevron.ScaleType = Enum.ScaleType.Fit
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
_optionConns = {},
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
function self:_updateSummary()
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
function self:_syncVisuals()
for _, optData in ipairs(self._optionButtons) do
local isChecked = false
if self._isMulti then
isChecked = self._selected[optData.value] == true
else
isChecked = (self._selected == optData.value)
end
optData.button.BackgroundColor3 = isChecked and self._theme.ElementActive or self._theme.Element
optData.label.TextColor3 = isChecked and self._theme.TextPrimary or self._theme.TextSecondary
optData.label.Font = isChecked and self._theme.FontBold or self._theme.FontRegular
optData.check.Visible = isChecked
end
end
function self:_rebuildOptions()
for _, conn in ipairs(self._optionConns) do
pcall(function() conn:Disconnect() end)
end
self._optionConns = {}
for _, optData in ipairs(self._optionButtons) do
pcall(function() optData.button:Destroy() end)
end
self._optionButtons = {}
for _, opt in ipairs(self._options) do
local optStr = tostring(opt)
local isChecked = false
if self._isMulti then
isChecked = self._selected[opt] == true
else
isChecked = (self._selected == opt)
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
checkIcon.Size = UDim2.fromOffset(14, 14)
checkIcon.Position = UDim2.new(1, -22, 0.5, -7)
checkIcon.BackgroundTransparency = 1
checkIcon.Image = LucideSheet
checkIcon.ImageRectSize = CheckRectSize
checkIcon.ImageRectOffset = CheckRectOffset
checkIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
checkIcon.ScaleType = Enum.ScaleType.Fit
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
self:_updateSummary()
self:_syncVisuals()
task.spawn(self._callback, activeList)
else
self._selected = opt
self:_updateSummary()
self:_syncVisuals()
self:Close()
task.spawn(self._callback, opt)
end
end
local optClick = optBtn.Activated:Connect(onOptionClicked)
table.insert(self._optionConns, optClick)
table.insert(self._optionButtons, {
button = optBtn,
label = optLabel,
check = checkIcon,
value = opt,
})
end
end
if actionsBar then
local saBtn = actionsBar:FindFirstChild("SelectAll")
if saBtn then
saBtn.Activated:Connect(function()
for _, item in ipairs(self._options) do
self._selected[item] = true
end
self:_updateSummary()
self:_syncVisuals()
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
self:_updateSummary()
self:_syncVisuals()
task.spawn(self._callback, {})
end)
end
end
self:_updateSummary()
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
self._headerClick = headerClick
if cleanup then
cleanup:Add(headerClick)
cleanup:Add(container)
end
return self
end
function Dropdown:Open()
self._open = true
self:_rebuildOptions()
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
function Dropdown:Destroy()
for _, conn in ipairs(self._optionConns or {}) do
pcall(function() conn:Disconnect() end)
end
self._optionConns = {}
if self._headerClick then
pcall(function() self._headerClick:Disconnect() end)
end
if self._container then
self._container:Destroy()
self._container = nil
end
end
return Dropdown
end
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
self._keyClickConn = keyClickConn
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
self._inputBeganConn = inputBeganConn
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
if self._keyClickConn then
pcall(function() self._keyClickConn:Disconnect() end)
self._keyClickConn = nil
end
if self._inputBeganConn then
pcall(function() self._inputBeganConn:Disconnect() end)
self._inputBeganConn = nil
end
if self._container then
self._container:Destroy()
self._container = nil
end
end
return Keybind
end
_modules["src/components/ColorPicker"] = function()
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local ColorPicker = {}
ColorPicker.__index = ColorPicker
local PRESET_COLORS = {
Color3.fromRGB(255, 255, 255),
Color3.fromRGB(255, 60, 60),
Color3.fromRGB(255, 140, 0),
Color3.fromRGB(255, 220, 0),
Color3.fromRGB(40, 220, 100),
Color3.fromRGB(0, 190, 255),
Color3.fromRGB(60, 110, 255),
Color3.fromRGB(180, 80, 255),
}
function ColorPicker.new(parent, options, theme, cleanup)
options = options or {}
local name = options.Name or options.Title or options.Text or "Color"
local currentColor = options.Default or Color3.fromRGB(255, 255, 255)
local callback = options.Callback or function() end
local container = Instance.new("Frame")
container.Name = "ColorPicker_" .. name
container.Size = UDim2.new(1, 0, 0, theme.SmallElementHeight or 34)
container.BackgroundColor3 = theme.Element
container.BorderSizePixel = 0
container.ClipsDescendants = true
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
local headerBtn = Instance.new("TextButton")
headerBtn.Name = "HeaderButton"
headerBtn.Size = UDim2.new(1, 0, 0, theme.SmallElementHeight or 34)
headerBtn.BackgroundTransparency = 1
headerBtn.AutoButtonColor = false
headerBtn.Text = ""
headerBtn.Active = true
headerBtn.Parent = container
local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "Title"
titleLabel.Size = UDim2.new(1, -50, 1, 0)
titleLabel.Position = UDim2.new(0, 10, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = name
titleLabel.TextColor3 = theme.TextPrimary
titleLabel.Font = theme.FontBold
titleLabel.TextSize = 11
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Active = false
titleLabel.Parent = headerBtn
local colorChip = Instance.new("Frame")
colorChip.Name = "ColorChip"
colorChip.Size = UDim2.new(0, 26, 0, 16)
colorChip.Position = UDim2.new(1, -36, 0.5, -8)
colorChip.BackgroundColor3 = currentColor
colorChip.BorderSizePixel = 0
colorChip.Active = false
colorChip.Parent = headerBtn
local chipCorner = Instance.new("UICorner")
chipCorner.CornerRadius = UDim.new(0, 4)
chipCorner.Parent = colorChip
local chipStroke = Instance.new("UIStroke")
chipStroke.Color = Color3.fromRGB(255, 255, 255)
chipStroke.Transparency = 0.7
chipStroke.Thickness = 1
chipStroke.Parent = colorChip
local tray = Instance.new("Frame")
tray.Name = "PaletteTray"
tray.Size = UDim2.new(1, -16, 0, 96)
tray.Position = UDim2.new(0, 8, 0, (theme.SmallElementHeight or 34) + 4)
tray.BackgroundTransparency = 1
tray.Visible = false
tray.Parent = container
local presetsRow = Instance.new("Frame")
presetsRow.Name = "Presets"
presetsRow.Size = UDim2.new(1, 0, 0, 20)
presetsRow.BackgroundTransparency = 1
presetsRow.Parent = tray
local pLayout = Instance.new("UIListLayout")
pLayout.FillDirection = Enum.FillDirection.Horizontal
pLayout.SortOrder = Enum.SortOrder.LayoutOrder
pLayout.Padding = UDim.new(0, 5)
pLayout.Parent = presetsRow
local self = setmetatable({
_container = container,
_chip = colorChip,
_tray = tray,
_color = currentColor,
_theme = theme,
_callback = callback,
_isOpen = false,
_conns = {},
_sliderConns = {},
}, ColorPicker)
for _, pCol in ipairs(PRESET_COLORS) do
local pBtn = Instance.new("TextButton")
pBtn.Name = "Preset"
pBtn.Size = UDim2.new(0, 20, 0, 20)
pBtn.BackgroundColor3 = pCol
pBtn.AutoButtonColor = false
pBtn.Text = ""
pBtn.BorderSizePixel = 0
pBtn.Parent = presetsRow
local pCorn = Instance.new("UICorner")
pCorn.CornerRadius = UDim.new(0, 4)
pCorn.Parent = pBtn
local pStroke = Instance.new("UIStroke")
pStroke.Color = Color3.fromRGB(255, 255, 255)
pStroke.Transparency = 0.75
pStroke.Thickness = 1
pStroke.Parent = pBtn
local c = pBtn.Activated:Connect(function()
self:SetValue(pCol, true)
end)
table.insert(self._conns, c)
end
local slidersFrame = Instance.new("Frame")
slidersFrame.Name = "RGBChannels"
slidersFrame.Size = UDim2.new(1, 0, 0, 68)
slidersFrame.Position = UDim2.new(0, 0, 0, 26)
slidersFrame.BackgroundTransparency = 1
slidersFrame.Parent = tray
local sLayout = Instance.new("UIListLayout")
sLayout.FillDirection = Enum.FillDirection.Vertical
sLayout.SortOrder = Enum.SortOrder.LayoutOrder
sLayout.Padding = UDim.new(0, 4)
sLayout.Parent = slidersFrame
local channels = {
{ Name = "R", Color = Color3.fromRGB(255, 80, 80), Getter = function() return math.floor(self._color.R * 255) end, Setter = function(v) self._color = Color3.fromRGB(v, math.floor(self._color.G * 255), math.floor(self._color.B * 255)) end },
{ Name = "G", Color = Color3.fromRGB(80, 255, 120), Getter = function() return math.floor(self._color.G * 255) end, Setter = function(v) self._color = Color3.fromRGB(math.floor(self._color.R * 255), v, math.floor(self._color.B * 255)) end },
{ Name = "B", Color = Color3.fromRGB(80, 140, 255), Getter = function() return math.floor(self._color.B * 255) end, Setter = function(v) self._color = Color3.fromRGB(math.floor(self._color.R * 255), math.floor(self._color.G * 255), v) end },
}
local channelWidgets = {}
for _, ch in ipairs(channels) do
local row = Instance.new("Frame")
row.Name = "Channel_" .. ch.Name
row.Size = UDim2.new(1, 0, 0, 18)
row.BackgroundTransparency = 1
row.Parent = slidersFrame
local tag = Instance.new("TextLabel")
tag.Size = UDim2.new(0, 14, 1, 0)
tag.BackgroundTransparency = 1
tag.Text = ch.Name
tag.TextColor3 = ch.Color
tag.Font = theme.FontBold
tag.TextSize = 10
tag.Parent = row
local track = Instance.new("TextButton")
track.Name = "Track"
track.Size = UDim2.new(1, -54, 0, 6)
track.Position = UDim2.new(0, 18, 0.5, -3)
track.BackgroundColor3 = theme.SliderTrack
track.AutoButtonColor = false
track.Text = ""
track.BorderSizePixel = 0
track.Parent = row
local tCorn = Instance.new("UICorner")
tCorn.CornerRadius = UDim.new(1, 0)
tCorn.Parent = track
local fill = Instance.new("Frame")
fill.Name = "Fill"
fill.Size = UDim2.new(ch.Getter() / 255, 0, 1, 0)
fill.BackgroundColor3 = ch.Color
fill.BorderSizePixel = 0
fill.Parent = track
local fCorn = Instance.new("UICorner")
fCorn.CornerRadius = UDim.new(1, 0)
fCorn.Parent = fill
local valLbl = Instance.new("TextLabel")
valLbl.Size = UDim2.new(0, 30, 1, 0)
valLbl.Position = UDim2.new(1, -30, 0, 0)
valLbl.BackgroundTransparency = 1
valLbl.Text = tostring(ch.Getter())
valLbl.TextColor3 = theme.TextMuted
valLbl.Font = theme.FontRegular
valLbl.TextSize = 10
valLbl.TextXAlignment = Enum.TextXAlignment.Right
valLbl.Parent = row
channelWidgets[ch.Name] = { Fill = fill, ValLbl = valLbl, Channel = ch }
local dragging = false
local function updateFromInput(inputObj)
local trackW = track.AbsoluteSize.X
if trackW <= 0 then return end
local relX = math.clamp(inputObj.Position.X - track.AbsolutePosition.X, 0, trackW)
local ratio = relX / trackW
local val = math.clamp(math.floor(ratio * 255 + 0.5), 0, 255)
ch.Setter(val)
fill.Size = UDim2.new(val / 255, 0, 1, 0)
valLbl.Text = tostring(val)
colorChip.BackgroundColor3 = self._color
task.spawn(self._callback, self._color)
end
local tDown = track.InputBegan:Connect(function(inp)
if inp.UserInputType == Enum.UserInputType.MouseButton1 or inp.UserInputType == Enum.UserInputType.Touch then
dragging = true
updateFromInput(inp)
end
end)
local tMove = UserInputService.InputChanged:Connect(function(inp)
if dragging and (inp.UserInputType == Enum.UserInputType.MouseMovement or inp.UserInputType == Enum.UserInputType.Touch) then
updateFromInput(inp)
end
end)
local tEnd = UserInputService.InputEnded:Connect(function(inp)
if inp.UserInputType == Enum.UserInputType.MouseButton1 or inp.UserInputType == Enum.UserInputType.Touch then
dragging = false
end
end)
table.insert(self._sliderConns, tDown)
table.insert(self._sliderConns, tMove)
table.insert(self._sliderConns, tEnd)
end
self._channelWidgets = channelWidgets
local function toggleTray()
self._isOpen = not self._isOpen
tray.Visible = self._isOpen
local targetH = self._isOpen and ((theme.SmallElementHeight or 34) + 104) or (theme.SmallElementHeight or 34)
TweenService:Create(container, TweenInfo.new(theme.AnimationFast or 0.15), {
Size = UDim2.new(1, 0, 0, targetH)
}):Play()
end
local hClick = headerBtn.Activated:Connect(toggleTray)
table.insert(self._conns, hClick)
if cleanup then
cleanup:Add(hClick)
for _, c in ipairs(self._sliderConns) do cleanup:Add(c) end
cleanup:Add(container)
end
return self
end
function ColorPicker:SetValue(color, fireCallback)
if typeof(color) ~= "Color3" then return end
self._color = color
self._chip.BackgroundColor3 = color
if self._channelWidgets then
local r = math.floor(color.R * 255)
local g = math.floor(color.G * 255)
local b = math.floor(color.B * 255)
if self._channelWidgets.R then
self._channelWidgets.R.Fill.Size = UDim2.new(r / 255, 0, 1, 0)
self._channelWidgets.R.ValLbl.Text = tostring(r)
end
if self._channelWidgets.G then
self._channelWidgets.G.Fill.Size = UDim2.new(g / 255, 0, 1, 0)
self._channelWidgets.G.ValLbl.Text = tostring(g)
end
if self._channelWidgets.B then
self._channelWidgets.B.Fill.Size = UDim2.new(b / 255, 0, 1, 0)
self._channelWidgets.B.ValLbl.Text = tostring(b)
end
end
if fireCallback ~= false then
task.spawn(self._callback, self._color)
end
end
function ColorPicker:GetValue()
return self._color
end
function ColorPicker:Destroy()
for _, c in ipairs(self._conns) do
if c and c.Connected then c:Disconnect() end
end
for _, c in ipairs(self._sliderConns) do
if c and c.Connected then c:Disconnect() end
end
self._conns = {}
self._sliderConns = {}
if self._container then
self._container:Destroy()
self._container = nil
end
end
return ColorPicker
end
_modules["src/components/Paragraph"] = function()
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
_modules["src/components/Divider"] = function()
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
_modules["src/components/Banner"] = function()
local TweenService = game:GetService("TweenService")
local Banner = {}
Banner.__index = Banner
local function resolveAsset(asset)
if not asset or asset == "" then
return "rbxassetid://108339444679489"
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
local image = options.Image or options.AssetId or theme.DefaultBanner or "rbxassetid://108339444679489"
local defaultCollapsed = options.Collapsed == true
local container = Instance.new("Frame")
container.Name = "Banner"
container.Size = UDim2.new(1, 0, 0, 0)
container.AutomaticSize = Enum.AutomaticSize.Y
container.BackgroundColor3 = theme.Card
container.BorderSizePixel = 0
container.ClipsDescendants = false
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
imageLabel.ScaleType = Enum.ScaleType.Fit
imageLabel.BorderSizePixel = 0
imageLabel.Parent = imageFrame
local function updateBannerHeight()
local width = imageFrame.AbsoluteSize.X
if width > 40 then
local targetH = math.clamp(math.floor(width / (643 / 253)), 60, 320)
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
_toggleConn = nil,
_absConn = absConn,
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
self._toggleConn = toggleConn
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
if self._toggleConn and self._toggleConn.Connected then
self._toggleConn:Disconnect()
self._toggleConn = nil
end
if self._absConn and self._absConn.Connected then
self._absConn:Disconnect()
self._absConn = nil
end
if self._container then
self._container:Destroy()
self._container = nil
end
end
return Banner
end
_modules["src/components/Progression"] = function()
local TweenService = game:GetService("TweenService")
local Progression = {}
Progression.__index = Progression
local okIcon, IconService = pcall(function()
return require(script.Parent.Parent.services.IconService)
end)
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
icon.ScaleType = Enum.ScaleType.Fit
icon.Active = false
icon.ZIndex = 3
icon.Parent = nodeBtn
local initColor = (i == initialStep) and Color3.fromRGB(255, 255, 255) or theme.TextMuted
if okIcon and IconService and IconService.Apply then
IconService.Apply(icon, stepData.Icon or "check", initColor)
else
icon.Image = stepData.Icon or ""
icon.ImageColor3 = initColor
end
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
_conns = {},
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
table.insert(self._conns, conn)
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
if self._conns then
for _, c in ipairs(self._conns) do
if c and c.Connected then c:Disconnect() end
end
self._conns = {}
end
if self._container then
self._container:Destroy()
self._container = nil
end
end
return Progression
end
_modules["src/services/ConfigService"] = function()
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
_modules["src/services/IconService"] = function()
local ContentProvider = game:GetService("ContentProvider")
local IconService = {}
local Sheet1 = "136111683851629"
local Sheet2 = "135883070486325"
local DefaultSize = Vector2.new(24, 24)
local Icons = {
focus = { sheet = Sheet1, size = DefaultSize, offset = Vector2.new(650, 275) },
target = { sheet = Sheet2, size = DefaultSize, offset = Vector2.new(225, 0) },
crosshair = { sheet = Sheet1, size = DefaultSize, offset = Vector2.new(725, 75) },
combat = { sheet = Sheet2, size = DefaultSize, offset = Vector2.new(125, 25) },
binoculars = { sheet = Sheet1, size = DefaultSize, offset = Vector2.new(375, 75) },
palette = { sheet = Sheet1, size = DefaultSize, offset = Vector2.new(425, 825) },
globe = { sheet = Sheet1, size = DefaultSize, offset = Vector2.new(425, 550) },
user = { sheet = Sheet2, size = DefaultSize, offset = Vector2.new(375, 75) },
zap = { sheet = Sheet2, size = DefaultSize, offset = Vector2.new(400, 150) },
shield = { sheet = Sheet1, size = DefaultSize, offset = Vector2.new(750, 775) },
settings = { sheet = Sheet1, size = DefaultSize, offset = Vector2.new(825, 675) },
swords = { sheet = Sheet2, size = DefaultSize, offset = Vector2.new(125, 25) },
sword = { sheet = Sheet2, size = DefaultSize, offset = Vector2.new(150, 0) },
eye = { sheet = Sheet1, size = DefaultSize, offset = Vector2.new(175, 675) },
home = { sheet = Sheet1, size = DefaultSize, offset = Vector2.new(650, 275) },
pin = { sheet = Sheet1, size = DefaultSize, offset = Vector2.new(325, 800) },
map = { sheet = Sheet1, size = DefaultSize, offset = Vector2.new(325, 800) },
skull = { sheet = Sheet1, size = DefaultSize, offset = Vector2.new(875, 700) },
star = { sheet = Sheet1, size = DefaultSize, offset = Vector2.new(950, 925) },
flame = { sheet = Sheet1, size = DefaultSize, offset = Vector2.new(850, 75) },
gem = { sheet = Sheet1, size = DefaultSize, offset = Vector2.new(175, 775) },
diamond = { sheet = Sheet1, size = DefaultSize, offset = Vector2.new(175, 775) },
package = { sheet = Sheet1, size = DefaultSize, offset = Vector2.new(550, 700) },
gamepad = { sheet = Sheet1, size = DefaultSize, offset = Vector2.new(300, 650) },
scroll = { sheet = Sheet1, size = DefaultSize, offset = Vector2.new(800, 675) },
cart = { sheet = Sheet1, size = DefaultSize, offset = Vector2.new(975, 575) },
wrench = { sheet = Sheet2, size = DefaultSize, offset = Vector2.new(50, 475) },
search = { sheet = Sheet1, size = DefaultSize, offset = Vector2.new(650, 825) },
info = { sheet = Sheet1, size = DefaultSize, offset = Vector2.new(150, 875) },
bell = { sheet = Sheet1, size = DefaultSize, offset = Vector2.new(100, 325) },
lock = { sheet = Sheet1, size = DefaultSize, offset = Vector2.new(300, 800) },
check = { sheet = Sheet1, size = DefaultSize, offset = Vector2.new(175, 450) },
chevron = { sheet = Sheet1, size = DefaultSize, offset = Vector2.new(625, 25) },
sliders = { sheet = Sheet1, size = DefaultSize, offset = Vector2.new(875, 475) },
moon = { sheet = Sheet1, size = DefaultSize, offset = Vector2.new(650, 275) },
sun = { sheet = Sheet1, size = DefaultSize, offset = Vector2.new(425, 825) },
}
local Aliases = {
aim = "focus",
theme = "palette",
visuals = "palette",
spectate = "binoculars",
world = "globe",
universal = "globe",
network = "globe",
server = "globe",
player = "user",
profile = "user",
speed = "zap",
lightning = "zap",
defense = "shield",
parry = "shield",
gear = "settings",
config = "settings",
esp = "eye",
main = "home",
teleport = "pin",
["map-pin"] = "pin",
fire = "flame",
["shopping-cart"] = "cart",
tools = "wrench",
tool = "wrench",
information = "info",
["chevron-down"] = "chevron",
arrow = "chevron",
layers = "focus",
dark = "moon",
light = "sun",
}
IconService.Icons = Icons
IconService.Sheet1 = Sheet1
IconService.Sheet2 = Sheet2
function IconService.Preload()
task.spawn(function()
pcall(function()
ContentProvider:PreloadAsync({
"rbxassetid://" .. Sheet1,
"rbxassetid://" .. Sheet2,
})
end)
end)
end
function IconService.Get(name)
if not name or name == "" then return nil end
local s = string.lower(tostring(name))
if Aliases[s] and Icons[Aliases[s]] then
return Icons[Aliases[s]]
end
if Icons[s] then
return Icons[s]
end
for k, v in pairs(Icons) do
if string.find(s, k) or string.find(k, s) then
return v
end
end
return Icons.focus
end
function IconService.Apply(imageInstance, name, color)
if not imageInstance or not (imageInstance:IsA("ImageLabel") or imageInstance:IsA("ImageButton")) then
return
end
if not name or name == "" then
return
end
local num = tonumber(name)
if num then
imageInstance.Image = "rbxassetid://" .. tostring(num)
imageInstance.ImageRectSize = Vector2.new(0, 0)
imageInstance.ImageRectOffset = Vector2.new(0, 0)
if color then
imageInstance.ImageColor3 = color
end
return
end
local str = tostring(name)
if string.find(str, "rbxasset") or string.find(str, "http") then
imageInstance.Image = str
imageInstance.ImageRectSize = Vector2.new(0, 0)
imageInstance.ImageRectOffset = Vector2.new(0, 0)
if color then
imageInstance.ImageColor3 = color
end
return
end
local data = IconService.Get(str)
if data then
imageInstance.Image = "rbxassetid://" .. data.sheet
imageInstance.ImageRectSize = data.size
imageInstance.ImageRectOffset = data.offset
imageInstance.ScaleType = Enum.ScaleType.Fit
if color then
imageInstance.ImageColor3 = color
end
end
end
function IconService.Resolve(input)
if not input or input == "" then return nil end
local data = IconService.Get(input)
if data then
return "rbxassetid://" .. data.sheet
end
if tonumber(input) then
return "rbxassetid://" .. tostring(input)
end
return input
end
return IconService
end
_modules["src/services/ProfileService"] = function()
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
if self._configService then
self._profiles[self._activeProfile] = self._configService:GetAll()
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
_modules["src/core/Window"] = function()
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local MarketplaceService = game:GetService("MarketplaceService")
local Window = {}
Window.__index = Window
local TabGroup = {}
TabGroup.__index = TabGroup
local Tab = {}
Tab.__index = Tab
local Section = {}
Section.__index = Section
function Window.new(options, dependencies)
local self
options = options or {}
local deps = dependencies or {}
local theme = deps.Theme
local cleanup = deps.Cleanup
local Layout = deps.Layout
local Modal = deps.Modal
local MobilePin = deps.MobilePin
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
local ColorPicker = deps.ColorPicker
if not ColorPicker then
local cOk, cRes = pcall(function() return require(script.Parent.Parent.components.ColorPicker) end)
ColorPicker = cOk and cRes
end
local IconService = deps.IconService
if not IconService then
local iOk, iRes = pcall(function() return require(script.Parent.Parent.services.IconService) end)
IconService = iOk and iRes
end
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
local enableMobilePin = options.MobilePin ~= false
local logoAsset = options.Logo or "rbxassetid://6031075936"
local function resolveParentGui(customParent)
if customParent then return customParent end
local okH, h = pcall(function() return gethui and gethui() end)
if okH and h then return h end
if not RunService:IsStudio() then
local okCg, cg = pcall(function() return game:GetService("CoreGui") end)
if okCg and cg then
local test = Instance.new("Folder")
local pOk = pcall(function()
test.Parent = cg
test:Destroy()
end)
if pOk then return cg end
end
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
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = defaultSize
mainFrame.Position = options.Position or UDim2.new(0.5, -defaultSize.X.Offset / 2, 0.5, -defaultSize.Y.Offset / 2)
mainFrame.BackgroundColor3 = theme.Background
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Active = true
mainFrame.Parent = screenGui
local cursorUnlocker = Instance.new("TextButton")
cursorUnlocker.Name = "CursorUnlocker"
cursorUnlocker.Size = UDim2.fromOffset(0, 0)
cursorUnlocker.BackgroundTransparency = 1
cursorUnlocker.Text = ""
cursorUnlocker.Modal = true
cursorUnlocker.Visible = true
cursorUnlocker.Active = false
cursorUnlocker.Parent = mainFrame
local windowScale = Instance.new("UIScale")
windowScale.Name = "WindowScale"
windowScale.Scale = sizePreset.Scale or 1.0
windowScale.Parent = mainFrame
local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = theme.WindowCornerRadius or theme.CornerRadius
mainCorner.Parent = mainFrame
local mainStroke = nil
if theme.UseStrokes then
mainStroke = Instance.new("UIStroke")
mainStroke.Name = "WindowStroke"
mainStroke.Color = theme.BorderWindow or Color3.fromRGB(42, 42, 50)
mainStroke.Thickness = 1
mainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
mainStroke.Parent = mainFrame
end
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
local logoBtn = Instance.new("TextButton")
logoBtn.Name = "LogoButton"
logoBtn.Size = UDim2.new(0, 26, 0, 26)
logoBtn.Position = UDim2.new(0, 14, 0.5, -13)
logoBtn.BackgroundTransparency = 1
logoBtn.AutoButtonColor = false
logoBtn.Text = ""
logoBtn.Active = true
logoBtn.Parent = header
local logoAsset = options.Logo or theme.DefaultLogo or "rbxassetid://126257104774952"
local logoImg = Instance.new("ImageLabel")
logoImg.Name = "LogoImage"
logoImg.Size = UDim2.new(1, 0, 1, 0)
logoImg.BackgroundTransparency = 1
logoImg.Image = logoAsset
logoImg.ScaleType = Enum.ScaleType.Fit
logoImg.BorderSizePixel = 0
logoImg.Active = false
logoImg.Parent = logoBtn
local logoCorner = Instance.new("UICorner")
logoCorner.CornerRadius = UDim.new(0, 6)
logoCorner.Parent = logoImg
local isDarkInit = (theme.IsLight ~= true and theme.Name ~= "Pure White")
local logoStroke = Instance.new("UIStroke")
logoStroke.Name = "LogoStroke"
logoStroke.Color = isDarkInit and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(18, 20, 24)
logoStroke.Thickness = 1
logoStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
logoStroke.Parent = logoImg
local logoToggleConn = logoBtn.Activated:Connect(function()
self:ToggleSidebar()
end)
local lbEnterConn = logoBtn.MouseEnter:Connect(function()
TweenService:Create(logoImg, TweenInfo.new(0.12), { ImageTransparency = 0.15 }):Play()
end)
local lbLeaveConn = logoBtn.MouseLeave:Connect(function()
TweenService:Create(logoImg, TweenInfo.new(0.12), { ImageTransparency = 0 }):Play()
end)
if cleanup then
cleanup:Add(logoToggleConn)
cleanup:Add(lbEnterConn)
cleanup:Add(lbLeaveConn)
cleanup:Add(logoBtn)
end
local headerDivider = Instance.new("Frame")
headerDivider.Name = "HeaderDivider"
headerDivider.Size = UDim2.new(1, 0, 0, 1)
headerDivider.Position = UDim2.new(0, 0, 1, -1)
headerDivider.BackgroundColor3 = theme.Border
headerDivider.BorderSizePixel = 0
headerDivider.Parent = header
local function formatHeaderTitle(isDark)
local divColor = isDark and "#707888" or "#9AA2B0"
local rawTitle = options.Title or "Liyhub"
local rawSubtitle = options.Subtitle or subtitleText
if string.find(rawTitle, "|") then
local parts = string.split(rawTitle, "|")
local brand = string.gsub(parts[1], "^%s*(.-)%s*$", "%1")
local details = string.gsub(parts[2], "^%s*(.-)%s*$", "%1")
if #parts > 2 then
for k = 3, #parts do
details = details .. " | " .. string.gsub(parts[k], "^%s*(.-)%s*$", "%1")
end
end
return string.format("<b>%s</b>  <font color=\"%s\">|</font>  %s", brand, divColor, details)
elseif rawSubtitle and rawSubtitle ~= "" then
return string.format("<b>%s</b>  <font color=\"%s\">|</font>  %s", rawTitle, divColor, rawSubtitle)
else
return string.format("<b>%s</b>", rawTitle)
end
end
local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "Title"
titleLabel.AnchorPoint = Vector2.new(0, 0.5)
titleLabel.Position = UDim2.new(0, 48, 0.5, 0)
titleLabel.Size = UDim2.new(1, -165, 0, 22)
titleLabel.BackgroundTransparency = 1
titleLabel.RichText = true
titleLabel.Text = formatHeaderTitle(isDarkInit)
titleLabel.TextColor3 = theme.TextPrimary
titleLabel.Font = theme.FontRegular
titleLabel.TextSize = 13.5
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.TextTruncate = Enum.TextTruncate.AtEnd
titleLabel.Parent = header
local subLabel = Instance.new("TextLabel")
subLabel.Name = "Subtitle"
subLabel.Size = UDim2.new(0, 0, 0, 0)
subLabel.Position = UDim2.new(0, 0, 0, 0)
subLabel.BackgroundTransparency = 1
subLabel.Text = ""
subLabel.Visible = false
subLabel.Parent = header
local controlsFrame = Instance.new("Frame")
controlsFrame.Name = "Controls"
controlsFrame.Size = UDim2.new(0, 102, 0, 30)
controlsFrame.Position = UDim2.new(1, -112, 0, 9)
controlsFrame.BackgroundTransparency = 1
controlsFrame.ZIndex = 20
controlsFrame.Parent = mainFrame
local controlsLayout = Instance.new("UIListLayout")
controlsLayout.FillDirection = Enum.FillDirection.Horizontal
controlsLayout.SortOrder = Enum.SortOrder.LayoutOrder
controlsLayout.Padding = UDim.new(0, 6)
controlsLayout.Parent = controlsFrame
local controlBtnBg = Color3.fromRGB(24, 25, 32)
local controlBtnHover = Color3.fromRGB(36, 38, 48)
local controlIconColor = Color3.fromRGB(200, 205, 215)
local themeBtn = Instance.new("TextButton")
themeBtn.Name = "ThemeToggle"
themeBtn.Size = UDim2.new(0, 30, 0, 30)
themeBtn.BackgroundColor3 = controlBtnBg
themeBtn.AutoButtonColor = false
themeBtn.Text = ""
themeBtn.BorderSizePixel = 0
themeBtn.Active = true
themeBtn.LayoutOrder = 1
themeBtn.ZIndex = 21
themeBtn.Parent = controlsFrame
local themeCorner = Instance.new("UICorner")
themeCorner.CornerRadius = UDim.new(0, 8)
themeCorner.Parent = themeBtn
local themeIconContainer = Instance.new("Frame")
themeIconContainer.Name = "ThemeIcon"
themeIconContainer.Size = UDim2.fromOffset(16, 16)
themeIconContainer.AnchorPoint = Vector2.new(0.5, 0.5)
themeIconContainer.Position = UDim2.new(0.5, 0, 0.5, 0)
themeIconContainer.BackgroundTransparency = 1
themeIconContainer.Active = false
themeIconContainer.ZIndex = 22
themeIconContainer.Parent = themeBtn
local function renderThemeIcon(isDark)
themeIconContainer:ClearAllChildren()
if isDark then
local moonBody = Instance.new("Frame")
moonBody.Name = "MoonBody"
moonBody.Size = UDim2.fromOffset(13, 13)
moonBody.AnchorPoint = Vector2.new(0.5, 0.5)
moonBody.Position = UDim2.new(0.5, 0, 0.5, 0)
moonBody.BackgroundColor3 = controlIconColor
moonBody.BorderSizePixel = 0
moonBody.ZIndex = 22
moonBody.Active = false
moonBody.Parent = themeIconContainer
local mbc = Instance.new("UICorner")
mbc.CornerRadius = UDim.new(1, 0)
mbc.Parent = moonBody
local moonCutout = Instance.new("Frame")
moonCutout.Name = "MoonCutout"
moonCutout.Size = UDim2.fromOffset(12, 12)
moonCutout.AnchorPoint = Vector2.new(0.5, 0.5)
moonCutout.Position = UDim2.new(0.5, -3.5, 0.5, -2.5)
moonCutout.BackgroundColor3 = (self and self._controlBtnBg) or themeBtn.BackgroundColor3
moonCutout.BorderSizePixel = 0
moonCutout.ZIndex = 23
moonCutout.Active = false
moonCutout.Parent = themeIconContainer
local mcc = Instance.new("UICorner")
mcc.CornerRadius = UDim.new(1, 0)
mcc.Parent = moonCutout
else
local sunCore = Instance.new("Frame")
sunCore.Name = "SunCore"
sunCore.Size = UDim2.fromOffset(7, 7)
sunCore.AnchorPoint = Vector2.new(0.5, 0.5)
sunCore.Position = UDim2.new(0.5, 0, 0.5, 0)
sunCore.BackgroundColor3 = Color3.fromRGB(255, 175, 20)
sunCore.BorderSizePixel = 0
sunCore.ZIndex = 24
sunCore.Active = false
sunCore.Parent = themeIconContainer
local scc = Instance.new("UICorner")
scc.CornerRadius = UDim.new(1, 0)
scc.Parent = sunCore
local sunAngles = { 0, 45, 90, 135 }
for _, ang in ipairs(sunAngles) do
local ray = Instance.new("Frame")
ray.Name = "Ray"
ray.Size = UDim2.fromOffset(15, 1.8)
ray.AnchorPoint = Vector2.new(0.5, 0.5)
ray.Position = UDim2.new(0.5, 0, 0.5, 0)
ray.Rotation = ang
ray.BackgroundColor3 = Color3.fromRGB(255, 175, 20)
ray.BorderSizePixel = 0
ray.ZIndex = 23
ray.Active = false
ray.Parent = themeIconContainer
local rc = Instance.new("UICorner")
rc.CornerRadius = UDim.new(1, 0)
rc.Parent = ray
end
end
end
renderThemeIcon(true)
local minBtn = Instance.new("TextButton")
minBtn.Name = "Minimize"
minBtn.LayoutOrder = 2
minBtn.Size = UDim2.new(0, 30, 0, 30)
minBtn.BackgroundColor3 = controlBtnBg
minBtn.AutoButtonColor = false
minBtn.Text = ""
minBtn.BorderSizePixel = 0
minBtn.Active = true
minBtn.ZIndex = 21
minBtn.Parent = controlsFrame
local minCorner = Instance.new("UICorner")
minCorner.CornerRadius = UDim.new(0, 8)
minCorner.Parent = minBtn
local minLine = Instance.new("Frame")
minLine.Name = "IconLine"
minLine.Size = UDim2.fromOffset(13, 2.5)
minLine.AnchorPoint = Vector2.new(0.5, 0.5)
minLine.Position = UDim2.new(0.5, 0, 0.5, 0)
minLine.BackgroundColor3 = controlIconColor
minLine.BorderSizePixel = 0
minLine.ZIndex = 22
minLine.Active = false
minLine.Parent = minBtn
local minLineCorner = Instance.new("UICorner")
minLineCorner.CornerRadius = UDim.new(1, 0)
minLineCorner.Parent = minLine
local closeBtn = Instance.new("TextButton")
closeBtn.Name = "Close"
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.LayoutOrder = 3
closeBtn.BackgroundColor3 = controlBtnBg
closeBtn.AutoButtonColor = false
closeBtn.Text = ""
closeBtn.BorderSizePixel = 0
closeBtn.Active = true
closeBtn.ZIndex = 21
closeBtn.Parent = controlsFrame
local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 8)
closeCorner.Parent = closeBtn
local closeCrossContainer = Instance.new("Frame")
closeCrossContainer.Name = "IconCross"
closeCrossContainer.Size = UDim2.fromOffset(14, 14)
closeCrossContainer.AnchorPoint = Vector2.new(0.5, 0.5)
closeCrossContainer.Position = UDim2.new(0.5, 0, 0.5, 0)
closeCrossContainer.BackgroundTransparency = 1
closeCrossContainer.ZIndex = 22
closeCrossContainer.Active = false
closeCrossContainer.Parent = closeBtn
local closeBar1 = Instance.new("Frame")
closeBar1.Name = "Bar1"
closeBar1.Size = UDim2.fromOffset(14, 2.5)
closeBar1.AnchorPoint = Vector2.new(0.5, 0.5)
closeBar1.Position = UDim2.new(0.5, 0, 0.5, 0)
closeBar1.Rotation = 45
closeBar1.BackgroundColor3 = controlIconColor
closeBar1.BorderSizePixel = 0
closeBar1.ZIndex = 22
closeBar1.Active = false
closeBar1.Parent = closeCrossContainer
local closeBar1Corner = Instance.new("UICorner")
closeBar1Corner.CornerRadius = UDim.new(1, 0)
closeBar1Corner.Parent = closeBar1
local closeBar2 = Instance.new("Frame")
closeBar2.Name = "Bar2"
closeBar2.Size = UDim2.fromOffset(14, 2.5)
closeBar2.AnchorPoint = Vector2.new(0.5, 0.5)
closeBar2.Position = UDim2.new(0.5, 0, 0.5, 0)
closeBar2.Rotation = -45
closeBar2.BackgroundColor3 = controlIconColor
closeBar2.BorderSizePixel = 0
closeBar2.ZIndex = 22
closeBar2.Active = false
closeBar2.Parent = closeCrossContainer
local closeBar2Corner = Instance.new("UICorner")
closeBar2Corner.CornerRadius = UDim.new(1, 0)
closeBar2Corner.Parent = closeBar2
local themeHovIn = themeBtn.MouseEnter:Connect(function()
local hov = (self and self._controlBtnHover) or controlBtnHover
TweenService:Create(themeBtn, TweenInfo.new(0.12), { BackgroundColor3 = hov }):Play()
local mc = themeIconContainer:FindFirstChild("MoonCutout")
if mc then
TweenService:Create(mc, TweenInfo.new(0.12), { BackgroundColor3 = hov }):Play()
end
end)
local themeHovOut = themeBtn.MouseLeave:Connect(function()
local bg = (self and self._controlBtnBg) or controlBtnBg
TweenService:Create(themeBtn, TweenInfo.new(0.12), { BackgroundColor3 = bg }):Play()
local mc = themeIconContainer:FindFirstChild("MoonCutout")
if mc then
TweenService:Create(mc, TweenInfo.new(0.12), { BackgroundColor3 = bg }):Play()
end
end)
local minHovIn = minBtn.MouseEnter:Connect(function()
local hov = (self and self._controlBtnHover) or controlBtnHover
TweenService:Create(minBtn, TweenInfo.new(0.12), { BackgroundColor3 = hov }):Play()
end)
local minHovOut = minBtn.MouseLeave:Connect(function()
local bg = (self and self._controlBtnBg) or controlBtnBg
TweenService:Create(minBtn, TweenInfo.new(0.12), { BackgroundColor3 = bg }):Play()
end)
local closeHovIn = closeBtn.MouseEnter:Connect(function()
TweenService:Create(closeBtn, TweenInfo.new(0.12), { BackgroundColor3 = Color3.fromRGB(50, 24, 30) }):Play()
closeBar1.BackgroundColor3 = Color3.fromRGB(240, 100, 110)
closeBar2.BackgroundColor3 = Color3.fromRGB(240, 100, 110)
end)
local closeHovOut = closeBtn.MouseLeave:Connect(function()
local bg = (self and self._controlBtnBg) or controlBtnBg
local ic = (self and self._controlIconColor) or controlIconColor
TweenService:Create(closeBtn, TweenInfo.new(0.12), { BackgroundColor3 = bg }):Play()
closeBar1.BackgroundColor3 = ic
closeBar2.BackgroundColor3 = ic
end)
if cleanup then
cleanup:Add(themeHovIn)
cleanup:Add(themeHovOut)
cleanup:Add(minHovIn)
cleanup:Add(minHovOut)
cleanup:Add(closeHovIn)
cleanup:Add(closeHovOut)
end
local body = Instance.new("Frame")
body.Name = "Body"
body.Size = UDim2.new(1, 0, 1, -48)
body.Position = UDim2.new(0, 0, 0, 48)
body.BackgroundTransparency = 1
body.Parent = mainFrame
local sidebar = Instance.new("Frame")
sidebar.Name = "Sidebar"
sidebar.Size = UDim2.new(0, 190, 1, 0)
sidebar.BackgroundColor3 = theme.Sidebar
sidebar.BorderSizePixel = 0
sidebar.Parent = body
local sidebarCorner = Instance.new("UICorner")
sidebarCorner.CornerRadius = theme.WindowCornerRadius or theme.CornerRadius or UDim.new(0, 10)
sidebarCorner.Parent = sidebar
local sidebarFlatTop = Instance.new("Frame")
sidebarFlatTop.Name = "FlatTop"
sidebarFlatTop.Size = UDim2.new(1, 0, 0, 12)
sidebarFlatTop.Position = UDim2.new(0, 0, 0, 0)
sidebarFlatTop.BackgroundColor3 = theme.Sidebar
sidebarFlatTop.BorderSizePixel = 0
sidebarFlatTop.ZIndex = 1
sidebarFlatTop.Parent = sidebar
local sidebarFlatRight = Instance.new("Frame")
sidebarFlatRight.Name = "FlatRight"
sidebarFlatRight.Size = UDim2.new(0, 12, 1, 0)
sidebarFlatRight.Position = UDim2.new(1, -12, 0, 0)
sidebarFlatRight.BackgroundColor3 = theme.Sidebar
sidebarFlatRight.BorderSizePixel = 0
sidebarFlatRight.ZIndex = 1
sidebarFlatRight.Parent = sidebar
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
local profileCard = Instance.new("TextButton")
profileCard.Name = "ProfileCard"
profileCard.Size = UDim2.new(1, -16, 0, 46)
profileCard.Position = UDim2.new(0, 8, 1, -52)
profileCard.BackgroundColor3 = theme.SidebarItem
profileCard.AutoButtonColor = false
profileCard.Text = ""
profileCard.BorderSizePixel = 0
profileCard.Active = true
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
local profDisplayName = Instance.new("TextLabel")
profDisplayName.Name = "DisplayName"
profDisplayName.Size = UDim2.new(1, -48, 0, 16)
profDisplayName.Position = UDim2.new(0, 45, 0, 7)
profDisplayName.BackgroundTransparency = 1
profDisplayName.Text = ""
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
profUsername.Text = ""
profUsername.TextColor3 = theme.TextSecondary
profUsername.Font = theme.FontRegular
profUsername.TextSize = 10
profUsername.TextXAlignment = Enum.TextXAlignment.Left
profUsername.TextTruncate = Enum.TextTruncate.AtEnd
profUsername.Parent = profileCard
local function applyRealProfile(realPlayer)
if not realPlayer then return end
profDisplayName.Text = realPlayer.DisplayName
profUsername.Text = "@" .. realPlayer.Name
task.spawn(function()
local thumb = Players:GetUserThumbnailAsync(
realPlayer.UserId,
Enum.ThumbnailType.HeadShot,
Enum.ThumbnailSize.Size100x100
)
if thumb and avatarImg and avatarImg.Parent then
avatarImg.Image = thumb
end
end)
end
local realPlayer = Players.LocalPlayer or Players:GetPlayers()[1]
if realPlayer then
applyRealProfile(realPlayer)
else
local playerConn
playerConn = Players.PlayerAdded:Connect(function(newPlayer)
applyRealProfile(newPlayer)
if playerConn then
playerConn:Disconnect()
end
end)
if cleanup then
cleanup:Add(playerConn)
end
end
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
self = setmetatable({
_screenGui = screenGui,
_mainFrame = mainFrame,
_mainStroke = mainStroke,
_header = header,
_headerFlatBottom = headerFlatBottom,
_headerDivider = headerDivider,
_titleLabel = titleLabel,
_subLabel = subLabel,
_formatHeaderTitle = formatHeaderTitle,
_sidebar = sidebar,
_sidebarFlatTop = sidebarFlatTop,
_sidebarFlatRight = sidebarFlatRight,
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
_iconService = IconService,
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
ColorPicker = ColorPicker,
},
_tabGroups = {},
_sidebarCollapsed = false,
_allTabs = {},
_activeTab = nil,
_toggleKey = toggleKey,
_minimized = false,
_originalSize = defaultSize,
_destroyed = false,
_themeBtn = themeBtn,
_minBtn = minBtn,
_logoBadge = nil,
_logoStroke = logoStroke,
_closeBtn = closeBtn,
_themeIconContainer = themeIconContainer,
_renderThemeIcon = renderThemeIcon,
_currentThemeMode = "Dark",
_themeManager = deps.ThemeManager,
_userProfileData = nil,
_gripIcon = gripIcon,
_controlBtnBg = controlBtnBg,
_controlBtnHover = controlBtnHover,
_controlIconColor = controlIconColor,
}, Window)
local lastProfClick = 0
local function onProfileClicked()
local now = os.clock()
if now - lastProfClick < 0.2 then return end
lastProfClick = now
if self._userTab then
self:_setActiveTab(self._userTab)
else
self:ShowProfileModal()
end
end
local profConn = profileCard.Activated:Connect(onProfileClicked)
if cleanup then
cleanup:Add(profConn)
end
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
local activeScale = windowScale.Scale > 0 and windowScale.Scale or 1.0
local delta = (input.Position - dragStart) / activeScale
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
local lastTheme = 0
local function doThemeToggle()
local now = os.clock()
if now - lastTheme < 0.2 then return end
lastTheme = now
self:ToggleTheme()
end
local themeClick = themeBtn.Activated:Connect(doThemeToggle)
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
if enableMobilePin and MobilePin then
self._mobilePin = MobilePin.new(screenGui, self, {
Title = titleText,
Logo = logoAsset,
User = dispNameText,
}, theme, cleanup)
if self._uiScale then
self._mobilePin:SetScale(self._uiScale.Scale)
end
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
local resizeMoveConn, resizeEndConn
local resizeBegan = resizeGrip.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
if resizeMoveConn then resizeMoveConn:Disconnect(); resizeMoveConn = nil end
if resizeEndConn then resizeEndConn:Disconnect(); resizeEndConn = nil end
isResizing = true
resizeStartMouse = Vector2.new(input.Position.X, input.Position.Y)
resizeStartSize = Vector2.new(mainFrame.Size.X.Offset, mainFrame.Size.Y.Offset)
TweenService:Create(gripIcon, TweenInfo.new(0.1), {
ImageColor3 = Color3.fromRGB(255, 255, 255),
ImageTransparency = 0
}):Play()
resizeMoveConn = UserInputService.InputChanged:Connect(function(moveInput)
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
local maxW = math.max(math.floor(curVp.X / activeScale) - 20, 600)
local maxH = math.max(math.floor(curVp.Y / activeScale) - 20, 400)
local newW = math.clamp(math.floor(resizeStartSize.X + delta.X), minW, maxW)
local newH = math.clamp(math.floor(resizeStartSize.Y + delta.Y), minH, maxH)
mainFrame.Size = UDim2.fromOffset(newW, newH)
self._originalSize = mainFrame.Size
if self._profileCard then
local isCompactH = newH < 350
self._profileCard.Size = isCompactH and UDim2.new(1, -16, 0, 36) or UDim2.new(1, -16, 0, 46)
self._profileCard.Position = isCompactH and UDim2.new(0, 8, 1, -40) or UDim2.new(0, 8, 1, -52)
local av = self._profileCard:FindFirstChild("Avatar")
if av then
av.Size = isCompactH and UDim2.new(0, 24, 0, 24) or UDim2.new(0, 32, 0, 32)
av.Position = isCompactH and UDim2.new(0, 6, 0.5, -12) or UDim2.new(0, 7, 0.5, -16)
end
local dName = self._profileCard:FindFirstChild("DisplayName")
local uName = self._profileCard:FindFirstChild("Username")
local isNarrow = newW < 560
if dName then
dName.TextSize = isNarrow and 10 or 12
dName.Position = isCompactH and UDim2.new(0, 36, 0, 3) or UDim2.new(0, 45, 0, 7)
end
if uName then
uName.TextSize = isNarrow and 8 or 10
uName.Position = isCompactH and UDim2.new(0, 36, 0, 18) or UDim2.new(0, 45, 0, 23)
end
end
if self._forceTwoColumns == nil then
local autoTwo = newW >= 620
for _, tab in ipairs(self._allTabs or {}) do
if tab._layoutEngine and tab._layoutEngine.SetTwoColumns then
tab._layoutEngine:SetTwoColumns(autoTwo)
end
end
end
end
end)
resizeEndConn = UserInputService.InputEnded:Connect(function(endInput)
if endInput.UserInputType == Enum.UserInputType.MouseButton1 or endInput.UserInputType == Enum.UserInputType.Touch then
isResizing = false
if resizeMoveConn then resizeMoveConn:Disconnect(); resizeMoveConn = nil end
if resizeEndConn then resizeEndConn:Disconnect(); resizeEndConn = nil end
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
cleanup:Add(function()
if resizeMoveConn then resizeMoveConn:Disconnect() end
if resizeEndConn then resizeEndConn:Disconnect() end
end)
end
if cleanup then
cleanup:Add(dragBegan)
cleanup:Add(dragChanged)
cleanup:Add(dragUpdate)
cleanup:Add(dragEnded)
cleanup:Add(themeClick)
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
local realPlayer = Players.LocalPlayer or Players:GetPlayers()[1]
local dispNameText = realPlayer and realPlayer.DisplayName or ""
self._mobilePin:SetUserText(dispNameText)
if self._uiScale then
self._mobilePin:SetScale(self._uiScale.Scale)
end
self._mobilePin:SetVisible(true)
self._mobilePin:SetOpenState(false)
end
for _, tab in ipairs(self._allTabs or {}) do
if tab._layoutEngine and tab._layoutEngine.UpdateForDevice then
tab._layoutEngine:UpdateForDevice(self._currentDevice, true, self._forceTwoColumns)
end
end
end
function Window:Open()
self._minimized = false
self._mainFrame.Visible = true
if self._mobilePin then
self._mobilePin:SetVisible(false)
self._mobilePin:SetOpenState(true)
end
for _, tab in ipairs(self._allTabs or {}) do
if tab._layoutEngine and tab._layoutEngine.UpdateForDevice then
tab._layoutEngine:UpdateForDevice(self._currentDevice, false, self._forceTwoColumns)
end
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
function Window:SetSidebarCollapsed(collapsed)
self._sidebarCollapsed = (collapsed == true)
local sbW = self._sidebarCollapsed and 50 or (self._sizePreset and self._sizePreset.SidebarWidth or 190)
if self._sidebar then
self._sidebar.Size = UDim2.new(0, sbW, 1, 0)
end
if self._contentArea then
self._contentArea.Size = UDim2.new(1, -sbW, 1, 0)
self._contentArea.Position = UDim2.new(0, sbW, 0, 0)
end
if self._tabGroupsScroll then
local p = self._tabGroupsScroll:FindFirstChildOfClass("UIPadding")
if p then
p.PaddingLeft = UDim.new(0, self._sidebarCollapsed and 4 or 8)
p.PaddingRight = UDim.new(0, self._sidebarCollapsed and 4 or 8)
end
end
if self._profileCard then
self._profileCard.Size = self._sidebarCollapsed and UDim2.new(0, 36, 0, 36) or UDim2.new(1, -16, 0, 46)
self._profileCard.Position = self._sidebarCollapsed and UDim2.new(0.5, -18, 1, -44) or UDim2.new(0, 8, 1, -52)
local av = self._profileCard:FindFirstChild("Avatar")
if av then
av.Size = self._sidebarCollapsed and UDim2.new(0, 28, 0, 28) or UDim2.new(0, 32, 0, 32)
av.Position = self._sidebarCollapsed and UDim2.new(0.5, -14, 0.5, -14) or UDim2.new(0, 7, 0.5, -16)
end
local dName = self._profileCard:FindFirstChild("DisplayName")
local uName = self._profileCard:FindFirstChild("Username")
if dName then dName.Visible = not self._sidebarCollapsed end
if uName then uName.Visible = not self._sidebarCollapsed end
end
for _, tabGroup in ipairs(self._tabGroups or {}) do
if tabGroup._header then
tabGroup._header.Visible = not self._sidebarCollapsed
end
end
for _, tab in ipairs(self._allTabs or {}) do
if tab._button then
tab._button.Size = self._sidebarCollapsed and UDim2.new(0, 38, 0, 38) or UDim2.new(1, 0, 0, 32)
tab._button.Position = self._sidebarCollapsed and UDim2.new(0.5, -19, 0, 0) or UDim2.new(0, 0, 0, 0)
local corner = tab._button:FindFirstChildOfClass("UICorner")
if corner then
corner.CornerRadius = UDim.new(0, self._sidebarCollapsed and 8 or 6)
end
end
if tab._titleLabel then
tab._titleLabel.Visible = not self._sidebarCollapsed
end
if tab._activeBar then
tab._activeBar.Visible = (not self._sidebarCollapsed) and (self._activeTab == tab)
end
if tab._iconLabel then
tab._iconLabel.Position = self._sidebarCollapsed and UDim2.new(0.5, -9, 0.5, -9) or UDim2.new(0, 10, 0.5, -9)
tab._iconLabel.Size = self._sidebarCollapsed and UDim2.new(0, 18, 0, 18) or UDim2.new(0, 16, 0, 16)
if self._activeTab == tab then
tab._iconLabel.ImageColor3 = Color3.fromRGB(160, 180, 255)
else
tab._iconLabel.ImageColor3 = Color3.fromRGB(130, 140, 160)
end
end
end
end
function Window:ToggleSidebar()
self:SetSidebarCollapsed(not self._sidebarCollapsed)
end
function Window:SetTwoColumnsMode(enabled)
self._forceTwoColumns = enabled
for _, tab in ipairs(self._allTabs or {}) do
if tab._layoutEngine and tab._layoutEngine.SetTwoColumns then
tab._layoutEngine:SetTwoColumns(enabled)
end
end
if self._layoutModeDropdown then
self._layoutModeDropdown:SetValue(enabled and "2 Column (Kiri & Kanan)" or "1 Column (1 Baris Lurus)")
end
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
local dev = string.lower(preset.Name)
local isTwoCols = (dev == "pc" or dev == "tablet")
self:SetTwoColumnsMode(isTwoCols)
if self._layoutModeDropdown and self._layoutModeDropdown.SetValue then
self._layoutModeDropdown:SetValue(isTwoCols and "2 Column (Kiri & Kanan)" or "1 Column (1 Baris Lurus)")
end
if self._scaleSlider and self._scaleSlider.SetValue then
local targetVal = math.floor((preset.Scale * 100) + 0.5)
self._scaleSlider:SetValue(targetVal)
end
if self._mobilePin and self._mobilePin.SetScale then
self._mobilePin:SetScale(preset.Scale)
end
if self._profileCard then
local isSmall = sbW < 180
local dName = self._profileCard:FindFirstChild("DisplayName")
local uName = self._profileCard:FindFirstChild("Username")
if dName then dName.TextSize = isSmall and 10 or 12 end
if uName then uName.TextSize = isSmall and 9 or 10 end
end
end
function Window:SetScale(scaleFactor, skipSlider)
local num = math.clamp(tonumber(scaleFactor) or 1.0, 0.5, 1.5)
self._baseScale = num
self._uiScale.Scale = num
if not skipSlider and self._scaleSlider and self._scaleSlider.SetValue then
local targetVal = math.floor((num * 100) + 0.5)
if self._scaleSlider:GetValue() ~= targetVal then
self._scaleSlider:SetValue(targetVal)
end
end
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
function Window:GetUserProfile()
local realPlayer = Players.LocalPlayer or Players:GetPlayers()[1]
if not realPlayer then
return {
DisplayName = "",
Username = "",
UserId = 0,
AccountAge = 0,
}
end
return {
DisplayName = realPlayer.DisplayName,
Username = "@" .. realPlayer.Name,
UserId = realPlayer.UserId,
AccountAge = realPlayer.AccountAge,
}
end
function Window:ShowProfileModal()
if self._userTab then
self:_setActiveTab(self._userTab)
return
end
local realPlayer = Players.LocalPlayer or Players:GetPlayers()[1]
if not realPlayer then return end
local dName = realPlayer.DisplayName
local uName = "@" .. realPlayer.Name
local uid = tostring(realPlayer.UserId)
local age = tostring(realPlayer.AccountAge) .. " days"
local isPrem = realPlayer.MembershipType == Enum.MembershipType.Premium
local status = isPrem and "Roblox Premium" or "Standard Account"
self:ShowModal({
Title = "User Profile",
Message = string.format("Account: %s (%s)\nUser ID: %s\nAccount Age: %s\nStatus: %s", dName, uName, uid, age, status),
ConfirmText = "Copy User ID",
CancelText = "Close",
OnConfirm = function()
local setClip = setclipboard or toclipboard or (Clipboard and Clipboard.set)
if setClip then
setClip(uid)
self:Notify({ Title = "Copied", Content = "User ID copied to clipboard!", Duration = 2 })
end
end
})
end
function Window:GetUniversalGroup()
return self._universalGroup
end
function Window:GetUserProfileTab()
return self._userTab
end
function Window:GetUserTab()
return self._userTab
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
local bannerImage = options.Banner or options.BannerImage or "rbxassetid://108339444679489"
local bannerTitle = options.BannerTitle or "LiyHub Announcement"
local bannerDesc = options.BannerDesc or "Universal high-performance script framework engineered by Than & aeris. Minimalist pure B&W design, vector typography, and native stealth architecture."
local univGroupName = options.UniversalGroupName or options.UniversalTitle or "Liyhub"
local univGroup = self:CreateTabGroup(univGroupName)
self._universalGroup = univGroup
local userTab = univGroup:CreateTab({
Name = "User Profile",
Icon = "user",
})
self._userTab = userTab
local realPlayer = Players.LocalPlayer or Players:GetPlayers()[1]
local dispName = realPlayer and realPlayer.DisplayName or "Player"
local rawName = realPlayer and ("@" .. realPlayer.Name) or "@Unknown"
local userIdStr = realPlayer and tostring(realPlayer.UserId) or "0"
local accountAgeStr = realPlayer and (tostring(realPlayer.AccountAge) .. " days") or "N/A"
local isRobloxPremium = realPlayer and (realPlayer.MembershipType == Enum.MembershipType.Premium)
local accountStatusStr = isRobloxPremium and "Roblox Premium" or "Standard Account"
local genv = (getgenv and getgenv()) or {}
local drmKey = genv.LiyHubKey or _G.LiyHubKey or shared.LiyHubKey or "FREE-FOR-ALL"
local drmTier = genv.LiyHubTier or _G.LiyHubTier or shared.LiyHubTier or (genv.LiyHubIsPremium and "VIP" or "Freemium")
local drmRemaining = genv.LiyHubRemainingTime or (genv.LiyHubRemainingSeconds and string.format("%dh %dm", math.floor(genv.LiyHubRemainingSeconds / 3600), math.floor((genv.LiyHubRemainingSeconds % 3600) / 60))) or "Lifetime"
local isDrmPremium = (genv.LiyHubIsPremium == true) or (_G.LiyHubIsPremium == true) or string.find(string.lower(tostring(drmTier)), "premium") ~= nil or string.find(string.lower(tostring(drmTier)), "vip") ~= nil
local drmStatusStr = isDrmPremium and "Premium Active" or "Freemium Active"
local executionsCount = genv.LiyHubExecutionCount or _G.LiyHubExecutionCount
if not executionsCount then
local trackedCount = 1
pcall(function()
if isfile and readfile and isfile("liyhub_executions.txt") then
local saved = tonumber(readfile("liyhub_executions.txt"))
if saved then
trackedCount = saved + 1
end
end
if writefile then
writefile("liyhub_executions.txt", tostring(trackedCount))
end
end)
executionsCount = trackedCount
end
local function getActiveExecutorName()
local detectedName = nil
pcall(function()
if identifyexecutor then
detectedName = identifyexecutor()
elseif getexecutorname then
detectedName = getexecutorname()
elseif identify_executor then
detectedName = identify_executor()
elseif get_executor_name then
detectedName = get_executor_name()
elseif syn and syn.request then
detectedName = "Synapse X"
elseif SENTINEL_LOADED then
detectedName = "Sentinel"
elseif KRNL_LOADED then
detectedName = "Krnl"
elseif is_sirhurt_closure then
detectedName = "SirHurt"
elseif fluxus then
detectedName = "Fluxus"
elseif delta then
detectedName = "Delta"
elseif arceus then
detectedName = "Arceus X"
elseif Codex then
detectedName = "Codex"
elseif is_electron_closure then
detectedName = "Electron"
elseif solara then
detectedName = "Solara"
elseif celery then
detectedName = "Celery"
elseif RunService:IsStudio() then
detectedName = "Roblox Studio"
end
end)
if not detectedName and genv.LiyHubExecutorName then
detectedName = genv.LiyHubExecutorName
end
return detectedName or "Roblox Client"
end
local executorName = getActiveExecutorName()
local activeGameName = "Experience"
pcall(function()
local productInfo = MarketplaceService:GetProductInfo(game.PlaceId)
if productInfo and productInfo.Name then
activeGameName = productInfo.Name
end
end)
if activeGameName == "Experience" and game.Name and game.Name ~= "" then
activeGameName = game.Name
end
local placeIdNum = tostring(game.PlaceId)
local gameIdNum = tostring(game.GameId)
local serverJobId = (game.JobId and game.JobId ~= "") and game.JobId or "Local Server / Studio"
local accountSec = userTab:CreateSection("Account Identity")
accountSec:CreateParagraph({
Title = dispName .. " (" .. rawName .. ")",
Content = string.format("User ID: %s\nAccount Age: %s\nRoblox Status: %s", userIdStr, accountAgeStr, accountStatusStr),
})
accountSec:CreateButton({
Name = "Copy User ID",
Desc = "Roblox Account Identifier: " .. userIdStr,
ButtonText = "Copy",
Callback = function()
local copyFn = setclipboard or toclipboard or (Clipboard and Clipboard.set)
if copyFn then
copyFn(userIdStr)
self:Notify({
Title = "Copied",
Content = "User ID copied to clipboard!",
Duration = 2,
})
end
end,
})
local drmSec = userTab:CreateSection("DRM License & Security")
drmSec:CreateParagraph({
Title = "Tier: " .. tostring(drmTier) .. " (" .. drmStatusStr .. ")",
Content = string.format("License Key: %s\nValid Time: %s\nTotal Executions: %s", tostring(drmKey), tostring(drmRemaining), tostring(executionsCount) .. (tonumber(executionsCount) == 1 and " execution" or " executions")),
})
drmSec:CreateButton({
Name = "Copy License Key",
Desc = tostring(drmKey),
ButtonText = "Copy",
Callback = function()
local copyFn = setclipboard or toclipboard or (Clipboard and Clipboard.set)
if copyFn then
copyFn(tostring(drmKey))
self:Notify({
Title = "Copied",
Content = "License key copied to clipboard!",
Duration = 2,
})
end
end,
})
local envSec = userTab:CreateSection("Game & Environment")
envSec:CreateParagraph({
Title = activeGameName,
Content = string.format("Executor: %s\nPlace ID: %s\nUniverse ID: %s\nJob ID: %s", tostring(executorName), placeIdNum, gameIdNum, serverJobId),
})
envSec:CreateButton({
Name = "Copy Server Job ID",
Desc = serverJobId,
ButtonText = "Copy",
Callback = function()
local copyFn = setclipboard or toclipboard or (Clipboard and Clipboard.set)
if copyFn then
copyFn(serverJobId)
self:Notify({
Title = "Copied",
Content = "Server Job ID copied to clipboard!",
Duration = 2,
})
end
end,
})
local infoTab = univGroup:CreateTab({
Name = "Information",
Icon = "info",
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
Icon = "settings",
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
local layoutModeDropdown = devSec:CreateDropdown({
Name = "Layout Structure Mode",
Options = { "2 Column (Kiri & Kanan)", "1 Column (1 Baris Lurus)" },
Default = (self._currentDevice == "Android") and "1 Column (1 Baris Lurus)" or "2 Column (Kiri & Kanan)",
Callback = function(choice)
local isTwo = string.find(choice, "2") ~= nil
self:SetTwoColumnsMode(isTwo)
self:Notify({
Title = "Layout Mode",
Content = isTwo and "Struktur diubah ke 2 Kolom (Kiri & Kanan)" or "Struktur diubah ke 1 Kolom (1 Baris Lurus)",
Duration = 2,
})
end
})
self._layoutModeDropdown = layoutModeDropdown
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
local scaleSlider = devSec:CreateSlider({
Name = "UI Scale Multiplier",
Min = 70,
Max = 140,
Default = 100,
Unit = "%",
Callback = function(val)
self:SetScale(val / 100, true)
end
})
self._scaleSlider = scaleSlider
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
_header = gHeader,
_tabsFrame = tabsFrame,
_arrow = gArrow,
_collapsed = false,
_tabs = {},
}, TabGroup)
if self._tabGroups then
table.insert(self._tabGroups, tabGroupObj)
end
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
function Window:ToggleTheme()
if self._currentThemeMode == "Light" then
self:SetTheme("Dark")
else
self:SetTheme("Light")
end
end
function Window:SetTheme(themeNameOrTable)
local ThemeManager = self._themeManager
if not ThemeManager then
local okTM, resTM = pcall(function() return require(script.Parent.Parent.themes.ThemeManager) end)
ThemeManager = okTM and resTM
end
local targetTheme = nil
local targetMode = "Dark"
if type(themeNameOrTable) == "string" then
local lower = string.lower(themeNameOrTable)
if lower == "light" or lower == "pure white" or (string.find(lower, "white") and not string.find(lower, "black")) then
targetMode = "Light"
targetTheme = ThemeManager and ThemeManager.Themes["Pure White"]
else
targetMode = "Dark"
targetTheme = ThemeManager and ThemeManager.Themes["Pure Black & White"]
end
elseif type(themeNameOrTable) == "table" then
targetTheme = themeNameOrTable
local nameLower = targetTheme.Name and string.lower(targetTheme.Name) or ""
targetMode = (targetTheme.IsLight == true or nameLower == "pure white" or (string.find(nameLower, "white") and not string.find(nameLower, "black"))) and "Light" or "Dark"
end
if not targetTheme and ThemeManager then
targetTheme = ThemeManager:GetTheme()
end
if not targetTheme then return end
self._theme = targetTheme
self._currentThemeMode = targetMode
local isDark = (targetMode == "Dark")
local btnBg = isDark and Color3.fromRGB(24, 25, 32) or Color3.fromRGB(235, 238, 244)
local btnHov = isDark and Color3.fromRGB(36, 38, 48) or Color3.fromRGB(222, 226, 234)
local iconCol = isDark and Color3.fromRGB(200, 205, 215) or Color3.fromRGB(45, 50, 60)
self._controlBtnBg = btnBg
self._controlBtnHover = btnHov
self._controlIconColor = iconCol
TweenService:Create(self._mainFrame, TweenInfo.new(0.2), { BackgroundColor3 = targetTheme.Background }):Play()
if self._mainStroke then
TweenService:Create(self._mainStroke, TweenInfo.new(0.2), { Color = targetTheme.BorderWindow }):Play()
end
if self._header then
TweenService:Create(self._header, TweenInfo.new(0.2), { BackgroundColor3 = targetTheme.Header }):Play()
end
if self._headerFlatBottom then
self._headerFlatBottom.BackgroundColor3 = targetTheme.Header
end
if self._headerDivider then
self._headerDivider.BackgroundColor3 = targetTheme.Border
end
if self._titleLabel then
self._titleLabel.TextColor3 = targetTheme.TextPrimary
if self._formatHeaderTitle then
self._titleLabel.Text = self._formatHeaderTitle(isDark)
end
end
if self._subLabel then
self._subLabel.TextColor3 = targetTheme.TextMuted
end
if self._sidebar then
TweenService:Create(self._sidebar, TweenInfo.new(0.2), { BackgroundColor3 = targetTheme.Sidebar }):Play()
end
if self._sidebarFlatTop then
self._sidebarFlatTop.BackgroundColor3 = targetTheme.Sidebar
end
if self._sidebarFlatRight then
self._sidebarFlatRight.BackgroundColor3 = targetTheme.Sidebar
end
if self._sidebarStroke then
TweenService:Create(self._sidebarStroke, TweenInfo.new(0.2), { Color = targetTheme.Border }):Play()
end
if self._contentArea then
self._contentArea.BackgroundColor3 = targetTheme.Background
end
if self._profileCard then
TweenService:Create(self._profileCard, TweenInfo.new(0.2), { BackgroundColor3 = targetTheme.SidebarItem }):Play()
local dName = self._profileCard:FindFirstChild("DisplayName")
local uName = self._profileCard:FindFirstChild("Username")
if dName then dName.TextColor3 = targetTheme.TextPrimary end
if uName then uName.TextColor3 = targetTheme.TextMuted end
local pStroke = self._profileCard:FindFirstChildOfClass("UIStroke")
if pStroke then pStroke.Color = targetTheme.Border end
local av = self._profileCard:FindFirstChild("Avatar")
if av then av.BackgroundColor3 = targetTheme.Header end
end
if self._themeBtn then
self._themeBtn.BackgroundColor3 = btnBg
end
if self._minBtn then
self._minBtn.BackgroundColor3 = btnBg
local line = self._minBtn:FindFirstChild("IconLine")
if line then line.BackgroundColor3 = iconCol end
end
if self._closeBtn then
self._closeBtn.BackgroundColor3 = btnBg
local cross = self._closeBtn:FindFirstChild("IconCross")
if cross then
local b1 = cross:FindFirstChild("Bar1")
local b2 = cross:FindFirstChild("Bar2")
if b1 then b1.BackgroundColor3 = iconCol end
if b2 then b2.BackgroundColor3 = iconCol end
end
end
if self._renderThemeIcon then
self._renderThemeIcon(isDark)
end
if self._gripIcon then
self._gripIcon.ImageColor3 = isDark and Color3.fromRGB(140, 155, 180) or Color3.fromRGB(80, 90, 110)
end
if self._logoStroke then
self._logoStroke.Color = isDark and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(18, 20, 24)
end
if self._mobilePin and self._mobilePin.SetTheme then
self._mobilePin:SetTheme(targetTheme, isDark)
end
for _, tabGroup in ipairs(self._tabGroups or {}) do
if tabGroup._header then
local gTitle = tabGroup._header:FindFirstChild("Title")
if gTitle then gTitle.TextColor3 = targetTheme.TextMuted end
local gArrow = tabGroup._header:FindFirstChild("Arrow")
if gArrow then gArrow.ImageColor3 = targetTheme.TextMuted end
end
end
for _, tab in ipairs(self._allTabs or {}) do
if tab == self._activeTab then
tab:_activate()
else
tab:_deactivate()
end
if tab._contentContainer then
tab._contentContainer.BackgroundColor3 = targetTheme.Background
end
for _, section in ipairs(tab._sections or {}) do
self:_applyThemeToSection(section, targetTheme, isDark)
end
for _, banner in ipairs(tab._banners or {}) do
self:_applyThemeToBanner(banner, targetTheme, isDark)
end
end
end
function Window:_applyThemeToBanner(banner, targetTheme, isDark)
if not banner or not banner._container then return end
banner._container.BackgroundColor3 = targetTheme.Card
local stroke = banner._container:FindFirstChildOfClass("UIStroke")
if stroke then
stroke.Color = targetTheme.Border
end
local header = banner._container:FindFirstChild("Header")
if header then
local title = header:FindFirstChild("Title")
if title then
title.TextColor3 = targetTheme.TextPrimary
end
local arrow = header:FindFirstChild("Arrow")
if arrow then
arrow.ImageColor3 = targetTheme.TextMuted
end
end
local contentBox = banner._container:FindFirstChild("ContentBox")
if contentBox then
local imgFrame = contentBox:FindFirstChild("ImageFrame")
if imgFrame then
imgFrame.BackgroundColor3 = targetTheme.Header
end
local textContainer = contentBox:FindFirstChild("TextContainer")
if textContainer then
local desc = textContainer:FindFirstChild("Description")
if desc then
desc.TextColor3 = targetTheme.TextSecondary
end
end
end
end
function Window:_applyThemeToSection(section, targetTheme, isDark)
if not section then return end
if section._container then
section._container.BackgroundColor3 = targetTheme.Card
local secStroke = section._container:FindFirstChildOfClass("UIStroke")
if secStroke then
secStroke.Color = targetTheme.Border
end
end
if section._title then
section._title.TextColor3 = targetTheme.TextPrimary
end
if section._arrow then
section._arrow.ImageColor3 = targetTheme.TextSecondary
end
if section._icon then
section._icon.ImageColor3 = targetTheme.TextPrimary
end
for _, comp in ipairs(section._components or {}) do
self:_applyThemeToComponent(comp, targetTheme, isDark)
end
if section._body then
self:_walkAndThemeDescendants(section._body, targetTheme, isDark)
end
end
function Window:_applyThemeToComponent(comp, targetTheme, isDark)
if not comp or type(comp) ~= "table" then return end
comp._theme = targetTheme
if comp._container and comp._container.Name == "Banner" then
self:_applyThemeToBanner(comp, targetTheme, isDark)
return
end
if comp._container then
local c = comp._container
if c:IsA("GuiObject") then
if comp._isPrimary then
c.BackgroundColor3 = isDark and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(20, 22, 26)
elseif comp._isPrimary == false or c.Name:find("ActionRow_") or c.Name:find("Paragraph_") or c.Name:find("Toggle_") or c.Name:find("Slider_") or c.Name:find("Input_") or c.Name:find("Keybind_") or c.Name:find("Button_") then
c.BackgroundColor3 = targetTheme.Element
end
end
local cStroke = c:FindFirstChildOfClass("UIStroke")
if cStroke then
cStroke.Color = targetTheme.Border
end
end
if comp._actionBtn then
comp._actionBtn.BackgroundColor3 = isDark and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(18, 20, 24)
comp._actionBtn.TextColor3 = isDark and Color3.fromRGB(14, 14, 16) or Color3.fromRGB(255, 255, 255)
end
if comp._label and comp._container and comp._container:IsA("TextButton") then
if not isDark then
comp._container.BackgroundColor3 = Color3.fromRGB(18, 20, 24)
comp._label.TextColor3 = Color3.fromRGB(255, 255, 255)
local st = comp._container:FindFirstChildOfClass("UIStroke")
if st then st.Enabled = false end
else
local isPri = comp._isPrimary
comp._container.BackgroundColor3 = isPri and Color3.fromRGB(255, 255, 255) or targetTheme.Element
comp._label.TextColor3 = isPri and Color3.fromRGB(14, 14, 16) or targetTheme.TextPrimary
local st = comp._container:FindFirstChildOfClass("UIStroke")
if st then
st.Enabled = not isPri
st.Color = targetTheme.Border
end
end
end
if comp._titleLabel then
comp._titleLabel.TextColor3 = targetTheme.TextPrimary
end
if comp._contentLabel then
comp._contentLabel.TextColor3 = targetTheme.TextSecondary
end
if comp._switch then
local active = comp._state == true
comp._switch.BackgroundColor3 = active and targetTheme.ToggleActive or targetTheme.ToggleInactive
if comp._switchStroke then
comp._switchStroke.Color = active and targetTheme.ToggleActive or targetTheme.ToggleBorderInactive
end
if comp._knob then
comp._knob.BackgroundColor3 = active and targetTheme.ToggleKnob or targetTheme.ToggleKnobInactive
end
end
if comp._track then
comp._track.BackgroundColor3 = isDark and Color3.fromRGB(20, 22, 30) or Color3.fromRGB(222, 226, 234)
if comp._trackStroke then
comp._trackStroke.Color = isDark and Color3.fromRGB(36, 40, 56) or Color3.fromRGB(205, 210, 220)
end
if comp._fill then
comp._fill.BackgroundColor3 = targetTheme.SliderFill
end
local valLabel = comp._track:FindFirstChild("Value")
if valLabel then
valLabel.TextColor3 = targetTheme.TextPrimary
end
end
if comp._boxBg then
comp._boxBg.BackgroundColor3 = targetTheme.Card
local bStroke = comp._boxBg:FindFirstChildOfClass("UIStroke")
if bStroke then
bStroke.Color = targetTheme.Border
end
end
if comp._textBox then
comp._textBox.TextColor3 = targetTheme.TextPrimary
comp._textBox.PlaceholderColor3 = targetTheme.TextMuted
end
if comp._selectBox then
comp._selectBox.BackgroundColor3 = targetTheme.Element
local sbStroke = comp._selectBox:FindFirstChildOfClass("UIStroke")
if sbStroke then
sbStroke.Color = targetTheme.Border
end
if comp._selectionLabel then
comp._selectionLabel.TextColor3 = targetTheme.TextSecondary
end
if comp._chevron then
comp._chevron.ImageColor3 = targetTheme.TextMuted
end
end
if comp._listContainer then
comp._listContainer.BackgroundColor3 = targetTheme.Card
local lcStroke = comp._listContainer:FindFirstChildOfClass("UIStroke")
if lcStroke then
lcStroke.Color = targetTheme.Border
end
end
if comp._keyButton then
comp._keyButton.BackgroundColor3 = targetTheme.Card
comp._keyButton.TextColor3 = targetTheme.TextPrimary
local kbStroke = comp._keyButton:FindFirstChildOfClass("UIStroke")
if kbStroke then
kbStroke.Color = targetTheme.Border
end
end
if comp._items then
for _, item in ipairs(comp._items) do
self:_applyThemeToComponent(item, targetTheme, isDark)
end
end
if comp._buttons then
for _, btn in ipairs(comp._buttons) do
self:_applyThemeToComponent(btn, targetTheme, isDark)
end
end
end
function Window:_walkAndThemeDescendants(rootInstance, targetTheme, isDark)
if not rootInstance then return end
for _, desc in ipairs(rootInstance:GetDescendants()) do
if desc.Name == "Banner" and desc:IsA("Frame") then
desc.BackgroundColor3 = targetTheme.Card
local s = desc:FindFirstChildOfClass("UIStroke")
if s then s.Color = targetTheme.Border end
end
if desc:IsA("UIStroke") then
if desc.Name == "BorderStroke" or desc.Name == "SectionStroke" or desc.Name == "ProfileStroke" then
desc.Color = targetTheme.Border
end
elseif desc:IsA("TextButton") and (desc.Name:find("Button_") or desc.Name == "ActionButton") then
desc.BackgroundColor3 = isDark and Color3.fromRGB(22, 22, 27) or Color3.fromRGB(236, 238, 243)
if desc.Name == "ActionButton" then
desc.TextColor3 = isDark and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(18, 20, 24)
end
local st = desc:FindFirstChildOfClass("UIStroke")
if st then
st.Color = isDark and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(18, 20, 24)
st.Enabled = true
end
elseif desc:IsA("TextLabel") then
if desc.Name == "Label" and desc.Parent and desc.Parent:IsA("TextButton") and desc.Parent.Name:find("Button_") then
desc.TextColor3 = isDark and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(18, 20, 24)
elseif desc.Name == "Title" or desc.Name == "Name" or desc.Name == "DisplayName" then
desc.TextColor3 = targetTheme.TextPrimary
elseif desc.Name == "Description" or desc.Name == "Desc" or desc.Name == "Content" or desc.Name == "Username" or desc.Name == "Subtitle" then
desc.TextColor3 = targetTheme.TextSecondary
elseif desc.Name == "SelectionLabel" then
desc.TextColor3 = targetTheme.TextSecondary
end
elseif desc:IsA("ImageLabel") then
if desc.Name == "Arrow" or desc.Name == "Chevron" then
desc.ImageColor3 = targetTheme.TextMuted
end
end
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
function TabGroup:CreateTab(options)
local name = type(options) == "table" and (options.Name or options.Text) or tostring(options)
local iconId = type(options) == "table" and (options.Icon or options.Image) or nil
local devName = string.lower(self._window._currentDevice or "pc")
local defaultTwoCols = (devName == "pc" or devName == "tablet")
local twoColumns = defaultTwoCols
if type(options) == "table" and options.TwoColumns ~= nil then
twoColumns = options.TwoColumns
end
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
local isDarkTab = (self._window._currentThemeMode ~= "Light")
local activeBar = Instance.new("Frame")
activeBar.Name = "ActiveBar"
activeBar.Size = UDim2.new(0, 3, 0, 18)
activeBar.Position = UDim2.new(0, 0, 0.5, -9)
activeBar.BackgroundColor3 = isDarkTab and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(20, 22, 26)
activeBar.BorderSizePixel = 0
activeBar.Visible = false
activeBar.Parent = tabBtn
local barCorner = Instance.new("UICorner")
barCorner.CornerRadius = UDim.new(1, 0)
barCorner.Parent = activeBar
local tabStroke = Instance.new("UIStroke")
tabStroke.Name = "ActiveStroke"
tabStroke.Color = self._window._theme.Border
tabStroke.Thickness = 1
tabStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
tabStroke.Enabled = false
tabStroke.Parent = tabBtn
local iconLabel = nil
local labelOffset = 10
if iconId then
iconLabel = Instance.new("ImageLabel")
iconLabel.Name = "Icon"
iconLabel.Size = UDim2.new(0, 18, 0, 18)
iconLabel.Position = UDim2.new(0, 10, 0.5, -9)
iconLabel.BackgroundTransparency = 1
iconLabel.ScaleType = Enum.ScaleType.Fit
iconLabel.Parent = tabBtn
local iconService = self._window._iconService
if iconService and iconService.Apply then
iconService.Apply(iconLabel, iconId, Color3.fromRGB(130, 140, 160))
else
iconLabel.Image = tostring(iconId)
iconLabel.ImageColor3 = Color3.fromRGB(130, 140, 160)
end
labelOffset = 34
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
_banners = {},
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
if self._window._allTabs then
table.insert(self._window._allTabs, tabObj)
end
if not self._window._activeTab then
self._window:_setActiveTab(tabObj)
end
return tabObj
end
function Tab:_activate()
local curTheme = self._window._theme
local isDark = (self._window._currentThemeMode ~= "Light")
self._button.BackgroundTransparency = 0
self._button.BackgroundColor3 = isDark and Color3.fromRGB(28, 28, 34) or Color3.fromRGB(255, 255, 255)
local aStroke = self._button:FindFirstChild("ActiveStroke")
if aStroke then
aStroke.Enabled = not isDark
aStroke.Color = curTheme.Border
end
self._titleLabel.TextColor3 = curTheme.TextPrimary
self._titleLabel.Font = curTheme.FontBold
self._activeBar.Visible = not self._window._sidebarCollapsed
self._activeBar.BackgroundColor3 = isDark and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(20, 22, 26)
if self._iconLabel then
self._iconLabel.ImageColor3 = isDark and Color3.fromRGB(180, 200, 255) or Color3.fromRGB(20, 22, 26)
end
self._contentContainer.Visible = true
end
function Tab:_deactivate()
local curTheme = self._window._theme
local isDark = (self._window._currentThemeMode ~= "Light")
self._button.BackgroundTransparency = 1
local aStroke = self._button:FindFirstChild("ActiveStroke")
if aStroke then
aStroke.Enabled = false
end
self._titleLabel.TextColor3 = curTheme.TextMuted
self._titleLabel.Font = curTheme.FontRegular
self._activeBar.Visible = false
self._activeBar.BackgroundColor3 = isDark and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(20, 22, 26)
if self._iconLabel then
self._iconLabel.ImageColor3 = isDark and Color3.fromRGB(130, 140, 160) or Color3.fromRGB(130, 136, 148)
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
if banner and banner._container then
if self._layoutEngine and self._layoutEngine.RegisterSectionInstance then
self._layoutEngine:RegisterSectionInstance(banner._container)
end
end
if self._banners then
table.insert(self._banners, banner)
end
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
if self._layoutEngine and self._layoutEngine.RegisterSectionInstance then
self._layoutEngine:RegisterSectionInstance(sectionCard)
end
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
local sHeader = Instance.new("TextButton")
sHeader.Name = "Header"
sHeader.Size = UDim2.new(1, 0, 0, 22)
sHeader.BackgroundTransparency = 1
sHeader.AutoButtonColor = false
sHeader.Text = ""
sHeader.Parent = sectionCard
local secOffset = 0
local secIcon = sectionOptions.Icon or sectionOptions.Image
local sImg = nil
if secIcon then
local iconService = self._window._iconService
sImg = Instance.new("ImageLabel")
sImg.Name = "SectionIcon"
sImg.Size = UDim2.fromOffset(14, 14)
sImg.Position = UDim2.new(0, 0, 0.5, -7)
sImg.BackgroundTransparency = 1
sImg.ScaleType = Enum.ScaleType.Fit
sImg.Parent = sHeader
if iconService and iconService.Apply then
iconService.Apply(sImg, secIcon, self._window._theme.TextPrimary)
else
sImg.Image = tostring(secIcon)
sImg.ImageColor3 = self._window._theme.TextPrimary
end
secOffset = 20
end
local sTitle = Instance.new("TextLabel")
sTitle.Name = "Title"
sTitle.Size = UDim2.new(1, -24 - secOffset, 1, 0)
sTitle.Position = UDim2.new(0, secOffset, 0, 0)
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
_header = sHeader,
_title = sTitle,
_arrow = sArrow,
_icon = sImg,
_body = sBody,
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
local Row = {}
Row.__index = Row
function Row.new(parent, theme, cleanup, components)
local rowFrame = Instance.new("Frame")
rowFrame.Name = "Row"
rowFrame.Size = UDim2.new(1, 0, 0, theme.SmallElementHeight or 34)
rowFrame.BackgroundTransparency = 1
rowFrame.BorderSizePixel = 0
rowFrame.Parent = parent
local rList = Instance.new("UIListLayout")
rList.FillDirection = Enum.FillDirection.Horizontal
rList.SortOrder = Enum.SortOrder.LayoutOrder
rList.Padding = UDim.new(0, 6)
rList.Parent = rowFrame
local self = setmetatable({
_container = rowFrame,
_theme = theme,
_cleanup = cleanup,
_components = components,
_items = {},
}, Row)
if cleanup then
cleanup:Add(rowFrame)
end
return self
end
function Row:_rebalance()
local count = #self._items
if count == 0 then return end
local gapTotal = (count - 1) * 6
local widthScale = 1 / count
for _, item in ipairs(self._items) do
local target = item._container or item
if target and target:IsA("GuiObject") then
target.Size = UDim2.new(widthScale, -math.floor(gapTotal / count), 1, 0)
end
end
end
function Row:AddToggle(options)
local tog = self._components.Toggle.new(self._container, options, self._theme, self._cleanup)
table.insert(self._items, tog)
self:_rebalance()
return tog
end
function Row:AddKeybind(options)
local key = self._components.Keybind.new(self._container, options, self._theme, self._cleanup)
table.insert(self._items, key)
self:_rebalance()
return key
end
function Row:AddButton(options)
local btn = self._components.Button.new(self._container, options, self._theme, self._cleanup)
table.insert(self._items, btn)
self:_rebalance()
return btn
end
function Row:AddSlider(options)
local sld = self._components.Slider.new(self._container, options, self._theme, self._cleanup)
table.insert(self._items, sld)
self:_rebalance()
return sld
end
function Row:AddDropdown(options)
local drp = self._components.Dropdown.new(self._container, options, self._theme, self._cleanup)
table.insert(self._items, drp)
self:_rebalance()
return drp
end
function Row:AddInput(options)
local inp = self._components.Input.new(self._container, options, self._theme, self._cleanup)
table.insert(self._items, inp)
self:_rebalance()
return inp
end
Row.AddTextbox = Row.AddInput
function Row:AddColorPicker(options)
local cp = self._components.ColorPicker.new(self._container, options, self._theme, self._cleanup)
table.insert(self._items, cp)
self:_rebalance()
return cp
end
function Row:Destroy()
if self._container then
self._container:Destroy()
self._container = nil
end
end
local Label = {}
Label.__index = Label
function Label.new(parent, options, theme, cleanup, section)
local text = type(options) == "table" and (options.Text or options.Name or options.Title or "") or tostring(options or "")
local desc = type(options) == "table" and (options.Desc or options.Description) or nil
local container = Instance.new("Frame")
container.Name = "LabelCard"
container.Size = UDim2.new(1, 0, 0, desc and 38 or 26)
container.BackgroundColor3 = theme.Element
container.BorderSizePixel = 0
container.Parent = parent
local corner = Instance.new("UICorner")
corner.CornerRadius = theme.SmallCornerRadius or UDim.new(0, 5)
corner.Parent = container
if theme.UseStrokes then
local stroke = Instance.new("UIStroke")
stroke.Name = "BorderStroke"
stroke.Color = theme.BorderSubtle or theme.Border
stroke.Thickness = 1
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
stroke.Parent = container
end
local mainLbl = Instance.new("TextLabel")
mainLbl.Name = "Text"
mainLbl.Size = UDim2.new(1, -16, 0, desc and 18 or 26)
mainLbl.Position = UDim2.new(0, 10, 0, desc and 3 or 0)
mainLbl.BackgroundTransparency = 1
mainLbl.Text = text
mainLbl.TextColor3 = theme.TextPrimary
mainLbl.Font = theme.FontRegular
mainLbl.TextSize = 11
mainLbl.TextXAlignment = Enum.TextXAlignment.Left
mainLbl.TextTruncate = Enum.TextTruncate.AtEnd
mainLbl.Parent = container
local descLbl = nil
if desc then
descLbl = Instance.new("TextLabel")
descLbl.Name = "Desc"
descLbl.Size = UDim2.new(1, -16, 0, 14)
descLbl.Position = UDim2.new(0, 10, 0, 20)
descLbl.BackgroundTransparency = 1
descLbl.Text = desc
descLbl.TextColor3 = theme.TextMuted
descLbl.Font = theme.FontRegular
descLbl.TextSize = 10
descLbl.TextXAlignment = Enum.TextXAlignment.Left
descLbl.TextTruncate = Enum.TextTruncate.AtEnd
descLbl.Parent = container
end
local self = setmetatable({
_container = container,
_mainLbl = mainLbl,
_descLbl = descLbl,
_theme = theme,
_section = section,
}, Label)
if cleanup then
cleanup:Add(container)
end
return self
end
function Label:SetText(newText)
self._mainLbl.Text = tostring(newText or "")
end
Label.Set = Label.SetText
function Label:GetText()
return self._mainLbl.Text
end
function Label:AddToggle(opt)
return self._section and self._section:CreateToggle(opt)
end
function Label:AddDropdown(opt)
return self._section and self._section:CreateDropdown(opt)
end
function Label:AddSlider(opt)
return self._section and self._section:CreateSlider(opt)
end
function Label:AddButton(opt)
return self._section and self._section:CreateButton(opt)
end
function Label:AddKeybind(opt)
return self._section and self._section:CreateKeybind(opt)
end
function Label:AddInput(opt)
return self._section and self._section:CreateInput(opt)
end
Label.AddTextbox = Label.AddInput
function Label:Destroy()
if self._container then
self._container:Destroy()
self._container = nil
end
end
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
function Section:CreateColorPicker(options)
local cp = self._window._components.ColorPicker.new(
self._body,
options,
self._window._theme,
self._window._cleanup
)
table.insert(self._components, cp)
return cp
end
function Section:CreateRow()
local row = Row.new(self._body, self._window._theme, self._window._cleanup, self._window._components)
table.insert(self._components, row)
return row
end
function Section:CreateLabel(optionsOrText)
local lbl = Label.new(self._body, optionsOrText, self._window._theme, self._window._cleanup, self)
table.insert(self._components, lbl)
return lbl
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
Section.AddColorPicker = Section.CreateColorPicker
Section.AddRow = Section.CreateRow
Section.AddLabel = Section.CreateLabel
Section.AddTextbox = Section.CreateInput
Section.CreateTextbox = Section.CreateInput
return Window
end
local PureBlackWhite = _require("src/themes/PureBlackWhite")
local PureWhite = _require("src/themes/PureWhite")
local ThemeManager = _require("src/themes/ThemeManager")
local Cleanup = _require("src/core/Cleanup")
local Signals = _require("src/core/Signals")
local TweenUtil = _require("src/core/Tween")
local Layout = _require("src/core/Layout")
local Window = _require("src/core/Window")
local ConfigService = _require("src/services/ConfigService")
local IconService = _require("src/services/IconService")
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
local ColorPicker = _require("src/components/ColorPicker")
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
Icons = IconService and IconService.UniversalEmotes,
ResolveIcon = IconService and IconService.Resolve,
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
ThemeManager = ThemeManager,
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
ColorPicker = ColorPicker,
Paragraph = Paragraph,
Divider = Divider,
Banner = Banner,
Progression = Progression,
SizeManager = SizeManager,
IconService = IconService,
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
local hub = LiyHubUI
local parentGui = nil
if hub._activeWindows and #hub._activeWindows > 0 and hub._activeWindows[1]._screenGui then
parentGui = hub._activeWindows[1]._screenGui
else
local okHui, hui = pcall(function() return gethui and gethui() end)
if okHui and hui then
parentGui = hui
else
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local pgui = player and player:FindFirstChildOfClass("PlayerGui")
parentGui = pgui or game:GetService("CoreGui")
end
end
if parentGui then
local theme = ThemeManager and ThemeManager:GetTheme()
Modal.Notify(parentGui, options, theme)
end
end
end
LiyHubUI.Create = LiyHubUI.CreateWindow
return LiyHubUI