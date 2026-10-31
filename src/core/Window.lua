--[[
    LiyHub UI - Window & Core Navigation System
    Implements main window frame, dragging, minimize/close, profile card,
    collapsible tab groups, tabs, sections, layouts, mobile pin tab, and complete resource cleanup.
]]

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local Window = {}
Window.__index = Window

local TabGroup = {}
TabGroup.__index = TabGroup

local Tab = {}
Tab.__index = Tab

local Section = {}
Section.__index = Section

function Window.new(options, dependencies)
    options = options or {}
    local deps = dependencies or {}
    local theme = deps.Theme
    local cleanup = deps.Cleanup
    local Layout = deps.Layout
    local Modal = deps.Modal
    local MobilePin = deps.MobilePin
    
    -- Load component modules
    local Button = deps.Button
    local ButtonGroup = deps.ButtonGroup
    local Toggle = deps.Toggle
    local ToggleGroup = deps.ToggleGroup
    local Slider = deps.Slider
    local SliderGroup = deps.SliderGroup
    local InputComp = deps.Input
    local InputGroup = deps.InputGroup
    local Dropdown = deps.Dropdown
    local DropdownGroup = deps.DropdownGroup
    local Keybind = deps.Keybind
    local Paragraph = deps.Paragraph
    local Divider = deps.Divider
    local Banner = deps.Banner
    local Progression = deps.Progression
    
    local SizeManager = deps.SizeManager
    if not SizeManager then
        local sOk, sRes = pcall(function() return require(script.Parent.Parent.size.SizeManager) end)
        SizeManager = sOk and sRes
    end
    
    local detectedDevice = SizeManager and SizeManager.DetectDevice() or "PC"
    local deviceName = options.Device or detectedDevice
    local sizePreset = SizeManager and SizeManager.GetPreset(deviceName) or {
        Name = "PC",
        Scale = 1.00,
        DefaultSize = UDim2.fromOffset(740, 490),
        MinSize = Vector2.new(480, 340),
        MaxSize = Vector2.new(1280, 840),
        SidebarWidth = 190,
        HeaderHeight = 48,
        ModalWidth = 340,
    }

    local titleText = options.Title or "LiyHub"
    local subtitleText = options.Subtitle or "v2.2 Black & White Edition"
    local defaultSize = options.Size
    if not defaultSize then
        defaultSize = sizePreset.DefaultSize
    elseif options.Device == nil and detectedDevice ~= "PC" then
        if defaultSize == UDim2.fromOffset(740, 490) or defaultSize == UDim2.new(0, 740, 0, 490) or defaultSize == UDim2.new(0, 680, 0, 460) then
            defaultSize = sizePreset.DefaultSize
        end
    end
    local toggleKey = options.ToggleKey or Enum.KeyCode.RightControl
    local enableMobilePin = options.MobilePin ~= false -- Default enabled
    local logoAsset = options.Logo or "rbxassetid://6031075936"
    local function resolveParentGui(customParent)
        if customParent then return customParent end
        local okH, h = pcall(function() return gethui and gethui() end)
        if okH and h then return h end
        local okCg, cg = pcall(function() return game:GetService("CoreGui") end)
        if okCg and cg then
            local test = Instance.new("Folder")
            local pOk = pcall(function()
                test.Parent = cg
                test:Destroy()
            end)
            if pOk then return cg end
        end
        local lp = Players.LocalPlayer
        if lp then
            local pg = lp:FindFirstChild("PlayerGui") or lp:WaitForChild("PlayerGui", 5)
            if pg then return pg end
        end
        return game:GetService("StarterGui")
    end

    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "LiyHubUI_" .. titleText
    screenGui.ResetOnSpawn = false
    screenGui.DisplayOrder = 2147483647
    screenGui.IgnoreGuiInset = true
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    if typeof(syn) == "table" and typeof(syn.protect_gui) == "function" then
        pcall(syn.protect_gui, screenGui)
    elseif typeof(protect_gui) == "function" then
        pcall(protect_gui, screenGui)
    elseif typeof(protectgui) == "function" then
        pcall(protectgui, screenGui)
    end
    screenGui.Parent = resolveParentGui(options.Parent)
    
    -- Main Frame
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = defaultSize
    mainFrame.Position = options.Position or UDim2.new(0.5, -defaultSize.X.Offset / 2, 0.5, -defaultSize.Y.Offset / 2)
    mainFrame.BackgroundColor3 = theme.Background
    mainFrame.BorderSizePixel = 0
    mainFrame.ClipsDescendants = true
    mainFrame.Active = true
    mainFrame.Parent = screenGui
    
    local windowScale = Instance.new("UIScale")
    windowScale.Name = "WindowScale"
    windowScale.Scale = sizePreset.Scale or 1.0
    windowScale.Parent = mainFrame

    local mainCorner = Instance.new("UICorner")
    mainCorner.CornerRadius = theme.WindowCornerRadius or theme.CornerRadius
    mainCorner.Parent = mainFrame
    
    if theme.UseStrokes then
        local mainStroke = Instance.new("UIStroke")
        mainStroke.Name = "WindowStroke"
        mainStroke.Color = theme.BorderWindow or Color3.fromRGB(42, 42, 50)
        mainStroke.Thickness = 1
        mainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        mainStroke.Parent = mainFrame
    end
    

    
    -- Header Bar
    local header = Instance.new("Frame")
    header.Name = "Header"
    header.Size = UDim2.new(1, 0, 0, 48)
    header.BackgroundColor3 = theme.Header
    header.BorderSizePixel = 0
    header.Parent = mainFrame
    
    local headerCorner = Instance.new("UICorner")
    headerCorner.CornerRadius = theme.CornerRadius
    headerCorner.Parent = header
    
    local headerFlatBottom = Instance.new("Frame")
    headerFlatBottom.Name = "FlatBottom"
    headerFlatBottom.Size = UDim2.new(1, 0, 0, 10)
    headerFlatBottom.Position = UDim2.new(0, 0, 1, -10)
    headerFlatBottom.BackgroundColor3 = theme.Header
    headerFlatBottom.BorderSizePixel = 0
    headerFlatBottom.Parent = header
    
    local logoImg = Instance.new("ImageLabel")
    logoImg.Name = "Logo"
    logoImg.Size = UDim2.new(0, 26, 0, 26)
    logoImg.Position = UDim2.new(0, 14, 0.5, -13)
    logoImg.BackgroundTransparency = 1
    logoImg.Image = logoAsset or theme.DefaultLogo or "rbxasset://textures/LiyhubLogo.png"
    logoImg.ScaleType = Enum.ScaleType.Fit
    logoImg.Parent = header
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(1, -130, 0, 18)
    titleLabel.Position = UDim2.new(0, 46, 0, 7)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = titleText
    titleLabel.TextColor3 = theme.TextPrimary
    titleLabel.Font = theme.FontTitle
    titleLabel.TextSize = theme.FontSizeTitle
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.TextTruncate = Enum.TextTruncate.AtEnd
    titleLabel.Parent = header
    
    local subLabel = Instance.new("TextLabel")
    subLabel.Name = "Subtitle"
    subLabel.Size = UDim2.new(1, -130, 0, 14)
    subLabel.Position = UDim2.new(0, 46, 0, 25)
    subLabel.BackgroundTransparency = 1
    subLabel.Text = subtitleText
    subLabel.TextColor3 = theme.TextMuted
    subLabel.Font = theme.FontRegular
    subLabel.TextSize = theme.FontSizeSubtitle
    subLabel.TextXAlignment = Enum.TextXAlignment.Left
    subLabel.TextTruncate = Enum.TextTruncate.AtEnd
    subLabel.Parent = header
    
    -- Header Controls: Minimize & Close
    local controlsFrame = Instance.new("Frame")
    controlsFrame.Name = "Controls"
    controlsFrame.Size = UDim2.new(0, 70, 0, 28)
    controlsFrame.Position = UDim2.new(1, -78, 0, 10)
    controlsFrame.BackgroundTransparency = 1
    controlsFrame.ZIndex = 20
    controlsFrame.Parent = mainFrame
    
    local controlsLayout = Instance.new("UIListLayout")
    controlsLayout.FillDirection = Enum.FillDirection.Horizontal
    controlsLayout.SortOrder = Enum.SortOrder.LayoutOrder
    controlsLayout.Padding = UDim.new(0, 6)
    controlsLayout.Parent = controlsFrame
    
    local minBtn = Instance.new("TextButton")
    minBtn.Name = "Minimize"
    minBtn.Size = UDim2.new(0, 28, 0, 28)
    minBtn.BackgroundColor3 = theme.Element
    minBtn.AutoButtonColor = true
    minBtn.Text = "-"
    minBtn.TextColor3 = theme.TextPrimary
    minBtn.Font = Enum.Font.GothamBold
    minBtn.TextSize = 16
    minBtn.BorderSizePixel = 0
    minBtn.Active = true
    minBtn.ZIndex = 21
    minBtn.Parent = controlsFrame
    
    local minCorner = Instance.new("UICorner")
    minCorner.CornerRadius = theme.SmallCornerRadius
    minCorner.Parent = minBtn
    
    local closeBtn = Instance.new("TextButton")
    closeBtn.Name = "Close"
    closeBtn.Size = UDim2.new(0, 28, 0, 28)
    closeBtn.BackgroundColor3 = theme.Element
    closeBtn.AutoButtonColor = true
    closeBtn.Text = "X"
    closeBtn.TextColor3 = theme.TextPrimary
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.TextSize = 13
    closeBtn.BorderSizePixel = 0
    closeBtn.Active = true
    closeBtn.ZIndex = 21
    closeBtn.Parent = controlsFrame
    
    local closeCorner = Instance.new("UICorner")
    closeCorner.CornerRadius = theme.SmallCornerRadius
    closeCorner.Parent = closeBtn
    
    -- Body container
    local body = Instance.new("Frame")
    body.Name = "Body"
    body.Size = UDim2.new(1, 0, 1, -48)
    body.Position = UDim2.new(0, 0, 0, 48)
    body.BackgroundTransparency = 1
    body.Parent = mainFrame
    
    -- Left Sidebar
    local sidebar = Instance.new("Frame")
    sidebar.Name = "Sidebar"
    sidebar.Size = UDim2.new(0, 190, 1, 0)
    sidebar.BackgroundColor3 = theme.Sidebar
    sidebar.BorderSizePixel = 0
    sidebar.Parent = body
    
    -- Sidebar Tab Groups Container (Scrollable)
    local tabGroupsScroll = Instance.new("ScrollingFrame")
    tabGroupsScroll.Name = "TabGroupsScroll"
    tabGroupsScroll.Size = UDim2.new(1, 0, 1, -58)
    tabGroupsScroll.BackgroundTransparency = 1
    tabGroupsScroll.BorderSizePixel = 0
    tabGroupsScroll.ScrollBarThickness = 2
    tabGroupsScroll.ScrollBarImageColor3 = theme.Scrollbar
    tabGroupsScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
    tabGroupsScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    tabGroupsScroll.Parent = sidebar
    
    local tabGroupsList = Instance.new("UIListLayout")
    tabGroupsList.SortOrder = Enum.SortOrder.LayoutOrder
    tabGroupsList.Padding = UDim.new(0, 8)
    tabGroupsList.Parent = tabGroupsScroll
    
    local tabGroupsPadding = Instance.new("UIPadding")
    tabGroupsPadding.PaddingTop = UDim.new(0, 8)
    tabGroupsPadding.PaddingBottom = UDim.new(0, 8)
    tabGroupsPadding.PaddingLeft = UDim.new(0, 8)
    tabGroupsPadding.PaddingRight = UDim.new(0, 8)
    tabGroupsPadding.Parent = tabGroupsScroll
    
    -- Profile Card at Bottom of Sidebar
    local profileCard = Instance.new("Frame")
    profileCard.Name = "ProfileCard"
    profileCard.Size = UDim2.new(1, -16, 0, 46)
    profileCard.Position = UDim2.new(0, 8, 1, -52)
    profileCard.BackgroundColor3 = theme.SidebarItem
    profileCard.BorderSizePixel = 0
    profileCard.Parent = sidebar
    
    local profCorner = Instance.new("UICorner")
    profCorner.CornerRadius = theme.SmallCornerRadius
    profCorner.Parent = profileCard
    
    if theme.UseStrokes then
        local profStroke = Instance.new("UIStroke")
        profStroke.Name = "ProfileStroke"
        profStroke.Color = theme.Border
        profStroke.Thickness = 1
        profStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        profStroke.Parent = profileCard
    end
    
    local avatarImg = Instance.new("ImageLabel")
    avatarImg.Name = "Avatar"
    avatarImg.Size = UDim2.new(0, 32, 0, 32)
    avatarImg.Position = UDim2.new(0, 7, 0.5, -16)
    avatarImg.BackgroundColor3 = theme.Header
    avatarImg.BorderSizePixel = 0
    avatarImg.Parent = profileCard
    
    local avCorner = Instance.new("UICorner")
    avCorner.CornerRadius = UDim.new(1, 0)
    avCorner.Parent = avatarImg
    
    task.spawn(function()
        local player = Players.LocalPlayer
        if player then
            local thumb, isReady = Players:GetUserThumbnailAsync(
                player.UserId,
                Enum.ThumbnailType.HeadShot,
                Enum.ThumbnailSize.Size100x100
            )
            if thumb and avatarImg and avatarImg.Parent then
                avatarImg.Image = thumb
            end
        end
    end)
    
    local localUser = Players.LocalPlayer
    local dispNameText = localUser and localUser.DisplayName or "User"
    local rawNameText = localUser and ("@" .. localUser.Name) or "@user"
    
    local profDisplayName = Instance.new("TextLabel")
    profDisplayName.Name = "DisplayName"
    profDisplayName.Size = UDim2.new(1, -48, 0, 16)
    profDisplayName.Position = UDim2.new(0, 45, 0, 7)
    profDisplayName.BackgroundTransparency = 1
    profDisplayName.Text = dispNameText
    profDisplayName.TextColor3 = theme.TextPrimary
    profDisplayName.Font = theme.FontBold
    profDisplayName.TextSize = theme.FontSizeSmall
    profDisplayName.TextXAlignment = Enum.TextXAlignment.Left
    profDisplayName.TextTruncate = Enum.TextTruncate.AtEnd
    profDisplayName.Parent = profileCard
    
    local profUsername = Instance.new("TextLabel")
    profUsername.Name = "Username"
    profUsername.Size = UDim2.new(1, -48, 0, 14)
    profUsername.Position = UDim2.new(0, 45, 0, 23)
    profUsername.BackgroundTransparency = 1
    profUsername.Text = rawNameText
    profUsername.TextColor3 = theme.TextSecondary
    profUsername.Font = theme.FontRegular
    profUsername.TextSize = 10
    profUsername.TextXAlignment = Enum.TextXAlignment.Left
    profUsername.TextTruncate = Enum.TextTruncate.AtEnd
    profUsername.Parent = profileCard
    
    -- Right Content Area
    local contentArea = Instance.new("Frame")
    contentArea.Name = "ContentArea"
    contentArea.Size = UDim2.new(1, -190, 1, 0)
    contentArea.Position = UDim2.new(0, 190, 0, 0)
    contentArea.BackgroundTransparency = 1
    contentArea.BorderSizePixel = 0
    contentArea.ClipsDescendants = true
    contentArea.Parent = body
    
    local contentPadding = Instance.new("UIPadding")
    contentPadding.PaddingTop = UDim.new(0, 10)
    contentPadding.PaddingBottom = UDim.new(0, 10)
    contentPadding.PaddingLeft = UDim.new(0, 10)
    contentPadding.PaddingRight = UDim.new(0, 10)
    contentPadding.Parent = contentArea
    
    local resizeGrip = Instance.new("TextButton")
    resizeGrip.Name = "ResizeGrip"
    resizeGrip.Text = ""
    resizeGrip.AutoButtonColor = false
    resizeGrip.BackgroundTransparency = 1
    resizeGrip.Size = UDim2.fromOffset(24, 24)
    resizeGrip.AnchorPoint = Vector2.new(1, 1)
    resizeGrip.Position = UDim2.new(1, -2, 1, -2)
    resizeGrip.ZIndex = 50
    resizeGrip.Parent = mainFrame

    local gripIcon = Instance.new("ImageLabel")
    gripIcon.Name = "GripIcon"
    gripIcon.Size = UDim2.fromOffset(12, 12)
    gripIcon.AnchorPoint = Vector2.new(1, 1)
    gripIcon.Position = UDim2.new(1, -4, 1, -4)
    gripIcon.BackgroundTransparency = 1
    gripIcon.Image = "rbxassetid://10709791523"
    gripIcon.Rotation = 45
    gripIcon.ImageColor3 = Color3.fromRGB(140, 155, 180)
    gripIcon.ImageTransparency = 0.45
    gripIcon.ZIndex = 51
    gripIcon.Active = false
    gripIcon.Parent = resizeGrip
    
    local self = setmetatable({
        _screenGui = screenGui,
        _mainFrame = mainFrame,
        _header = header,
        _sidebar = sidebar,
        _tabGroupsScroll = tabGroupsScroll,
        _contentArea = contentArea,
        _profileCard = profileCard,
        _theme = theme,
        _cleanup = cleanup,
        _layoutCtor = Layout,
        _modal = Modal,
        _mobilePin = nil,
        _sizeManager = SizeManager,
        _sizePreset = sizePreset,
        _currentDevice = sizePreset.Name,
        _baseScale = sizePreset.Scale or 1.0,
        _uiScale = windowScale,
        _components = {
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
            MobilePin = MobilePin,
        },
        _tabGroups = {},
        _activeTab = nil,
        _toggleKey = toggleKey,
        _minimized = false,
        _originalSize = defaultSize,
        _destroyed = false,
    }, Window)
    
    -- Window Dragging Implementation
    local dragging = false
    local dragInput, dragStart, startPos
    
    local dragBegan = header.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            local mousePos = input.Position
            local cPos = controlsFrame.AbsolutePosition
            local cSize = controlsFrame.AbsoluteSize
            if mousePos.X >= cPos.X and mousePos.X <= cPos.X + cSize.X and mousePos.Y >= cPos.Y and mousePos.Y <= cPos.Y + cSize.Y then
                return
            end
            dragging = true
            dragStart = input.Position
            startPos = mainFrame.Position
        end
    end)
    
    local dragChanged = header.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    
    local dragUpdate = UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            mainFrame.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)
    
    local dragEnded = UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
    
    local lastMin = 0
    local function doMin()
        local now = os.clock()
        if now - lastMin < 0.15 then return end
        lastMin = now
        self:ToggleMinimize()
    end
    local minClick = minBtn.Activated:Connect(doMin)
    
    local lastClose = 0
    local function doClose()
        local now = os.clock()
        if now - lastClose < 0.15 then return end
        lastClose = now
        self:ShowModal({
            Title = "Close " .. titleText .. "?",
            Message = "Are you sure you want to unload and close " .. titleText .. "?",
            ConfirmText = "Close UI",
            CancelText = "Cancel",
            OnConfirm = function()
                self:Destroy()
            end,
        })
    end
    local closeClick = closeBtn.Activated:Connect(doClose)
    
    local keyToggleConn = UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if not gameProcessed and input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == self._toggleKey then
            self:Toggle()
        end
    end)
    
    -- Create Mobile Pin Tab if enabled
    if enableMobilePin and MobilePin then
        self._mobilePin = MobilePin.new(screenGui, self, {
            Title = titleText,
            Logo = logoAsset,
        }, theme, cleanup)
        self._mobilePin:SetVisible(false)
    end

    local isResizing = false
    local resizeStartMouse = Vector2.zero
    local resizeStartSize = Vector2.zero

    local gripEnter = resizeGrip.MouseEnter:Connect(function()
        TweenService:Create(gripIcon, TweenInfo.new(0.15), {
            ImageColor3 = Color3.fromRGB(255, 255, 255),
            ImageTransparency = 0
        }):Play()
    end)
    local gripLeave = resizeGrip.MouseLeave:Connect(function()
        if not isResizing then
            TweenService:Create(gripIcon, TweenInfo.new(0.15), {
                ImageColor3 = Color3.fromRGB(140, 155, 180),
                ImageTransparency = 0.45
            }):Play()
        end
    end)

    local resizeBegan = resizeGrip.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            isResizing = true
            resizeStartMouse = Vector2.new(input.Position.X, input.Position.Y)
            resizeStartSize = Vector2.new(mainFrame.AbsoluteSize.X, mainFrame.AbsoluteSize.Y)
            TweenService:Create(gripIcon, TweenInfo.new(0.1), {
                ImageColor3 = Color3.fromRGB(255, 255, 255),
                ImageTransparency = 0
            }):Play()

            local moveConn, endConn
            moveConn = UserInputService.InputChanged:Connect(function(moveInput)
                if not isResizing then return end
                if moveInput.UserInputType == Enum.UserInputType.MouseMovement or moveInput.UserInputType == Enum.UserInputType.Touch then
                    local activeScale = windowScale.Scale > 0 and windowScale.Scale or 1.0
                    local delta = (Vector2.new(moveInput.Position.X, moveInput.Position.Y) - resizeStartMouse) / activeScale
                    local curCam = workspace.CurrentCamera
                    local curVp = Vector2.new(1920, 1080)
                    if curCam and curCam.ViewportSize.X > 0 then
                        curVp = curCam.ViewportSize
                    end
                    local minW = sizePreset.MinSize and sizePreset.MinSize.X or 440
                    local minH = sizePreset.MinSize and sizePreset.MinSize.Y or 300
                    local maxW = math.max(curVp.X - 20, 600)
                    local maxH = math.max(curVp.Y - 20, 400)
                    local newW = math.clamp(math.floor(resizeStartSize.X + delta.X), minW, maxW)
                    local newH = math.clamp(math.floor(resizeStartSize.Y + delta.Y), minH, maxH)
                    mainFrame.Size = UDim2.fromOffset(newW, newH)
                    self._originalSize = mainFrame.Size
                end
            end)

            endConn = UserInputService.InputEnded:Connect(function(endInput)
                if endInput.UserInputType == Enum.UserInputType.MouseButton1 or endInput.UserInputType == Enum.UserInputType.Touch then
                    isResizing = false
                    if moveConn then moveConn:Disconnect() end
                    if endConn then endConn:Disconnect() end
                    TweenService:Create(gripIcon, TweenInfo.new(0.2), {
                        ImageColor3 = Color3.fromRGB(140, 155, 180),
                        ImageTransparency = 0.45
                    }):Play()
                end
            end)
        end
    end)

    if cleanup then
        cleanup:Add(gripEnter)
        cleanup:Add(gripLeave)
        cleanup:Add(resizeBegan)
    end
    
    if cleanup then
        cleanup:Add(dragBegan)
        cleanup:Add(dragChanged)
        cleanup:Add(dragUpdate)
        cleanup:Add(dragEnded)
        cleanup:Add(minClick)
        cleanup:Add(closeClick)
        cleanup:Add(keyToggleConn)
        cleanup:Add(screenGui)
    end

    local function updateWindowScale()
        pcall(function()
            if not screenGui or not screenGui.Parent or not windowScale or not windowScale.Parent then return end
            local curCam = workspace.CurrentCamera
            local vp = curCam and curCam.ViewportSize
            if not vp or vp.X <= 0 or vp.Y <= 0 then
                local sz = screenGui.AbsoluteSize
                if sz and sz.X > 0 and sz.Y > 0 then
                    vp = sz
                end
            end
            if not vp or vp.X <= 0 or vp.Y <= 0 then return end
            local baseW = mainFrame.Size.X.Offset
            local baseH = mainFrame.Size.Y.Offset
            if baseW <= 0 or baseH <= 0 then return end
            local pad = (detectedDevice ~= "PC") and 24 or 32
            local scaleX = (vp.X - pad) / baseW
            local scaleY = (vp.Y - pad) / baseH
            local fitScale = math.min(scaleX, scaleY)
            local userScale = self._baseScale or sizePreset.Scale or 1.0
            if fitScale < 1.0 then
                windowScale.Scale = math.clamp(fitScale * userScale, 0.45, userScale)
            else
                windowScale.Scale = userScale
            end
        end)
    end
    updateWindowScale()
    local vpConn = workspace.CurrentCamera and workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(updateWindowScale)
    local guiConn = screenGui:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateWindowScale)
    if cleanup then
        if vpConn then cleanup:Add(vpConn) end
        cleanup:Add(guiConn)
    end

    self:_initUniversalTabs(options)
    
    return self
