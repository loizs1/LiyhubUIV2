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
    
    local titleText = options.Title or "LiyHub"
    local subtitleText = options.Subtitle or "v2.2 Black & White Edition"
    local defaultSize = options.Size or UDim2.new(0, 680, 0, 460)
    local toggleKey = options.ToggleKey or Enum.KeyCode.RightControl
    local enableMobilePin = options.MobilePin ~= false -- Default enabled
    local logoAsset = options.Logo or "rbxassetid://6031075936"
    local parentGui = options.Parent
    
    if not parentGui then
        local localPlayer = Players.LocalPlayer
        if localPlayer then
            parentGui = localPlayer:WaitForChild("PlayerGui", 5)
        end
    end
    
    -- Main ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "LiyHubUI_" .. titleText
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    pcall(function()
        if typeof(syn) == "table" and syn.protect_gui then
            syn.protect_gui(screenGui)
        end
    end)
    screenGui.Parent = parentGui or game:GetService("CoreGui")
    
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
    
    local mainCorner = Instance.new("UICorner")
    mainCorner.CornerRadius = theme.CornerRadius
    mainCorner.Parent = mainFrame
    
    -- Cursor unlocker for PC interaction
    local modalUnlocker = Instance.new("TextButton")
    modalUnlocker.Name = "ModalUnlocker"
    modalUnlocker.BackgroundTransparency = 1
    modalUnlocker.Text = ""
    modalUnlocker.Size = UDim2.new(0, 0, 0, 0)
    modalUnlocker.Visible = true
    modalUnlocker.Modal = true
    modalUnlocker.Active = false
    modalUnlocker.Parent = mainFrame
    
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
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(0.5, 0, 0, 20)
    titleLabel.Position = UDim2.new(0, 16, 0, 8)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = titleText
    titleLabel.TextColor3 = theme.TextPrimary
    titleLabel.Font = theme.FontTitle
    titleLabel.TextSize = theme.FontSizeTitle
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = header
    
    local subLabel = Instance.new("TextLabel")
    subLabel.Name = "Subtitle"
    subLabel.Size = UDim2.new(0.5, 0, 0, 14)
    subLabel.Position = UDim2.new(0, 16, 0, 28)
    subLabel.BackgroundTransparency = 1
    subLabel.Text = subtitleText
    subLabel.TextColor3 = theme.TextSecondary
    subLabel.Font = theme.FontRegular
    subLabel.TextSize = theme.FontSizeSubtitle
    subLabel.TextXAlignment = Enum.TextXAlignment.Left
    subLabel.Parent = header
    
    -- Header Controls: Minimize & Close
    local controlsFrame = Instance.new("Frame")
    controlsFrame.Name = "Controls"
    controlsFrame.Size = UDim2.new(0, 70, 0, 28)
    controlsFrame.Position = UDim2.new(1, -80, 0.5, -14)
    controlsFrame.BackgroundTransparency = 1
    controlsFrame.Parent = header
    
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
    minBtn.ZIndex = 14
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
    closeBtn.ZIndex = 14
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
    
    -- Resize Grip in bottom right
    local resizeGrip = Instance.new("TextLabel")
    resizeGrip.Name = "ResizeGrip"
    resizeGrip.Size = UDim2.new(0, 16, 0, 16)
    resizeGrip.Position = UDim2.new(1, -18, 1, -18)
    resizeGrip.BackgroundTransparency = 1
    resizeGrip.Text = ""
    resizeGrip.TextColor3 = theme.TextMuted
    resizeGrip.Font = theme.FontBold
    resizeGrip.TextSize = 14
    resizeGrip.ZIndex = 50
    resizeGrip.Parent = mainFrame
    
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
    
    local minClick = minBtn.Activated:Connect(function()
        self:ToggleMinimize()
    end)
    
    local closeClick = closeBtn.Activated:Connect(function()
        self:ShowModal({
            Title = "Close " .. titleText .. "?",
            Message = "Are you sure you want to unload and close " .. titleText .. "?",
            ConfirmText = "Close UI",
            CancelText = "Cancel",
            OnConfirm = function()
                self:Destroy()
            end,
        })
    end)
    
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
    
    return self
end

function Window:ToggleMinimize()
    self._minimized = not self._minimized
    if self._minimized then
        TweenService:Create(self._mainFrame, TweenInfo.new(self._theme.AnimationFast), {
            Size = UDim2.new(self._originalSize.X.Scale, self._originalSize.X.Offset, 0, 48)
        }):Play()
    else
        TweenService:Create(self._mainFrame, TweenInfo.new(self._theme.AnimationFast), {
            Size = self._originalSize
        }):Play()
    end
end

function Window:Toggle()
    local targetVisible = not self._mainFrame.Visible
    self._mainFrame.Visible = targetVisible
    if self._mobilePin then
        self._mobilePin:UpdateState()
    end
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
    
    local gArrow = Instance.new("TextLabel")
    gArrow.Name = "Arrow"
    gArrow.Size = UDim2.new(0, 16, 1, 0)
    gArrow.Position = UDim2.new(1, -18, 0, 0)
    gArrow.BackgroundTransparency = 1
    gArrow.Text = "^"
    gArrow.TextColor3 = self._theme.TextMuted
    gArrow.Font = self._theme.FontBold
    gArrow.TextSize = 10
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
    
    local toggleClick = gHeader.Activated:Connect(function()
        tabGroupObj._collapsed = not tabGroupObj._collapsed
        tabsFrame.Visible = not tabGroupObj._collapsed
        gArrow.Text = tabGroupObj._collapsed and "v" or "^"
    end)
    
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
    tabBtn.BackgroundColor3 = self._window._theme.SidebarItem
    tabBtn.AutoButtonColor = false
    tabBtn.Text = ""
    tabBtn.BorderSizePixel = 0
    tabBtn.Parent = self._tabsFrame
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = self._window._theme.SmallCornerRadius
    corner.Parent = tabBtn
    
    local activeBar = Instance.new("Frame")
    activeBar.Name = "ActiveBar"
    activeBar.Size = UDim2.new(0, 3, 1, -10)
    activeBar.Position = UDim2.new(0, 3, 0, 5)
    activeBar.BackgroundColor3 = self._window._theme.Accent
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
    titleLabel.Font = self._window._theme.FontRegular
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
    
    local btnClick = tabBtn.Activated:Connect(function()
        self._window:_setActiveTab(tabObj)
    end)
    
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
    self._button.BackgroundColor3 = self._window._theme.SidebarItem
    self._titleLabel.TextColor3 = self._window._theme.TextSecondary
    self._titleLabel.Font = self._window._theme.FontRegular
    self._activeBar.Visible = false
    if self._iconLabel then
        self._iconLabel.ImageColor3 = self._window._theme.TextSecondary
    end
    self._contentContainer.Visible = false
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
    
    local sArrow = Instance.new("TextLabel")
    sArrow.Name = "Arrow"
    sArrow.Size = UDim2.new(0, 20, 1, 0)
    sArrow.Position = UDim2.new(1, -20, 0, 0)
    sArrow.BackgroundTransparency = 1
    sArrow.Text = "^"
    sArrow.TextColor3 = self._window._theme.TextSecondary
    sArrow.Font = self._window._theme.FontBold
    sArrow.TextSize = 11
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
    
    local toggleConn = sHeader.Activated:Connect(function()
        sectionObj._collapsed = not sectionObj._collapsed
        sBody.Visible = not sectionObj._collapsed
        sArrow.Text = sectionObj._collapsed and "v" or "^"
    end)
    
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

return Window
