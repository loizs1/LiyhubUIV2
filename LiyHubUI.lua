--[[
    ============================================================================
    LiyHub UI - Modular Roblox Luau UI Library
    Pure Black & White Minimalist Edition
    
    Official Name: LiyHub UI
    Entry Point: LiyHubUI.lua
    ============================================================================
]]

local ThemeManager = nil
local PureBlackWhite = nil
local Cleanup = nil
local Signals = nil
local TweenUtil = nil
local Layout = nil
local Window = nil
local ConfigService = nil
local ProfileService = nil

local Button = nil
local ButtonGroup = nil
local Toggle = nil
local ToggleGroup = nil
local Slider = nil
local SliderGroup = nil
local InputComp = nil
local InputGroup = nil
local Dropdown = nil
local DropdownGroup = nil
local Keybind = nil
local Paragraph = nil
local Divider = nil
local Banner = nil
local Progression = nil
local Modal = nil
local MobilePin = nil

local function safeRequire(pathList)
    local cur = script
    for _, part in ipairs(pathList) do
        if typeof(cur) == "Instance" then
            cur = cur:FindFirstChild(part)
        else
            return nil
        end
    end
    if cur and cur:IsA("ModuleScript") then
        local ok, res = pcall(require, cur)
        if ok then return res end
    end
    return nil
end

pcall(function()
    ThemeManager = safeRequire({"src", "themes", "ThemeManager"}) or require(script.src.themes.ThemeManager)
    PureBlackWhite = safeRequire({"src", "themes", "PureBlackWhite"}) or require(script.src.themes.PureBlackWhite)
    Cleanup = safeRequire({"src", "core", "Cleanup"}) or require(script.src.core.Cleanup)
    Signals = safeRequire({"src", "core", "Signals"}) or require(script.src.core.Signals)
    TweenUtil = safeRequire({"src", "core", "Tween"}) or require(script.src.core.Tween)
    Layout = safeRequire({"src", "core", "Layout"}) or require(script.src.core.Layout)
    Window = safeRequire({"src", "core", "Window"}) or require(script.src.core.Window)
    ConfigService = safeRequire({"src", "services", "ConfigService"}) or require(script.src.services.ConfigService)
    ProfileService = safeRequire({"src", "services", "ProfileService"}) or require(script.src.services.ProfileService)
    
    Button = safeRequire({"src", "components", "Button"}) or require(script.src.components.Button)
    ButtonGroup = safeRequire({"src", "components", "ButtonGroup"}) or require(script.src.components.ButtonGroup)
    Toggle = safeRequire({"src", "components", "Toggle"}) or require(script.src.components.Toggle)
    ToggleGroup = safeRequire({"src", "components", "ToggleGroup"}) or require(script.src.components.ToggleGroup)
    Slider = safeRequire({"src", "components", "Slider"}) or require(script.src.components.Slider)
    SliderGroup = safeRequire({"src", "components", "SliderGroup"}) or require(script.src.components.SliderGroup)
    InputComp = safeRequire({"src", "components", "Input"}) or require(script.src.components.Input)
    InputGroup = safeRequire({"src", "components", "InputGroup"}) or require(script.src.components.InputGroup)
    Dropdown = safeRequire({"src", "components", "Dropdown"}) or require(script.src.components.Dropdown)
    DropdownGroup = safeRequire({"src", "components", "DropdownGroup"}) or require(script.src.components.DropdownGroup)
    Keybind = safeRequire({"src", "components", "Keybind"}) or require(script.src.components.Keybind)
    Paragraph = safeRequire({"src", "components", "Paragraph"}) or require(script.src.components.Paragraph)
    Divider = safeRequire({"src", "components", "Divider"}) or require(script.src.components.Divider)
    Banner = safeRequire({"src", "components", "Banner"}) or require(script.src.components.Banner)
    Progression = safeRequire({"src", "components", "Progression"}) or require(script.src.components.Progression)
    Modal = safeRequire({"src", "components", "Modal"}) or require(script.src.components.Modal)
    MobilePin = safeRequire({"src", "components", "MobilePin"}) or require(script.src.components.MobilePin)
end)

local IconsProxy = setmetatable({}, {
    __index = function(_, key)
        return tostring(key)
    end
})

local LiyHubUI = {
    Version = "2.2.0",
    Name = "LiyHub UI",
    Icons = IconsProxy,
    Emotes = IconsProxy,
    _activeWindows = {},
    _themeManager = ThemeManager,
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