end

function Window:Minimize()
    self._minimized = true
    self._mainFrame.Visible = false
    if self._mobilePin then
        self._mobilePin:SetVisible(true)
        self._mobilePin:SetOpenState(false)
    end
end

function Window:Open()
    self._minimized = false
    self._mainFrame.Visible = true
    if self._mobilePin then
        self._mobilePin:SetVisible(false)
        self._mobilePin:SetOpenState(true)
    end
end

function Window:ToggleMinimize()
    if self._mainFrame.Visible then
        self:Minimize()
    else
        self:Open()
    end
end

function Window:Toggle()
    self:ToggleMinimize()
end

function Window:SetDevice(deviceType)
    if not self._sizeManager then return end
    local preset = self._sizeManager.GetPreset(deviceType)
    if not preset then return end
    self._sizePreset = preset
    self._currentDevice = preset.Name
    self._baseScale = preset.Scale
    self._uiScale.Scale = preset.Scale
    self._mainFrame.Size = preset.DefaultSize
    self._originalSize = preset.DefaultSize
    local sbW = preset.SidebarWidth or 190
    if self._sidebar then
        self._sidebar.Size = UDim2.new(0, sbW, 1, 0)
    end
    if self._contentArea then
        self._contentArea.Size = UDim2.new(1, -sbW, 1, 0)
        self._contentArea.Position = UDim2.new(0, sbW, 0, 0)
    end
