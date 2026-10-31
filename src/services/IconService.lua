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