# LiyHub UI Troubleshooting Guide

### 1. UI Doesn't Appear on Screen
- **Cause**: In Roblox Studio Play mode, check if `ScreenGui` is parented to `LocalPlayer.PlayerGui`.
- **Solution**: Ensure your script runs as a `LocalScript` on the client. `LiyHubUI:CreateWindow()` automatically defaults to `LocalPlayer.PlayerGui`.

### 2. UI Keybind Doesn't Toggle Window
- **Cause**: Game input or focused text box consumed the key event, or the toggle key was changed.
- **Solution**: The default toggle key is `Enum.KeyCode.RightControl`. Ensure `Window:SetToggleKey(Enum.KeyCode.RightControl)` or your desired key is configured.

### 3. File Persistence Not Saving
- **Cause**: Standard Roblox Studio security sandboxes do not expose filesystem functions (`writefile`, `readfile`).
- **Solution**: `ConfigService` automatically falls back to in-memory state when filesystem APIs are unavailable. Configuration values remain intact for the duration of the play session.

### 4. Components Overlapping in Dual-Column Layout
- **Cause**: Sections were created without specifying a `Side` option or columns exceeded bounds.
- **Solution**: Ensure your tab is configured with `TwoColumns = true` and sections are designated with `Side = "Left"` or `Side = "Right"`.

