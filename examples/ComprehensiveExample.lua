local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")

pcall(function()
    for _, c in ipairs(CoreGui:GetChildren()) do
        if string.find(c.Name, "LiyHub") then
            c:Destroy()
        end
    end
end)

local lp = Players.LocalPlayer
if lp then
    local pgui = lp:FindFirstChildOfClass("PlayerGui")
    if pgui then
        for _, c in ipairs(pgui:GetChildren()) do
            if string.find(c.Name, "LiyHub") then
                c:Destroy()
            end
        end
    end
end

local LiyHubUI = require(ReplicatedStorage:WaitForChild("LiyHubUI"))

local Window = LiyHubUI:CreateWindow({
    Title = "Liyhub",
    Subtitle = "v2.2 Black & White Edition",
    ToggleKey = Enum.KeyCode.RightControl,
    MobilePin = true,
    Logo = "rbxasset://textures/LiyhubLogo.png",
    Discord = "https://discord.gg/Nr56tQJeJh",
})

local MainFeaturesGroup = Window:CreateTabGroup("Main Features")

local MainTab = MainFeaturesGroup:CreateTab({
    Name = "Main (Mode 1)",
    Icon = "rbxassetid://6031094678",
})

local FarmSection = MainTab:CreateSection("Auto Farming & Quest")

local QuestProgression = FarmSection:CreateProgression({
    Title = "Quest Journey (Auto Farm)",
    Subtitle = "Automated quest and boss combat workflow",
    Steps = {
        { Label = "Accept", Icon = "rbxassetid://6031075931" },
        { Label = "Teleport", Icon = "rbxassetid://6031075929" },
        { Label = "Farm", Icon = "rbxassetid://6031094678" },
        { Label = "Boss", Icon = "rbxassetid://6031091004" },
        { Label = "Reward", Icon = "rbxasset://textures/LiyhubLogo.png" },
    },
    CurrentStep = 1,
    Callback = function(stepIndex)
    end
})

FarmSection:CreateToggle({
    Name = "Auto Execute Step",
    Desc = "Continuously advances and completes the selected quest journey step.",
    Default = false,
    Callback = function(state)
    end
})

local farmActions = FarmSection:CreateButtonGroup({
    Buttons = {
        {
            Name = "Start Auto Farm",
            Callback = function()
            end
        },
        {
            Name = "Stop Auto Farm",
            Callback = function()
            end
        }
    }
})

FarmSection:CreateDropdown({
    Name = "Quest Difficulty",
    Options = { "Easy", "Medium", "Hard", "Nightmare" },
    Default = "Easy",
    Callback = function(selected)
    end
})

FarmSection:CreateMultiDropdown({
    Name = "Targets (Multi-Select)",
    Options = { "Pirate Raider", "Marine Captain", "Island Boss", "Elite Guard" },
    Default = { "Pirate Raider" },
    Callback = function(selectedList)
    end
})

local CombatTab = MainFeaturesGroup:CreateTab({
    Name = "Combat (Mode 2)",
    Icon = "rbxassetid://6031091004",
})

local AimSection = CombatTab:CreateSection("Aimbot & Targeting")

AimSection:CreateToggle({
    Name = "Enable Silent Aim",
    Desc = "Redirects weapon projectiles silently toward target bones.",
    Default = false,
    Callback = function(state)
    end
})

AimSection:CreateSlider({
    Name = "Aim Field of View",
    Min = 30,
    Max = 360,
    Default = 220,
    Suffix = "px",
    Callback = function(val) end
})

AimSection:CreateSlider({
    Name = "Hit Chance",
    Min = 0,
    Max = 100,
    Default = 100,
    Suffix = "%",
    Callback = function(val) end
})

AimSection:CreateSlider({
    Name = "Reaction Delay",
    Min = 0.01,
    Max = 1.00,
    Default = 0.08,
    Step = 0.01,
    Suffix = "s",
    Callback = function(val) end
})

AimSection:CreateSlider({
    Name = "Prediction Distance",
    Min = 0.0,
    Max = 50.0,
    Default = 0.0,
    Step = 0.1,
    Suffix = "studs",
    Callback = function(val) end
})

AimSection:CreateSlider({
    Name = "Camera Smoothing",
    Min = 0.0,
    Max = 20.0,
    Default = 0.0,
    Step = 0.1,
    Suffix = "studs",
    Callback = function(val) end
})

AimSection:CreateDropdown({
    Name = "Target Body Part",
    Options = { "Head", "Torso", "HumanoidRootPart" },
    Default = "Head",
    Callback = function(part)
    end
})

local WeaponSection = CombatTab:CreateSection("Weapon Modifications")

WeaponSection:CreateToggle({
    Name = "Fast Reload",
    Desc = "Eliminates reload windup and weapon cooldowns.",
    Default = false,
    Callback = function(state)
    end
})

WeaponSection:CreateToggle({
    Name = "No Spread",
    Desc = "Tightens weapon spread to exact pinpoint center.",
    Default = false,
    Callback = function(state)
    end
})

WeaponSection:CreateMultiDropdown({
    Name = "Weapon Buffs (Multi-Select)",
    Options = { "Infinite Ammo", "Rapid Fire", "Explosive Bullets" },
    Default = { "Infinite Ammo" },
    Callback = function(selectedList)
    end
})

local WorldGroup = Window:CreateTabGroup("World & Travel")

local TeleportTab = WorldGroup:CreateTab({
    Name = "Teleport",
    Icon = "rbxassetid://6031075929",
})

local IslandSection = TeleportTab:CreateSection("Island Waypoints")

IslandSection:CreateDropdown({
    Name = "Island",
    Options = { "Spawn Island", "Desert Oasis", "Sky Sanctuary" },
    Default = "Spawn Island",
    Callback = function(island)
    end
})

IslandSection:CreateDropdown({
    Name = "Method",
    Options = { "Tween Smooth", "Bypass CFrame" },
    Default = "Tween Smooth",
    Callback = function(method)
    end
})

IslandSection:CreateButton({
    Name = "Teleport to Island",
    Desc = "Travel cleanly to the selected island coordinates.",
    ButtonText = "Teleport",
    Callback = function()
    end
})