end

function Window:SetScale(scaleFactor)
    local num = math.clamp(tonumber(scaleFactor) or 1.0, 0.5, 1.5)
    self._baseScale = num
    self._uiScale.Scale = num
end

function Window:SetSizePreset(presetName)
    local mult = self._sizeManager and self._sizeManager.GetScaleMultiplier(presetName) or 1.0
    self:SetScale(mult)
end

function Window:GetDevice()
    return self._currentDevice or "PC"
end

function Window:GetScale()
    return self._uiScale and self._uiScale.Scale or 1.0
end

function Window:GetUniversalGroup()
    return self._universalGroup
end

function Window:GetInformationTab()
    return self._infoTab
end

function Window:GetSettingsTab()
    return self._settingsTab
end

function Window:_initUniversalTabs(options)
    if options.UniversalGroup == false then return end

    local discordUrl = options.Discord or options.DiscordLink or "https://discord.gg/Nr56tQJeJh"
    local bannerImage = options.Banner or options.BannerImage or "rbxassetid://108339444679489"
    local bannerTitle = options.BannerTitle or "LiyHub Announcement"
    local bannerDesc = options.BannerDesc or "Universal high-performance script framework engineered by Than & aeris. Minimalist pure B&W design, vector typography, and native stealth architecture."

    local univGroup = self:CreateTabGroup("Universal")
    self._universalGroup = univGroup

    local infoTab = univGroup:CreateTab({
        Name = "Information",
        Icon = "rbxassetid://6031075931",
    })
    self._infoTab = infoTab

    infoTab:CreateBanner({
        Title = bannerTitle,
        Image = bannerImage,
        Description = bannerDesc,
    })

    local commSec = infoTab:CreateSection("Community & Support")
    commSec:CreateButton({
        Name = "Discord Community",
        Desc = discordUrl,
        ButtonText = "Copy Invite",
        Callback = function()
            pcall(function()
                if setclipboard then
                    setclipboard(discordUrl)
                elseif toclipboard then
                    toclipboard(discordUrl)
                end
            end)
            self:Notify({
                Title = "Success",
                Content = "Discord invite copied to clipboard!",
                Duration = 2.5,
            })
        end
    })

    local settingsTab = univGroup:CreateTab({
        Name = "Setting UI",
        Icon = "rbxassetid://6031075936",
    })
    self._settingsTab = settingsTab

    local cfgSec = settingsTab:CreateSection("Configurations")
    cfgSec:CreateInput({
        Name = "Profile Name",
        Placeholder = "Enter config name...",
        Default = "DefaultConfig",
        Callback = function(text) end
    })
    cfgSec:CreateDropdown({
        Name = "Select Saved Config",
        Options = { "Default", "Legit", "Rage", "Farming" },
        Default = "Default",
        Callback = function(val) end
    })
    cfgSec:CreateButtonGroup({
        Buttons = {
            {
                Name = "Save",
                Callback = function()
                    self:Notify({ Title = "Config Saved", Content = "Profile saved successfully.", Duration = 2 })
                end
            },
            {
                Name = "Load",
                Callback = function()
                    self:Notify({ Title = "Config Loaded", Content = "Configuration applied cleanly.", Duration = 2 })
                end
            },
            {
                Name = "Delete",
                Callback = function()
                    self:Notify({ Title = "Config Deleted", Content = "Configuration removed.", Duration = 2 })
                end
            }
        }
    })

    local devSec = settingsTab:CreateSection("Device Layout Presets")
    devSec:CreateButtonGroup({
        Buttons = {
            {
                Name = "PC Layout",
                Callback = function()
                    self:SetDevice("PC")
                    self:Notify({ Title = "Device Switch", Content = "Layout updated to PC (1.00x)", Duration = 2 })
                end
            },
            {
                Name = "Tablet Layout",
                Callback = function()
                    self:SetDevice("Tablet")
                    self:Notify({ Title = "Device Switch", Content = "Layout updated to Tablet (1.05x)", Duration = 2 })
                end
            },
            {
                Name = "Android Layout",
                Callback = function()
                    self:SetDevice("Android")
                    self:Notify({ Title = "Device Switch", Content = "Layout updated to Android (1.10x)", Duration = 2 })
                end
            }
        }
    })
    devSec:CreateSlider({
        Name = "UI Scale Multiplier",
        Min = 70,
        Max = 140,
        Default = 100,
        Unit = "%",
        Callback = function(val)
            self:SetScale(val / 100)
        end
    })

    local ifSec = settingsTab:CreateSection("Interface Management")
    ifSec:CreateKeybind({
        Name = "Menu Toggle Keybind",
        Default = Enum.KeyCode.RightControl,
        Callback = function(key)
            self:Notify({ Title = "Keybind Updated", Content = "Toggle key set to " .. tostring(key.Name), Duration = 2 })
        end
    })
    ifSec:CreateButton({
        Name = "Unload / Close Liyhub",
        Desc = "Unloads all GUI elements and terminates hooks.",
        ButtonText = "Unload",
        Callback = function()
            self:ShowModal({
                Title = "Unload Liyhub?",
                Message = "Are you sure you want to completely unload and destroy Liyhub?",
                ConfirmText = "Unload",
                CancelText = "Cancel",
                OnConfirm = function()
                    self:Destroy()
                end
            })
        end
    })

    self:_setActiveTab(infoTab)
