# Getting Started with LiyHub UI

## Installation

### Method 1: Roblox Studio (ModuleScript)
1. Place the `LiyHubUI` folder or root `LiyHubUI.lua` into `ReplicatedStorage`.
2. Ensure child folders `src`, `components`, `core`, `services`, and `themes` are organized as ModuleScripts underneath.
3. In a `LocalScript` inside `StarterPlayerScripts` or `StarterGui`:
   ```lua
   local LiyHubUI = require(game:GetService("ReplicatedStorage"):WaitForChild("LiyHubUI"))
   ```

### Method 2: Standalone Execution
For scripts executed at runtime, require the root `LiyHubUI.lua` directly:
```lua
local LiyHubUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/.../LiyHubUI.lua"))()
```

---

## Basic Workflow

### 1. Creating the Window
```lua
local Window = LiyHubUI:CreateWindow({
    Title = "LiyHub UI",
    Subtitle = "v2.2 Black & White Edition",
    Size = UDim2.new(0, 680, 0, 460),
    ToggleKey = Enum.KeyCode.RightControl, -- Key to toggle window visibility
})
```

### 2. Organizing Navigation with Tab Groups
LiyHub UI uses collapsible tab categories to keep large numbers of tabs organized:
```lua
local Group = Window:CreateTabGroup("Main Features")
local Tab = Group:CreateTab({
    Name = "Farming",
    Icon = "rbxassetid://6031075931", -- Optional asset ID
})
```

### 3. Creating Sections and Components
Sections group related components together:
```lua
local Section = Tab:CreateSection("Auto Farming")

Section:CreateToggle({
    Name = "Enable Auto Farm",
    Default = false,
    Callback = function(enabled)
        print("Farming status:", enabled)
    end
})
```

### 4. Toast Notifications
Send smooth sliding toast alerts from the bottom-right corner:
```lua
Window:Notify({
    Title = "Notice",
    Content = "Operation completed successfully.",
    Duration = 3,
})
```

