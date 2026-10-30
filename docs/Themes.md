# LiyHub UI Theme System

LiyHub UI is built around a **Pure Black & White Minimalist** visual philosophy.

## Design Rules
1. **No UI Strokes**: To achieve a clean, borderless, matte appearance, UI strokes are completely disabled.
2. **Matte Surfaces**: Rich, deep matte background colors (`#0E0E10` to `#161619`) ensure maximum contrast with pure white elements.
3. **Typography**: Clean modern sans-serif typography (`GothamBold`, `GothamMedium`, or `BuilderSans`) provides high readability at all resolutions.
4. **Restrained Motion**: Subtle, fast quadratic ease-out transitions (`0.15s` - `0.25s`).

## Token Reference

| Token Name | Value | Purpose |
| :--- | :--- | :--- |
| `Background` | `Color3.fromRGB(14, 14, 16)` | Main window background canvas |
| `Header` | `Color3.fromRGB(18, 18, 21)` | Top header bar |
| `Sidebar` | `Color3.fromRGB(16, 16, 19)` | Left navigation panel |
| `SidebarItem` | `Color3.fromRGB(22, 22, 26)` | Inactive tab button surface |
| `SidebarItemActive`| `Color3.fromRGB(32, 32, 38)` | Active selected tab button |
| `Card` | `Color3.fromRGB(22, 22, 26)` | Section card container |
| `Element` | `Color3.fromRGB(26, 26, 31)` | Interactive buttons, inputs, toggles |
| `ElementHover` | `Color3.fromRGB(35, 35, 42)` | Hover state |
| `ElementActive` | `Color3.fromRGB(44, 44, 53)` | Pressed/focused state |
| `TextPrimary` | `Color3.fromRGB(255, 255, 255)` | Main titles and labels |
| `TextSecondary` | `Color3.fromRGB(160, 160, 172)`| Subtitles and descriptions |
| `TextMuted` | `Color3.fromRGB(95, 95, 108)` | Section headers and hints |
| `Accent` | `Color3.fromRGB(255, 255, 255)`| Active tab left indicator bar |
| `AccentStep` | `Color3.fromRGB(0, 174, 255)` | Stepper active/completed node color |