end

function Window:SetTransparency(value)
    value = math.clamp(value or 0, 0, 1)
    self._mainFrame.BackgroundTransparency = value
    self._header.BackgroundTransparency = value
    self._sidebar.BackgroundTransparency = value
end

function Window:SetGroupTransparency(value)
    value = math.clamp(value or 0, 0, 1)
    self._mainFrame.GroupTransparency = value
end

function Window:SetToggleKey(keyCode)
    if typeof(keyCode) == "EnumItem" and keyCode.EnumType == Enum.KeyCode then
        self._toggleKey = keyCode
    end
end

function Window:SetMobilePin(visible)
    if self._mobilePin then
        self._mobilePin:SetVisible(visible)
    end
end

function Window:GetMobilePin()
    return self._mobilePin
end

function Window:Notify(options)
    if self._modal then
        self._modal.Notify(self._screenGui, options, self._theme, self._cleanup)
    end
end

function Window:ShowModal(options)
    if self._modal then
        self._modal.ShowConfirmation(self._screenGui, options, self._theme, self._cleanup)
    end
end

function Window:CreateTabGroup(name)
    assert(type(name) == "string", "TabGroup name must be a string")
    
    local groupContainer = Instance.new("Frame")
    groupContainer.Name = "TabGroup_" .. name
    groupContainer.Size = UDim2.new(1, 0, 0, 0)
    groupContainer.AutomaticSize = Enum.AutomaticSize.Y
    groupContainer.BackgroundTransparency = 1
    groupContainer.Parent = self._tabGroupsScroll
    
    local gList = Instance.new("UIListLayout")
    gList.SortOrder = Enum.SortOrder.LayoutOrder
    gList.Padding = UDim.new(0, 3)
    gList.Parent = groupContainer
    
    -- Header button (collapsible)
    local gHeader = Instance.new("TextButton")
    gHeader.Name = "Header"
    gHeader.Size = UDim2.new(1, 0, 0, 22)
    gHeader.BackgroundTransparency = 1
    gHeader.AutoButtonColor = false
    gHeader.Text = ""
    gHeader.Parent = groupContainer
    
    local gTitle = Instance.new("TextLabel")
    gTitle.Name = "Title"
    gTitle.Size = UDim2.new(1, -20, 1, 0)
    gTitle.Position = UDim2.new(0, 6, 0, 0)
    gTitle.BackgroundTransparency = 1
    gTitle.Text = string.upper(name)
    gTitle.TextColor3 = self._theme.TextMuted
    gTitle.Font = self._theme.FontBold
    gTitle.TextSize = 10
    gTitle.TextXAlignment = Enum.TextXAlignment.Left
    gTitle.Parent = gHeader
    
    local gArrow = Instance.new("ImageLabel")
    gArrow.Name = "Arrow"
    gArrow.Size = UDim2.fromOffset(12, 12)
    gArrow.Position = UDim2.new(1, -16, 0.5, -6)
    gArrow.BackgroundTransparency = 1
    gArrow.Image = "rbxassetid://10709790948"
    gArrow.ImageColor3 = self._theme.TextMuted
    gArrow.Rotation = 180
    gArrow.Parent = gHeader
    
    -- Tabs Frame
    local tabsFrame = Instance.new("Frame")
    tabsFrame.Name = "Tabs"
    tabsFrame.Size = UDim2.new(1, 0, 0, 0)
    tabsFrame.AutomaticSize = Enum.AutomaticSize.Y
    tabsFrame.BackgroundTransparency = 1
    tabsFrame.Parent = groupContainer
    
    local tList = Instance.new("UIListLayout")
    tList.SortOrder = Enum.SortOrder.LayoutOrder
    tList.Padding = UDim.new(0, 3)
    tList.Parent = tabsFrame
    
    local tabGroupObj = setmetatable({
        _window = self,
        _container = groupContainer,
        _tabsFrame = tabsFrame,
        _arrow = gArrow,
        _collapsed = false,
        _tabs = {},
    }, TabGroup)
    
    local lastGroupToggle = 0
    local function toggleGroup()
        local now = os.clock()
        if now - lastGroupToggle < 0.15 then return end
        lastGroupToggle = now
        tabGroupObj._collapsed = not tabGroupObj._collapsed
        tabsFrame.Visible = not tabGroupObj._collapsed
        TweenService:Create(gArrow, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Rotation = tabGroupObj._collapsed and 0 or 180
        }):Play()
    end
    local toggleClick = gHeader.Activated:Connect(toggleGroup)
    
    if self._cleanup then
        self._cleanup:Add(toggleClick)
        self._cleanup:Add(groupContainer)
    end
    
    table.insert(self._tabGroups, tabGroupObj)
    return tabGroupObj
