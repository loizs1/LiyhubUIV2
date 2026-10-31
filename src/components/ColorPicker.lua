local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local ColorPicker = {}
ColorPicker.__index = ColorPicker

local PRESET_COLORS = {
    Color3.fromRGB(255, 255, 255),
    Color3.fromRGB(255, 60, 60),
    Color3.fromRGB(255, 140, 0),
    Color3.fromRGB(255, 220, 0),
    Color3.fromRGB(40, 220, 100),
    Color3.fromRGB(0, 190, 255),
    Color3.fromRGB(60, 110, 255),
    Color3.fromRGB(180, 80, 255),
}

function ColorPicker.new(parent, options, theme, cleanup)
    options = options or {}
    local name = options.Name or options.Title or options.Text or "Color"
    local currentColor = options.Default or Color3.fromRGB(255, 255, 255)
    local callback = options.Callback or function() end

    local container = Instance.new("Frame")
    container.Name = "ColorPicker_" .. name
    container.Size = UDim2.new(1, 0, 0, theme.SmallElementHeight or 34)
    container.BackgroundColor3 = theme.Element
    container.BorderSizePixel = 0
    container.ClipsDescendants = true
    container.Parent = parent

    local corner = Instance.new("UICorner")
    corner.CornerRadius = theme.SmallCornerRadius or UDim.new(0, 5)
    corner.Parent = container

    if theme.UseStrokes then
        local stroke = Instance.new("UIStroke")
        stroke.Name = "BorderStroke"
        stroke.Color = theme.Border
        stroke.Thickness = 1
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Parent = container
    end

    local headerBtn = Instance.new("TextButton")
    headerBtn.Name = "HeaderButton"
    headerBtn.Size = UDim2.new(1, 0, 0, theme.SmallElementHeight or 34)
    headerBtn.BackgroundTransparency = 1
    headerBtn.AutoButtonColor = false
    headerBtn.Text = ""
    headerBtn.Active = true
    headerBtn.Parent = container

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(1, -50, 1, 0)
    titleLabel.Position = UDim2.new(0, 10, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = name
    titleLabel.TextColor3 = theme.TextPrimary
    titleLabel.Font = theme.FontBold
    titleLabel.TextSize = 11
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Active = false
    titleLabel.Parent = headerBtn

    local colorChip = Instance.new("Frame")
    colorChip.Name = "ColorChip"
    colorChip.Size = UDim2.new(0, 26, 0, 16)
    colorChip.Position = UDim2.new(1, -36, 0.5, -8)
    colorChip.BackgroundColor3 = currentColor
    colorChip.BorderSizePixel = 0
    colorChip.Active = false
    colorChip.Parent = headerBtn

    local chipCorner = Instance.new("UICorner")
    chipCorner.CornerRadius = UDim.new(0, 4)
    chipCorner.Parent = colorChip

    local chipStroke = Instance.new("UIStroke")
    chipStroke.Color = Color3.fromRGB(255, 255, 255)
    chipStroke.Transparency = 0.7
    chipStroke.Thickness = 1
    chipStroke.Parent = colorChip

    local tray = Instance.new("Frame")
    tray.Name = "PaletteTray"
    tray.Size = UDim2.new(1, -16, 0, 96)
    tray.Position = UDim2.new(0, 8, 0, (theme.SmallElementHeight or 34) + 4)
    tray.BackgroundTransparency = 1
    tray.Visible = false
    tray.Parent = container

    local presetsRow = Instance.new("Frame")
    presetsRow.Name = "Presets"
    presetsRow.Size = UDim2.new(1, 0, 0, 20)
    presetsRow.BackgroundTransparency = 1
    presetsRow.Parent = tray

    local pLayout = Instance.new("UIListLayout")
    pLayout.FillDirection = Enum.FillDirection.Horizontal
    pLayout.SortOrder = Enum.SortOrder.LayoutOrder
    pLayout.Padding = UDim.new(0, 5)
    pLayout.Parent = presetsRow

    local self = setmetatable({
        _container = container,
        _chip = colorChip,
        _tray = tray,
        _color = currentColor,
        _theme = theme,
        _callback = callback,
        _isOpen = false,
        _conns = {},
        _sliderConns = {},
    }, ColorPicker)

    for _, pCol in ipairs(PRESET_COLORS) do
        local pBtn = Instance.new("TextButton")
        pBtn.Name = "Preset"
        pBtn.Size = UDim2.new(0, 20, 0, 20)
        pBtn.BackgroundColor3 = pCol
        pBtn.AutoButtonColor = false
        pBtn.Text = ""
        pBtn.BorderSizePixel = 0
        pBtn.Parent = presetsRow

        local pCorn = Instance.new("UICorner")
        pCorn.CornerRadius = UDim.new(0, 4)
        pCorn.Parent = pBtn

        local pStroke = Instance.new("UIStroke")
        pStroke.Color = Color3.fromRGB(255, 255, 255)
        pStroke.Transparency = 0.75
        pStroke.Thickness = 1
        pStroke.Parent = pBtn

        local c = pBtn.Activated:Connect(function()
            self:SetValue(pCol, true)
        end)
        table.insert(self._conns, c)
    end

    local slidersFrame = Instance.new("Frame")
    slidersFrame.Name = "RGBChannels"
    slidersFrame.Size = UDim2.new(1, 0, 0, 68)
    slidersFrame.Position = UDim2.new(0, 0, 0, 26)
    slidersFrame.BackgroundTransparency = 1
    slidersFrame.Parent = tray

    local sLayout = Instance.new("UIListLayout")
    sLayout.FillDirection = Enum.FillDirection.Vertical
    sLayout.SortOrder = Enum.SortOrder.LayoutOrder
    sLayout.Padding = UDim.new(0, 4)
    sLayout.Parent = slidersFrame

    local channels = {
        { Name = "R", Color = Color3.fromRGB(255, 80, 80), Getter = function() return math.floor(self._color.R * 255) end, Setter = function(v) self._color = Color3.fromRGB(v, math.floor(self._color.G * 255), math.floor(self._color.B * 255)) end },
        { Name = "G", Color = Color3.fromRGB(80, 255, 120), Getter = function() return math.floor(self._color.G * 255) end, Setter = function(v) self._color = Color3.fromRGB(math.floor(self._color.R * 255), v, math.floor(self._color.B * 255)) end },
        { Name = "B", Color = Color3.fromRGB(80, 140, 255), Getter = function() return math.floor(self._color.B * 255) end, Setter = function(v) self._color = Color3.fromRGB(math.floor(self._color.R * 255), math.floor(self._color.G * 255), v) end },
    }

    local channelWidgets = {}

    for _, ch in ipairs(channels) do
        local row = Instance.new("Frame")
        row.Name = "Channel_" .. ch.Name
        row.Size = UDim2.new(1, 0, 0, 18)
        row.BackgroundTransparency = 1
        row.Parent = slidersFrame

        local tag = Instance.new("TextLabel")
        tag.Size = UDim2.new(0, 14, 1, 0)
        tag.BackgroundTransparency = 1
        tag.Text = ch.Name
        tag.TextColor3 = ch.Color
        tag.Font = theme.FontBold
        tag.TextSize = 10
        tag.Parent = row

        local track = Instance.new("TextButton")
        track.Name = "Track"
        track.Size = UDim2.new(1, -54, 0, 6)
        track.Position = UDim2.new(0, 18, 0.5, -3)
        track.BackgroundColor3 = theme.SliderTrack
        track.AutoButtonColor = false
        track.Text = ""
        track.BorderSizePixel = 0
        track.Parent = row

        local tCorn = Instance.new("UICorner")
        tCorn.CornerRadius = UDim.new(1, 0)
        tCorn.Parent = track

        local fill = Instance.new("Frame")
        fill.Name = "Fill"
        fill.Size = UDim2.new(ch.Getter() / 255, 0, 1, 0)
        fill.BackgroundColor3 = ch.Color
        fill.BorderSizePixel = 0
        fill.Parent = track

        local fCorn = Instance.new("UICorner")
        fCorn.CornerRadius = UDim.new(1, 0)
        fCorn.Parent = fill

        local valLbl = Instance.new("TextLabel")
        valLbl.Size = UDim2.new(0, 30, 1, 0)
        valLbl.Position = UDim2.new(1, -30, 0, 0)
        valLbl.BackgroundTransparency = 1
        valLbl.Text = tostring(ch.Getter())
        valLbl.TextColor3 = theme.TextMuted
        valLbl.Font = theme.FontRegular
        valLbl.TextSize = 10
        valLbl.TextXAlignment = Enum.TextXAlignment.Right
        valLbl.Parent = row

        channelWidgets[ch.Name] = { Fill = fill, ValLbl = valLbl, Channel = ch }

        local dragging = false
        local function updateFromInput(inputObj)
            local trackW = track.AbsoluteSize.X
            if trackW <= 0 then return end
            local relX = math.clamp(inputObj.Position.X - track.AbsolutePosition.X, 0, trackW)
            local ratio = relX / trackW
            local val = math.clamp(math.floor(ratio * 255 + 0.5), 0, 255)
            ch.Setter(val)
            fill.Size = UDim2.new(val / 255, 0, 1, 0)
            valLbl.Text = tostring(val)
            colorChip.BackgroundColor3 = self._color
            task.spawn(self._callback, self._color)
        end

        local tDown = track.InputBegan:Connect(function(inp)
            if inp.UserInputType == Enum.UserInputType.MouseButton1 or inp.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                updateFromInput(inp)
            end
        end)
        local tMove = UserInputService.InputChanged:Connect(function(inp)
            if dragging and (inp.UserInputType == Enum.UserInputType.MouseMovement or inp.UserInputType == Enum.UserInputType.Touch) then
                updateFromInput(inp)
            end
        end)
        local tEnd = UserInputService.InputEnded:Connect(function(inp)
            if inp.UserInputType == Enum.UserInputType.MouseButton1 or inp.UserInputType == Enum.UserInputType.Touch then
                dragging = false
            end
        end)

        table.insert(self._sliderConns, tDown)
        table.insert(self._sliderConns, tMove)
        table.insert(self._sliderConns, tEnd)
    end

    self._channelWidgets = channelWidgets

    local function toggleTray()
        self._isOpen = not self._isOpen
        tray.Visible = self._isOpen
        local targetH = self._isOpen and ((theme.SmallElementHeight or 34) + 104) or (theme.SmallElementHeight or 34)
        TweenService:Create(container, TweenInfo.new(theme.AnimationFast or 0.15), {
            Size = UDim2.new(1, 0, 0, targetH)
        }):Play()
    end

    local hClick = headerBtn.Activated:Connect(toggleTray)
    table.insert(self._conns, hClick)

    if cleanup then
        cleanup:Add(hClick)
        for _, c in ipairs(self._sliderConns) do cleanup:Add(c) end
        cleanup:Add(container)
    end

    return self
end

function ColorPicker:SetValue(color, fireCallback)
    if typeof(color) ~= "Color3" then return end
    self._color = color
    self._chip.BackgroundColor3 = color
    if self._channelWidgets then
        local r = math.floor(color.R * 255)
        local g = math.floor(color.G * 255)
        local b = math.floor(color.B * 255)
        if self._channelWidgets.R then
            self._channelWidgets.R.Fill.Size = UDim2.new(r / 255, 0, 1, 0)
            self._channelWidgets.R.ValLbl.Text = tostring(r)
        end
        if self._channelWidgets.G then
            self._channelWidgets.G.Fill.Size = UDim2.new(g / 255, 0, 1, 0)
            self._channelWidgets.G.ValLbl.Text = tostring(g)
        end
        if self._channelWidgets.B then
            self._channelWidgets.B.Fill.Size = UDim2.new(b / 255, 0, 1, 0)
            self._channelWidgets.B.ValLbl.Text = tostring(b)
        end
    end
    if fireCallback ~= false then
        task.spawn(self._callback, self._color)
    end
end

function ColorPicker:GetValue()
    return self._color
end

function ColorPicker:Destroy()
    for _, c in ipairs(self._conns) do
        if c and c.Connected then c:Disconnect() end
    end
    for _, c in ipairs(self._sliderConns) do
        if c and c.Connected then c:Disconnect() end
    end
    self._conns = {}
    self._sliderConns = {}
    if self._container then
        self._container:Destroy()
        self._container = nil
    end
end

return ColorPicker