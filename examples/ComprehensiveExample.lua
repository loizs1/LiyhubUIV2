--[[
    LiyHub UI - Comprehensive Official Example
    Matches the exact video implementation and visual design:
    - Mobile Pin Tab (floating, draggable capsule pill button with LiyHub logo)
    - Server Announcement Banner with collapsible description
    - Quest Journey Progression Stepper (Accept, Teleport, Farm, Boss, Reward)
    - Slider with floating real-time tooltip bubble
    - Dual-column layouts for Combat & Teleport
    - Config & Profile modal system
]]

local LiyHubUI = nil
local ok, res = pcall(function()
    return require(game:GetService("ReplicatedStorage"):WaitForChild("LiyHubUI"))
end)
if ok and res then
    LiyHubUI = res
else
    LiyHubUI = require(script.Parent.Parent.LiyHubUI)
end

-- 1. Create Main Window with Mobile Pin Tab enabled
local Window = LiyHubUI:CreateWindow({
    Title = "LiyHub",
    Subtitle = "v2.2 Black & White Edition",
    Size = UDim2.new(0, 680, 0, 460),
    ToggleKey = Enum.KeyCode.RightControl,
    MobilePin = true, -- Enables the top draggable capsule pill button
    Logo = "rbxassetid://6031075936",
})

-- Initialize Config & Profile Services
local ConfigService = LiyHubUI:CreateConfigService({
    FolderName = "LiyHubConfigs",
    FileName = "config.json"
})
local ProfileService = LiyHubUI:CreateProfileService(ConfigService)

-- ============================================================================
-- TAB GROUP 1: MAIN FEATURES
-- ============================================================================
local MainFeaturesGroup = Window:CreateTabGroup("Main Features")

-- Tab: Main (Mode 1)
local MainTab = MainFeaturesGroup:CreateTab({
    Name = "Main (Mode 1)",
    Icon = "rbxassetid://6031075931",
})

-- Section: Server Announcement Banner
local AnnouncementSection = MainTab:CreateSection("Server Announcement")

AnnouncementSection:CreateBanner({
    Title = "LiyHub Announcement",
    Image = "rbxassetid://15634771265",
    ImageHeight = 105,
    Description = "Welcome to LiyHub v2.2 Pure B&W! This banner supports Discord CDN links, Google/Web image URLs, or Roblox Asset IDs, complete with collapsible text paragraphs.",
})

-- Section: Auto Farming & Quest
local FarmSection = MainTab:CreateSection("Auto Farming & Quest")

-- Progression Stepper Component
local QuestProgression = FarmSection:CreateProgression({
    Title = "Quest Journey (Auto Farm)",
    Subtitle = "Automated quest and boss combat workflow",
    Steps = {
        { Label = "Accept", Icon = "rbxassetid://6031075931" },
        { Label = "Teleport", Icon = "rbxassetid://6031075929" },
        { Label = "Farm", Icon = "rbxassetid://6031094678" },
        { Label = "Boss", Icon = "rbxassetid://6031091004" },
        { Label = "Reward", Icon = "rbxassetid://6031075936" },
    },
    CurrentStep = 1,
    NextText = "Next",
    PrevText = "Previous",
    OnStepChanged = function(stepIndex, stepInfo)
        print("[LiyHub] Step changed to: " .. tostring(stepIndex) .. " (" .. tostring(stepInfo.Label) .. ")")
    end,
})

FarmSection:CreateToggle({
    Name = "Auto Execute Step",
    Default = false,
    Callback = function(val)
        print("[LiyHub] Auto Execute Step:", val)
    end
})

FarmSection:CreateDropdown({
    Name = "Quest Difficulty",
    Options = { "Normal", "Hard", "Nightmare" },
    Default = "Normal",
    Callback = function(diff)
        print("[LiyHub] Selected difficulty:", diff)
    end
})

FarmSection:CreateToggleGroup({
    Toggles = {
        { Name = "Auto Attack", Default = false, Callback = function(v) print("Auto Attack:", v) end },
        { Name = "Auto Skill", Default = false, Callback = function(v) print("Auto Skill:", v) end },
    }
})