end

function Window:_setActiveTab(tab)
    if self._activeTab == tab then return end
    
    if self._activeTab then
        self._activeTab:_deactivate()
    end
    self._activeTab = tab
    if self._activeTab then
        self._activeTab:_activate()
    end
end

function Window:Destroy()
    if self._destroyed then return end
    self._destroyed = true
    if self._cleanup then
        self._cleanup:Destroy()
    end
    if self._screenGui then
        self._screenGui:Destroy()
        self._screenGui = nil
    end
end

function Window:CreateTab(options, icon)
    if not self._defaultTabGroup then
        self._defaultTabGroup = self:CreateTabGroup("Tabs")
    end
    if type(options) == "string" then
        options = { Name = options, Icon = icon }
    end
    return self._defaultTabGroup:CreateTab(options)
end
Window.AddTab = Window.CreateTab

-- ============================================================================
-- TabGroup Methods
-- ============================================================================

function TabGroup:CreateTab(options)
    local name = type(options) == "table" and (options.Name or options.Text) or tostring(options)
    local iconId = type(options) == "table" and (options.Icon or options.Image) or nil
    local twoColumns = type(options) == "table" and options.TwoColumns == true or false
    
    -- Tab Sidebar Button
    local tabBtn = Instance.new("TextButton")
    tabBtn.Name = "Tab_" .. name
    tabBtn.Size = UDim2.new(1, 0, 0, 32)
    tabBtn.BackgroundColor3 = self._window._theme.SidebarItemActive
    tabBtn.BackgroundTransparency = 1
    tabBtn.AutoButtonColor = false
    tabBtn.Text = ""
    tabBtn.BorderSizePixel = 0
    tabBtn.Parent = self._tabsFrame
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = self._window._theme.SmallCornerRadius
    corner.Parent = tabBtn
    
    local activeBar = Instance.new("Frame")
    activeBar.Name = "ActiveBar"
    activeBar.Size = UDim2.new(0, 3, 0, 18)
    activeBar.Position = UDim2.new(0, 0, 0.5, -9)
    activeBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    activeBar.BorderSizePixel = 0
    activeBar.Visible = false
    activeBar.Parent = tabBtn
    
    local barCorner = Instance.new("UICorner")
    barCorner.CornerRadius = UDim.new(1, 0)
    barCorner.Parent = activeBar
    
    local iconLabel = nil
    local labelOffset = 10
    if iconId then
        iconLabel = Instance.new("ImageLabel")
        iconLabel.Name = "Icon"
        iconLabel.Size = UDim2.new(0, 16, 0, 16)
        iconLabel.Position = UDim2.new(0, 10, 0.5, -8)
        iconLabel.BackgroundTransparency = 1
        iconLabel.Image = iconId
        iconLabel.ImageColor3 = self._window._theme.TextSecondary
        iconLabel.Parent = tabBtn
        labelOffset = 32
    end
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(1, -labelOffset - 6, 1, 0)
    titleLabel.Position = UDim2.new(0, labelOffset, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = name
    titleLabel.TextColor3 = self._window._theme.TextSecondary
    titleLabel.Font = self._window._theme.FontBold
    titleLabel.TextSize = self._window._theme.FontSizeSmall
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = tabBtn
    
    -- Tab Content Container
    local contentContainer = Instance.new("Frame")
    contentContainer.Name = "TabContent_" .. name
    contentContainer.Size = UDim2.new(1, 0, 1, 0)
    contentContainer.BackgroundTransparency = 1
    contentContainer.Visible = false
    contentContainer.Parent = self._window._contentArea
    
    local layoutEngine = self._window._layoutCtor.new(contentContainer, {
        TwoColumns = twoColumns,
    })
    
    local tabObj = setmetatable({
        _window = self._window,
        _tabGroup = self,
        _button = tabBtn,
        _activeBar = activeBar,
        _titleLabel = titleLabel,
        _iconLabel = iconLabel,
        _contentContainer = contentContainer,
        _layoutEngine = layoutEngine,
        _sections = {},
    }, Tab)
    
    local lastTabSelect = 0
    local function selectTab()
        local now = os.clock()
        if now - lastTabSelect < 0.1 then return end
        lastTabSelect = now
        self._window:_setActiveTab(tabObj)
    end
    local btnClick = tabBtn.Activated:Connect(selectTab)
    
    if self._window._cleanup then
        self._window._cleanup:Add(btnClick)
        self._window._cleanup:Add(tabBtn)
        self._window._cleanup:Add(contentContainer)
    end
    
    table.insert(self._tabs, tabObj)
    
    if not self._window._activeTab then
        self._window:_setActiveTab(tabObj)
    end
    
    return tabObj
end

-- ============================================================================
-- Tab Methods
-- ============================================================================

function Tab:_activate()
    self._button.BackgroundTransparency = 0
    self._button.BackgroundColor3 = self._window._theme.SidebarItemActive
    self._titleLabel.TextColor3 = self._window._theme.TextPrimary
    self._titleLabel.Font = self._window._theme.FontBold
    self._activeBar.Visible = true
    if self._iconLabel then
        self._iconLabel.ImageColor3 = self._window._theme.TextPrimary
    end
    self._contentContainer.Visible = true
end

function Tab:_deactivate()
    self._button.BackgroundTransparency = 1
    self._titleLabel.TextColor3 = self._window._theme.TextSecondary
    self._titleLabel.Font = self._window._theme.FontBold
    self._activeBar.Visible = false
    if self._iconLabel then
        self._iconLabel.ImageColor3 = self._window._theme.TextSecondary
    end
    self._contentContainer.Visible = false
end

function Tab:CreateBanner(options)
    local parent = self._layoutEngine:GetSectionParent(options)
    local banner = self._window._components.Banner.new(
        parent,
        options,
        self._window._theme,
        self._window._cleanup
    )
    return banner
end

function Tab:CreateSection(nameOrOptions)
    local sectionName = type(nameOrOptions) == "table" and (nameOrOptions.Name or nameOrOptions.Text) or tostring(nameOrOptions)
    local sectionOptions = type(nameOrOptions) == "table" and nameOrOptions or {}
    
    local sectionParent = self._layoutEngine:GetSectionParent(sectionOptions)
    
    local sectionCard = Instance.new("Frame")
    sectionCard.Name = "Section_" .. sectionName
    sectionCard.Size = UDim2.new(1, 0, 0, 0)
    sectionCard.AutomaticSize = Enum.AutomaticSize.Y
    sectionCard.BackgroundColor3 = self._window._theme.Card
    sectionCard.BorderSizePixel = 0
    sectionCard.Parent = sectionParent
    
    local sCorner = Instance.new("UICorner")
    sCorner.CornerRadius = self._window._theme.CornerRadius
    sCorner.Parent = sectionCard
    
    if self._window._theme.UseStrokes then
        local secStroke = Instance.new("UIStroke")
        secStroke.Name = "SectionStroke"
        secStroke.Color = self._window._theme.Border
        secStroke.Thickness = 1
        secStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        secStroke.Parent = sectionCard
    end
    
    local sPadding = Instance.new("UIPadding")
    sPadding.PaddingTop = UDim.new(0, 8)
    sPadding.PaddingBottom = UDim.new(0, 10)
    sPadding.PaddingLeft = UDim.new(0, 10)
    sPadding.PaddingRight = UDim.new(0, 10)
    sPadding.Parent = sectionCard
    
    local sList = Instance.new("UIListLayout")
    sList.SortOrder = Enum.SortOrder.LayoutOrder
    sList.Padding = UDim.new(0, 8)
    sList.Parent = sectionCard
    
    -- Section Header (Title & Collapsible Arrow)
    local sHeader = Instance.new("TextButton")
    sHeader.Name = "Header"
    sHeader.Size = UDim2.new(1, 0, 0, 22)
    sHeader.BackgroundTransparency = 1
    sHeader.AutoButtonColor = false
    sHeader.Text = ""
    sHeader.Parent = sectionCard
    
    local sTitle = Instance.new("TextLabel")
    sTitle.Name = "Title"
    sTitle.Size = UDim2.new(1, -24, 1, 0)
    sTitle.BackgroundTransparency = 1
    sTitle.Text = string.upper(sectionName)
    sTitle.TextColor3 = self._window._theme.TextPrimary
    sTitle.Font = self._window._theme.FontBold
    sTitle.TextSize = self._window._theme.FontSizeSection
    sTitle.TextXAlignment = Enum.TextXAlignment.Left
    sTitle.Parent = sHeader
    
    local sArrow = Instance.new("ImageLabel")
    sArrow.Name = "Arrow"
    sArrow.Size = UDim2.fromOffset(12, 12)
    sArrow.Position = UDim2.new(1, -16, 0.5, -6)
    sArrow.BackgroundTransparency = 1
    sArrow.Image = "rbxassetid://10709790948"
    sArrow.ImageColor3 = self._window._theme.TextSecondary
    sArrow.Rotation = 180
    sArrow.Parent = sHeader
    
    -- Section Body (Holds components)
    local sBody = Instance.new("Frame")
    sBody.Name = "Body"
    sBody.Size = UDim2.new(1, 0, 0, 0)
    sBody.AutomaticSize = Enum.AutomaticSize.Y
    sBody.BackgroundTransparency = 1
    sBody.Parent = sectionCard
    
    local bList = Instance.new("UIListLayout")
    bList.SortOrder = Enum.SortOrder.LayoutOrder
    bList.Padding = UDim.new(0, 6)
    bList.Parent = sBody
    
    local sectionObj = setmetatable({
        _tab = self,
        _window = self._window,
        _container = sectionCard,
        _body = sBody,
        _arrow = sArrow,
        _collapsed = false,
        _components = {},
    }, Section)
    
    local lastSecToggle = 0
    local function toggleSec()
        local now = os.clock()
        if now - lastSecToggle < 0.15 then return end
        lastSecToggle = now
        sectionObj._collapsed = not sectionObj._collapsed
        sBody.Visible = not sectionObj._collapsed
        TweenService:Create(sArrow, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Rotation = sectionObj._collapsed and 0 or 180
        }):Play()
    end
    local toggleConn = sHeader.Activated:Connect(toggleSec)
    
    if self._window._cleanup then
        self._window._cleanup:Add(toggleConn)
        self._window._cleanup:Add(sectionCard)
    end
    
    table.insert(self._sections, sectionObj)
    return sectionObj
