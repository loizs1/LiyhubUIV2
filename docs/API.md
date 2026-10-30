# LiyHub UI API Reference

## LiyHubUI (Root)

### `LiyHubUI:CreateWindow(options: Table): Window`
Creates and initializes a new top-level UI window.
- **Parameters**:
  - `Title`: `string` (default: `"LiyHub UI"`)
  - `Subtitle`: `string` (default: `"v2.2 Black & White Edition"`)
  - `Size`: `UDim2` (default: `UDim2.new(0, 680, 0, 460)`)
  - `Position`: `UDim2` (optional, centered by default)
  - `ToggleKey`: `Enum.KeyCode` (default: `Enum.KeyCode.RightControl`)
  - `Parent`: `Instance` (optional, defaults to `LocalPlayer.PlayerGui`)
  - `Theme`: `Table` (optional, defaults to `PureBlackWhite`)
- **Returns**: `Window`

### `LiyHubUI:CreateConfigService(options: Table): ConfigService`
Instantiates a configuration service.
- **Parameters**:
  - `FolderName`: `string`
  - `FileName`: `string`

### `LiyHubUI:CreateProfileService(configService: ConfigService): ProfileService`
Instantiates a named profile manager connected to a config service.

### `LiyHubUI:Notify(options: Table)`
Displays a global notification toast on the client screen.

---

## Window

### `Window:CreateTabGroup(name: string): TabGroup`
Creates a collapsible category in the left sidebar.

### `Window:SetTransparency(value: number)`
Sets the background transparency of the main window surfaces (0 to 1).

### `Window:SetGroupTransparency(value: number)`
Sets the canvas group transparency of the whole window.

### `Window:SetToggleKey(keyCode: Enum.KeyCode)`
Updates the global keyboard keybind that toggles window visibility.

### `Window:Toggle()`
Toggles the visibility state of the window.

### `Window:Notify(options: Table)`
Spawns a toast notification attached to this window's ScreenGui.
- **Options**:
  - `Title`: `string`
  - `Content`: `string`
  - `Duration`: `number` (seconds, default: `3.5`)

### `Window:ShowModal(options: Table)`
Opens a centered confirmation modal dialog.
- **Options**:
  - `Title`: `string`
  - `Message`: `string`
  - `ConfirmText`: `string` (default: `"Confirm"`)
  - `CancelText`: `string` (default: `"Cancel"`)
  - `OnConfirm`: `function()`
  - `OnCancel`: `function()`

### `Window:Destroy()`
Safely disconnects all input connections, terminates active window tasks, and destroys all ScreenGui elements. Safe for repeated calls (idempotent).

---

## TabGroup

### `TabGroup:CreateTab(options: Table): Tab`
Creates a tab within this category.
- **Options**:
  - `Name`: `string`
  - `Icon`: `string` (Roblox asset ID, optional)
  - `TwoColumns`: `boolean` (default: `false`, enables dual-column layout)

---

## Tab

### `Tab:CreateSection(nameOrOptions: string | Table): Section`
Creates a container section on the tab canvas.
- **Options**:
  - `Name`: `string`
  - `Side`: `"Left" | "Right"` (only used when `TwoColumns = true`)

---

## Section Components

- `CreateButton(options)`
- `CreateButtonGroup(options)`
- `CreateToggle(options)`
- `CreateToggleGroup(options)`
- `CreateSlider(options)`
- `CreateSliderGroup(options)`
- `CreateInput(options)`
- `CreateInputGroup(options)`
- `CreateDropdown(options)`
- `CreateDropdownGroup(options)`
- `CreateKeybind(options)`
- `CreateParagraph(options)`
- `CreateDivider()`
- `CreateBanner(options)`
- `CreateProgression(options)`

