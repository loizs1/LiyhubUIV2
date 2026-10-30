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
