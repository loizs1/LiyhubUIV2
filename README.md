# LiyhubUI V2

> **High-Performance, Stealth-Oriented Minimalist UI Framework for Roblox Luau**

LiyhubUI V2 is a modular, production-ready graphical interface engine built for high-performance Roblox game automation scripts. Engineered with a sleek, minimalist monochromatic design, native stealth anti-detection mechanics, responsive multi-device layouts (PC, Tablet, Android), and over 750+ Lucide icons.

---

## Key Highlights

- **Stealth Architecture**: Operates silently with zero console prints in callbacks, automatic secure parenting into `gethui()` / `CoreGui`, randomized instance names, and no detectable attributes or tags.
- **Pure Monochromatic Aesthetics**: Supports high-contrast **Pure Black & White** and **Pure White** themes with fluid 60 FPS transitions and procedural Sun/Moon switcher.
- **Adaptive Multi-Device Engine**: Built-in sizing presets for PC, Tablet, and Android with automatic viewport detection and synchronized `UI Scale Multiplier` slider.
- **Dynamic 1-Column & 2-Column Modes**: Flexible dashboard engine supporting balanced dual-column cards or streamlined single-column flows.
- **750+ Vector Lucide Icons**: Instant icon rendering via procedural spritesheet mapping by simple string names (`"crosshair"`, `"eye"`, `"shield"`, `"user"`, `"zap"`).
- **Floating Mobile Pin Widget**: Built-in draggable pill widget automatically activated on mobile devices or when minimized, with state persistence.
- **Cloud DRM & Telemetry Integration**: Native handshake support displaying verified License Key, Tier, Expiration countdown, Execution Counter, and Executor Name.
- **Complete Component Ecosystem**: Toggles, Sliders, Single/Multi Dropdowns, ColorPickers, Inputs, Keybinds, Buttons, Progression Steppers, Banners, and Modal Dialogs.

---

## Quick Start

```luau
local Liyhub = loadstring(game:HttpGet("https://raw.githubusercontent.com/loizs1/LiyhubUI/main/LiyhubUI.bundle.luau"))()

local Window = Liyhub:CreateWindow({
    Title = "Liyhub",
    Subtitle = "Universal Edition",
    Size = UDim2.fromOffset(740, 490),
    ToggleKey = Enum.KeyCode.RightControl,
    MobilePin = true,
})

local MainGroup = Window:CreateTabGroup("Main Features")
local CombatTab = MainGroup:CreateTab({ Name = "Combat", Icon = "crosshair" })
local TargetSection = CombatTab:CreateSection({ Name = "Targeting", Side = "Left" })

TargetSection:CreateToggle({
    Name = "Silent Aim",
    Desc = "Redirect projectiles toward nearest enemy bone.",
    Default = false,
    Callback = function(state)
        getgenv().SilentAim = state
    end
})

TargetSection:CreateSlider({
    Name = "Field of View",
    Min = 30,
    Max = 360,
    Default = 90,
    Unit = "°",
    Callback = function(val)
        getgenv().FOV = val
    end
})
```

---

## Architecture & Layout System

### Window Configuration Options

| Option | Type | Default | Description |
|---|---|---|---|
| `Title` | `string` | `"Liyhub"` | Primary header branding title. |
| `Subtitle` | `string` | `""` | Secondary subtitle text. |
| `Size` | `UDim2` | `(740, 490)` | Initial window dimensions. |
| `ToggleKey` | `Enum.KeyCode` | `RightControl` | Keyboard shortcut to toggle window visibility. |
| `MobilePin` | `boolean` | `true` | Enables draggable floating mobile widget. |
| `Logo` | `string` | `"rbxassetid://126257104774952"` | Asset URL or Roblox ID for branding logo. |
| `Discord` | `string` | `"https://discord.gg/Nr56tQJeJh"` | Discord server invite link for information tab. |
| `TwoColumns` | `boolean` | `true` | Starts window in 2-column split view mode. |
| `UniversalGroup` | `boolean` | `true` | Automatically mounts User Profile, Info, and Settings tabs. |

### Responsive Device Presets

Switch layout presets dynamically at runtime:
```luau
Window:SetDevice("PC")      -- 740x490 window, 1.00x scale, 2-column layout
Window:SetDevice("Tablet")  -- 640x440 window, 1.05x scale, 2-column layout
Window:SetDevice("Android") -- 580x410 window, 1.10x scale, 1-column layout
```
Switching devices automatically synchronizes window bounds, sidebar dimensions, column layout, and moves the `UI Scale Multiplier` slider to the exact preset value.

---

