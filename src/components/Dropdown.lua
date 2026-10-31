local TweenService = game:GetService("TweenService")

local Dropdown = {}
Dropdown.__index = Dropdown

local LucideSheet = "rbxassetid://136111683851629"
local ChevronRectSize = Vector2.new(24, 24)
local ChevronRectOffset = Vector2.new(625, 25)
local CheckRectSize = Vector2.new(24, 24)
local CheckRectOffset = Vector2.new(175, 450)

function Dropdown.new(parent, options, theme, cleanup)
    options = options or {}
    local text = options.Title or options.Name or options.Text or "Dropdown"
    local rawOptions = options.Values or options.Options or {}
    local isMulti = options.MultiSelect == true or options.Multi == true
    local defaultVal = options.Default
    local callback = options.Callback or options.OnChange or function() end
    
    local container = Instance.new("Frame")
    container.Name = "Dropdown_" .. text
    container.Size = UDim2.new(1, 0, 0, 0)
    container.AutomaticSize = Enum.AutomaticSize.Y
    container.BackgroundTransparency = 1
    container.BorderSizePixel = 0
    container.ClipsDescendants = false
    container.Parent = parent
    
    local cList = Instance.new("UIListLayout")
    cList.SortOrder = Enum.SortOrder.LayoutOrder
    cList.Padding = UDim.new(0, 4)
    cList.Parent = container
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(1, 0, 0, 16)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = text
    titleLabel.TextColor3 = theme.TextPrimary
    titleLabel.Font = theme.FontBold
    titleLabel.TextSize = theme.FontSizeSmall or 11
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Active = false
    titleLabel.Parent = container
    
    local selectBox = Instance.new("TextButton")
    selectBox.Name = "SelectBox"
    selectBox.Size = UDim2.new(1, 0, 0, theme.SmallElementHeight or 32)
    selectBox.BackgroundColor3 = theme.Element
    selectBox.AutoButtonColor = false
    selectBox.Text = ""
    selectBox.BorderSizePixel = 0
    selectBox.Active = true
    selectBox.ZIndex = 5
    selectBox.Parent = container
    
    local sbCorner = Instance.new("UICorner")
    sbCorner.CornerRadius = theme.SmallCornerRadius or UDim.new(0, 5)
    sbCorner.Parent = selectBox
    
    if theme.UseStrokes then
        local stroke = Instance.new("UIStroke")
        stroke.Name = "BorderStroke"
        stroke.Color = theme.Border
        stroke.Thickness = 1
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Parent = selectBox
    end
    
    local selectionLabel = Instance.new("TextLabel")
    selectionLabel.Name = "SelectionLabel"
    selectionLabel.Size = UDim2.new(1, -34, 1, 0)
    selectionLabel.Position = UDim2.new(0, 10, 0, 0)
    selectionLabel.BackgroundTransparency = 1
    selectionLabel.Text = "Select..."
    selectionLabel.TextColor3 = theme.TextSecondary
    selectionLabel.Font = theme.FontRegular
    selectionLabel.TextSize = theme.FontSizeSmall
    selectionLabel.TextXAlignment = Enum.TextXAlignment.Left
    selectionLabel.TextTruncate = Enum.TextTruncate.AtEnd
    selectionLabel.Active = false
    selectionLabel.ZIndex = 6
    selectionLabel.Parent = selectBox
    
    local chevron = Instance.new("ImageLabel")
    chevron.Name = "Chevron"
    chevron.Size = UDim2.fromOffset(14, 14)
    chevron.Position = UDim2.new(1, -22, 0.5, -7)
    chevron.BackgroundTransparency = 1
    chevron.Image = LucideSheet
    chevron.ImageRectSize = ChevronRectSize
    chevron.ImageRectOffset = ChevronRectOffset
    chevron.ImageColor3 = theme.TextMuted
    chevron.ScaleType = Enum.ScaleType.Fit
    chevron.Active = false
    chevron.ZIndex = 6
    chevron.Parent = selectBox
    
    local listContainer = Instance.new("Frame")
    listContainer.Name = "ListContainer"
    listContainer.Size = UDim2.new(1, 0, 0, 0)
    listContainer.BackgroundColor3 = theme.Header
    listContainer.BorderSizePixel = 0
    listContainer.Visible = false
    listContainer.ClipsDescendants = true
    listContainer.ZIndex = 25
    listContainer.Parent = container
    
    local lcCorner = Instance.new("UICorner")
    lcCorner.CornerRadius = theme.SmallCornerRadius or UDim.new(0, 5)
    lcCorner.Parent = listContainer
    
    if theme.UseStrokes then
        local lcStroke = Instance.new("UIStroke")
        lcStroke.Name = "BorderStroke"
        lcStroke.Color = theme.Border
        lcStroke.Thickness = 1
        lcStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        lcStroke.Parent = listContainer
    end
    
    local lcList = Instance.new("UIListLayout")
    lcList.SortOrder = Enum.SortOrder.LayoutOrder
    lcList.Padding = UDim.new(0, 4)
    lcList.Parent = listContainer
    
    local lcPad = Instance.new("UIPadding")
    lcPad.PaddingTop = UDim.new(0, 4)
    lcPad.PaddingBottom = UDim.new(0, 4)
    lcPad.PaddingLeft = UDim.new(0, 4)
    lcPad.PaddingRight = UDim.new(0, 4)
    lcPad.Parent = listContainer
    
    local actionsBar = nil
    if isMulti and #rawOptions >= 3 then
        actionsBar = Instance.new("Frame")
        actionsBar.Name = "ActionsBar"
        actionsBar.Size = UDim2.new(1, 0, 0, 22)
        actionsBar.BackgroundTransparency = 1
        actionsBar.ZIndex = 26
        actionsBar.Parent = listContainer
        
        local abLayout = Instance.new("UIListLayout")
        abLayout.FillDirection = Enum.FillDirection.Horizontal
        abLayout.SortOrder = Enum.SortOrder.LayoutOrder
        abLayout.Padding = UDim.new(0, 6)
        abLayout.Parent = actionsBar
        
        local selectAllBtn = Instance.new("TextButton")
        selectAllBtn.Name = "SelectAll"
        selectAllBtn.Size = UDim2.new(0.5, -3, 1, 0)
        selectAllBtn.BackgroundColor3 = theme.Element
        selectAllBtn.AutoButtonColor = false
        selectAllBtn.Text = "Select All"
        selectAllBtn.TextColor3 = theme.TextPrimary
        selectAllBtn.Font = theme.FontBold
        selectAllBtn.TextSize = 10
        selectAllBtn.BorderSizePixel = 0
        selectAllBtn.ZIndex = 27
        selectAllBtn.Parent = actionsBar
        local saCorner = Instance.new("UICorner")
        saCorner.CornerRadius = UDim.new(0, 4)
        saCorner.Parent = selectAllBtn
        
        local clearBtn = Instance.new("TextButton")
        clearBtn.Name = "Clear"
        clearBtn.Size = UDim2.new(0.5, -3, 1, 0)
        clearBtn.BackgroundColor3 = theme.Element
        clearBtn.AutoButtonColor = false
        clearBtn.Text = "Clear"
        clearBtn.TextColor3 = theme.TextMuted
        clearBtn.Font = theme.FontBold
        clearBtn.TextSize = 10
        clearBtn.BorderSizePixel = 0
        clearBtn.ZIndex = 27
        clearBtn.Parent = actionsBar
        local clCorner = Instance.new("UICorner")
        clCorner.CornerRadius = UDim.new(0, 4)
        clCorner.Parent = clearBtn
    end
    
    local scrollFrame = Instance.new("ScrollingFrame")
    scrollFrame.Name = "Scroll"
    scrollFrame.Size = UDim2.new(1, 0, 0, 100)
    scrollFrame.BackgroundTransparency = 1
    scrollFrame.BorderSizePixel = 0
    scrollFrame.ScrollBarThickness = 3
    scrollFrame.ScrollBarImageColor3 = theme.Scrollbar
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    scrollFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
    scrollFrame.ZIndex = 26
    scrollFrame.Parent = listContainer
    
    local sfList = Instance.new("UIListLayout")
    sfList.SortOrder = Enum.SortOrder.LayoutOrder
    sfList.Padding = UDim.new(0, 2)
    sfList.Parent = scrollFrame
    
    local self = setmetatable({
        _container = container,
        _selectBox = selectBox,
        _selectionLabel = selectionLabel,
        _chevron = chevron,
        _listContainer = listContainer,
        _scrollFrame = scrollFrame,
        _actionsBar = actionsBar,
        _theme = theme,
        _options = rawOptions,
        _isMulti = isMulti,
        _selected = isMulti and {} or nil,
        _callback = callback,
        _open = false,
        _optionButtons = {},
        _cleanup = cleanup,
    }, Dropdown)
    
    if isMulti then
        if type(defaultVal) == "table" then
            for _, item in ipairs(defaultVal) do
                self._selected[item] = true
            end
        elseif defaultVal ~= nil then
            self._selected[defaultVal] = true
        end
    else
        self._selected = defaultVal or rawOptions[1]
    end
    
    function self:_updateSummary()
        if self._isMulti then
            local activeList = {}
            for _, opt in ipairs(self._options) do
                if self._selected[opt] then
                    table.insert(activeList, tostring(opt))
                end
            end
            if #activeList == 0 then
                self._selectionLabel.Text = "Select..."
                self._selectionLabel.TextColor3 = self._theme.TextSecondary
            elseif #activeList == 1 then
                self._selectionLabel.Text = activeList[1]
                self._selectionLabel.TextColor3 = self._theme.TextPrimary
            elseif #activeList == 2 then
                self._selectionLabel.Text = activeList[1] .. ", " .. activeList[2]
                self._selectionLabel.TextColor3 = self._theme.TextPrimary
            else
                self._selectionLabel.Text = tostring(#activeList) .. " Selected"
                self._selectionLabel.TextColor3 = self._theme.TextPrimary
            end
        else
            if self._selected ~= nil then
                self._selectionLabel.Text = tostring(self._selected)
                self._selectionLabel.TextColor3 = self._theme.TextPrimary
            else
                self._selectionLabel.Text = "Select..."
                self._selectionLabel.TextColor3 = self._theme.TextSecondary
            end
        end
    end
    
    function self:_rebuildOptions()
        for _, btn in ipairs(self._optionButtons) do
            btn:Destroy()
        end
        self._optionButtons = {}
        
        for _, opt in ipairs(self._options) do
            local optStr = tostring(opt)
            local isChecked = false
            if self._isMulti then
                isChecked = self._selected[opt] == true
            else
                isChecked = (self._selected == opt)
            end
            
            local optBtn = Instance.new("TextButton")
            optBtn.Name = "Opt_" .. optStr
            optBtn.Size = UDim2.new(1, 0, 0, 26)
            optBtn.BackgroundColor3 = isChecked and self._theme.ElementActive or self._theme.Element
            optBtn.AutoButtonColor = false
            optBtn.Text = ""
            optBtn.BorderSizePixel = 0
            optBtn.Active = true
            optBtn.ZIndex = 27
            optBtn.Parent = self._scrollFrame
            
            local obCorner = Instance.new("UICorner")
            obCorner.CornerRadius = UDim.new(0, 4)
            obCorner.Parent = optBtn
            
            local optLabel = Instance.new("TextLabel")
            optLabel.Name = "Label"
            optLabel.Size = UDim2.new(1, -30, 1, 0)
            optLabel.Position = UDim2.new(0, 8, 0, 0)
            optLabel.BackgroundTransparency = 1
            optLabel.Text = optStr
            optLabel.TextColor3 = isChecked and self._theme.TextPrimary or self._theme.TextSecondary
            optLabel.Font = isChecked and self._theme.FontBold or self._theme.FontRegular
            optLabel.TextSize = self._theme.FontSizeSmall
            optLabel.TextXAlignment = Enum.TextXAlignment.Left
            optLabel.TextTruncate = Enum.TextTruncate.AtEnd
            optLabel.Active = false
            optLabel.ZIndex = 28
            optLabel.Parent = optBtn
            
            local checkIcon = Instance.new("ImageLabel")
            checkIcon.Name = "Checkmark"
            checkIcon.Size = UDim2.fromOffset(14, 14)
            checkIcon.Position = UDim2.new(1, -22, 0.5, -7)
            checkIcon.BackgroundTransparency = 1
            checkIcon.Image = LucideSheet
            checkIcon.ImageRectSize = CheckRectSize
            checkIcon.ImageRectOffset = CheckRectOffset
            checkIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
            checkIcon.ScaleType = Enum.ScaleType.Fit
            checkIcon.Visible = isChecked
            checkIcon.Active = false
            checkIcon.ZIndex = 28
            checkIcon.Parent = optBtn
            
            local lastOptClick = 0
            local function onOptionClicked()
                local now = os.clock()
                if now - lastOptClick < 0.1 then return end
                lastOptClick = now
                
                if self._isMulti then
                    self._selected[opt] = not self._selected[opt]
                    local activeList = {}
                    for _, item in ipairs(self._options) do
                        if self._selected[item] then
                            table.insert(activeList, item)
                        end
                    end
                    self:_updateSummary()
                    self:_rebuildOptions()
                    task.spawn(self._callback, activeList)
                else
                    self._selected = opt
                    self:_updateSummary()
                    self:_rebuildOptions()
                    self:Close()
                    task.spawn(self._callback, opt)
                end
            end
            
            local optClick = optBtn.Activated:Connect(onOptionClicked)
            if self._cleanup then
                self._cleanup:Add(optClick)
            end
            table.insert(self._optionButtons, optBtn)
        end
    end
    
    if actionsBar then
        local saBtn = actionsBar:FindFirstChild("SelectAll")
        if saBtn then
            saBtn.Activated:Connect(function()
                for _, item in ipairs(self._options) do
                    self._selected[item] = true
                end
                self:_updateSummary()
                self:_rebuildOptions()
                local outList = {}
                for _, item in ipairs(self._options) do
                    table.insert(outList, item)
                end
                task.spawn(self._callback, outList)
            end)
        end
        local clBtn = actionsBar:FindFirstChild("Clear")
        if clBtn then
            clBtn.Activated:Connect(function()
                self._selected = {}
                self:_updateSummary()
                self:_rebuildOptions()
                task.spawn(self._callback, {})
            end)
        end
    end
    
    self:_updateSummary()
    self:_rebuildOptions()
    
    local lastHeader = 0
    local function toggleDropdown()
        local now = os.clock()
        if now - lastHeader < 0.15 then return end
        lastHeader = now
        if self._open then
            self:Close()
        else
            self:Open()
        end
    end
    local headerClick = selectBox.Activated:Connect(toggleDropdown)
    
    if cleanup then
        cleanup:Add(headerClick)
        cleanup:Add(container)
    end
    
    return self
end

function Dropdown:Open()
    self._open = true
    self:_rebuildOptions()
    self._chevron.Rotation = 180
    self._listContainer.Visible = true
    local itemCount = #self._options
    local scrollHeight = math.clamp(itemCount * 28 + (itemCount - 1) * 2, 28, 140)
    self._scrollFrame.Size = UDim2.new(1, 0, 0, scrollHeight)
    local totalHeight = scrollHeight + 8 + (self._actionsBar and 26 or 0)
    
    TweenService:Create(self._listContainer, TweenInfo.new(self._theme.AnimationFast), {
        Size = UDim2.new(1, 0, 0, totalHeight)
    }):Play()
end

function Dropdown:Close()
    self._open = false
    self._chevron.Rotation = 0
    local t = TweenService:Create(self._listContainer, TweenInfo.new(self._theme.AnimationFast), {
        Size = UDim2.new(1, 0, 0, 0)
    })
    t:Play()
    t.Completed:Connect(function()
        if not self._open then
            self._listContainer.Visible = false
        end
    end)
end

function Dropdown:Toggle()
    if self._open then self:Close() else self:Open() end
end

function Dropdown:SetValue(value)
    if self._isMulti then
        self._selected = {}
        if type(value) == "table" then
            for _, item in ipairs(value) do
                self._selected[item] = true
            end
        elseif value ~= nil then
            self._selected[value] = true
        end
    else
        self._selected = value
    end
    self:_updateSummary()
    self:_rebuildOptions()
end

function Dropdown:GetValue()
    if self._isMulti then
        local out = {}
        for _, opt in ipairs(self._options) do
            if self._selected[opt] then
                table.insert(out, opt)
            end
        end
        return out
    end
    return self._selected
end

function Dropdown:SetOptions(newOptions)
    self._options = newOptions or {}
    if not self._isMulti then
        local found = false
        for _, v in ipairs(self._options) do
            if v == self._selected then
                found = true
                break
            end
        end
        if not found then
            self._selected = self._options[1]
        end
    else
        for k in pairs(self._selected) do
            local found = false
            for _, v in ipairs(self._options) do
                if v == k then found = true break end
            end
            if not found then self._selected[k] = nil end
        end
    end
    self:_updateSummary()
    self:_rebuildOptions()
    if self._open then
        local itemCount = #self._options
        local scrollHeight = math.clamp(itemCount * 28 + (itemCount - 1) * 2, 28, 140)
        self._scrollFrame.Size = UDim2.new(1, 0, 0, scrollHeight)
        local totalHeight = scrollHeight + 8 + (self._actionsBar and 26 or 0)
        self._listContainer.Size = UDim2.new(1, 0, 0, totalHeight)
    end
end

function Dropdown:Destroy()
    if self._container then
        self._container:Destroy()
    end
end

return Dropdown
