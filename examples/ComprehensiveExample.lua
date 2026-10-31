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

local MainGroup = Window:CreateTabGroup("Main Features")

local MainTab = MainGroup:CreateTab({
    Name = "Main (Mode 1)",
    Icon = "focus",
})

local FarmSection = MainTab:CreateSection("Auto Farming & Quest")

local autoFarmActive = false
local autoFarmThread = nil
local stepNames = { "Accept", "Teleport", "Farm", "Boss", "Reward" }

local QuestProgression = FarmSection:CreateProgression({
    Title = "Quest Journey (Auto Farm)",
    Subtitle = "Automated quest and boss combat workflow",
    Steps = {
        { Label = "Accept", Icon = "check" },
        { Label = "Teleport", Icon = "teleport" },
        { Label = "Farm", Icon = "swords" },
        { Label = "Boss", Icon = "skull" },
        { Label = "Reward", Icon = "gem" },
    },
    CurrentStep = 1,
    Callback = function(stepIndex)
        Window:Notify({
            Title = "Quest Step Selected",
            Content = "Active step set to: " .. tostring(stepNames[stepIndex] or stepIndex),
            Duration = 1.5,
            Type = "Info"
        })
    end
})

local function stopAutoFarm()
    autoFarmActive = false
    if autoFarmThread then
        task.cancel(autoFarmThread)
        autoFarmThread = nil
    end
    Window:Notify({
        Title = "Auto Farm",
        Content = "Quest progression paused.",
        Duration = 2,
        Type = "Info"
    })
end

local function startAutoFarm()
    if autoFarmActive then return end
    autoFarmActive = true
    Window:Notify({
        Title = "Auto Farm",
        Content = "Advancing quest progression pipeline...",
        Duration = 2,
        Type = "Success"
    })
    autoFarmThread = task.spawn(function()
        while autoFarmActive do
            task.wait(1.5)
            if not autoFarmActive then break end
            local cur = QuestProgression:GetStep()
            local nxt = (cur % 5) + 1
            QuestProgression:SetStep(nxt)
        end
    end)
end

FarmSection:CreateToggle({
    Name = "Auto Execute Step",
    Desc = "Continuously advances and completes the selected quest journey step.",
    Default = false,
    Callback = function(state)
        if state then
            startAutoFarm()
        else
            stopAutoFarm()
        end
    end
})

FarmSection:CreateButtonGroup({
    Buttons = {
        {
            Name = "Start Auto Farm",
            Callback = startAutoFarm
        },
        {
            Name = "Stop Auto Farm",
            Callback = stopAutoFarm
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

local EspTab = MainGroup:CreateTab({
    Name = "Observation & ESP",
    Icon = "binoculars",
})

local EspSec = EspTab:CreateSection("Visual ESP Engine")
EspSec:CreateToggle({
    Name = "Player Box ESP",
    Desc = "Draws 2D bounding boxes around players.",
    Default = false,
    Callback = function(state) end
})
EspSec:CreateToggle({
    Name = "Nametags & Distance",
    Desc = "Displays billboard indicators with distance studs.",
    Default = false,
    Callback = function(state) end
})

local ThemeTab = MainGroup:CreateTab({
    Name = "Themes & Visuals",
    Icon = "palette",
})
local ThemeSec = ThemeTab:CreateSection("Custom Visuals")
ThemeSec:CreateToggle({
    Name = "Pure Contrast Mode",
    Desc = "Enhances border highlights and backdrop blur.",
    Default = false,
    Callback = function(state) end
})

local WorldGroup = Window:CreateTabGroup("World & Navigation")

local TeleportTab = WorldGroup:CreateTab({
    Name = "Teleport",
    Icon = "globe",
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

local PlayerGroup = Window:CreateTabGroup("Player Modifiers")

local PlayerTab = PlayerGroup:CreateTab({
    Name = "Local Player",
    Icon = "user",
})

local StatSec = PlayerTab:CreateSection("Player State")
StatSec:CreateSlider({
    Name = "WalkSpeed Multiplier",
    Min = 16,
    Max = 250,
    Default = 16,
    Suffix = "studs/s",
    Callback = function(val) end
})
StatSec:CreateSlider({
    Name = "JumpPower Multiplier",
    Min = 50,
    Max = 350,
    Default = 50,
    Suffix = "studs",
    Callback = function(val) end
})

local SpeedTab = PlayerGroup:CreateTab({
    Name = "Speed & Movement",
    Icon = "zap",
})
local SpeedSec = SpeedTab:CreateSection("Physics Bypass")
SpeedSec:CreateToggle({
    Name = "Infinite Jump",
    Desc = "Allows airborne jump repetition without ground contact.",
    Default = false,
    Callback = function(s) end
})
SpeedSec:CreateToggle({
    Name = "No Clip",
    Desc = "Passes collision checks through geometry.",
    Default = false,
    Callback = function(s) end
})

local CombatTab = MainGroup:CreateTab({
    Name = "Combat (Mode 2)",
    Icon = "shield",
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

AimSection:CreateDropdown({
    Name = "Target Body Part",
    Options = { "Head", "Torso", "HumanoidRootPart" },
    Default = "Head",
    Callback = function(part)
    end
})