## Complete Component API

### 1. Navigation

#### `Window:CreateTabGroup(name: string)`
Creates a collapsible category group in the sidebar.
```luau
local CombatGroup = Window:CreateTabGroup("Combat & Warfare")
```

#### `TabGroup:CreateTab(options: table)`
Creates a tab inside the specified category group.
```luau
local AimbotTab = CombatGroup:CreateTab({
    Name = "Aimbot",
    Icon = "crosshair", -- Lucide icon name or asset ID
})
```

#### `Tab:CreateSection(options: string | table)`
Creates a collapsible card section within the tab.
```luau
local LeftSec = AimbotTab:CreateSection({ Name = "Aim Settings", Side = "Left" })
local RightSec = AimbotTab:CreateSection({ Name = "Filter Settings", Side = "Right" })
```

---

### 2. Form & Input Controls

#### Toggle
Supports multi-line descriptions and instant state feedback.
```luau
local aimToggle = LeftSec:CreateToggle({
    Name = "Auto Lock",
    Desc = "Continuously track target position.",
    Default = false,
    Callback = function(enabled: boolean)
        getgenv().AutoLock = enabled
    end
})
```

#### ToggleGroup
Groups multiple related toggles into a single visual container.
```luau
LeftSec:CreateToggleGroup({
    Toggles = {
        { Name = "Check Walls", Default = true, Callback = function(s) end },
        { Name = "Check Visible", Default = true, Callback = function(s) end },
    }
})
```

#### Slider
Interactive slider with numeric bounds, stepping quantization, units, and programmatic control.
```luau
local speedSlider = LeftSec:CreateSlider({
    Name = "Flight Speed",
    Min = 16,
    Max = 300,
    Step = 1,
    Default = 50,
    Unit = " studs/s",
    Callback = function(value: number)
        getgenv().FlightSpeed = value
    end
})

speedSlider:SetValue(100)        -- Programmatically sets value & animates fill
local current = speedSlider:GetValue()
```

#### SliderGroup
```luau
LeftSec:CreateSliderGroup({
    Sliders = {
        { Name = "Horizontal Sens", Min = 1, Max = 10, Default = 5, Callback = function(v) end },
        { Name = "Vertical Sens", Min = 1, Max = 10, Default = 5, Callback = function(v) end },
    }
})
```

#### Dropdown (Single Select)
Expandable animated dropdown with search and option rebuild.
```luau
local boneDrop = LeftSec:CreateDropdown({
    Name = "Hitbox Target",
    Options = { "Head", "HumanoidRootPart", "Torso", "Random" },
    Default = "Head",
    Callback = function(selected: string)
        getgenv().TargetBone = selected
    end
})

boneDrop:SetValue("Torso")
boneDrop:SetOptions({ "Head", "UpperTorso", "LowerTorso" })
```

#### MultiDropdown (Multi Select)
Multi-select dropdown with Select All and Clear buttons.
```luau
local targetFilter = LeftSec:CreateMultiDropdown({
    Name = "Target Filter",
    Options = { "Enemies", "NPCs", "Friends", "Staff" },
    Default = { "Enemies" },
    Callback = function(selectedList: {string})
        getgenv().FilterList = selectedList
    end
})

targetFilter:SetValue({ "Enemies", "NPCs" })
```

#### Input / Textbox
Single-line text entry with placeholder support.
```luau
local playerInput = RightSec:CreateInput({
    Name = "Whitelist Username",
    Placeholder = "Enter exact player name...",
    Default = "",
    ClearOnEnter = false,
    Callback = function(text: string)
        getgenv().WhitelistedUser = text
    end
})

playerInput:SetValue("Player1")
```

#### Keybind
Interactive keybind listener with live binding prompt.
```luau
local combatKey = RightSec:CreateKeybind({
    Name = "Parry Shortcut",
    Default = Enum.KeyCode.F,
    Callback = function(key: Enum.KeyCode)
        getgenv().ParryKey = key
    end
})
```

#### ColorPicker
RGB color selector for ESP chams, tracers, and UI accent customizations.
```luau
local chamsColor = RightSec:CreateColorPicker({
    Name = "Chams Color",
    Default = Color3.fromRGB(0, 200, 255),
    Callback = function(color: Color3)
        getgenv().ChamsColor = color
    end
})
```

---

### 3. Action Components

#### Button & Action Row
Standard button or card row with embedded trigger button.
```luau
-- Standard Button
RightSec:CreateButton({
    Name = "Server Hop",
    Callback = function()
        -- TeleportService routine
    end
})

-- Action Row (Title + Description + Compact Button)
RightSec:CreateButton({
    Title = "Rejoin Current Server",
    Description = "Quickly reconnect to current experience instance.",
    ButtonText = "Rejoin",
    Callback = function()
        -- Reconnect routine
    end
})
```

