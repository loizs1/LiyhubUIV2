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
    Subtitle = "Universal Edition",
    ToggleKey = Enum.KeyCode.RightControl,
    MobilePin = true,
    Logo = "rbxasset://textures/LiyhubLogo.png",
    Discord = "https://discord.gg/Nr56tQJeJh",
})

local MainGroup = Window:CreateTabGroup("Components")

local FormTab = MainGroup:CreateTab({
    Name = "Form Controls",
    Icon = LiyHubUI.Icons.home,
    TwoColumns = true,
})

local BasicSec = FormTab:CreateSection({ Title = "Basic Elements", Side = "Left" })
local AdvancedSec = FormTab:CreateSection({ Title = "Input & Pickers", Side = "Right" })

BasicSec:CreateToggle({
    Name = "Active Feature",
    Desc = "Toggle component description and state tracker.",
    Default = false,
    Callback = function(state) end
})

BasicSec:CreateSlider({
    Name = "Value Multiplier",
    Min = 0,
    Max = 100,
    Step = 1,
    Default = 50,
    Unit = "%",
    Callback = function(val) end
})

BasicSec:CreateDropdown({
    Name = "Selection Mode",
    Options = { "Standard", "Aggressive", "Precision", "Adaptive" },
    Default = "Standard",
    Callback = function(choice) end
})

BasicSec:CreateMultiDropdown({
    Name = "Active Modules",
    Options = { "Module A", "Module B", "Module C", "Module D" },
    Default = { "Module A" },
    Callback = function(list) end
})

AdvancedSec:CreateInput({
    Name = "Target Identifier",
    Placeholder = "Enter value here...",
    Default = "",
    ClearOnEnter = false,
    Callback = function(text) end
})

AdvancedSec:CreateKeybind({
    Name = "Action Keybind",
    Default = Enum.KeyCode.E,
    Callback = function(key) end
})

AdvancedSec:CreateColorPicker({
    Name = "Accent Highlight",
    Default = Color3.fromRGB(0, 162, 255),
    Callback = function(col) end
})

AdvancedSec:CreateButton({
    Title = "Execute Pipeline",
    Description = "Trigger immediate sequence processing.",
    ButtonText = "Run",
    Callback = function()
        Window:Notify({
            Title = "Pipeline",
            Content = "Sequence executed cleanly.",
            Duration = 2,
            Type = "Success"
        })
    end
})

local GroupTab = MainGroup:CreateTab({
    Name = "Group Layouts",
    Icon = LiyHubUI.Icons.swords,
    TwoColumns = true,
})

local LeftGroupSec = GroupTab:CreateSection({ Title = "Horizontal (50/50)", Side = "Left" })
local RightGroupSec = GroupTab:CreateSection({ Title = "Vertical Stack", Side = "Right" })

LeftGroupSec:CreateToggleGroup({
    Direction = "Right",
    Toggles = {
        {
            Title = "Feature 1",
            Default = false,
            Callback = function(v) end
        },
        {
            Title = "Feature 2",
            Default = false,
            Callback = function(v) end
        }
    }
})

LeftGroupSec:CreateSliderGroup({
    Direction = "Right",
    Sliders = {
        {
            Title = "Sensitivity X",
            Min = 1,
            Max = 100,
            Default = 50,
            Callback = function(v) end
        },
        {
            Title = "Sensitivity Y",
            Min = 1,
            Max = 100,
            Default = 50,
            Callback = function(v) end
        }
    }
})

LeftGroupSec:CreateInputGroup({
    Direction = "Right",
    Inputs = {
        {
            Title = "Coordinate X",
            Placeholder = "0",
            Default = "0",
            Callback = function(t) end
        },
        {
            Title = "Coordinate Y",
            Placeholder = "0",
            Default = "0",
            Callback = function(t) end
        }
    }
})

LeftGroupSec:CreateButtonGroup({
    Buttons = {
        { Name = "Start", Callback = function() end },
        { Name = "Pause", Callback = function() end },
        { Name = "Reset", Callback = function() end },
    }
})

RightGroupSec:CreateToggleGroup({
    Direction = "Down",
    Toggles = {
        {
            Title = "Option Primary",
            Default = false,
            Callback = function(v) end
        },
        {
            Title = "Option Secondary",
            Default = false,
            Callback = function(v) end
        }
    }
})

RightGroupSec:CreateSliderGroup({
    Direction = "Down",
    Sliders = {
        {
            Title = "Primary Radius",
            Min = 0,
            Max = 360,
            Default = 180,
            Callback = function(v) end
        },
        {
            Title = "Falloff Factor",
            Min = 1,
            Max = 50,
            Default = 10,
            Callback = function(v) end
        }
    }
})

RightGroupSec:CreateInputGroup({
    Direction = "Down",
    Inputs = {
        {
            Title = "Primary Endpoint",
            Placeholder = "https://...",
            Callback = function(t) end
        },
        {
            Title = "Access Identifier",
            Placeholder = "ID Key...",
            Callback = function(t) end
        }
    }
})

local WorkflowTab = MainGroup:CreateTab({
    Name = "Workflow",
    Icon = LiyHubUI.Icons.settings,
    TwoColumns = true,
})

local StepperSec = WorkflowTab:CreateSection({ Title = "Process Pipeline", Side = "Left" })
local MediaSec = WorkflowTab:CreateSection({ Title = "Media & Notices", Side = "Right" })

local StepperComp = StepperSec:CreateProgression({
    Title = "Execution Stages",
    Subtitle = "Multi-step workflow container with nested controls",
    Steps = {
        { Name = "Initialize", Icon = "check" },
        { Name = "Configure", Icon = "settings" },
        { Name = "Execute", Icon = "zap" },
        { Name = "Verify", Icon = "shield" },
        { Name = "Complete", Icon = "gem" },
    },
    CurrentStep = 1,
    Controls = true,
    NextText = "Next",
    PrevText = "Previous",
    Callback = function(stepIndex, stepData)
        local stageName = (stepData and (stepData.Name or stepData.Label)) or tostring(stepIndex)
        Window:Notify({
            Title = "Stage Update",
            Content = "Switched to: " .. stageName .. " (Step " .. tostring(stepIndex) .. ")",
            Duration = 1.5,
            Type = "Info"
        })
    end
})

StepperComp:CreateToggle({
    Name = "Auto Advance Workflow",
    Desc = "Continuously step through pipeline stages.",
    Default = false,
    Callback = function(state) end
})

StepperComp:CreateDropdown({
    Name = "Execution Profile",
    Options = { "Default", "Aggressive", "Conservative" },
    Default = "Default",
    Callback = function(choice) end
})

MediaSec:CreateBanner({
    Title = "Framework Announcement",
    Content = "LiyhubUI v2.2 minimalist pure black and white framework with responsive groups.",
    Image = "rbxassetid://108339444679489",
    Collapsible = true,
    Default = true,
    Buttons = {
        {
            Title = "Documentation",
            Accent = true,
            Callback = function()
                Window:Notify({
                    Title = "Documentation",
                    Content = "API reference available in repository README.",
                    Duration = 2,
                    Type = "Info"
                })
            end
        },
        {
            Title = "Check Status",
            Accent = false,
            Callback = function()
                Window:Notify({
                    Title = "System Status",
                    Content = "All components operational at 60 FPS.",
                    Duration = 2,
                    Type = "Success"
                })
            end
        }
    }
})

MediaSec:CreateParagraph({
    Title = "Architecture Notice",
    Content = "Components support responsive dual-column and single-column viewport adaptations."
})

MediaSec:CreateDivider()

return Window
