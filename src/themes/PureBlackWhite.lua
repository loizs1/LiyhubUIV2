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
