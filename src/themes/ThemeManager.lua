local PureBlackWhite = nil
pcall(function()
    PureBlackWhite = _require("src/themes/PureBlackWhite")
end)
if not PureBlackWhite then
    pcall(function()
        PureBlackWhite = require(script.Parent.PureBlackWhite)
    end)
end

local PureWhite = nil
pcall(function()
    PureWhite = _require("src/themes/PureWhite")
end)
if not PureWhite then
    pcall(function()
        PureWhite = require(script.Parent.PureWhite)
    end)
end

local ThemeManager = {
    CurrentTheme = PureBlackWhite,
    Themes = {
        ["Pure Black & White"] = PureBlackWhite,
        ["Default"] = PureBlackWhite,
        ["Dark"] = PureBlackWhite,
        ["Pure White"] = PureWhite,
        ["Light"] = PureWhite,
        ["White"] = PureWhite,
    },
    _subscribers = {},
}

function ThemeManager:GetTheme()
    return self.CurrentTheme
end

function ThemeManager:RegisterTheme(name, themeTable)
    assert(type(name) == "string", "Theme name must be a string")
    assert(type(themeTable) == "table", "Theme definition must be a table")
    self.Themes[name] = themeTable
end

function ThemeManager:SetTheme(nameOrTable)
    local target = nil
    if type(nameOrTable) == "string" then
        target = self.Themes[nameOrTable]
        assert(target, "Theme '" .. tostring(nameOrTable) .. "' is not registered")
    elseif type(nameOrTable) == "table" then
        target = nameOrTable
    else
        error("Invalid theme argument: expected string or table")
    end
    self.CurrentTheme = target
    for callback, _ in pairs(self._subscribers) do
        task.spawn(callback, target)
    end
end

function ThemeManager:Subscribe(callback)
    assert(type(callback) == "function", "Callback must be a function")
    self._subscribers[callback] = true
    return function()
        self._subscribers[callback] = nil
    end
end

return ThemeManager