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

local AnnouncementSec = MainTab:CreateSection("Server Announcement")
AnnouncementSec:CreateBanner({
    Title = "LiyHub Announcement",
    Content = "Welcome to LiyHub v2.2 Pure B&W edition with nested controls and modular responsive groups.",
    Image = "rbxassetid://108339444679489",
    Collapsible = true,
    Default = true,
    Buttons = {
        {
            Title = "Join Discord",
            Accent = true,
            Callback = function()
                local setClip = setclipboard or toclipboard or (Clipboard and Clipboard.set)
                if setClip then
                    setClip("https://discord.gg/Nr56tQJeJh")
                end
                Window:Notify({
                    Title = "Discord Invite",
                    Content = "Discord invite copied to clipboard.",
                    Duration = 2,
                    Type = "Success"
                })
            end
        },
        {
            Title = "Check Updates",
            Accent = false,
            Callback = function()
                Window:Notify({
                    Title = "System Updates",
                    Content = "You are running the latest v2.2 build.",
                    Duration = 2,
                    Type = "Info"
                })
            end
        }
    }
})

local FarmSection = MainTab:CreateSection("Auto Farming & Quest")

local autoFarmActive = false
local autoFarmThread = nil
local stepNames = { "Accept", "Teleport", "Farm", "Boss", "Reward" }

local QuestProgression = FarmSection:CreateProgression({
    Title = "Quest Journey (Auto Farm)",
    Subtitle = "Automated quest and boss combat workflow",
    Steps = {
        { Name = "Accept", Icon = "check" },
        { Name = "Teleport", Icon = "teleport" },
        { Name = "Farm", Icon = "swords" },
        { Name = "Boss", Icon = "skull" },
        { Name = "Reward", Icon = "gem" },
    },
    CurrentStep = 1,
    Controls = true,
    NextText = "Next",
    PrevText = "Previous",
    Callback = function(stepIndex, stepData)
        local stageName = (stepData and (stepData.Name or stepData.Label)) or stepNames[stepIndex] or tostring(stepIndex)
        Window:Notify({
            Title = "Quest Step Selected",
            Content = "Stage: " .. stageName .. " (Step " .. tostring(stepIndex) .. ")",
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

QuestProgression:CreateToggle({
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

QuestProgression:CreateDropdown({
    Name = "Quest Difficulty",
    Options = { "Easy", "Medium", "Hard", "Nightmare" },
    Default = "Easy",
    Callback = function(selected)
        Window:Notify({
            Title = "Difficulty",
            Content = "Quest difficulty set to: " .. tostring(selected),
            Duration = 1.5
        })
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

FarmSection:CreateMultiDropdown({
    Name = "Targets (Multi-Select)",
    Options = { "Pirate Raider", "Marine Captain", "Island Boss", "Elite Guard" },
    Default = { "Pirate Raider" },
    Callback = function(selectedList)
    end
})

local CombatTab = MainGroup:CreateTab({
    Name = "Dual Elements (Mode 2)",
    Icon = "shield",
    TwoColumns = true,
})

local LeftSection = CombatTab:CreateSection({ Title = "Type: Right (1 Card Horizontal)", Side = "Left" })
local RightSection = CombatTab:CreateSection({ Title = "Type: Down (1 Card Vertical)", Side = "Right" })

LeftSection:CreateToggleGroup({
    Direction = "Right",
    Toggles = {
        {
            Title = "Auto Farm",
            Default = false,
            Callback = function(v) end
        },
        {
            Title = "Fast Attack",
            Default = false,
            Callback = function(v) end
        }
    }
})

LeftSection:CreateSliderGroup({
    Direction = "Right",
    Sliders = {
        {
            Title = "WalkSpeed",
            Min = 16,
            Max = 150,
            Default = 60,
            Callback = function(v) end
        },
        {
            Title = "JumpPower",
            Min = 50,
            Max = 300,
            Default = 150,
            Callback = function(v) end
        }
    }
})

LeftSection:CreateInputGroup({
    Direction = "Right",
    Inputs = {
        {
            Title = "Target X",
            Placeholder = "100",
            Default = "100",
            Callback = function(t) end
        },
        {
            Title = "Target Y",
            Placeholder = "250",
            Default = "250",
            Callback = function(t) end
        }
    }
})

RightSection:CreateToggleGroup({
    Direction = "Down",
    Toggles = {
        {
            Title = "Kill Aura",
            Default = false,
            Callback = function(v) end
        },
        {
            Title = "Auto Equip",
            Default = false,
            Callback = function(v) end
        }
    }
})

RightSection:CreateSliderGroup({
    Direction = "Down",
    Sliders = {
        {
            Title = "FOV Radius",
            Min = 0,
            Max = 360,
            Default = 90,
            Callback = function(v) end
        },
        {
            Title = "Smoothness",
            Min = 1,
            Max = 100,
            Default = 10,
            Callback = function(v) end
        }
    }
})

RightSection:CreateInputGroup({
    Direction = "Down",
    Inputs = {
        {
            Title = "Webhook URL",
            Placeholder = "https://discord.com/api/webhooks/...",
            Callback = function(t) end
        },
        {
            Title = "Discord User ID",
            Placeholder = "123456789",
            Callback = function(t) end
        }
    }
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

local SettingsGroup = Window:CreateTabGroup("Settings")
local SettingsTab = SettingsGroup:CreateTab({
    Name = "Settings & Transparency",
    Icon = "settings",
})

local TransSec = SettingsTab:CreateSection("Interface Transparency")
TransSec:CreateSlider({
    Name = "Window Acrylic Transparency",
    Min = 0,
    Max = 100,
    Default = 0,
    Suffix = "%",
    Callback = function(val)
        Window:SetTransparency(val / 100)
    end
})

TransSec:CreateParagraph({
    Title = "Configuration & User Profile",
    Content = "Click your user profile avatar card in the bottom-left sidebar to open the Profile & Config Manager modal."
})

return Window