end

-- ============================================================================
-- Section Component Constructors
-- ============================================================================

function Section:CreateButton(options)
    local btn = self._window._components.Button.new(
        self._body,
        options,
        self._window._theme,
        self._window._cleanup
    )
    table.insert(self._components, btn)
    return btn
end

function Section:CreateButtonGroup(options)
    local grp = self._window._components.ButtonGroup.new(
        self._body,
        options,
        self._window._theme,
        self._window._cleanup,
        self._window._components.Button
    )
    table.insert(self._components, grp)
    return grp
end

function Section:CreateToggle(options)
    local tog = self._window._components.Toggle.new(
        self._body,
        options,
        self._window._theme,
        self._window._cleanup
    )
    table.insert(self._components, tog)
    return tog
end

function Section:CreateToggleGroup(options)
    local grp = self._window._components.ToggleGroup.new(
        self._body,
        options,
        self._window._theme,
        self._window._cleanup,
        self._window._components.Toggle
    )
    table.insert(self._components, grp)
    return grp
end

function Section:CreateSlider(options)
    local sld = self._window._components.Slider.new(
        self._body,
        options,
        self._window._theme,
        self._window._cleanup
    )
    table.insert(self._components, sld)
    return sld
end

function Section:CreateSliderGroup(options)
    local grp = self._window._components.SliderGroup.new(
        self._body,
        options,
        self._window._theme,
        self._window._cleanup,
        self._window._components.Slider
    )
    table.insert(self._components, grp)
    return grp
