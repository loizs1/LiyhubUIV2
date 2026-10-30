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
        DefaultBanner = "rbxasset://textures/LiyhubBanner.png",
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
