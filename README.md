# LiyHub UI

> **Pure Black & White Minimalist UI Library for Roblox Luau**

LiyHub UI is a modular, high-performance, and distraction-free UI library crafted for Roblox Luau developers. Designed with a sleek pure black-and-white aesthetic, matte surfaces, fluid animations, and zero UI strokes, it provides an extensive suite of modern UI components and services for complex script interfaces.

---

## Features

- **Pure Black & White Minimalist Design**: High-contrast matte black and white palette with clean typography and zero UI strokes.
- **Modular Architecture**: Clean separation between core window systems, navigation, layouts, components, themes, and configuration services.
- **Single & Dual-Column Layouts**: Full responsive support for multi-column dashboards (`TwoColumns = true`, `Side = "Left" | "Right"`).
- **Component Groups**: `ButtonGroup`, `ToggleGroup`, `SliderGroup`, `InputGroup`, and `DropdownGroup` with independent state and callback isolation.
- **Rich Interactive Components**:
  - **Progression Stepper**: Multi-step workflow with connection lines, step status indicators, and next/previous navigation.
  - **Banner**: Media presentation card with image header, title, and explanatory text.
  - **Single & Multi-Select Dropdowns**: Expandable animated selection list with custom options and checkmarks.
  - **Draggable Sliders**: Numeric bounds, stepping quantization, and real-time value display.
  - **Animated Toggles**: Synchronized switch toggle with internal state management.
  - **Interactive Keybinds**: Direct keypress listener with custom trigger actions.
  - **Inputs & Text Fields**: Placeholder support, focus animations, and submit handlers.
  - **Confirmation Modals & Toast Notifications**: Screen-level dialogs and floating toast alerts.
- **Configuration & Profiles**: Save, load, import, export, and named profile switching with built-in runtime fallback.
- **Reliable Lifecycle & Resource Cleanup**: Idempotent `Window:Destroy()` cleans up all event connections, UI instances, tasks, and animations.

---

## Directory Structure

```
LiyHubUI/
├── LiyHubUI.lua                   # Main entry point & standalone loader
├── src/
│   ├── core/
│   │   ├── Window.lua             # Window frame, dragging, profile card, modals
│   │   ├── Layout.lua             # Single and dual column layout engine
│   │   ├── Signals.lua            # High-performance Luau events
│   │   ├── Cleanup.lua            # Deterministic Maid / Janitor lifecycle cleanup
│   │   └── Tween.lua              # Smooth animation helpers
│   ├── components/
│   │   ├── Button.lua             # Standard button
│   │   ├── ButtonGroup.lua        # Balanced horizontal button row
│   │   ├── Toggle.lua             # Animated toggle switch
│   │   ├── ToggleGroup.lua        # Grouped card of toggles
│   │   ├── Slider.lua             # Draggable numeric slider
│   │   ├── SliderGroup.lua        # Grouped card of sliders
│   │   ├── Input.lua              # Text input with placeholder
│   │   ├── InputGroup.lua         # Grouped card of inputs
│   │   ├── Dropdown.lua           # Single & multi-select dropdown
│   │   ├── DropdownGroup.lua      # Grouped card of dropdowns
│   │   ├── Keybind.lua            # Interactive keybind listener
│   │   ├── Paragraph.lua          # Information card
│   │   ├── Divider.lua            # Subtle separator
│   │   ├── Banner.lua             # Image header banner
│   │   ├── Progression.lua        # Stepper workflow component
│   │   └── Modal.lua              # Confirmation dialogs & toasts
│   ├── services/
│   │   ├── ConfigService.lua      # Configuration serialization & validation
│   │   └── ProfileService.lua     # Named profiles manager
│   └── themes/
│       ├── ThemeManager.lua       # Theme state and subscriber system
│       └── PureBlackWhite.lua     # Pure B&W theme definition
├── examples/
│   ├── ComprehensiveExample.lua   # Full showcase script
│   └── MinimalExample.lua         # Quick start starter script
├── tests/
│   ├── TestRunner.lua             # Automated verification runner
│   └── UnitTests.lua              # 18-point verification test suites
└── docs/
    ├── GettingStarted.md
    ├── API.md
    ├── Components.md
    ├── Themes.md
    ├── Configuration.md
    └── Troubleshooting.md
```

---

## Quick Start

```lua
local LiyHubUI = require(path.to.LiyHubUI)

local Window = LiyHubUI:CreateWindow({
    Title = "LiyHub UI",
    Subtitle = "v2.2 Black & White Edition",
    ToggleKey = Enum.KeyCode.RightControl,
})

local MainGroup = Window:CreateTabGroup("Main Features")
local Tab = MainGroup:CreateTab({ Name = "Home", Icon = "rbxassetid://6031075931" })
local Section = Tab:CreateSection("General Controls")

Section:CreateButton({
    Text = "Trigger Action",
    Callback = function()
        Window:Notify({ Title = "Success", Content = "Action executed!" })
    end
})

Section:CreateToggle({
    Name = "Auto Farm",
    Default = false,
    Callback = function(val)
        print("Auto Farm set to:", val)
    end
})
```

---

## License

MIT License. Designed and maintained for the LiyHub ecosystem.