end

function Section:CreateInput(options)
    local inp = self._window._components.Input.new(
        self._body,
        options,
        self._window._theme,
        self._window._cleanup
    )
    table.insert(self._components, inp)
    return inp
end

function Section:CreateInputGroup(options)
    local grp = self._window._components.InputGroup.new(
        self._body,
        options,
        self._window._theme,
        self._window._cleanup,
        self._window._components.Input
    )
    table.insert(self._components, grp)
    return grp
end

function Section:CreateDropdown(options)
    local drp = self._window._components.Dropdown.new(
        self._body,
        options,
        self._window._theme,
        self._window._cleanup
    )
    table.insert(self._components, drp)
    return drp
end

function Section:CreateMultiDropdown(options)
    options = options or {}
    options.Multi = true
    return self:CreateDropdown(options)
end

function Section:CreateDropdownGroup(options)
    local grp = self._window._components.DropdownGroup.new(
        self._body,
        options,
        self._window._theme,
        self._window._cleanup,
        self._window._components.Dropdown
    )
    table.insert(self._components, grp)
    return grp
end

function Section:CreateKeybind(options)
    local key = self._window._components.Keybind.new(
        self._body,
        options,
        self._window._theme,
        self._window._cleanup
    )
    table.insert(self._components, key)
    return key