#### ButtonGroup
Balanced horizontal multi-action row.
```luau
RightSec:CreateButtonGroup({
    Buttons = {
        { Name = "Start Farm", Callback = function() end },
        { Name = "Pause", Callback = function() end },
        { Name = "Reset", Callback = function() end },
    }
})
```

#### Dual-Widget Row (Anti-Cutoff Mobile Row)
Places two widgets side-by-side with 50/50 balanced width.
```luau
local quickRow = RightSec:CreateRow()
quickRow:AddToggle({ Name = "Auto Heal", Desc = "Use potion at < 30% HP", Default = true, Callback = function(s) end })
quickRow:AddKeybind({ Name = "Heal Key", Default = Enum.KeyCode.H, Callback = function(k) end })
```

---

### 4. Presentation & Feedback

#### Progression Stepper
Multi-step workflow visualization with status dots, connection lines, and icons.
```luau
local questFlow = LeftSec:CreateProgression({
    Title = "Quest Automation Pipeline",
    Subtitle = "Real-time execution state tracker",
    CurrentStep = 1,
    Steps = {
        { Label = "Accept", Icon = "check" },
        { Label = "Travel", Icon = "teleport" },
        { Label = "Combat", Icon = "swords" },
        { Label = "Boss", Icon = "shield" },
        { Label = "Claim", Icon = "zap" },
    }
})

questFlow:SetStep(3) -- Moves active highlight to step 3 ("Combat")
```

#### Banner
Media card with customizable image, title, and body text.
```luau
LeftSec:CreateBanner({
    Image = "rbxassetid://108339444679489",
    Title = "Announcement",
    Description = "Premium tier active. All modules executing at maximum fidelity."
})
```

#### Paragraph & Divider
```luau
RightSec:CreateParagraph({
    Title = "Network Notice",
    Content = "All telemetry signals are validated through local proxies."
})

RightSec:CreateDivider()
```

#### Toast Notifications
Floating non-intrusive notifications with auto-dismiss.
```luau
Window:Notify({
    Title = "Configuration Loaded",
    Content = "Profile 'Default' restored successfully.",
    Duration = 2.5,
    Type = "Success" -- "Success" | "Info" | "Warning"
})
```

#### Modal Dialogs
Full-screen modal confirmation dialogs.
```luau
Window:ShowModal({
    Title = "Confirm Deletion",
    Content = "Are you sure you want to delete profile 'Custom1'?",
    Buttons = {
        { Text = "Cancel", Variant = "Secondary", Callback = function() end },
        { Text = "Delete", Variant = "Primary", Callback = function() end },
    }
})
```

---

## Universal System Tabs

When `UniversalGroup = true` (default), LiyhubUI automatically mounts three built-in system tabs:

1. **User Profile**:
   - Displays Roblox Identity: DisplayName, Username, UserId, Account Age, Roblox Premium status, and headshot avatar.
   - Displays Cloud DRM Telemetry: License Key, Tier, Remaining Duration, Total Executions, Executor Name, Job ID, and Place ID.
   - Includes one-click copy buttons for User ID and License Key.
2. **Information**:
   - Header announcement banner.
   - Discord Community card with 1-click invite link copier.
3. **Setting UI**:
   - **Configuration Profile Manager**: Dropdown selector, Create/Save, Load, Delete, and Refresh.
   - **Device Layout Presets**: Instant 1-click buttons for PC Layout (100%), Tablet Layout (105%), and Android Layout (110%).
   - **Layout Structure Mode**: Switch between 2 Columns (Split View) and 1 Column (Single Flow).
   - **UI Scale Multiplier**: Fine-tune zoom scale from 70% to 140%.
   - **Interface Management**: Interactive toggle keybind selector and clean Unload / Destroy button.

---

## Stealth Directives & Best Practices

All scripts using LiyhubUI must follow these security rules:
1. **Never use `print()` or `warn()`** inside UI callbacks or game loops. Roblox anticheats monitor `LogService.MessageOut`.
2. **Store state in `getgenv()`**, never in `_G` or shared Roblox tables.
3. **Zero Auto-Start**: All toggles and automated routines must default to `false`.
4. **Use Idempotent Cleanup**: Call `Window:Destroy()` when unloading to disconnect all internal connections and restore camera/cursor state.

---

## License

MIT License. Designed and maintained for the Liyhub ecosystem.
