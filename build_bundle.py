import re
import os
import json

base_dir = os.path.dirname(os.path.abspath(__file__))

files_to_bundle = [
    ("src/themes/PureBlackWhite", "src/themes/PureBlackWhite.lua"),
    ("src/themes/PureWhite", "src/themes/PureWhite.lua"),
    ("src/themes/ThemeManager", "src/themes/ThemeManager.lua"),
    ("src/size/PC", "src/size/PC.lua"),
    ("src/size/Android", "src/size/Android.lua"),
    ("src/size/Tablet", "src/size/Tablet.lua"),
    ("src/size/SizeManager", "src/size/SizeManager.lua"),
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
    ("src/components/ColorPicker", "src/components/ColorPicker.lua"),
    ("src/components/Paragraph", "src/components/Paragraph.lua"),
    ("src/components/Divider", "src/components/Divider.lua"),
    ("src/components/Banner", "src/components/Banner.lua"),
    ("src/components/Progression", "src/components/Progression.lua"),
    ("src/services/ConfigService", "src/services/ConfigService.lua"),
    ("src/services/IconService", "src/services/IconService.lua"),
    ("src/services/ProfileService", "src/services/ProfileService.lua"),
    ("src/core/Window", "src/core/Window.lua"),
]

bundle_code = """
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
    content = re.sub(r'--\[\[.*?\/\/\/\]\]', '', content, flags=re.DOTALL)
    content = re.sub(r'--\[\[.*?\]\]', '', content, flags=re.DOTALL)
    content = re.sub(r'--[^\n]*', '', content)
    lines = [l.rstrip() for l in content.splitlines() if l.strip()]
    content = '\n'.join(lines)
    bundle_code += f'\n_modules["{mod_name}"] = function()\n'
    bundle_code += content + "\nend\n"

bundle_code += """
local PureBlackWhite = _require("src/themes/PureBlackWhite")
local PureWhite = _require("src/themes/PureWhite")
local ThemeManager = _require("src/themes/ThemeManager")
local Cleanup = _require("src/core/Cleanup")
local Signals = _require("src/core/Signals")
local TweenUtil = _require("src/core/Tween")
local Layout = _require("src/core/Layout")
local Window = _require("src/core/Window")
local ConfigService = _require("src/services/ConfigService")
local IconService = _require("src/services/IconService")
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
local ColorPicker = _require("src/components/ColorPicker")
local Paragraph = _require("src/components/Paragraph")
local Divider = _require("src/components/Divider")
local Banner = _require("src/components/Banner")
local Progression = _require("src/components/Progression")
local Modal = _require("src/components/Modal")
local MobilePin = _require("src/components/MobilePin")
local PC = _require("src/size/PC")
local Android = _require("src/size/Android")
local Tablet = _require("src/size/Tablet")
local SizeManager = _require("src/size/SizeManager")

local LiyHubUI = {
    Version = "2.2.0",
    Name = "LiyHub UI",
    _activeWindows = {},
    _themeManager = ThemeManager,
    _sizeManager = SizeManager,
    Icons = IconService and IconService.UniversalEmotes,
    ResolveIcon = IconService and IconService.Resolve,
    Sizes = {
        PC = PC,
        Android = Android,
        Tablet = Tablet,
    },
    _require = _require,
}

function LiyHubUI:CreateWindow(options)
    local hub = (type(self) == "table" and self._activeWindows and self) or LiyHubUI
    if type(self) == "table" and not self._activeWindows and options == nil then
        options = self
    end
    options = options or {}
    local cleanup = Cleanup and Cleanup.new()
    local theme = options.Theme or (ThemeManager and ThemeManager:GetTheme())
    
    local deps = {
        Theme = theme,
        ThemeManager = ThemeManager,
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
        ColorPicker = ColorPicker,
        Paragraph = Paragraph,
        Divider = Divider,
        Banner = Banner,
        Progression = Progression,
        SizeManager = SizeManager,
        IconService = IconService,
    }
    
    local win = Window.new(options, deps)
    table.insert(hub._activeWindows, win)
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
        local hub = LiyHubUI
        local parentGui = nil
        if hub._activeWindows and #hub._activeWindows > 0 and hub._activeWindows[1]._screenGui then
            parentGui = hub._activeWindows[1]._screenGui
        else
            local okHui, hui = pcall(function() return gethui and gethui() end)
            if okHui and hui then
                parentGui = hui
            else
                local Players = game:GetService("Players")
                local player = Players.LocalPlayer
                local pgui = player and player:FindFirstChildOfClass("PlayerGui")
                parentGui = pgui or game:GetService("CoreGui")
            end
        end
        if parentGui then
            local theme = ThemeManager and ThemeManager:GetTheme()
            Modal.Notify(parentGui, options, theme)
        end
    end
end

LiyHubUI.Create = LiyHubUI.CreateWindow

return LiyHubUI
"""

out_bundle = os.path.join(base_dir, "LiyHubUI.bundle.lua")
clean_bundle = re.sub(r'--\[\[.*?\]\]', '', bundle_code, flags=re.DOTALL)
clean_bundle = re.sub(r'--[^\n]*', '', clean_bundle)
clean_bundle = '\n'.join([l.strip() for l in clean_bundle.splitlines() if l.strip()])
bundle_code = clean_bundle
with open(out_bundle, "w", encoding="utf-8") as f:
    f.write(bundle_code)

print(f"Bundle built successfully: {os.path.getsize(out_bundle)} bytes")
