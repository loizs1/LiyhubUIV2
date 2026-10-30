--[[
    LiyHub UI - Dropdown Component
    Supports Single-select and Multi-select modes, expandable animated list,
    options update, and synchronized state.
]]

local TweenService = game:GetService("TweenService")

local Dropdown = {}
Dropdown.__index = Dropdown

function Dropdown.new(parent, options, theme, cleanup)
    options = options or {}
    local text = options.Text or options.Name or "Dropdown"
    local rawOptions = options.Options or {}
    local isMulti = options.MultiSelect == true
    local defaultVal = options.Default
    local callback = options.Callback or options.OnChange or function() end
    
    local container = Instance.new("Frame")
    container.Name = "Dropdown_" .. text
    container.Size = UDim2.new(1, 0, 0, theme.ElementHeight or 36)
    container.BackgroundColor3 = theme.Element
    container.ClipsDescendants = true
    container.BorderSizePixel = 0
    container.Parent = parent
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = theme.CornerRadius
    corner.Parent = container
    
    -- Header button (toggles open/closed)
    local header = Instance.new("TextButton")
    header.Name = "Header"
    header.Size = UDim2.new(1, 0, 0, theme.ElementHeight or 36)
    header.BackgroundTransparency = 1
    header.AutoButtonColor = false
    header.Text = ""
    header.Parent = container
    
    local label = Instance.new("TextLabel")
    label.Name = "Label"
    label.Size = UDim2.new(0.5, 0, 1, 0)
    label.Position = UDim2.new(0, 12, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = theme.TextPrimary
    label.Font = theme.FontRegular
    label.TextSize = theme.FontSizeRegular
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = header
    
    local selectionLabel = Instance.new("TextLabel")
    selectionLabel.Name = "SelectionLabel"
    selectionLabel.Size = UDim2.new(0.5, -45, 1, 0)
    selectionLabel.Position = UDim2.new(0.5, 5, 0, 0)
    selectionLabel.BackgroundTransparency = 1
    selectionLabel.Text = "Select..."
    selectionLabel.TextColor3 = theme.TextSecondary
    selectionLabel.Font = theme.FontRegular
    selectionLabel.TextSize = theme.FontSizeSmall
    selectionLabel.TextXAlignment = Enum.TextXAlignment.Right
    selectionLabel.TextTruncate = Enum.TextTruncate.AtEnd
    selectionLabel.Parent = header
    
    local arrow = Instance.new("TextLabel")
    arrow.Name = "Arrow"
    arrow.Size = UDim2.new(0, 20, 0, 20)
    arrow.Position = UDim2.new(1, -30, 0.5, -10)
    arrow.BackgroundTransparency = 1
    arrow.Text = "v"
    arrow.TextColor3 = theme.TextSecondary
    arrow.Font = theme.FontBold
    arrow.TextSize = 11
    arrow.Parent = header
    
    -- Options List Container
    local listFrame = Instance.new("Frame")
    listFrame.Name = "OptionsList"
    listFrame.Size = UDim2.new(1, -12, 0, 0)
    listFrame.Position = UDim2.new(0, 6, 0, (theme.ElementHeight or 36) + 2)
    listFrame.BackgroundTransparency = 1
    listFrame.BorderSizePixel = 0
    listFrame.Parent = container
    
    local listLayout = Instance.new("UIListLayout")
    listLayout.SortOrder = Enum.SortOrder.LayoutOrder
    listLayout.Padding = UDim.new(0, 3)
    listLayout.Parent = listFrame
    
    local self = setmetatable({
        _container = container,
        _header = header,
        _label = label,
        _selectionLabel = selectionLabel,
        _arrow = arrow,
        _listFrame = listFrame,
        _theme = theme,
        _isMulti = isMulti,
        _options = rawOptions,
        _selected = isMulti and {} or nil,
        _isOpen = false,
        _callback = callback,
        _optionButtons = {},
        _cleanup = cleanup,
    }, Dropdown)
    
    local headerClick = header.Activated:Connect(function()
        self:ToggleOpen()
    end)
    
    if cleanup then
        cleanup:Add(headerClick)
        cleanup:Add(container)
    end
    
    self:SetOptions(rawOptions)
    if defaultVal ~= nil then
        self:SetValue(defaultVal, false)
    end
    
    return self
end

function Dropdown:_recalculateHeight()
    local itemHeight = 28
    local headerH = self._theme.ElementHeight or 36
    if self._isOpen then
        local count = #self._options
        local totalListH = count * (itemHeight + 3) + 6
        self._listFrame.Size = UDim2.new(1, -12, 0, totalListH)
        TweenService:Create(self._container, TweenInfo.new(self._theme.AnimationFast), {
            Size = UDim2.new(1, 0, 0, headerH + totalListH + 4)
        }):Play()
        self._arrow.Text = "^"
    else
        TweenService:Create(self._container, TweenInfo.new(self._theme.AnimationFast), {
            Size = UDim2.new(1, 0, 0, headerH)
        }):Play()
        self._arrow.Text = "v"
    end
end

function Dropdown:ToggleOpen()
    self._isOpen = not self._isOpen
    self:_recalculateHeight()
end

function Dropdown:SetOpen(state)
    self._isOpen = state == true
    self:_recalculateHeight()
end

function Dropdown:SetOptions(newOptions)
    self._options = newOptions or {}
    for _, btn in pairs(self._optionButtons) do
        btn:Destroy()
    end
    self._optionButtons = {}
    
    for i, opt in ipairs(self._options) do
        local optName = tostring(opt)
        local optBtn = Instance.new("TextButton")
        optBtn.Name = "Option_" .. optName
        optBtn.Size = UDim2.new(1, 0, 0, 28)
        optBtn.BackgroundColor3 = self._theme.Card
        optBtn.AutoButtonColor = false
        optBtn.Text = ""
        optBtn.BorderSizePixel = 0
        optBtn.Parent = self._listFrame
        
        local corner = Instance.new("UICorner")
        corner.CornerRadius = self._theme.SmallCornerRadius
        corner.Parent = optBtn
        
        local optLabel = Instance.new("TextLabel")
        optLabel.Name = "Label"
        optLabel.Size = UDim2.new(1, -30, 1, 0)
        optLabel.Position = UDim2.new(0, 10, 0, 0)
        optLabel.BackgroundTransparency = 1
        optLabel.Text = optName
        optLabel.TextColor3 = self._theme.TextSecondary
        optLabel.Font = self._theme.FontRegular
        optLabel.TextSize = self._theme.FontSizeSmall
        optLabel.TextXAlignment = Enum.TextXAlignment.Left
        optLabel.Parent = optBtn
        
        local check = Instance.new("TextLabel")
        check.Name = "Check"
        check.Size = UDim2.new(0, 20, 1, 0)
        check.Position = UDim2.new(1, -25, 0, 0)
        check.BackgroundTransparency = 1
        check.Text = ""
        check.TextColor3 = self._theme.TextPrimary
        check.Font = self._theme.FontBold
        check.TextSize = 12
        check.Parent = optBtn
        
        optBtn.Activated:Connect(function()
            if self._isMulti then
                local exists = false
                for idx, v in ipairs(self._selected) do
                    if v == optName then
                        table.remove(self._selected, idx)
                        exists = true
                        break
                    end
                end
                if not exists then
                    table.insert(self._selected, optName)
                end
                self:_updateMultiDisplay()
                task.spawn(self._callback, table.clone(self._selected))
            else
                self._selected = optName
                self._selectionLabel.Text = optName
                self:SetOpen(false)
                self:_updateSingleDisplay()
                task.spawn(self._callback, self._selected)
            end
        end)
        
        self._optionButtons[optName] = optBtn
    end
    
    if self._isMulti then
        self:_updateMultiDisplay()
    else
        self:_updateSingleDisplay()
    end
    if self._isOpen then
        self:_recalculateHeight()
    end
end

function Dropdown.Refresh(self, newOptions)
    self:SetOptions(newOptions)
end

function Dropdown:_updateSingleDisplay()
    for optName, btn in pairs(self._optionButtons) do
        local check = btn:FindFirstChild("Check")
        local optLabel = btn:FindFirstChild("Label")
        if optName == self._selected then
            btn.BackgroundColor3 = self._theme.ElementHover
            if check then check.Text = "X" end
            if optLabel then optLabel.TextColor3 = self._theme.TextPrimary end
        else
            btn.BackgroundColor3 = self._theme.Card
            if check then check.Text = "" end
            if optLabel then optLabel.TextColor3 = self._theme.TextSecondary end
        end
    end
    self._selectionLabel.Text = self._selected or "Select..."
end

function Dropdown:_updateMultiDisplay()
    local selectedMap = {}
    for _, v in ipairs(self._selected or {}) do
        selectedMap[v] = true
    end
    
    for optName, btn in pairs(self._optionButtons) do
        local check = btn:FindFirstChild("Check")
        local optLabel = btn:FindFirstChild("Label")
        if selectedMap[optName] then
            btn.BackgroundColor3 = self._theme.ElementHover
            if check then check.Text = "X" end
            if optLabel then optLabel.TextColor3 = self._theme.TextPrimary end
        else
            btn.BackgroundColor3 = self._theme.Card
            if check then check.Text = "" end
            if optLabel then optLabel.TextColor3 = self._theme.TextSecondary end
        end
    end
    
    local count = #self._selected
    if count == 0 then
        self._selectionLabel.Text = "None selected"
    elseif count == 1 then
        self._selectionLabel.Text = self._selected[1]
    else
        self._selectionLabel.Text = tostring(count) .. " selected"
    end
end

function Dropdown:GetValue()
    if self._isMulti then
        return table.clone(self._selected)
    else
        return self._selected
    end
end

function Dropdown:SetValue(val, fireCallback)
    if self._isMulti then
        if type(val) == "table" then
            self._selected = table.clone(val)
        else
            self._selected = { tostring(val) }
        end
        self:_updateMultiDisplay()
        if fireCallback ~= false then
            task.spawn(self._callback, table.clone(self._selected))
        end
    else
        self._selected = tostring(val)
        self:_updateSingleDisplay()
        if fireCallback ~= false then
            task.spawn(self._callback, self._selected)
        end
    end
end

function Dropdown:SetText(text)
    self._label.Text = tostring(text)
end

function Dropdown:Destroy()
    if self._container then
        self._container:Destroy()
        self._container = nil
    end
end

return Dropdown

