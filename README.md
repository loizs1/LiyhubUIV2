# LiyhubUI V2

> **High-Performance, Stealth-Oriented Minimalist UI Framework for Roblox Luau**

LiyhubUI V2 is an enterprise-grade graphical user interface engine engineered for high-performance Roblox game automation scripts. Built with a sleek monochromatic aesthetic, native stealth anti-detection architecture, fluid 60 FPS transitions, responsive multi-device layouts (PC, Tablet, Android), and over 750+ Lucide vector icons.

---

## Table of Contents

1. [Key Highlights](#key-highlights)
2. [Bootstrap & Quick Start](#bootstrap--quick-start)
3. [Architecture & Layout System](#architecture--layout-system)
   - [Window Creation Options](#window-creation-options)
   - [Layout Modes (1-Column vs 2-Column)](#layout-modes-1-column-vs-2-column)
   - [Responsive Device Presets](#responsive-device-presets)
   - [Window Acrylic Transparency](#window-acrylic-transparency)
   - [Runtime Theme Switching](#runtime-theme-switching)
4. [Complete Component API Reference](#complete-component-api-reference)
   - [Navigation: Tab Groups & Tabs](#1-navigation-tab-groups--tabs)
   - [Sections & Layout Side](#2-sections--layout-side)
   - [Interactive Form Components](#3-interactive-form-components)
     - [Toggle & ToggleGroup](#toggle--togglegroup)
     - [Slider & SliderGroup](#slider--slidergroup)
     - [Dropdown & MultiDropdown](#dropdown--multidropdown)
     - [DropdownGroup](#dropdowngroup)
     - [Input / Textbox & InputGroup](#input--textbox--inputgroup)
     - [Keybind](#keybind)
     - [ColorPicker](#colorpicker)
   - [Action Components](#4-action-components)
     - [Button & Action Row](#button--action-row)
     - [ButtonGroup](#buttongroup)
     - [Dual-Widget Row](#dual-widget-row-anti-cutoff-mobile-row)
   - [Advanced & Workflow Components](#5-advanced--workflow-components)
     - [Progression Stepper with Nested Controls](#progression-stepper-multi-step-workflow-with-nested-controls)
     - [Banner (Collapsible with Action Buttons)](#banner-collapsible-with-action-buttons)
     - [Paragraph & Divider](#paragraph--divider)
   - [Feedback & Overlays](#6-feedback--overlays)
     - [Toast Notifications](#toast-notifications)
     - [Modal Confirmation Dialogs](#modal-confirmation-dialogs)
5. [Universal Built-In System Tabs](#universal-built-in-system-tabs)
6. [Stealth Directives & Security Policy](#stealth-directives--security-policy)

---

## Key Highlights

- **Stealth Architecture**: Operates silently with zero `print()` or `warn()` calls in callbacks, automatic secure parenting into `gethui()` / `CoreGui`, randomized instance names, and no detectable `CollectionService` tags or attributes.
- **Pure Monochromatic Aesthetics**: Supports high-contrast **Pure Black & White** and **Pure White** themes with fluid 60 FPS transitions and procedural Sun/Moon switcher.
- **Adaptive Multi-Device Engine**: Built-in sizing presets for PC, Tablet, and Android with synchronized `UI Scale Multiplier` slider.
- **Dual-Column & Single-Column Dashboards**: Seamlessly toggle between balanced 2-column cards (`Side = "Left"` & `Side = "Right"`) or single-column vertical flows.
- **750+ Vector Lucide Icons**: Instant icon rendering via procedural spritesheet mapping by simple string names (`"crosshair"`, `"eye"`, `"shield"`, `"user"`, `"zap"`, `"swords"`, `"settings"`).
- **Floating Mobile Pin Widget**: Built-in draggable pill widget automatically activated on mobile devices or when minimized, with position persistence.
- **Cloud DRM & Telemetry Integration**: Native handshake support displaying verified License Key, Tier, Expiration countdown, Execution Counter, and Executor Name.
- **Nested Component Containers**: Progression steppers support embedding toggles, dropdowns, sliders, and buttons directly inside the step card.
- **Group Direction Engine**: Multi-control groups (`ToggleGroup`, `SliderGroup`, `InputGroup`) support both horizontal (`Direction = "Right"`) and vertical stacked (`Direction = "Down"`) layouts inside unified cards.

---

## Bootstrap & Quick Start

Load LiyhubUI directly into any executor workspace:

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
    Callback = function(state: boolean)
        getgenv().SilentAim = state
    end
})

TargetSection:CreateSlider({
    Name = "Field of View",
    Min = 30,
    Max = 360,
    Default = 90,
    Unit = "°",
    Callback = function(val: number)
        getgenv().FOV = val
    end
})
```

---

## Architecture & Layout System

### Window Creation Options

```luau
local Window = Liyhub:CreateWindow({
    Title = "Liyhub",
    Subtitle = "Universal Edition",
    Size = UDim2.fromOffset(740, 490),
    ToggleKey = Enum.KeyCode.RightControl,
    MobilePin = true,
    Logo = "rbxassetid://126257104774952",
    Discord = "https://discord.gg/Nr56tQJeJh",
    TwoColumns = true,
    UniversalGroup = true,
})
```

| Parameter | Type | Default | Description |
|---|---|---|---|
| `Title` | `string` | `"Liyhub"` | Primary header branding title. |
| `Subtitle` | `string` | `""` | Secondary subtitle or version text. |
| `Size` | `UDim2` | `UDim2.fromOffset(740, 490)` | Initial window dimensions. |
| `ToggleKey` | `Enum.KeyCode` | `Enum.KeyCode.RightControl` | Keyboard shortcut to toggle window visibility. |
| `MobilePin` | `boolean` | `true` | Enables draggable floating mobile widget. |
| `Logo` | `string` | `"rbxassetid://126257104774952"` | Asset URL or Roblox ID for branding logo. |
| `Discord` | `string` | `"https://discord.gg/Nr56tQJeJh"` | Discord server invite link for information tab. |
| `TwoColumns` | `boolean` | `true` | Starts window in 2-column split view mode. |
| `UniversalGroup` | `boolean` | `true` | Automatically mounts User Profile, Info, and Settings tabs. |

### Layout Modes (1-Column vs 2-Column)

Toggle between balanced 2-column split view and single-column flow dynamically:

```luau
Window:SetTwoColumnsMode(true)  -- 2 Columns (Split View)
Window:SetTwoColumnsMode(false) -- 1 Column (Single Flow)
```

In 2-column mode, sections with `Side = "Left"` populate the left column, while `Side = "Right"` populate the right column. In single-column mode, all sections stack smoothly in a unified vertical scroll.

### Responsive Device Presets

Switch layout presets dynamically at runtime:

```luau
Window:SetDevice("PC")      -- 740x490 window, 1.00x scale, 2-column layout
Window:SetDevice("Tablet")  -- 640x440 window, 1.05x scale, 2-column layout
Window:SetDevice("Android") -- 580x410 window, 1.10x scale, 1-column layout
```

Switching devices automatically updates window bounds, sidebar dimensions, column layout, and moves the `UI Scale Multiplier` slider to the preset value.

### Window Acrylic Transparency

Adjust interface background transparency in real-time:

```luau
Window:SetTransparency(0.15)       -- Sets window backdrop transparency (0.0 to 1.0)
Window:SetGroupTransparency(0.20)  -- Sets overall CanvasGroup transparency
```

### Runtime Theme Switching

Switch themes dynamically or let users toggle via the header Sun/Moon button:

```luau
Window:SetTheme("Pure Black & White") -- Matte black backdrop, white typography & strokes
Window:SetTheme("Pure White")          -- Matte light backdrop, dark typography & strokes
```

---

## Complete Component API Reference

### 1. Navigation: Tab Groups & Tabs

#### `Window:CreateTabGroup(name: string)`
Creates a collapsible category group in the sidebar.
```luau
local MainGroup = Window:CreateTabGroup("Main Features")
local WorldGroup = Window:CreateTabGroup("World & Navigation")
local SettingsGroup = Window:CreateTabGroup("Settings")
```

#### `TabGroup:CreateTab(options: table)`
Creates a tab inside the specified category group.
```luau
local CombatTab = MainGroup:CreateTab({
    Name = "Combat",
    Icon = "crosshair", -- Lucide icon name, Asset ID, or URL
    TwoColumns = true,  -- Enables 2-column mode for this specific tab
})
```

### Vector Emotes & Icons System (`Liyhub.Icons` & `Liyhub.Emotes`)

LiyhubUI V2 includes a high-performance vector icon engine supporting 4 flexible input formats:
1. **Property Lookup**: `Liyhub.Icons.<name>` or `Liyhub.Emotes.<name>` (e.g., `Liyhub.Icons.sword`, `Liyhub.Emotes.book`)
2. **String Identifier**: Direct Lucide name string (e.g., `"crosshair"`, `"teleport"`, `"swords"`)
3. **Roblox Asset ID**: Direct asset string or numeric ID (e.g., `"rbxassetid://126257104774952"`)
4. **Web / CDN URL**: Direct HTTP(S) image link (e.g., `"https://cdn.discordapp.com/..."`)

```luau
-- Using Liyhub.Icons or Liyhub.Emotes table lookup:
local CombatTab = MainGroup:CreateTab({
    Name = "Combat",
    Icon = Liyhub.Icons.sword, -- Automatically resolves to vector icon
})

local WorldTab = MainGroup:CreateTab({
    Name = "World & Travel",
    Icon = Liyhub.Emotes.teleport,
})

local Stepper = LeftSec:CreateProgression({
    Title = "Workflow Pipeline",
    Steps = {
        { Name = "Accept", Icon = Liyhub.Icons.book },
        { Name = "Travel", Icon = Liyhub.Icons.gamepad },
        { Name = "Battle", Icon = Liyhub.Icons.sword },
        { Name = "Boss",   Icon = Liyhub.Icons.skull },
        { Name = "Reward", Icon = Liyhub.Icons.gem },
    }
})
```

#### Core Vector Emote Aliases Mapping

| Emote Key | Lucide Sprite | Sheet & Offset | Typical Use Case |
|---|---|---|---|
| `home` / `main` | Home building | Sheet 1 (650, 275) | Main dashboard tab |
| `sword` / `swords` / `combat` / `battle` | Crossed swords | Sheet 2 (125, 25) | Combat, attack, auto-farm |
| `teleport` / `pin` / `map` / `world` | Location pin / Globe | Sheet 1 (325, 800) | Waypoints, travel, island teleport |
| `crosshair` / `aim` / `target` / `focus` | Targeting reticle | Sheet 1 (725, 75) | Silent aim, aimbot, lock-on |
| `shield` / `defense` / `parry` | Protective crest | Sheet 1 (750, 775) | Auto block, invincibility, godmode |
| `zap` / `speed` / `lightning` | Lightning bolt | Sheet 2 (400, 150) | Walkspeed, fly, noclip, boost |
| `eye` / `esp` / `spectate` | Vision eye | Sheet 1 (175, 675) | Box ESP, nametags, tracers |
| `settings` / `gear` / `config` | Cog wheel | Sheet 1 (825, 675) | Settings, profile configuration |
| `user` / `profile` / `player` | User silhouette | Sheet 2 (375, 75) | Profile telemetry, local player stats |
| `skull` / `boss` | Skull icon | Sheet 1 (875, 700) | Boss encounters, kill aura |
| `gem` / `diamond` / `loot` / `reward` | Faceted diamond | Sheet 1 (175, 775) | Quest rewards, currency, gacha |
| `book` / `scroll` / `quest` | Ancient scroll | Sheet 1 (800, 675) | Quest journals, progression logs |
| `folder` / `package` | Storage crate | Sheet 1 (550, 700) | Inventory, storage, backpacks |
| `gamepad` | Game controller | Sheet 1 (300, 650) | Controls, keybinds, macros |
| `wrench` / `tool` / `tools` | Mechanical wrench | Sheet 2 (50, 475) | Utility scripts, physics modifiers |
| `flame` / `fire` | Fire flame | Sheet 1 (850, 75) | Weapon damage, elemental attacks |
| `check` / `accept` | Checkmark | Sheet 1 (175, 450) | Task completion, verified items |
| `chevron` / `arrow` / `arrowRight` | Direction arrow | Sheet 1 (625, 25) | Dropdown indicators, navigation |

---

### 2. Sections & Layout Side

Supported Lucide icon names include: `"crosshair"`, `"eye"`, `"shield"`, `"user"`, `"zap"`, `"swords"`, `"settings"`, `"globe"`, `"binoculars"`, `"palette"`, `"home"`, `"pin"`, `"skull"`, `"gem"`, `"wrench"`, `"info"`, `"check"`, and 700+ more.

---

### 2. Sections & Layout Side

#### `Tab:CreateSection(options: string | table)`
Creates a collapsible card section within the tab.
```luau
-- Single Column or Default:
local GeneralSec = MainTab:CreateSection("General Automation")

-- Dual Column Split View:
local LeftSec = CombatTab:CreateSection({ Title = "Targeting & Aim", Side = "Left" })
local RightSec = CombatTab:CreateSection({ Title = "Weapon Buffs", Side = "Right" })
```

---

### 3. Interactive Form Components

#### Toggle & ToggleGroup

##### Toggle
Single switch toggle with multi-line description support.
```luau
local silentAimToggle = LeftSec:CreateToggle({
    Name = "Silent Aim",
    Desc = "Automatically redirect weapon projectiles toward target bone.",
    Default = false,
    Callback = function(state: boolean)
        getgenv().SilentAimEnabled = state
    end
})
```

##### ToggleGroup
Combines 2 or more toggles inside a single card container. Supports horizontal side-by-side (`Direction = "Right"`) or vertical stack (`Direction = "Down"`).
```luau
-- Horizontal 50/50 side-by-side (Direction = "Right" or default)
LeftSec:CreateToggleGroup({
    Direction = "Right",
    Toggles = {
        {
            Title = "Auto Farm",
            Default = false,
            Callback = function(v: boolean) end
        },
        {
            Title = "Fast Attack",
            Default = false,
            Callback = function(v: boolean) end
        }
    }
})

-- Vertical 1-card stack (Direction = "Down")
RightSec:CreateToggleGroup({
    Direction = "Down",
    Toggles = {
        {
            Title = "Kill Aura",
            Default = false,
            Callback = function(v: boolean) end
        },
        {
            Title = "Auto Equip",
            Default = false,
            Callback = function(v: boolean) end
        }
    }
})
```

Aliases supported: `Section:CreateToggles()`, `Section:AddToggle()`, `Section:AddToggleGroup()`.

---

#### Slider & SliderGroup

##### Slider
Interactive slider with numeric stepping, custom units/suffixes, and programmatic value control.
```luau
local fovSlider = LeftSec:CreateSlider({
    Name = "Field of View",
    Min = 30,
    Max = 360,
    Step = 1,
    Default = 90,
    Unit = "°",
    Callback = function(val: number)
        getgenv().AimbotFOV = val
    end
})

fovSlider:SetValue(120)            -- Animates slider fill and invokes callback
local currentFov = fovSlider:GetValue()
```

##### SliderGroup
Groups multiple sliders into a single card. Supports horizontal (`Direction = "Right"`) or vertical (`Direction = "Down"`).
```luau
-- Horizontal side-by-side:
LeftSec:CreateSliderGroup({
    Direction = "Right",
    Sliders = {
        { Title = "WalkSpeed", Min = 16, Max = 150, Default = 60, Callback = function(v) end },
        { Title = "JumpPower", Min = 50, Max = 300, Default = 150, Callback = function(v) end },
    }
})

-- Vertical stack:
RightSec:CreateSliderGroup({
    Direction = "Down",
    Sliders = {
        { Title = "FOV Radius", Min = 0, Max = 360, Default = 90, Callback = function(v) end },
        { Title = "Smoothness", Min = 1, Max = 100, Default = 10, Callback = function(v) end },
    }
})
```

Aliases supported: `Section:CreateSliders()`, `Section:AddSlider()`, `Section:AddSliderGroup()`.

---

#### Dropdown & MultiDropdown

##### Dropdown (Single Select)
Expandable animated dropdown with search and dynamic option updates.
```luau
local boneDropdown = LeftSec:CreateDropdown({
    Name = "Target Bone",
    Options = { "Head", "HumanoidRootPart", "UpperTorso", "Random" },
    Default = "Head",
    Callback = function(choice: string)
        getgenv().TargetBone = choice
    end
})

boneDropdown:SetValue("HumanoidRootPart")
boneDropdown:SetOptions({ "Head", "Torso", "Feet" })
```

##### MultiDropdown (Multi Select)
Multi-selection dropdown with Select All and Clear buttons.
```luau
local filterDropdown = LeftSec:CreateMultiDropdown({
    Name = "Target Filter",
    Options = { "Enemies", "NPCs", "Friends", "Downed" },
    Default = { "Enemies" },
    Callback = function(selectedList: {string})
        getgenv().TargetFilter = selectedList
    end
})

filterDropdown:SetValue({ "Enemies", "NPCs" })
```

##### DropdownGroup
Pairs multiple dropdowns into a single card container.
```luau
LeftSec:CreateDropdownGroup({
    Dropdowns = {
        { Name = "Priority", Options = { "Distance", "Health", "Crosshair" }, Default = "Distance", Callback = function(c) end },
        { Name = "Prediction", Options = { "Off", "Low", "Medium", "High" }, Default = "Low", Callback = function(c) end },
    }
})
```

---

#### Input / Textbox & InputGroup

##### Input
Single-line text entry with placeholder support.
```luau
local playerInput = RightSec:CreateInput({
    Name = "Target Player",
    Placeholder = "Enter exact username...",
    Default = "",
    ClearOnEnter = false,
    Callback = function(text: string)
        getgenv().TargetPlayerName = text
    end
})

playerInput:SetValue("Player1")
```

##### InputGroup
Groups multiple text inputs into a single card container.
```luau
-- Horizontal side-by-side:
LeftSec:CreateInputGroup({
    Direction = "Right",
    Inputs = {
        { Title = "Target X", Placeholder = "100", Default = "100", Callback = function(t) end },
        { Title = "Target Y", Placeholder = "250", Default = "250", Callback = function(t) end },
    }
})

-- Vertical stack:
RightSec:CreateInputGroup({
    Direction = "Down",
    Inputs = {
        { Title = "Webhook URL", Placeholder = "https://discord.com/...", Callback = function(t) end },
        { Title = "Discord User ID", Placeholder = "123456789", Callback = function(t) end },
    }
})
```

Aliases supported: `Section:CreateInputs()`, `Section:AddInput()`, `Section:AddInputGroup()`.

---

#### Keybind
Interactive keybind listener with live binding prompt.
```luau
local toggleBind = RightSec:CreateKeybind({
    Name = "Trigger Keybind",
    Default = Enum.KeyCode.E,
    Callback = function(key: Enum.KeyCode)
        getgenv().TriggerKey = key
    end
})
```

---

#### ColorPicker
RGB color selector for ESP, chams, tracers, and UI accent colors.
```luau
local espColorPicker = RightSec:CreateColorPicker({
    Name = "ESP Accent Color",
    Default = Color3.fromRGB(0, 162, 255),
    Callback = function(col: Color3)
        getgenv().ESPColor = col
    end
})
```

---

### 4. Action Components

#### Button & Action Row

```luau
-- Full-Width Button:
LeftSec:CreateButton({
    Name = "Instant Kill Action",
    Callback = function()
        -- combat execution
    end
})

-- Action Row (Title + Description + Compact Button):
LeftSec:CreateButton({
    Title = "Teleport Safe Zone",
    Description = "Instant warp to safe coordinate bounds.",
    ButtonText = "Warp",
    Callback = function()
        -- teleport execution
    end
})
```

#### ButtonGroup
Balanced horizontal multi-action row with anti-cutoff typography.
```luau
LeftSec:CreateButtonGroup({
    Buttons = {
        { Name = "Start", Callback = function() end },
        { Name = "Pause", Callback = function() end },
        { Name = "Reset", Callback = function() end },
    }
})
```

#### Dual-Widget Row (Anti-Cutoff Mobile Row)
Places two widgets side-by-side with 50/50 balanced width.
```luau
local actionRow = LeftSec:CreateRow()
actionRow:AddToggle({ Name = "Auto Parry", Desc = "Block incoming attacks", Default = false, Callback = function(s) end })
actionRow:AddKeybind({ Name = "Parry Key", Default = Enum.KeyCode.F, Callback = function(k) end })
```

---

### 5. Advanced & Workflow Components

#### Progression Stepper (Multi-Step Workflow with Nested Controls)

The Progression component provides an animated multi-step workflow container with step status dots, connecting progress lines, Lucide icons, previous/next controls, and **nested interactive components** embedded directly inside the card.

```luau
local questProg = LeftSec:CreateProgression({
    Title = "Quest Journey (Auto Farm)",
    Subtitle = "Automated quest and boss combat workflow",
    CurrentStep = 1,
    Controls = true,
    NextText = "Next",
    PrevText = "Previous",
    Steps = {
        { Name = "Accept", Icon = "check" },
        { Name = "Teleport", Icon = "teleport" },
        { Name = "Farm", Icon = "swords" },
        { Name = "Boss", Icon = "skull" },
        { Name = "Reward", Icon = "gem" },
    },
    Callback = function(stepIndex: number, stepData: table)
        -- Step changed callback
    end
})

-- Nested Toggle inside the Progression Card:
local autoToggle = questProg:CreateToggle({
    Name = "Auto Execute Step",
    Desc = "Continuously advance through quest steps automatically.",
    Default = false,
    Callback = function(state: boolean)
        -- Start/stop auto execution
    end
})

-- Nested Dropdown inside the Progression Card:
local diffDropdown = questProg:CreateDropdown({
    Name = "Quest Difficulty",
    Options = { "Easy", "Medium", "Hard", "Nightmare" },
    Default = "Easy",
    Callback = function(diff: string) end
})

-- Nested Slider inside the Progression Card:
local speedSlider = questProg:CreateSlider({
    Name = "Step Interval",
    Min = 1,
    Max = 10,
    Default = 2,
    Unit = "s",
    Callback = function(sec: number) end
})

-- Programmatic Navigation Controls:
questProg:Next()            -- Advances to next step
questProg:Previous()        -- Returns to previous step
questProg:SetStep(3)        -- Jumps directly to step 3
local curStep = questProg:GetStep()
```

---

#### Banner (Collapsible with Action Buttons)

Media announcement card with responsive image scaling, collapsible toggle, paragraph text, and embedded action buttons.

```luau
LeftSec:CreateBanner({
    Title = "LiyHub Announcement",
    Content = "Special double XP weekend active across all public game modes.",
    Image = "rbxassetid://108339444679489", -- Supports Asset ID, rbxasset, or Web/CDN URLs
    Collapsible = true,
    Default = true,
    Buttons = {
        {
            Title = "Join Discord",
            Accent = true, -- High contrast primary button
            Callback = function()
                local setClip = setclipboard or toclipboard or (Clipboard and Clipboard.set)
                if setClip then
                    setClip("https://discord.gg/Nr56tQJeJh")
                end
            end
        },
        {
            Title = "Check Updates",
            Accent = false, -- Dark matte outline button
            Callback = function()
                -- Check updates routine
            end
        }
    }
})
```

---

#### Paragraph & Divider

```luau
RightSec:CreateParagraph({
    Title = "Security Protocol",
    Content = "All remotes are routed through internal validation proxies."
})

RightSec:CreateDivider()
```

---

### 6. Feedback & Overlays

#### Toast Notifications

```luau
Window:Notify({
    Title = "Configuration Saved",
    Content = "Profile 'Default' persisted successfully.",
    Duration = 2.5,
    Type = "Success" -- "Success" | "Info" | "Warning"
})
```

#### Modal Confirmation Dialogs

Supports two modes: standard confirmation or multi-button custom action dialogs.

```luau
-- Multi-Button Custom Dialog:
Window:ShowModal({
    Title = "Confirm Reset",
    Message = "Are you sure you want to reset all configurations to defaults?",
    Buttons = {
        {
            Text = "Cancel",
            Variant = "Secondary",
            Callback = function() end
        },
        {
            Text = "Reset",
            Variant = "Primary",
            Callback = function()
                -- Reset routine
            end
        }
    }
})

-- Standard Confirmation Dialog:
Window:ShowModal({
    Title = "Delete Profile",
    Message = "This action will permanently delete profile 'Custom1'.",
    ConfirmText = "Delete",
    CancelText = "Keep",
    OnConfirm = function() end,
    OnCancel = function() end
})
```

---

## Universal Built-In System Tabs

When `UniversalGroup = true` (default), LiyhubUI automatically creates three essential system tabs:

1. **User Profile**:
   - Displays live cloud DRM telemetry: `LiyHubKey`, `LiyHubTier`, `LiyHubRemainingTime`, `LiyHubExecutionCount`, executor detection, profile avatar thumbnail, and Job ID.
   - 1-Click buttons to copy User ID, License Key, and Server Job ID.
   - Clicking the user profile avatar card in the bottom-left sidebar instantly switches to this tab.
2. **Information**:
   - Announcement banner and 1-click Discord invite copier.
3. **Settings UI**:
   - Configuration Profile Manager (`Save`, `Load`, `Delete`, `Profile List`).
   - Device Layout Preset selector (`PC Layout`, `Tablet Layout`, `Android Layout`).
   - Dynamic `UI Scale Multiplier` slider synchronized with presets.
   - Menu toggle keybind selector.
   - Clean UI unload button.

---

## Stealth Directives & Security Policy

All scripts built with LiyhubUI V2 must adhere to these stealth rules:

1. **Zero `print()` or `warn()` Calls**: Never use console logging in UI callbacks or game loops to prevent detection via `LogService.MessageOut`.
2. **`getgenv()` Strict Isolation**: Always store global state flags in `getgenv()`. Never touch `_G`.
3. **No Detectable Tags or Attributes**: Never attach `CollectionService` tags or custom attributes to UI instances. LiyhubUI secures itself into `gethui()` / `CoreGui` using randomized identifiers.
4. **Zero Auto-Start**: All automation toggles, farming loops, and background tasks MUST default to `false`.
5. **Clean Task Spawning**: Wrap background loops inside `task.spawn` and cleanly bind frame updates to `RunService.RenderStepped` or `Heartbeat`.
