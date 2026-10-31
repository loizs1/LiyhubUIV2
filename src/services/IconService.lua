local IconService = {}

local Lucide = {
    focus = "rbxassetid://10747373176",
    crosshair = "rbxassetid://10734950309",
    target = "rbxassetid://10747373176",
    aim = "rbxassetid://10747373176",
    combat = "rbxassetid://10747373176",
    binoculars = "rbxassetid://10709774640",
    spectate = "rbxassetid://10709774640",
    palette = "rbxassetid://10734951052",
    theme = "rbxassetid://10734951052",
    visuals = "rbxassetid://10734951052",
    globe = "rbxassetid://10734950450",
    universal = "rbxassetid://10734950450",
    network = "rbxassetid://10734950450",
    server = "rbxassetid://10734950450",
    user = "rbxassetid://10734952179",
    player = "rbxassetid://10734952179",
    profile = "rbxassetid://10734952179",
    zap = "rbxassetid://10734952402",
    speed = "rbxassetid://10734952402",
    shield = "rbxassetid://10734951352",
    defense = "rbxassetid://10734951352",
    parry = "rbxassetid://10734951352",
    settings = "rbxassetid://10734950020",
    gear = "rbxassetid://10734950020",
    config = "rbxassetid://10734950020",
    swords = "rbxassetid://10734951847",
    sword = "rbxassetid://10734951847",
    eye = "rbxassetid://10734950190",
    home = "rbxassetid://10734950548",
    main = "rbxassetid://10734950548",
    pin = "rbxassetid://10734952044",
    teleport = "rbxassetid://10734952044",
    map = "rbxassetid://10734951117",
    skull = "rbxassetid://10734951467",
    star = "rbxassetid://10734951670",
    sparkles = "rbxassetid://10734951722",
    fire = "rbxassetid://10734960309",
    diamond = "rbxassetid://10734949856",
    package = "rbxassetid://10734950812",
    gamepad = "rbxassetid://10734950278",
    scroll = "rbxassetid://10734951254",
    cart = "rbxassetid://10734951560",
    tools = "rbxassetid://10734952285",
    search = "rbxassetid://10734951296",
    info = "rbxassetid://10734950669",
    bell = "rbxassetid://10734949654",
    lock = "rbxassetid://10734950897",
    check = "rbxassetid://10709790644",
    chevron = "rbxassetid://10709790948",
    arrow = "rbxassetid://10709790948",
    grip = "rbxassetid://10709791523",
    refresh = "rbxassetid://10734951199",
    trash = "rbxassetid://10734952230",
    terminal = "rbxassetid://10734952110",
    sliders = "rbxassetid://10734951515",
    layers = "rbxassetid://10734950860",
}

local Emotes = {
    ["🎯"] = Lucide.focus,
    ["⛶"] = Lucide.focus,
    ["🔭"] = Lucide.binoculars,
    ["🎨"] = Lucide.palette,
    ["🌐"] = Lucide.globe,
    ["👤"] = Lucide.user,
    ["⚡"] = Lucide.zap,
    ["🛡️"] = Lucide.shield,
    ["🛡"] = Lucide.shield,
    ["⚙️"] = Lucide.settings,
    ["⚙"] = Lucide.settings,
    ["⚔️"] = Lucide.swords,
    ["⚔"] = Lucide.swords,
    ["👁️"] = Lucide.eye,
    ["👁"] = Lucide.eye,
    ["🏠"] = Lucide.home,
    ["📍"] = Lucide.pin,
    ["🗺️"] = Lucide.map,
    ["🗺"] = Lucide.map,
    ["💀"] = Lucide.skull,
    ["⭐"] = Lucide.star,
    ["✨"] = Lucide.sparkles,
    ["🔥"] = Lucide.fire,
    ["💎"] = Lucide.diamond,
    ["📦"] = Lucide.package,
    ["🎮"] = Lucide.gamepad,
    ["📜"] = Lucide.scroll,
    ["🛒"] = Lucide.cart,
    ["🛠️"] = Lucide.tools,
    ["🔍"] = Lucide.search,
    ["ℹ️"] = Lucide.info,
    ["🔔"] = Lucide.bell,
    ["🔒"] = Lucide.lock,
    ["✓"] = Lucide.check,
}

IconService.Lucide = Lucide
IconService.Emotes = Emotes
IconService.Default = Lucide.layers

function IconService.Resolve(input)
    if not input or input == "" then return nil end
    if typeof(input) == "number" or tonumber(input) then
        return "rbxassetid://" .. tostring(input)
    end
    local s = tostring(input)
    if Emotes[s] then return Emotes[s] end
    local low = string.lower(s)
    if Lucide[low] then return Lucide[low] end
    if string.find(s, "rbxasset") or string.find(s, "http") then
        return s
    end
    local okG, getAsset = pcall(function() return getcustomasset or getsynasset end)
    if okG and typeof(getAsset) == "function" then
        local pOk, res = pcall(getAsset, s)
        if pOk and res then return res end
    end
    return Lucide.layers
end

return IconService