FarmSection:CreateButtonGroup({
    Buttons = {
        {
            Text = "Start Auto Farm",
            Callback = function()
                Window:Notify({ Title = "Auto Farm", Content = "Auto farm sequence started!", Duration = 3 })
            end
        },
        {
            Text = "Stop Auto Farm",
            Callback = function()
                Window:Notify({ Title = "Auto Farm", Content = "Auto farm stopped.", Duration = 3 })
            end
        },
    }
})

FarmSection:CreateDropdown({
    Name = "Targets (Multi-Select)",
    Options = { "Boss Monkey", "Desert Bandit", "Pirate Raider", "Marine Captain" },
    Default = { "Boss Monkey", "Desert Bandit" },
    MultiSelect = true,
    Callback = function(targets)
        print("[LiyHub] Targets:", table.concat(targets, ", "))
    end
})

FarmSection:CreateDropdown({
    Name = "Weapon Type",
    Options = { "Sword", "Melee", "Gun", "Fruit" },
    Default = "Sword",
    Callback = function(wep)
        print("[LiyHub] Weapon:", wep)
    end
})

FarmSection:CreateDropdown({
    Name = "Auto Collect Drops (Multi-Select)",
    Options = { "Beli Coins", "Gems", "Gold Chests", "Ancient Relics" },
    Default = { "Beli Coins" },
    MultiSelect = true,
    Callback = function(drops)
        print("[LiyHub] Drops:", table.concat(drops, ", "))
    end
})

FarmSection:CreateSlider({
    Name = "Attack Speed",
    Min = 10,
    Max = 100,
    Step = 5,
    Default = 50,
    Callback = function(val)
        print("[LiyHub] Attack Speed:", val)
    end
})

FarmSection:CreateButton({
    Text = "Instant Kill Nearby Mobs",
    Callback = function()
        Window:Notify({ Title = "Combat", Content = "Eliminated monsters in 30-stud radius!", Duration = 2.5 })
    end
})

-- Tab: Combat (Mode 2) [Dual-Column Layout]
local CombatTab = MainFeaturesGroup:CreateTab({
    Name = "Combat (Mode 2)",
    Icon = "rbxassetid://6031091004",
    TwoColumns = true,
})

local AimSection = CombatTab:CreateSection({
    Name = "Aimbot & Targeting",
    Side = "Left",
})

AimSection:CreateToggle({
    Name = "Enable Silent Aim",
    Default = false,
    Callback = function(v) print("Silent aim:", v) end
})

AimSection:CreateButtonGroup({
    Buttons = {
        { Text = "Lock Target", Callback = function() print("Target locked") end },
        { Text = "Switch", Callback = function() print("Switched target") end },
        { Text = "Clear", Callback = function() print("Cleared target") end },
    }
})

AimSection:CreateDropdown({
    Name = "Target Body Part",
    Options = { "Head", "Torso", "HumanoidRootPart" },
    Default = "Head",
    Callback = function(part) print("Target part:", part) end
})

AimSection:CreateSlider({
    Name = "Aim Field of View (FOV)",
    Min = 30,
    Max = 180,
    Step = 5,
    Default = 90,
    Callback = function(fov) print("FOV:", fov) end
})

local WeaponSection = CombatTab:CreateSection({
    Name = "Weapon Modifications",
    Side = "Right",
})

WeaponSection:CreateToggleGroup({
    Toggles = {
        { Name = "Fast Reload", Default = true, Callback = function(v) print("Fast reload:", v) end },
        { Name = "No Spread", Default = false, Callback = function(v) print("No spread:", v) end },
    }
})

WeaponSection:CreateDropdown({
    Name = "Weapon Buffs (Multi-Select)",
    Options = { "Fast Reload", "No Recoil", "Infinite Ammo", "Rapid Fire" },
    Default = { "Fast Reload", "No Recoil" },
    MultiSelect = true,
    Callback = function(buffs) print("Buffs:", table.concat(buffs, ", ")) end
})