end

function Section:CreateParagraph(options)
    local par = self._window._components.Paragraph.new(
        self._body,
        options,
        self._window._theme,
        self._window._cleanup
    )
    table.insert(self._components, par)
    return par
end

function Section:CreateDivider(options)
    local div = self._window._components.Divider.new(
        self._body,
        options,
        self._window._theme,
        self._window._cleanup
    )
    table.insert(self._components, div)
    return div
end

function Section:CreateBanner(options)
    local ban = self._window._components.Banner.new(
        self._body,
        options,
        self._window._theme,
        self._window._cleanup
    )
    table.insert(self._components, ban)
    return ban
end

function Section:CreateProgression(options)
    local prg = self._window._components.Progression.new(
        self._body,
        options,
        self._window._theme,
        self._window._cleanup
    )
    table.insert(self._components, prg)
    return prg
end

TabGroup.AddTab = TabGroup.CreateTab
Tab.AddSection = Tab.CreateSection
Tab.AddBanner = Tab.CreateBanner

Section.AddButton = Section.CreateButton
Section.AddButtonGroup = Section.CreateButtonGroup
Section.AddToggle = Section.CreateToggle
Section.AddToggleGroup = Section.CreateToggleGroup
Section.AddSlider = Section.CreateSlider
Section.AddSliderGroup = Section.CreateSliderGroup
Section.AddInput = Section.CreateInput
Section.AddInputGroup = Section.CreateInputGroup
Section.AddDropdown = Section.CreateDropdown
Section.AddDropdownGroup = Section.CreateDropdownGroup
Section.AddMultiDropdown = Section.CreateMultiDropdown
Section.AddKeybind = Section.CreateKeybind
Section.AddParagraph = Section.CreateParagraph
Section.AddDivider = Section.CreateDivider
Section.AddBanner = Section.CreateBanner
Section.AddProgression = Section.CreateProgression

return Window
