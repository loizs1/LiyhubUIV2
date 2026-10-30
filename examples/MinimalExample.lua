--[[
    LiyHub UI - Minimal Quick-Start Example
]]

local LiyHubUI = require(script.Parent.Parent.LiyHubUI)

local Window = LiyHubUI:CreateWindow({
    Title = "LiyHub UI",
    Subtitle = "Minimal Edition",
})

local MainGroup = Window:CreateTabGroup("Main")
local Tab = MainGroup:CreateTab({ Name = "Home" })
local Section = Tab:CreateSection("Quick Controls")

Section:CreateButton({
    Text = "Click Me",
    Callback = function()
        Window:Notify({
            Title = "Hello",
            Content = "You clicked the button!",
        })
    end,
})

Section:CreateToggle({
    Name = "Simple Toggle",
    Default = true,
    Callback = function(val)
        print("Toggle value:", val)
    end,
})

Section:CreateSlider({
    Name = "WalkSpeed",
    Min = 16,
    Max = 100,
    Default = 16,
    Callback = function(speed)
        local hum = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.WalkSpeed = speed end
    end,
})