WeaponSection:CreateButton({
    Text = "Instant Max Ammo",
    Callback = function()
        Window:Notify({ Title = "Weapons", Content = "Ammunition refilled to maximum!", Duration = 2 })
    end
})

-- ============================================================================
-- TAB GROUP 2: WORLD & TRAVEL (Dual-Column Layout)
-- ============================================================================
local WorldGroup = Window:CreateTabGroup("World & Travel")

local TeleportTab = WorldGroup:CreateTab({
    Name = "Teleport",
    Icon = "rbxassetid://6031075929",
    TwoColumns = true,
})

local IslandSection = TeleportTab:CreateSection({
    Name = "Island Waypoints",
    Side = "Left",
})

IslandSection:CreateDropdown({
    Name = "Island",
    Options = { "Roslit Bay", "Spawn Island", "Desert Oasis", "Sky Sanctuary" },
    Default = "Roslit Bay",
    Callback = function(isl) print("Island:", isl) end
})

IslandSection:CreateDropdown({
    Name = "Method",
    Options = { "Instant", "Tween Smooth", "Bypass CFrame" },
    Default = "Instant",
    Callback = function(m) print("Method:", m) end
})

IslandSection:CreateButtonGroup({
    Buttons = {
        { Text = "Teleport to Island", Callback = function() Window:Notify({ Title = "Teleport", Content = "Teleported to destination!", Duration = 2 }) end },
        { Text = "Set Waypoint", Callback = function() Window:Notify({ Title = "Waypoint", Content = "Waypoint marked.", Duration = 2 }) end },
    }
})

local PlayerSection = TeleportTab:CreateSection({
    Name = "Player Teleport",
    Side = "Right",
})

PlayerSection:CreateInput({
    Name = "Target Player Username",
    Placeholder = "Enter username...",
    Default = "teleport",
    Callback = function(name) print("Player username:", name) end
})

PlayerSection:CreateButtonGroup({
    Buttons = {
        { Text = "Teleport to Player", Callback = function() Window:Notify({ Title = "Teleport", Content = "Teleported to player!", Duration = 2 }) end },
        { Text = "Spectate Player", Callback = function() Window:Notify({ Title = "Spectate", Content = "Spectating player.", Duration = 2 }) end },
    }
})

-- ============================================================================
-- TAB GROUP 3: SETTINGS
-- ============================================================================
local SettingsGroup = Window:CreateTabGroup("Settings")

local SettingsTab = SettingsGroup:CreateTab({
    Name = "Settings",
    Icon = "rbxassetid://6031094678",
})

local ConfigSection = SettingsTab:CreateSection("Configurations")

ConfigSection:CreateKeybind({
    Name = "Toggle UI Keybind",
    Default = Enum.KeyCode.RightControl,
    Callback = function(k) Window:SetToggleKey(k) end
})

ConfigSection:CreateKeybind({
    Name = "Toggle Pin / Keybind",
    Default = Enum.KeyCode.F,
    OnTrigger = function()
        Window:Toggle()
    end
})

ConfigSection:CreateButton({
    Text = "Config & Profile Settings",
    Callback = function()
        Window:Notify({
            Title = "Config & Profile",
            Content = "Profile manager ready. Active profile: " .. ProfileService:GetActiveProfile(),
            Duration = 3,
        })
    end
})

ConfigSection:CreateButton({
    Text = "Unload / Close LiyHub",
    Callback = function()
        Window:ShowModal({
            Title = "Close LiyHub?",
            Message = "Are you sure you want to unload and close LiyHub?",
            ConfirmText = "Close UI",
            CancelText = "Cancel",
            OnConfirm = function()
                Window:Destroy()
            end
        })
    end
})

Window:Notify({
    Title = "LiyHub UI Loaded",
    Content = "Pure B&W Minimalist UI with Mobile Pin Tab active. Tap the floating pin or press RightControl.",
    Duration = 4,
})

return Window
