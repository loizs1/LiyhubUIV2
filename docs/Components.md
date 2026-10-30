# LiyHub UI Component Guide

## 1. Mobile Pin Tab ("Floating Capsule Pill")
A draggable capsule pill button at the top/anywhere on screen that provides touch and click access to toggle the main window. Especially designed for mobile players and minimal HUD setups.

```lua
-- Window automatically creates MobilePin if MobilePin = true (default)
local Window = LiyHubUI:CreateWindow({
    Title = "LiyHub",
    MobilePin = true,
    Logo = "rbxassetid://6031075936",
})

-- Mobile Pin APIs
Window:SetMobilePin(true) -- Toggle pin visibility
local pin = Window:GetMobilePin()
pin:SetText("LiyHub", "Tap to Open")
pin:SetLogo("rbxassetid://...")
```

---

## 2. Banner
Visual presentation banner featuring an image header, title, and collapsible explanatory text.

```lua
Section:CreateBanner({
    Title = "LiyHub Announcement",
    Image = "rbxassetid://15634771265",
    ImageHeight = 105,
    Description = "Welcome to LiyHub v2.2 Pure B&W! This banner supports Discord CDN links, Google/Web image URLs, or Roblox Asset IDs, complete with collapsible text paragraphs.",
})
```

---

## 3. Progression (Stepper Workflow)
Displays a multi-step progression sequence with connected nodes, status badges, and interactive navigation buttons.

```lua
local progress = Section:CreateProgression({
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
        print("Navigated to step:", stepIndex, stepInfo.Label)
    end,
})

progress:NextStep()
progress:PrevStep()
progress:SetStep(3, true)
```

---

## 4. Slider & SliderGroup
Numeric range sliders with bounds clamping, stepping, formatting, and real-time floating tooltip value bubble while dragging.

```lua
local slider = Section:CreateSlider({
    Name = "Attack Speed",
    Min = 10,
    Max = 100,
    Step = 5,
    Default = 50,
    Callback = function(val)
        print("Speed:", val)
    end
})
```

---

## 5. Dropdown & DropdownGroup
Single-select and multi-select dropdown menus with independent expansion and checkmarks.

```lua
-- Multi-select
Section:CreateDropdown({
    Name = "Targets (Multi-Select)",
    Options = { "Boss Monkey", "Desert Bandit", "Pirate Raider" },
    Default = { "Boss Monkey" },
    MultiSelect = true,
    Callback = function(targets)
        print("Selected:", table.concat(targets, ", "))
    end
})
```

---

## 6. Button & ButtonGroup
Creates clickable buttons with smooth hover and press animations.

```lua
Section:CreateButtonGroup({
    Buttons = {
        { Text = "Start Auto Farm", Callback = function() print("Started") end },
        { Text = "Stop Auto Farm", Callback = function() print("Stopped") end },
    }
})
```

---

## 7. Toggle & ToggleGroup
Animated pill switches with state synchronization.

```lua
Section:CreateToggle({
    Name = "Auto Execute Step",
    Default = false,
    Callback = function(val)
        print("State:", val)
    end
})
```

---

## 8. Keybind
Listens for keyboard input to bind and trigger actions.

```lua
Section:CreateKeybind({
    Name = "Toggle Pin / Keybind",
    Default = Enum.KeyCode.F,
    OnTrigger = function()
        Window:Toggle()
    end
})
```
