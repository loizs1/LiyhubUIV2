import os
import json

base_dir = r"c:\Users\User\Downloads\Liyhub Ui"

files_to_bundle = [
    ("src/themes/PureBlackWhite", "src/themes/PureBlackWhite.lua"),
    ("src/themes/ThemeManager", "src/themes/ThemeManager.lua"),
    ("src/core/Signals", "src/core/Signals.lua"),
    ("src/core/Cleanup", "src/core/Cleanup.lua"),
    ("src/core/Tween", "src/core/Tween.lua"),
    ("src/core/Layout", "src/core/Layout.lua"),
    ("src/components/Modal", "src/components/Modal.lua"),
    ("src/components/MobilePin", "src/components/MobilePin.lua"),
    ("src/components/Button", "src/components/Button.lua"),
    ("src/components/ButtonGroup", "src/components/ButtonGroup.lua"),
    ("src/components/Toggle", "src/components/Toggle.lua"),
    ("src/components/ToggleGroup", "src/components/ToggleGroup.lua"),
    ("src/components/Slider", "src/components/Slider.lua"),
    ("src/components/SliderGroup", "src/components/SliderGroup.lua"),
    ("src/components/Input", "src/components/Input.lua"),
    ("src/components/InputGroup", "src/components/InputGroup.lua"),
    ("src/components/Dropdown", "src/components/Dropdown.lua"),
    ("src/components/DropdownGroup", "src/components/DropdownGroup.lua"),
    ("src/components/Keybind", "src/components/Keybind.lua"),
    ("src/components/Paragraph", "src/components/Paragraph.lua"),
    ("src/components/Divider", "src/components/Divider.lua"),
    ("src/components/Banner", "src/components/Banner.lua"),
    ("src/components/Progression", "src/components/Progression.lua"),
    ("src/services/ConfigService", "src/services/ConfigService.lua"),
    ("src/services/ProfileService", "src/services/ProfileService.lua"),
    ("src/core/Window", "src/core/Window.lua"),
    ("tests/UnitTests", "tests/UnitTests.lua"),
    ("tests/TestRunner", "tests/TestRunner.lua"),
]

bundle_code = """--[[
    LiyHub UI - Complete Standalone Distribution Bundle
    Pure Black & White Minimalist Edition
]]

local _modules = {}
local _cache = {}

local function _require(name)
    if _cache[name] then
        return _cache[name]
    end
    local loader = _modules[name]
    if not loader then
        error("Module '" .. tostring(name) .. "' not found in bundle")
    end
    local result = loader()
    _cache[name] = result
    return result
end
"""

for mod_name, rel_path in files_to_bundle:
    full_path = os.path.join(base_dir, rel_path)
    with open(full_path, "r", encoding="utf-8") as f:
        content = f.read()
    
    bundle_code += f'\n-- Module: {mod_name}\n_modules["{mod_name}"] = function()\n'
    bundle_code += content + "\nend\n"

bundle_code += """
-- Direct references for top-level LiyHubUI
local PureBlackWhite = _require("src/themes/PureBlackWhite")
local ThemeManager = _require("src/themes/ThemeManager")
local Cleanup = _require("src/core/Cleanup")
local Signals = _require("src/core/Signals")
local TweenUtil = _require("src/core/Tween")
local Layout = _require("src/core/Layout")
local Window = _require("src/core/Window")
local ConfigService = _require("src/services/ConfigService")
local ProfileService = _require("src/services/ProfileService")

local Button = _require("src/components/Button")
local ButtonGroup = _require("src/components/ButtonGroup")
local Toggle = _require("src/components/Toggle")
local ToggleGroup = _require("src/components/ToggleGroup")
local Slider = _require("src/components/Slider")
local SliderGroup = _require("src/components/SliderGroup")
local InputComp = _require("src/components/Input")
local InputGroup = _require("src/components/InputGroup")
local Dropdown = _require("src/components/Dropdown")
local DropdownGroup = _require("src/components/DropdownGroup")
local Keybind = _require("src/components/Keybind")
local Paragraph = _require("src/components/Paragraph")
local Divider = _require("src/components/Divider")
local Banner = _require("src/components/Banner")
local Progression = _require("src/components/Progression")
local Modal = _require("src/components/Modal")
local MobilePin = _require("src/components/MobilePin")

local LiyHubUI = {
    Version = "2.2.0",
    Name = "LiyHub UI",
    _activeWindows = {},
    _themeManager = ThemeManager,
    _require = _require,
}

function LiyHubUI:CreateWindow(options)
    options = options or {}
    local cleanup = Cleanup and Cleanup.new()
    local theme = options.Theme or (ThemeManager and ThemeManager:GetTheme())
    
    local deps = {
        Theme = theme,
        Cleanup = cleanup,
        Layout = Layout,
        Modal = Modal,
        MobilePin = MobilePin,
        Button = Button,
        ButtonGroup = ButtonGroup,
        Toggle = Toggle,
        ToggleGroup = ToggleGroup,
        Slider = Slider,
        SliderGroup = SliderGroup,
        Input = InputComp,
        InputGroup = InputGroup,
        Dropdown = Dropdown,
        DropdownGroup = DropdownGroup,
        Keybind = Keybind,
        Paragraph = Paragraph,
        Divider = Divider,
        Banner = Banner,
        Progression = Progression,
    }
    
    local win = Window.new(options, deps)
    table.insert(self._activeWindows, win)
    return win
end

function LiyHubUI:GetThemeManager()
    return self._themeManager or ThemeManager
end

function LiyHubUI:CreateConfigService(options)
    if ConfigService then
        return ConfigService.new(options)
    end
    return nil
end

function LiyHubUI:CreateProfileService(configService)
    if ProfileService then
        return ProfileService.new(configService)
    end
    return nil
end

function LiyHubUI:Notify(options)
    if Modal then
        local Players = game:GetService("Players")
        local player = Players.LocalPlayer
        local pgui = player and player:FindFirstChildOfClass("PlayerGui")
        if pgui then
            local theme = ThemeManager and ThemeManager:GetTheme()
            Modal.Notify(pgui, options, theme)
        end
    end
end

LiyHubUI.Create = LiyHubUI.CreateWindow

return LiyHubUI
"""

out_bundle = os.path.join(base_dir, "LiyHubUI.bundle.lua")
with open(out_bundle, "w", encoding="utf-8") as f:
    f.write(bundle_code)

print(f"Bundle built successfully: {os.path.getsize(out_bundle)} bytes")
