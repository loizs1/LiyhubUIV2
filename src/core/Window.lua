local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local MarketplaceService = game:GetService("MarketplaceService")

local Window = {}
Window.__index = Window

local TabGroup = {}
TabGroup.__index = TabGroup

local Tab = {}
Tab.__index = Tab

local Section = {}
Section.__index = Section

function Window.new(options, dependencies)
    local self
    options = options or {}
    local deps = dependencies or {}
    local theme = deps.Theme
    local cleanup = deps.Cleanup
    local Layout = deps.Layout
    local Modal = deps.Modal
    local MobilePin = deps.MobilePin
    
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
    local ColorPicker = deps.ColorPicker
    if not ColorPicker then
        local cOk, cRes = pcall(function() return require(script.Parent.Parent.components.ColorPicker) end)
        ColorPicker = cOk and cRes
    end
    local IconService = deps.IconService
    if not IconService then
        local iOk, iRes = pcall(function() return require(script.Parent.Parent.services.IconService) end)
        IconService = iOk and iRes
    end
    
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
    local enableMobilePin = options.MobilePin ~= false
    local logoAsset = options.Logo or "rbxassetid://6031075936"
    local function resolveParentGui(customParent)
        if customParent then return customParent end
        local okH, h = pcall(function() return gethui and gethui() end)
        if okH and h then return h end
        if not RunService:IsStudio() then
            local okCg, cg = pcall(function() return game:GetService("CoreGui") end)
            if okCg and cg then
                local test = Instance.new("Folder")
                local pOk = pcall(function()
                    test.Parent = cg
                    test:Destroy()
                end)
                if pOk then return cg end
            end
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
    
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = defaultSize
    mainFrame.Position = options.Position or UDim2.new(0.5, -defaultSize.X.Offset / 2, 0.5, -defaultSize.Y.Offset / 2)
    mainFrame.BackgroundColor3 = theme.Background
    mainFrame.BorderSizePixel = 0
    mainFrame.ClipsDescendants = true
    mainFrame.Active = true
    mainFrame.Parent = screenGui

    local cursorUnlocker = Instance.new("TextButton")
    cursorUnlocker.Name = "CursorUnlocker"
    cursorUnlocker.Size = UDim2.fromOffset(0, 0)
    cursorUnlocker.BackgroundTransparency = 1
    cursorUnlocker.Text = ""
    cursorUnlocker.Modal = true
    cursorUnlocker.Visible = true
    cursorUnlocker.Active = false
    cursorUnlocker.Parent = mainFrame
    
    local windowScale = Instance.new("UIScale")
    windowScale.Name = "WindowScale"
    windowScale.Scale = sizePreset.Scale or 1.0
    windowScale.Parent = mainFrame

    local mainCorner = Instance.new("UICorner")
    mainCorner.CornerRadius = theme.WindowCornerRadius or theme.CornerRadius
    mainCorner.Parent = mainFrame
    
    local mainStroke = nil
    if theme.UseStrokes then
        mainStroke = Instance.new("UIStroke")
        mainStroke.Name = "WindowStroke"
        mainStroke.Color = theme.BorderWindow or Color3.fromRGB(42, 42, 50)
        mainStroke.Thickness = 1
        mainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        mainStroke.Parent = mainFrame
    end
    

    
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
    
    local logoBtn = Instance.new("TextButton")
    logoBtn.Name = "LogoButton"
    logoBtn.Size = UDim2.new(0, 26, 0, 26)
    logoBtn.Position = UDim2.new(0, 14, 0.5, -13)
    logoBtn.BackgroundTransparency = 1
    logoBtn.AutoButtonColor = false
    logoBtn.Text = ""
    logoBtn.Parent = header
    
    local logoAsset = options.Logo or theme.DefaultLogo or "rbxassetid://126257104774952"
    local logoCorner = Instance.new("UICorner")
    logoCorner.CornerRadius = UDim.new(0, 6)
    logoCorner.Parent = logoBtn

    local logoImg = Instance.new("ImageLabel")
    logoImg.Name = "LogoImage"
    logoImg.Size = UDim2.new(1, 0, 1, 0)
    logoImg.BackgroundTransparency = 1
    logoImg.Image = logoAsset
    logoImg.ScaleType = Enum.ScaleType.Fit
    logoImg.BorderSizePixel = 0
    logoImg.Active = false
    logoImg.Parent = logoBtn
    
    local logoToggleConn = logoBtn.Activated:Connect(function()
        self:ToggleSidebar()
    end)
    if cleanup then cleanup:Add(logoToggleConn) end
    
    local headerDivider = Instance.new("Frame")
    headerDivider.Name = "HeaderDivider"
    headerDivider.Size = UDim2.new(1, 0, 0, 1)
    headerDivider.Position = UDim2.new(0, 0, 1, -1)
    headerDivider.BackgroundColor3 = theme.Border
    headerDivider.BorderSizePixel = 0
    headerDivider.Parent = header
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(1, -165, 0, 18)
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
    subLabel.Size = UDim2.new(1, -165, 0, 14)
    subLabel.Position = UDim2.new(0, 46, 0, 25)
    subLabel.BackgroundTransparency = 1
    subLabel.Text = subtitleText
    subLabel.TextColor3 = theme.TextMuted
    subLabel.Font = theme.FontRegular
    subLabel.TextSize = theme.FontSizeSubtitle
    subLabel.TextXAlignment = Enum.TextXAlignment.Left
    subLabel.TextTruncate = Enum.TextTruncate.AtEnd
    subLabel.Parent = header
    
    local controlsFrame = Instance.new("Frame")
    controlsFrame.Name = "Controls"
    controlsFrame.Size = UDim2.new(0, 102, 0, 30)
    controlsFrame.Position = UDim2.new(1, -112, 0, 9)
    controlsFrame.BackgroundTransparency = 1
    controlsFrame.ZIndex = 20
    controlsFrame.Parent = mainFrame
    
    local controlsLayout = Instance.new("UIListLayout")
    controlsLayout.FillDirection = Enum.FillDirection.Horizontal
    controlsLayout.SortOrder = Enum.SortOrder.LayoutOrder
    controlsLayout.Padding = UDim.new(0, 6)
    controlsLayout.Parent = controlsFrame
    
    local controlBtnBg = Color3.fromRGB(24, 25, 32)
    local controlBtnHover = Color3.fromRGB(36, 38, 48)
    local controlIconColor = Color3.fromRGB(200, 205, 215)
    
    local themeBtn = Instance.new("TextButton")
    themeBtn.Name = "ThemeToggle"
    themeBtn.Size = UDim2.new(0, 30, 0, 30)
    themeBtn.BackgroundColor3 = controlBtnBg
    themeBtn.AutoButtonColor = false
    themeBtn.Text = ""
    themeBtn.BorderSizePixel = 0
    themeBtn.Active = true
    themeBtn.LayoutOrder = 1
    themeBtn.ZIndex = 21
    themeBtn.Parent = controlsFrame

    local themeCorner = Instance.new("UICorner")
    themeCorner.CornerRadius = UDim.new(0, 8)
    themeCorner.Parent = themeBtn

    local themeIconContainer = Instance.new("Frame")
    themeIconContainer.Name = "ThemeIcon"
    themeIconContainer.Size = UDim2.fromOffset(16, 16)
    themeIconContainer.AnchorPoint = Vector2.new(0.5, 0.5)
    themeIconContainer.Position = UDim2.new(0.5, 0, 0.5, 0)
    themeIconContainer.BackgroundTransparency = 1
    themeIconContainer.Active = false
    themeIconContainer.ZIndex = 22
    themeIconContainer.Parent = themeBtn

    local function renderThemeIcon(isDark)
        themeIconContainer:ClearAllChildren()
        if isDark then
            local moonBody = Instance.new("Frame")
            moonBody.Name = "MoonBody"
            moonBody.Size = UDim2.fromOffset(13, 13)
            moonBody.AnchorPoint = Vector2.new(0.5, 0.5)
            moonBody.Position = UDim2.new(0.5, 0, 0.5, 0)
            moonBody.BackgroundColor3 = controlIconColor
            moonBody.BorderSizePixel = 0
            moonBody.ZIndex = 22
            moonBody.Active = false
            moonBody.Parent = themeIconContainer

            local mbc = Instance.new("UICorner")
            mbc.CornerRadius = UDim.new(1, 0)
            mbc.Parent = moonBody

            local moonCutout = Instance.new("Frame")
            moonCutout.Name = "MoonCutout"
            moonCutout.Size = UDim2.fromOffset(12, 12)
            moonCutout.AnchorPoint = Vector2.new(0.5, 0.5)
            moonCutout.Position = UDim2.new(0.5, -3.5, 0.5, -2.5)
            moonCutout.BackgroundColor3 = (self and self._controlBtnBg) or themeBtn.BackgroundColor3
            moonCutout.BorderSizePixel = 0
            moonCutout.ZIndex = 23
            moonCutout.Active = false
            moonCutout.Parent = themeIconContainer

            local mcc = Instance.new("UICorner")
            mcc.CornerRadius = UDim.new(1, 0)
            mcc.Parent = moonCutout
        else
            local sunCore = Instance.new("Frame")
            sunCore.Name = "SunCore"
            sunCore.Size = UDim2.fromOffset(7, 7)
            sunCore.AnchorPoint = Vector2.new(0.5, 0.5)
            sunCore.Position = UDim2.new(0.5, 0, 0.5, 0)
            sunCore.BackgroundColor3 = Color3.fromRGB(255, 175, 20)
            sunCore.BorderSizePixel = 0
            sunCore.ZIndex = 24
            sunCore.Active = false
            sunCore.Parent = themeIconContainer

            local scc = Instance.new("UICorner")
            scc.CornerRadius = UDim.new(1, 0)
            scc.Parent = sunCore

            local sunAngles = { 0, 45, 90, 135 }
            for _, ang in ipairs(sunAngles) do
                local ray = Instance.new("Frame")
                ray.Name = "Ray"
                ray.Size = UDim2.fromOffset(15, 1.8)
                ray.AnchorPoint = Vector2.new(0.5, 0.5)
                ray.Position = UDim2.new(0.5, 0, 0.5, 0)
                ray.Rotation = ang
                ray.BackgroundColor3 = Color3.fromRGB(255, 175, 20)
                ray.BorderSizePixel = 0
                ray.ZIndex = 23
                ray.Active = false
                ray.Parent = themeIconContainer

                local rc = Instance.new("UICorner")
                rc.CornerRadius = UDim.new(1, 0)
                rc.Parent = ray
            end
        end
    end
    renderThemeIcon(true)

    local minBtn = Instance.new("TextButton")
    minBtn.Name = "Minimize"
    minBtn.LayoutOrder = 2
    minBtn.Size = UDim2.new(0, 30, 0, 30)
    minBtn.BackgroundColor3 = controlBtnBg
    minBtn.AutoButtonColor = false
    minBtn.Text = ""
    minBtn.BorderSizePixel = 0
    minBtn.Active = true
    minBtn.ZIndex = 21
    minBtn.Parent = controlsFrame
    
    local minCorner = Instance.new("UICorner")
    minCorner.CornerRadius = UDim.new(0, 8)
    minCorner.Parent = minBtn
    
    local minLine = Instance.new("Frame")
    minLine.Name = "IconLine"
    minLine.Size = UDim2.fromOffset(13, 2.5)
    minLine.AnchorPoint = Vector2.new(0.5, 0.5)
    minLine.Position = UDim2.new(0.5, 0, 0.5, 0)
    minLine.BackgroundColor3 = controlIconColor
    minLine.BorderSizePixel = 0
    minLine.ZIndex = 22
    minLine.Active = false
    minLine.Parent = minBtn
    
    local minLineCorner = Instance.new("UICorner")
    minLineCorner.CornerRadius = UDim.new(1, 0)
    minLineCorner.Parent = minLine
    
    local closeBtn = Instance.new("TextButton")
    closeBtn.Name = "Close"
    closeBtn.Size = UDim2.new(0, 30, 0, 30)
    closeBtn.LayoutOrder = 3
    closeBtn.BackgroundColor3 = controlBtnBg
    closeBtn.AutoButtonColor = false
    closeBtn.Text = ""
    closeBtn.BorderSizePixel = 0
    closeBtn.Active = true
    closeBtn.ZIndex = 21
    closeBtn.Parent = controlsFrame
    
    local closeCorner = Instance.new("UICorner")
    closeCorner.CornerRadius = UDim.new(0, 8)
    closeCorner.Parent = closeBtn
    
    local closeCrossContainer = Instance.new("Frame")
    closeCrossContainer.Name = "IconCross"
    closeCrossContainer.Size = UDim2.fromOffset(14, 14)
    closeCrossContainer.AnchorPoint = Vector2.new(0.5, 0.5)
    closeCrossContainer.Position = UDim2.new(0.5, 0, 0.5, 0)
    closeCrossContainer.BackgroundTransparency = 1
    closeCrossContainer.ZIndex = 22
    closeCrossContainer.Active = false
    closeCrossContainer.Parent = closeBtn
    
    local closeBar1 = Instance.new("Frame")
    closeBar1.Name = "Bar1"
    closeBar1.Size = UDim2.fromOffset(14, 2.5)
    closeBar1.AnchorPoint = Vector2.new(0.5, 0.5)
    closeBar1.Position = UDim2.new(0.5, 0, 0.5, 0)
    closeBar1.Rotation = 45
    closeBar1.BackgroundColor3 = controlIconColor
    closeBar1.BorderSizePixel = 0
    closeBar1.ZIndex = 22
    closeBar1.Active = false
    closeBar1.Parent = closeCrossContainer
    
    local closeBar1Corner = Instance.new("UICorner")
    closeBar1Corner.CornerRadius = UDim.new(1, 0)
    closeBar1Corner.Parent = closeBar1
    
    local closeBar2 = Instance.new("Frame")
    closeBar2.Name = "Bar2"
    closeBar2.Size = UDim2.fromOffset(14, 2.5)
    closeBar2.AnchorPoint = Vector2.new(0.5, 0.5)
    closeBar2.Position = UDim2.new(0.5, 0, 0.5, 0)
    closeBar2.Rotation = -45
    closeBar2.BackgroundColor3 = controlIconColor
    closeBar2.BorderSizePixel = 0
    closeBar2.ZIndex = 22
    closeBar2.Active = false
    closeBar2.Parent = closeCrossContainer
    
    local closeBar2Corner = Instance.new("UICorner")
    closeBar2Corner.CornerRadius = UDim.new(1, 0)
    closeBar2Corner.Parent = closeBar2
    
    local themeHovIn = themeBtn.MouseEnter:Connect(function()
        local hov = (self and self._controlBtnHover) or controlBtnHover
        TweenService:Create(themeBtn, TweenInfo.new(0.12), { BackgroundColor3 = hov }):Play()
        local mc = themeIconContainer:FindFirstChild("MoonCutout")
        if mc then
            TweenService:Create(mc, TweenInfo.new(0.12), { BackgroundColor3 = hov }):Play()
        end
    end)
    local themeHovOut = themeBtn.MouseLeave:Connect(function()
        local bg = (self and self._controlBtnBg) or controlBtnBg
        TweenService:Create(themeBtn, TweenInfo.new(0.12), { BackgroundColor3 = bg }):Play()
        local mc = themeIconContainer:FindFirstChild("MoonCutout")
        if mc then
            TweenService:Create(mc, TweenInfo.new(0.12), { BackgroundColor3 = bg }):Play()
        end
    end)
    
    local minHovIn = minBtn.MouseEnter:Connect(function()
        local hov = (self and self._controlBtnHover) or controlBtnHover
        TweenService:Create(minBtn, TweenInfo.new(0.12), { BackgroundColor3 = hov }):Play()
    end)
    local minHovOut = minBtn.MouseLeave:Connect(function()
        local bg = (self and self._controlBtnBg) or controlBtnBg
        TweenService:Create(minBtn, TweenInfo.new(0.12), { BackgroundColor3 = bg }):Play()
    end)
    local closeHovIn = closeBtn.MouseEnter:Connect(function()
        TweenService:Create(closeBtn, TweenInfo.new(0.12), { BackgroundColor3 = Color3.fromRGB(50, 24, 30) }):Play()
        closeBar1.BackgroundColor3 = Color3.fromRGB(240, 100, 110)
        closeBar2.BackgroundColor3 = Color3.fromRGB(240, 100, 110)
    end)
    local closeHovOut = closeBtn.MouseLeave:Connect(function()
        local bg = (self and self._controlBtnBg) or controlBtnBg
        local ic = (self and self._controlIconColor) or controlIconColor
        TweenService:Create(closeBtn, TweenInfo.new(0.12), { BackgroundColor3 = bg }):Play()
        closeBar1.BackgroundColor3 = ic
        closeBar2.BackgroundColor3 = ic
    end)
    if cleanup then
        cleanup:Add(themeHovIn)
        cleanup:Add(themeHovOut)
        cleanup:Add(minHovIn)
        cleanup:Add(minHovOut)
        cleanup:Add(closeHovIn)
        cleanup:Add(closeHovOut)
    end
    
    local body = Instance.new("Frame")
    body.Name = "Body"
    body.Size = UDim2.new(1, 0, 1, -48)
    body.Position = UDim2.new(0, 0, 0, 48)
    body.BackgroundTransparency = 1
    body.Parent = mainFrame
    
    local sidebar = Instance.new("Frame")
    sidebar.Name = "Sidebar"
    sidebar.Size = UDim2.new(0, 190, 1, 0)
    sidebar.BackgroundColor3 = theme.Sidebar
    sidebar.BorderSizePixel = 0
    sidebar.Parent = body
    
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
    
    local profileCard = Instance.new("TextButton")
    profileCard.Name = "ProfileCard"
    profileCard.Size = UDim2.new(1, -16, 0, 46)
    profileCard.Position = UDim2.new(0, 8, 1, -52)
    profileCard.BackgroundColor3 = theme.SidebarItem
    profileCard.AutoButtonColor = false
    profileCard.Text = ""
    profileCard.BorderSizePixel = 0
    profileCard.Active = true
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
    
    local profDisplayName = Instance.new("TextLabel")
    profDisplayName.Name = "DisplayName"
    profDisplayName.Size = UDim2.new(1, -48, 0, 16)
    profDisplayName.Position = UDim2.new(0, 45, 0, 7)
    profDisplayName.BackgroundTransparency = 1
    profDisplayName.Text = ""
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
    profUsername.Text = ""
    profUsername.TextColor3 = theme.TextSecondary
    profUsername.Font = theme.FontRegular
    profUsername.TextSize = 10
    profUsername.TextXAlignment = Enum.TextXAlignment.Left
    profUsername.TextTruncate = Enum.TextTruncate.AtEnd
    profUsername.Parent = profileCard

    local function applyRealProfile(realPlayer)
        if not realPlayer then return end
        profDisplayName.Text = realPlayer.DisplayName
        profUsername.Text = "@" .. realPlayer.Name
        task.spawn(function()
            local thumb = Players:GetUserThumbnailAsync(
                realPlayer.UserId,
                Enum.ThumbnailType.HeadShot,
                Enum.ThumbnailSize.Size100x100
            )
            if thumb and avatarImg and avatarImg.Parent then
                avatarImg.Image = thumb
            end
        end)
    end

    local realPlayer = Players.LocalPlayer or Players:GetPlayers()[1]
    if realPlayer then
        applyRealProfile(realPlayer)
    else
        local playerConn
        playerConn = Players.PlayerAdded:Connect(function(newPlayer)
            applyRealProfile(newPlayer)
            if playerConn then
                playerConn:Disconnect()
            end
        end)
        if cleanup then
            cleanup:Add(playerConn)
        end
    end
    
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
    
    self = setmetatable({
        _screenGui = screenGui,
        _mainFrame = mainFrame,
        _mainStroke = mainStroke,
        _header = header,
        _headerFlatBottom = headerFlatBottom,
        _headerDivider = headerDivider,
        _titleLabel = titleLabel,
        _subLabel = subLabel,
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
        _iconService = IconService,
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
            ColorPicker = ColorPicker,
        },
        _tabGroups = {},
        _sidebarCollapsed = false,
        _allTabs = {},
        _activeTab = nil,
        _toggleKey = toggleKey,
        _minimized = false,
        _originalSize = defaultSize,
        _destroyed = false,
        _themeBtn = themeBtn,
        _minBtn = minBtn,
        _logoBadge = logoBadge,
        _logoStroke = lbStroke,
        _closeBtn = closeBtn,
        _themeIconContainer = themeIconContainer,
        _renderThemeIcon = renderThemeIcon,
        _currentThemeMode = "Dark",
        _themeManager = deps.ThemeManager,
        _userProfileData = nil,
        _gripIcon = gripIcon,
        _controlBtnBg = controlBtnBg,
        _controlBtnHover = controlBtnHover,
        _controlIconColor = controlIconColor,
    }, Window)

    local lastProfClick = 0
    local function onProfileClicked()
        local now = os.clock()
        if now - lastProfClick < 0.2 then return end
        lastProfClick = now
        if self._userTab then
            self:_setActiveTab(self._userTab)
        else
            self:ShowProfileModal()
        end
    end
    local profConn = profileCard.Activated:Connect(onProfileClicked)
    if cleanup then
        cleanup:Add(profConn)
    end
    
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
            local activeScale = windowScale.Scale > 0 and windowScale.Scale or 1.0
            local delta = (input.Position - dragStart) / activeScale
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
    
    local lastTheme = 0
    local function doThemeToggle()
        local now = os.clock()
        if now - lastTheme < 0.2 then return end
        lastTheme = now
        self:ToggleTheme()
    end
    local themeClick = themeBtn.Activated:Connect(doThemeToggle)

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
    
    if enableMobilePin and MobilePin then
        self._mobilePin = MobilePin.new(screenGui, self, {
            Title = titleText,
            Logo = logoAsset,
            User = dispNameText,
        }, theme, cleanup)
        if self._uiScale then
            self._mobilePin:SetScale(self._uiScale.Scale)
        end
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

    local resizeMoveConn, resizeEndConn
    local resizeBegan = resizeGrip.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            if resizeMoveConn then resizeMoveConn:Disconnect(); resizeMoveConn = nil end
            if resizeEndConn then resizeEndConn:Disconnect(); resizeEndConn = nil end
            isResizing = true
            resizeStartMouse = Vector2.new(input.Position.X, input.Position.Y)
            resizeStartSize = Vector2.new(mainFrame.Size.X.Offset, mainFrame.Size.Y.Offset)
            TweenService:Create(gripIcon, TweenInfo.new(0.1), {
                ImageColor3 = Color3.fromRGB(255, 255, 255),
                ImageTransparency = 0
            }):Play()

            resizeMoveConn = UserInputService.InputChanged:Connect(function(moveInput)
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
                    local maxW = math.max(math.floor(curVp.X / activeScale) - 20, 600)
                    local maxH = math.max(math.floor(curVp.Y / activeScale) - 20, 400)
                    local newW = math.clamp(math.floor(resizeStartSize.X + delta.X), minW, maxW)
                    local newH = math.clamp(math.floor(resizeStartSize.Y + delta.Y), minH, maxH)
                    mainFrame.Size = UDim2.fromOffset(newW, newH)
                    self._originalSize = mainFrame.Size
                    if self._profileCard then
                        local isCompactH = newH < 350
                        self._profileCard.Size = isCompactH and UDim2.new(1, -16, 0, 36) or UDim2.new(1, -16, 0, 46)
                        self._profileCard.Position = isCompactH and UDim2.new(0, 8, 1, -40) or UDim2.new(0, 8, 1, -52)
                        local av = self._profileCard:FindFirstChild("Avatar")
                        if av then
                            av.Size = isCompactH and UDim2.new(0, 24, 0, 24) or UDim2.new(0, 32, 0, 32)
                            av.Position = isCompactH and UDim2.new(0, 6, 0.5, -12) or UDim2.new(0, 7, 0.5, -16)
                        end
                        local dName = self._profileCard:FindFirstChild("DisplayName")
                        local uName = self._profileCard:FindFirstChild("Username")
                        local isNarrow = newW < 560
                        if dName then
                            dName.TextSize = isNarrow and 10 or 12
                            dName.Position = isCompactH and UDim2.new(0, 36, 0, 3) or UDim2.new(0, 45, 0, 7)
                        end
                        if uName then
                            uName.TextSize = isNarrow and 8 or 10
                            uName.Position = isCompactH and UDim2.new(0, 36, 0, 18) or UDim2.new(0, 45, 0, 23)
                        end
                    end
                    if self._forceTwoColumns == nil then
                        local autoTwo = newW >= 620
                        for _, tab in ipairs(self._allTabs or {}) do
                            if tab._layoutEngine and tab._layoutEngine.SetTwoColumns then
                                tab._layoutEngine:SetTwoColumns(autoTwo)
                            end
                        end
                    end
                end
            end)

            resizeEndConn = UserInputService.InputEnded:Connect(function(endInput)
                if endInput.UserInputType == Enum.UserInputType.MouseButton1 or endInput.UserInputType == Enum.UserInputType.Touch then
                    isResizing = false
                    if resizeMoveConn then resizeMoveConn:Disconnect(); resizeMoveConn = nil end
                    if resizeEndConn then resizeEndConn:Disconnect(); resizeEndConn = nil end
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
        cleanup:Add(function()
            if resizeMoveConn then resizeMoveConn:Disconnect() end
            if resizeEndConn then resizeEndConn:Disconnect() end
        end)
    end
    
    if cleanup then
        cleanup:Add(dragBegan)
        cleanup:Add(dragChanged)
        cleanup:Add(dragUpdate)
        cleanup:Add(dragEnded)
        cleanup:Add(themeClick)
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
        local realPlayer = Players.LocalPlayer or Players:GetPlayers()[1]
        local dispNameText = realPlayer and realPlayer.DisplayName or ""
        self._mobilePin:SetUserText(dispNameText)
        if self._uiScale then
            self._mobilePin:SetScale(self._uiScale.Scale)
        end
        self._mobilePin:SetVisible(true)
        self._mobilePin:SetOpenState(false)
    end
    for _, tab in ipairs(self._allTabs or {}) do
        if tab._layoutEngine and tab._layoutEngine.UpdateForDevice then
            tab._layoutEngine:UpdateForDevice(self._currentDevice, true, self._forceTwoColumns)
        end
    end
end

function Window:Open()
    self._minimized = false
    self._mainFrame.Visible = true
    if self._mobilePin then
        self._mobilePin:SetVisible(false)
        self._mobilePin:SetOpenState(true)
    end
    for _, tab in ipairs(self._allTabs or {}) do
        if tab._layoutEngine and tab._layoutEngine.UpdateForDevice then
            tab._layoutEngine:UpdateForDevice(self._currentDevice, false, self._forceTwoColumns)
        end
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

function Window:SetSidebarCollapsed(collapsed)
    self._sidebarCollapsed = (collapsed == true)
    local sbW = self._sidebarCollapsed and 50 or (self._sizePreset and self._sizePreset.SidebarWidth or 190)
    
    if self._sidebar then
        self._sidebar.Size = UDim2.new(0, sbW, 1, 0)
    end
    if self._contentArea then
        self._contentArea.Size = UDim2.new(1, -sbW, 1, 0)
        self._contentArea.Position = UDim2.new(0, sbW, 0, 0)
    end
    if self._tabGroupsScroll then
        local p = self._tabGroupsScroll:FindFirstChildOfClass("UIPadding")
        if p then
            p.PaddingLeft = UDim.new(0, self._sidebarCollapsed and 4 or 8)
            p.PaddingRight = UDim.new(0, self._sidebarCollapsed and 4 or 8)
        end
    end
    if self._profileCard then
        self._profileCard.Size = self._sidebarCollapsed and UDim2.new(0, 36, 0, 36) or UDim2.new(1, -16, 0, 46)
        self._profileCard.Position = self._sidebarCollapsed and UDim2.new(0.5, -18, 1, -44) or UDim2.new(0, 8, 1, -52)
        local av = self._profileCard:FindFirstChild("Avatar")
        if av then
            av.Size = self._sidebarCollapsed and UDim2.new(0, 28, 0, 28) or UDim2.new(0, 32, 0, 32)
            av.Position = self._sidebarCollapsed and UDim2.new(0.5, -14, 0.5, -14) or UDim2.new(0, 7, 0.5, -16)
        end
        local dName = self._profileCard:FindFirstChild("DisplayName")
        local uName = self._profileCard:FindFirstChild("Username")
        if dName then dName.Visible = not self._sidebarCollapsed end
        if uName then uName.Visible = not self._sidebarCollapsed end
    end
    
    for _, tabGroup in ipairs(self._tabGroups or {}) do
        if tabGroup._header then
            tabGroup._header.Visible = not self._sidebarCollapsed
        end
    end
    
    for _, tab in ipairs(self._allTabs or {}) do
        if tab._button then
            tab._button.Size = self._sidebarCollapsed and UDim2.new(0, 38, 0, 38) or UDim2.new(1, 0, 0, 32)
            tab._button.Position = self._sidebarCollapsed and UDim2.new(0.5, -19, 0, 0) or UDim2.new(0, 0, 0, 0)
            local corner = tab._button:FindFirstChildOfClass("UICorner")
            if corner then
                corner.CornerRadius = UDim.new(0, self._sidebarCollapsed and 8 or 6)
            end
        end
        if tab._titleLabel then
            tab._titleLabel.Visible = not self._sidebarCollapsed
        end
        if tab._activeBar then
            tab._activeBar.Visible = (not self._sidebarCollapsed) and (self._activeTab == tab)
        end
        if tab._iconLabel then
            tab._iconLabel.Position = self._sidebarCollapsed and UDim2.new(0.5, -9, 0.5, -9) or UDim2.new(0, 10, 0.5, -9)
            tab._iconLabel.Size = self._sidebarCollapsed and UDim2.new(0, 18, 0, 18) or UDim2.new(0, 16, 0, 16)
            if self._activeTab == tab then
                tab._iconLabel.ImageColor3 = Color3.fromRGB(160, 180, 255)
            else
                tab._iconLabel.ImageColor3 = Color3.fromRGB(130, 140, 160)
            end
        end
    end
end

function Window:ToggleSidebar()
    self:SetSidebarCollapsed(not self._sidebarCollapsed)
end

function Window:SetTwoColumnsMode(enabled)
    self._forceTwoColumns = enabled
    for _, tab in ipairs(self._allTabs or {}) do
        if tab._layoutEngine and tab._layoutEngine.SetTwoColumns then
            tab._layoutEngine:SetTwoColumns(enabled)
        end
    end
    if self._layoutModeDropdown then
        self._layoutModeDropdown:SetValue(enabled and "2 Column (Kiri & Kanan)" or "1 Column (1 Baris Lurus)")
    end
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
    local dev = string.lower(preset.Name)
    local isTwoCols = (dev == "pc" or dev == "tablet")
    self:SetTwoColumnsMode(isTwoCols)
    if self._mobilePin and self._mobilePin.SetScale then
        self._mobilePin:SetScale(preset.Scale)
    end
    if self._profileCard then
        local isSmall = sbW < 180
        local dName = self._profileCard:FindFirstChild("DisplayName")
        local uName = self._profileCard:FindFirstChild("Username")
        if dName then dName.TextSize = isSmall and 10 or 12 end
        if uName then uName.TextSize = isSmall and 9 or 10 end
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

function Window:GetUserProfile()
    local realPlayer = Players.LocalPlayer or Players:GetPlayers()[1]
    if not realPlayer then
        return {
            DisplayName = "",
            Username = "",
            UserId = 0,
            AccountAge = 0,
        }
    end
    return {
        DisplayName = realPlayer.DisplayName,
        Username = "@" .. realPlayer.Name,
        UserId = realPlayer.UserId,
        AccountAge = realPlayer.AccountAge,
    }
end

function Window:ShowProfileModal()
    if self._userTab then
        self:_setActiveTab(self._userTab)
        return
    end
    local realPlayer = Players.LocalPlayer or Players:GetPlayers()[1]
    if not realPlayer then return end
    local dName = realPlayer.DisplayName
    local uName = "@" .. realPlayer.Name
    local uid = tostring(realPlayer.UserId)
    local age = tostring(realPlayer.AccountAge) .. " days"
    local isPrem = realPlayer.MembershipType == Enum.MembershipType.Premium
    local status = isPrem and "Roblox Premium" or "Standard Account"
    
    self:ShowModal({
        Title = "User Profile",
        Message = string.format("Account: %s (%s)\nUser ID: %s\nAccount Age: %s\nStatus: %s", dName, uName, uid, age, status),
        ConfirmText = "Copy User ID",
        CancelText = "Close",
        OnConfirm = function()
            local setClip = setclipboard or toclipboard or (Clipboard and Clipboard.set)
            if setClip then
                setClip(uid)
                self:Notify({ Title = "Copied", Content = "User ID copied to clipboard!", Duration = 2 })
            end
        end
    })
end

function Window:GetUniversalGroup()
    return self._universalGroup
end

function Window:GetUserProfileTab()
    return self._userTab
end

function Window:GetUserTab()
    return self._userTab
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

    local univGroupName = options.UniversalGroupName or options.UniversalTitle or "Liyhub"
    local univGroup = self:CreateTabGroup(univGroupName)
    self._universalGroup = univGroup

    local userTab = univGroup:CreateTab({
        Name = "User Profile",
        Icon = "user",
    })
    self._userTab = userTab

    local realPlayer = Players.LocalPlayer or Players:GetPlayers()[1]
    local dispName = realPlayer and realPlayer.DisplayName or "Player"
    local rawName = realPlayer and ("@" .. realPlayer.Name) or "@Unknown"
    local userIdStr = realPlayer and tostring(realPlayer.UserId) or "0"
    local accountAgeStr = realPlayer and (tostring(realPlayer.AccountAge) .. " days") or "N/A"
    local isRobloxPremium = realPlayer and (realPlayer.MembershipType == Enum.MembershipType.Premium)
    local accountStatusStr = isRobloxPremium and "Roblox Premium" or "Standard Account"

    local genv = (getgenv and getgenv()) or {}
    local drmKey = genv.LiyHubKey or _G.LiyHubKey or shared.LiyHubKey or "FREE-FOR-ALL"
    local drmTier = genv.LiyHubTier or _G.LiyHubTier or shared.LiyHubTier or (genv.LiyHubIsPremium and "VIP" or "Freemium")
    local drmRemaining = genv.LiyHubRemainingTime or (genv.LiyHubRemainingSeconds and string.format("%dh %dm", math.floor(genv.LiyHubRemainingSeconds / 3600), math.floor((genv.LiyHubRemainingSeconds % 3600) / 60))) or "Lifetime"
    local isDrmPremium = (genv.LiyHubIsPremium == true) or (_G.LiyHubIsPremium == true) or string.find(string.lower(tostring(drmTier)), "premium") ~= nil or string.find(string.lower(tostring(drmTier)), "vip") ~= nil
    local drmStatusStr = isDrmPremium and "Premium Active" or "Freemium Active"

    local executionsCount = genv.LiyHubExecutionCount or _G.LiyHubExecutionCount
    if not executionsCount then
        local trackedCount = 1
        pcall(function()
            if isfile and readfile and isfile("liyhub_executions.txt") then
                local saved = tonumber(readfile("liyhub_executions.txt"))
                if saved then
                    trackedCount = saved + 1
                end
            end
            if writefile then
                writefile("liyhub_executions.txt", tostring(trackedCount))
            end
        end)
        executionsCount = trackedCount
    end

    local function getActiveExecutorName()
        local detectedName = nil
        pcall(function()
            if identifyexecutor then
                detectedName = identifyexecutor()
            elseif getexecutorname then
                detectedName = getexecutorname()
            elseif identify_executor then
                detectedName = identify_executor()
            elseif get_executor_name then
                detectedName = get_executor_name()
            elseif syn and syn.request then
                detectedName = "Synapse X"
            elseif SENTINEL_LOADED then
                detectedName = "Sentinel"
            elseif KRNL_LOADED then
                detectedName = "Krnl"
            elseif is_sirhurt_closure then
                detectedName = "SirHurt"
            elseif fluxus then
                detectedName = "Fluxus"
            elseif delta then
                detectedName = "Delta"
            elseif arceus then
                detectedName = "Arceus X"
            elseif Codex then
                detectedName = "Codex"
            elseif is_electron_closure then
                detectedName = "Electron"
            elseif solara then
                detectedName = "Solara"
            elseif celery then
                detectedName = "Celery"
            elseif RunService:IsStudio() then
                detectedName = "Roblox Studio"
            end
        end)
        if not detectedName and genv.LiyHubExecutorName then
            detectedName = genv.LiyHubExecutorName
        end
        return detectedName or "Roblox Client"
    end
    local executorName = getActiveExecutorName()

    local activeGameName = "Experience"
    pcall(function()
        local productInfo = MarketplaceService:GetProductInfo(game.PlaceId)
        if productInfo and productInfo.Name then
            activeGameName = productInfo.Name
        end
    end)
    if activeGameName == "Experience" and game.Name and game.Name ~= "" then
        activeGameName = game.Name
    end

    local placeIdNum = tostring(game.PlaceId)
    local gameIdNum = tostring(game.GameId)
    local serverJobId = (game.JobId and game.JobId ~= "") and game.JobId or "Local Server / Studio"

    local accountSec = userTab:CreateSection("Account Identity")
    accountSec:CreateParagraph({
        Title = dispName .. " (" .. rawName .. ")",
        Content = string.format("User ID: %s\nAccount Age: %s\nRoblox Status: %s", userIdStr, accountAgeStr, accountStatusStr),
    })
    accountSec:CreateButton({
        Name = "Copy User ID",
        Desc = "Roblox Account Identifier: " .. userIdStr,
        ButtonText = "Copy",
        Callback = function()
            local copyFn = setclipboard or toclipboard or (Clipboard and Clipboard.set)
            if copyFn then
                copyFn(userIdStr)
                self:Notify({
                    Title = "Copied",
                    Content = "User ID copied to clipboard!",
                    Duration = 2,
                })
            end
        end,
    })

    local drmSec = userTab:CreateSection("DRM License & Security")
    drmSec:CreateParagraph({
        Title = "Tier: " .. tostring(drmTier) .. " (" .. drmStatusStr .. ")",
        Content = string.format("License Key: %s\nValid Time: %s\nTotal Executions: %s", tostring(drmKey), tostring(drmRemaining), tostring(executionsCount) .. (tonumber(executionsCount) == 1 and " execution" or " executions")),
    })
    drmSec:CreateButton({
        Name = "Copy License Key",
        Desc = tostring(drmKey),
        ButtonText = "Copy",
        Callback = function()
            local copyFn = setclipboard or toclipboard or (Clipboard and Clipboard.set)
            if copyFn then
                copyFn(tostring(drmKey))
                self:Notify({
                    Title = "Copied",
                    Content = "License key copied to clipboard!",
                    Duration = 2,
                })
            end
        end,
    })

    local envSec = userTab:CreateSection("Game & Environment")
    envSec:CreateParagraph({
        Title = activeGameName,
        Content = string.format("Executor: %s\nPlace ID: %s\nUniverse ID: %s\nJob ID: %s", tostring(executorName), placeIdNum, gameIdNum, serverJobId),
    })
    envSec:CreateButton({
        Name = "Copy Server Job ID",
        Desc = serverJobId,
        ButtonText = "Copy",
        Callback = function()
            local copyFn = setclipboard or toclipboard or (Clipboard and Clipboard.set)
            if copyFn then
                copyFn(serverJobId)
                self:Notify({
                    Title = "Copied",
                    Content = "Server Job ID copied to clipboard!",
                    Duration = 2,
                })
            end
        end,
    })

    local infoTab = univGroup:CreateTab({
        Name = "Information",
        Icon = "info",
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
        Icon = "settings",
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
    local layoutModeDropdown = devSec:CreateDropdown({
        Name = "Layout Structure Mode",
        Options = { "2 Column (Kiri & Kanan)", "1 Column (1 Baris Lurus)" },
        Default = (self._currentDevice == "Android") and "1 Column (1 Baris Lurus)" or "2 Column (Kiri & Kanan)",
        Callback = function(choice)
            local isTwo = string.find(choice, "2") ~= nil
            self:SetTwoColumnsMode(isTwo)
            self:Notify({
                Title = "Layout Mode",
                Content = isTwo and "Struktur diubah ke 2 Kolom (Kiri & Kanan)" or "Struktur diubah ke 1 Kolom (1 Baris Lurus)",
                Duration = 2,
            })
        end
    })
    self._layoutModeDropdown = layoutModeDropdown
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
        _header = gHeader,
        _tabsFrame = tabsFrame,
        _arrow = gArrow,
        _collapsed = false,
        _tabs = {},
    }, TabGroup)
    if self._tabGroups then
        table.insert(self._tabGroups, tabGroupObj)
    end
    
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

function Window:ToggleTheme()
    if self._currentThemeMode == "Light" then
        self:SetTheme("Dark")
    else
        self:SetTheme("Light")
    end
end

function Window:SetTheme(themeNameOrTable)
    local ThemeManager = self._themeManager
    if not ThemeManager then
        local okTM, resTM = pcall(function() return require(script.Parent.Parent.themes.ThemeManager) end)
        ThemeManager = okTM and resTM
    end

    local targetTheme = nil
    local targetMode = "Dark"

    if type(themeNameOrTable) == "string" then
        local lower = string.lower(themeNameOrTable)
        if lower == "light" or lower == "pure white" or (string.find(lower, "white") and not string.find(lower, "black")) then
            targetMode = "Light"
            targetTheme = ThemeManager and ThemeManager.Themes["Pure White"]
        else
            targetMode = "Dark"
            targetTheme = ThemeManager and ThemeManager.Themes["Pure Black & White"]
        end
    elseif type(themeNameOrTable) == "table" then
        targetTheme = themeNameOrTable
        local nameLower = targetTheme.Name and string.lower(targetTheme.Name) or ""
        targetMode = (targetTheme.IsLight == true or nameLower == "pure white" or (string.find(nameLower, "white") and not string.find(nameLower, "black"))) and "Light" or "Dark"
    end

    if not targetTheme and ThemeManager then
        targetTheme = ThemeManager:GetTheme()
    end
    if not targetTheme then return end

    self._theme = targetTheme
    self._currentThemeMode = targetMode

    local isDark = (targetMode == "Dark")
    local btnBg = isDark and Color3.fromRGB(24, 25, 32) or Color3.fromRGB(235, 238, 244)
    local btnHov = isDark and Color3.fromRGB(36, 38, 48) or Color3.fromRGB(222, 226, 234)
    local iconCol = isDark and Color3.fromRGB(200, 205, 215) or Color3.fromRGB(45, 50, 60)

    self._controlBtnBg = btnBg
    self._controlBtnHover = btnHov
    self._controlIconColor = iconCol

    TweenService:Create(self._mainFrame, TweenInfo.new(0.2), { BackgroundColor3 = targetTheme.Background }):Play()
    if self._mainStroke then
        TweenService:Create(self._mainStroke, TweenInfo.new(0.2), { Color = targetTheme.BorderWindow }):Play()
    end
    if self._header then
        TweenService:Create(self._header, TweenInfo.new(0.2), { BackgroundColor3 = targetTheme.Header }):Play()
    end
    if self._headerFlatBottom then
        self._headerFlatBottom.BackgroundColor3 = targetTheme.Header
    end
    if self._headerDivider then
        self._headerDivider.BackgroundColor3 = targetTheme.Border
    end
    if self._titleLabel then
        self._titleLabel.TextColor3 = targetTheme.TextPrimary
    end
    if self._subLabel then
        self._subLabel.TextColor3 = targetTheme.TextMuted
    end
    if self._sidebar then
        TweenService:Create(self._sidebar, TweenInfo.new(0.2), { BackgroundColor3 = targetTheme.Sidebar }):Play()
    end
    if self._sidebarStroke then
        TweenService:Create(self._sidebarStroke, TweenInfo.new(0.2), { Color = targetTheme.Border }):Play()
    end
    if self._contentArea then
        self._contentArea.BackgroundColor3 = targetTheme.Background
    end
    if self._profileCard then
        TweenService:Create(self._profileCard, TweenInfo.new(0.2), { BackgroundColor3 = targetTheme.SidebarItem }):Play()
        local dName = self._profileCard:FindFirstChild("DisplayName")
        local uName = self._profileCard:FindFirstChild("Username")
        if dName then dName.TextColor3 = targetTheme.TextPrimary end
        if uName then uName.TextColor3 = targetTheme.TextMuted end
        local pStroke = self._profileCard:FindFirstChildOfClass("UIStroke")
        if pStroke then pStroke.Color = targetTheme.Border end
        local av = self._profileCard:FindFirstChild("Avatar")
        if av then av.BackgroundColor3 = targetTheme.Header end
    end

    if self._themeBtn then
        self._themeBtn.BackgroundColor3 = btnBg
    end
    if self._logoBadge then
        self._logoBadge.BackgroundColor3 = isDark and Color3.fromRGB(20, 22, 28) or Color3.fromRGB(240, 243, 248)
    end
    if self._logoStroke then
        self._logoStroke.Color = isDark and Color3.fromRGB(36, 40, 50) or Color3.fromRGB(218, 222, 230)
    end
    if self._minBtn then
        self._minBtn.BackgroundColor3 = btnBg
        local line = self._minBtn:FindFirstChild("IconLine")
        if line then line.BackgroundColor3 = iconCol end
    end
    if self._closeBtn then
        self._closeBtn.BackgroundColor3 = btnBg
        local cross = self._closeBtn:FindFirstChild("IconCross")
        if cross then
            local b1 = cross:FindFirstChild("Bar1")
            local b2 = cross:FindFirstChild("Bar2")
            if b1 then b1.BackgroundColor3 = iconCol end
            if b2 then b2.BackgroundColor3 = iconCol end
        end
    end

    if self._renderThemeIcon then
        self._renderThemeIcon(isDark)
    end

    if self._gripIcon then
        self._gripIcon.ImageColor3 = isDark and Color3.fromRGB(140, 155, 180) or Color3.fromRGB(80, 90, 110)
    end

    for _, tabGroup in ipairs(self._tabGroups or {}) do
        if tabGroup._header then
            local gTitle = tabGroup._header:FindFirstChild("Title")
            if gTitle then gTitle.TextColor3 = targetTheme.TextMuted end
            local gArrow = tabGroup._header:FindFirstChild("Arrow")
            if gArrow then gArrow.ImageColor3 = targetTheme.TextMuted end
        end
    end

    for _, tab in ipairs(self._allTabs or {}) do
        if tab == self._activeTab then
            tab:_activate()
        else
            tab:_deactivate()
        end
        if tab._contentContainer then
            tab._contentContainer.BackgroundColor3 = targetTheme.Background
        end
        for _, section in ipairs(tab._sections or {}) do
            self:_applyThemeToSection(section, targetTheme, isDark)
        end
        for _, banner in ipairs(tab._banners or {}) do
            self:_applyThemeToBanner(banner, targetTheme, isDark)
        end
    end
end

function Window:_applyThemeToBanner(banner, targetTheme, isDark)
    if not banner or not banner._container then return end
    banner._container.BackgroundColor3 = targetTheme.Card
    local stroke = banner._container:FindFirstChildOfClass("UIStroke")
    if stroke then
        stroke.Color = targetTheme.Border
    end
    local header = banner._container:FindFirstChild("Header")
    if header then
        local title = header:FindFirstChild("Title")
        if title then
            title.TextColor3 = targetTheme.TextPrimary
        end
        local arrow = header:FindFirstChild("Arrow")
        if arrow then
            arrow.ImageColor3 = targetTheme.TextMuted
        end
    end
    local contentBox = banner._container:FindFirstChild("ContentBox")
    if contentBox then
        local imgFrame = contentBox:FindFirstChild("ImageFrame")
        if imgFrame then
            imgFrame.BackgroundColor3 = targetTheme.Header
        end
        local textContainer = contentBox:FindFirstChild("TextContainer")
        if textContainer then
            local desc = textContainer:FindFirstChild("Description")
            if desc then
                desc.TextColor3 = targetTheme.TextSecondary
            end
        end
    end
end

function Window:_applyThemeToSection(section, targetTheme, isDark)
    if not section then return end
    if section._container then
        section._container.BackgroundColor3 = targetTheme.Card
        local secStroke = section._container:FindFirstChildOfClass("UIStroke")
        if secStroke then
            secStroke.Color = targetTheme.Border
        end
    end
    if section._title then
        section._title.TextColor3 = targetTheme.TextPrimary
    end
    if section._arrow then
        section._arrow.ImageColor3 = targetTheme.TextSecondary
    end
    if section._icon then
        section._icon.ImageColor3 = targetTheme.TextPrimary
    end
    for _, comp in ipairs(section._components or {}) do
        self:_applyThemeToComponent(comp, targetTheme, isDark)
    end
    if section._body then
        self:_walkAndThemeDescendants(section._body, targetTheme, isDark)
    end
end

function Window:_applyThemeToComponent(comp, targetTheme, isDark)
    if not comp or type(comp) ~= "table" then return end
    comp._theme = targetTheme
    
    if comp._container and comp._container.Name == "Banner" then
        self:_applyThemeToBanner(comp, targetTheme, isDark)
        return
    end
    if comp._container then
        local c = comp._container
        if c:IsA("GuiObject") then
            if comp._isPrimary then
                c.BackgroundColor3 = isDark and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(20, 22, 26)
            elseif comp._isPrimary == false or c.Name:find("ActionRow_") or c.Name:find("Paragraph_") or c.Name:find("Toggle_") or c.Name:find("Slider_") or c.Name:find("Input_") or c.Name:find("Keybind_") or c.Name:find("Button_") then
                c.BackgroundColor3 = targetTheme.Element
            end
        end
        local cStroke = c:FindFirstChildOfClass("UIStroke")
        if cStroke then
            cStroke.Color = targetTheme.Border
        end
    end

    if comp._actionBtn then
        comp._actionBtn.BackgroundColor3 = isDark and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(18, 20, 24)
        comp._actionBtn.TextColor3 = isDark and Color3.fromRGB(14, 14, 16) or Color3.fromRGB(255, 255, 255)
    end

    if comp._label and comp._container and comp._container:IsA("TextButton") then
        if not isDark then
            comp._container.BackgroundColor3 = Color3.fromRGB(18, 20, 24)
            comp._label.TextColor3 = Color3.fromRGB(255, 255, 255)
            local st = comp._container:FindFirstChildOfClass("UIStroke")
            if st then st.Enabled = false end
        else
            local isPri = comp._isPrimary
            comp._container.BackgroundColor3 = isPri and Color3.fromRGB(255, 255, 255) or targetTheme.Element
            comp._label.TextColor3 = isPri and Color3.fromRGB(14, 14, 16) or targetTheme.TextPrimary
            local st = comp._container:FindFirstChildOfClass("UIStroke")
            if st then
                st.Enabled = not isPri
                st.Color = targetTheme.Border
            end
        end
    end

    if comp._titleLabel then
        comp._titleLabel.TextColor3 = targetTheme.TextPrimary
    end

    if comp._contentLabel then
        comp._contentLabel.TextColor3 = targetTheme.TextSecondary
    end

    if comp._switch then
        local active = comp._state == true
        comp._switch.BackgroundColor3 = active and targetTheme.ToggleActive or targetTheme.ToggleInactive
        if comp._switchStroke then
            comp._switchStroke.Color = active and targetTheme.ToggleActive or targetTheme.ToggleBorderInactive
        end
        if comp._knob then
            comp._knob.BackgroundColor3 = active and targetTheme.ToggleKnob or targetTheme.ToggleKnobInactive
        end
    end

    if comp._track then
        comp._track.BackgroundColor3 = isDark and Color3.fromRGB(20, 22, 30) or Color3.fromRGB(222, 226, 234)
        if comp._trackStroke then
            comp._trackStroke.Color = isDark and Color3.fromRGB(36, 40, 56) or Color3.fromRGB(205, 210, 220)
        end
        if comp._fill then
            comp._fill.BackgroundColor3 = targetTheme.SliderFill
        end
        local valLabel = comp._track:FindFirstChild("Value")
        if valLabel then
            valLabel.TextColor3 = targetTheme.TextPrimary
        end
    end

    if comp._boxBg then
        comp._boxBg.BackgroundColor3 = targetTheme.Card
        local bStroke = comp._boxBg:FindFirstChildOfClass("UIStroke")
        if bStroke then
            bStroke.Color = targetTheme.Border
        end
    end
    if comp._textBox then
        comp._textBox.TextColor3 = targetTheme.TextPrimary
        comp._textBox.PlaceholderColor3 = targetTheme.TextMuted
    end

    if comp._selectBox then
        comp._selectBox.BackgroundColor3 = targetTheme.Element
        local sbStroke = comp._selectBox:FindFirstChildOfClass("UIStroke")
        if sbStroke then
            sbStroke.Color = targetTheme.Border
        end
        if comp._selectionLabel then
            comp._selectionLabel.TextColor3 = targetTheme.TextSecondary
        end
        if comp._chevron then
            comp._chevron.ImageColor3 = targetTheme.TextMuted
        end
    end
    if comp._listContainer then
        comp._listContainer.BackgroundColor3 = targetTheme.Card
        local lcStroke = comp._listContainer:FindFirstChildOfClass("UIStroke")
        if lcStroke then
            lcStroke.Color = targetTheme.Border
        end
    end

    if comp._keyButton then
        comp._keyButton.BackgroundColor3 = targetTheme.Card
        comp._keyButton.TextColor3 = targetTheme.TextPrimary
        local kbStroke = comp._keyButton:FindFirstChildOfClass("UIStroke")
        if kbStroke then
            kbStroke.Color = targetTheme.Border
        end
    end

    if comp._items then
        for _, item in ipairs(comp._items) do
            self:_applyThemeToComponent(item, targetTheme, isDark)
        end
    end

    if comp._buttons then
        for _, btn in ipairs(comp._buttons) do
            self:_applyThemeToComponent(btn, targetTheme, isDark)
        end
    end
end

function Window:_walkAndThemeDescendants(rootInstance, targetTheme, isDark)
    if not rootInstance then return end
    for _, desc in ipairs(rootInstance:GetDescendants()) do
        if desc.Name == "Banner" and desc:IsA("Frame") then
            desc.BackgroundColor3 = targetTheme.Card
            local s = desc:FindFirstChildOfClass("UIStroke")
            if s then s.Color = targetTheme.Border end
        end
        if desc:IsA("UIStroke") then
            if desc.Name == "BorderStroke" or desc.Name == "SectionStroke" or desc.Name == "ProfileStroke" then
                desc.Color = targetTheme.Border
            end
        elseif desc:IsA("TextButton") and (desc.Name:find("Button_") or desc.Name == "ActionButton") then
            if not isDark then
                desc.BackgroundColor3 = Color3.fromRGB(18, 20, 24)
                if desc.Name == "ActionButton" then
                    desc.TextColor3 = Color3.fromRGB(255, 255, 255)
                end
                local st = desc:FindFirstChildOfClass("UIStroke")
                if st then st.Enabled = false end
            else
                desc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                if desc.Name == "ActionButton" then
                    desc.TextColor3 = Color3.fromRGB(14, 14, 16)
                end
                local st = desc:FindFirstChildOfClass("UIStroke")
                if st then st.Enabled = false end
            end
        elseif desc:IsA("TextLabel") then
            if desc.Name == "Label" and desc.Parent and desc.Parent:IsA("TextButton") and desc.Parent.Name:find("Button_") then
                desc.TextColor3 = not isDark and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(14, 14, 16)
            elseif desc.Name == "Title" or desc.Name == "Name" or desc.Name == "DisplayName" then
                desc.TextColor3 = targetTheme.TextPrimary
            elseif desc.Name == "Description" or desc.Name == "Desc" or desc.Name == "Content" or desc.Name == "Username" or desc.Name == "Subtitle" then
                desc.TextColor3 = targetTheme.TextSecondary
            elseif desc.Name == "SelectionLabel" then
                desc.TextColor3 = targetTheme.TextSecondary
            end
        elseif desc:IsA("ImageLabel") then
            if desc.Name == "Arrow" or desc.Name == "Chevron" then
                desc.ImageColor3 = targetTheme.TextMuted
            end
        end
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

function TabGroup:CreateTab(options)
    local name = type(options) == "table" and (options.Name or options.Text) or tostring(options)
    local iconId = type(options) == "table" and (options.Icon or options.Image) or nil
    local devName = string.lower(self._window._currentDevice or "pc")
    local defaultTwoCols = (devName == "pc" or devName == "tablet")
    local twoColumns = defaultTwoCols
    if type(options) == "table" and options.TwoColumns ~= nil then
        twoColumns = options.TwoColumns
    end
    
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

    local tabStroke = Instance.new("UIStroke")
    tabStroke.Name = "ActiveStroke"
    tabStroke.Color = self._window._theme.Border
    tabStroke.Thickness = 1
    tabStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    tabStroke.Enabled = false
    tabStroke.Parent = tabBtn
    
    local iconLabel = nil
    local labelOffset = 10
    if iconId then
        iconLabel = Instance.new("ImageLabel")
        iconLabel.Name = "Icon"
        iconLabel.Size = UDim2.new(0, 18, 0, 18)
        iconLabel.Position = UDim2.new(0, 10, 0.5, -9)
        iconLabel.BackgroundTransparency = 1
        iconLabel.ScaleType = Enum.ScaleType.Fit
        iconLabel.Parent = tabBtn
        local iconService = self._window._iconService
        if iconService and iconService.Apply then
            iconService.Apply(iconLabel, iconId, Color3.fromRGB(130, 140, 160))
        else
            iconLabel.Image = tostring(iconId)
            iconLabel.ImageColor3 = Color3.fromRGB(130, 140, 160)
        end
        labelOffset = 34
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
        _banners = {},
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
    if self._window._allTabs then
        table.insert(self._window._allTabs, tabObj)
    end
    
    if not self._window._activeTab then
        self._window:_setActiveTab(tabObj)
    end
    
    return tabObj
end

function Tab:_activate()
    local curTheme = self._window._theme
    local isDark = (self._window._currentThemeMode ~= "Light")
    self._button.BackgroundTransparency = 0
    self._button.BackgroundColor3 = isDark and Color3.fromRGB(28, 28, 34) or Color3.fromRGB(255, 255, 255)
    local aStroke = self._button:FindFirstChild("ActiveStroke")
    if aStroke then
        aStroke.Enabled = not isDark
        aStroke.Color = curTheme.Border
    end
    self._titleLabel.TextColor3 = curTheme.TextPrimary
    self._titleLabel.Font = curTheme.FontBold
    self._activeBar.Visible = not self._window._sidebarCollapsed
    self._activeBar.BackgroundColor3 = isDark and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(20, 22, 26)
    if self._iconLabel then
        self._iconLabel.ImageColor3 = isDark and Color3.fromRGB(180, 200, 255) or Color3.fromRGB(20, 22, 26)
    end
    self._contentContainer.Visible = true
end

function Tab:_deactivate()
    local curTheme = self._window._theme
    local isDark = (self._window._currentThemeMode ~= "Light")
    self._button.BackgroundTransparency = 1
    local aStroke = self._button:FindFirstChild("ActiveStroke")
    if aStroke then
        aStroke.Enabled = false
    end
    self._titleLabel.TextColor3 = curTheme.TextMuted
    self._titleLabel.Font = curTheme.FontRegular
    self._activeBar.Visible = false
    if self._iconLabel then
        self._iconLabel.ImageColor3 = isDark and Color3.fromRGB(130, 140, 160) or Color3.fromRGB(130, 136, 148)
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
    if banner and banner._container then
        if self._layoutEngine and self._layoutEngine.RegisterSectionInstance then
            self._layoutEngine:RegisterSectionInstance(banner._container)
        end
    end
    if self._banners then
        table.insert(self._banners, banner)
    end
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
    if self._layoutEngine and self._layoutEngine.RegisterSectionInstance then
        self._layoutEngine:RegisterSectionInstance(sectionCard)
    end
    
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
    
    local sHeader = Instance.new("TextButton")
    sHeader.Name = "Header"
    sHeader.Size = UDim2.new(1, 0, 0, 22)
    sHeader.BackgroundTransparency = 1
    sHeader.AutoButtonColor = false
    sHeader.Text = ""
    sHeader.Parent = sectionCard
    
    local secOffset = 0
    local secIcon = sectionOptions.Icon or sectionOptions.Image
    local sImg = nil
    if secIcon then
        local iconService = self._window._iconService
        sImg = Instance.new("ImageLabel")
        sImg.Name = "SectionIcon"
        sImg.Size = UDim2.fromOffset(14, 14)
        sImg.Position = UDim2.new(0, 0, 0.5, -7)
        sImg.BackgroundTransparency = 1
        sImg.ScaleType = Enum.ScaleType.Fit
        sImg.Parent = sHeader
        if iconService and iconService.Apply then
            iconService.Apply(sImg, secIcon, self._window._theme.TextPrimary)
        else
            sImg.Image = tostring(secIcon)
            sImg.ImageColor3 = self._window._theme.TextPrimary
        end
        secOffset = 20
    end
    
    local sTitle = Instance.new("TextLabel")
    sTitle.Name = "Title"
    sTitle.Size = UDim2.new(1, -24 - secOffset, 1, 0)
    sTitle.Position = UDim2.new(0, secOffset, 0, 0)
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
        _header = sHeader,
        _title = sTitle,
        _arrow = sArrow,
        _icon = sImg,
        _body = sBody,
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

local Row = {}
Row.__index = Row

function Row.new(parent, theme, cleanup, components)
    local rowFrame = Instance.new("Frame")
    rowFrame.Name = "Row"
    rowFrame.Size = UDim2.new(1, 0, 0, theme.SmallElementHeight or 34)
    rowFrame.BackgroundTransparency = 1
    rowFrame.BorderSizePixel = 0
    rowFrame.Parent = parent

    local rList = Instance.new("UIListLayout")
    rList.FillDirection = Enum.FillDirection.Horizontal
    rList.SortOrder = Enum.SortOrder.LayoutOrder
    rList.Padding = UDim.new(0, 6)
    rList.Parent = rowFrame

    local self = setmetatable({
        _container = rowFrame,
        _theme = theme,
        _cleanup = cleanup,
        _components = components,
        _items = {},
    }, Row)

    if cleanup then
        cleanup:Add(rowFrame)
    end

    return self
end

function Row:_rebalance()
    local count = #self._items
    if count == 0 then return end
    local gapTotal = (count - 1) * 6
    local widthScale = 1 / count
    for _, item in ipairs(self._items) do
        local target = item._container or item
        if target and target:IsA("GuiObject") then
            target.Size = UDim2.new(widthScale, -math.floor(gapTotal / count), 1, 0)
        end
    end
end

function Row:AddToggle(options)
    local tog = self._components.Toggle.new(self._container, options, self._theme, self._cleanup)
    table.insert(self._items, tog)
    self:_rebalance()
    return tog
end

function Row:AddKeybind(options)
    local key = self._components.Keybind.new(self._container, options, self._theme, self._cleanup)
    table.insert(self._items, key)
    self:_rebalance()
    return key
end

function Row:AddButton(options)
    local btn = self._components.Button.new(self._container, options, self._theme, self._cleanup)
    table.insert(self._items, btn)
    self:_rebalance()
    return btn
end

function Row:AddSlider(options)
    local sld = self._components.Slider.new(self._container, options, self._theme, self._cleanup)
    table.insert(self._items, sld)
    self:_rebalance()
    return sld
end

function Row:AddDropdown(options)
    local drp = self._components.Dropdown.new(self._container, options, self._theme, self._cleanup)
    table.insert(self._items, drp)
    self:_rebalance()
    return drp
end

function Row:AddInput(options)
    local inp = self._components.Input.new(self._container, options, self._theme, self._cleanup)
    table.insert(self._items, inp)
    self:_rebalance()
    return inp
end
Row.AddTextbox = Row.AddInput

function Row:AddColorPicker(options)
    local cp = self._components.ColorPicker.new(self._container, options, self._theme, self._cleanup)
    table.insert(self._items, cp)
    self:_rebalance()
    return cp
end

function Row:Destroy()
    if self._container then
        self._container:Destroy()
        self._container = nil
    end
end

local Label = {}
Label.__index = Label

function Label.new(parent, options, theme, cleanup, section)
    local text = type(options) == "table" and (options.Text or options.Name or options.Title or "") or tostring(options or "")
    local desc = type(options) == "table" and (options.Desc or options.Description) or nil
    
    local container = Instance.new("Frame")
    container.Name = "LabelCard"
    container.Size = UDim2.new(1, 0, 0, desc and 38 or 26)
    container.BackgroundColor3 = theme.Element
    container.BorderSizePixel = 0
    container.Parent = parent
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = theme.SmallCornerRadius or UDim.new(0, 5)
    corner.Parent = container

    if theme.UseStrokes then
        local stroke = Instance.new("UIStroke")
        stroke.Name = "BorderStroke"
        stroke.Color = theme.BorderSubtle or theme.Border
        stroke.Thickness = 1
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Parent = container
    end

    local mainLbl = Instance.new("TextLabel")
    mainLbl.Name = "Text"
    mainLbl.Size = UDim2.new(1, -16, 0, desc and 18 or 26)
    mainLbl.Position = UDim2.new(0, 10, 0, desc and 3 or 0)
    mainLbl.BackgroundTransparency = 1
    mainLbl.Text = text
    mainLbl.TextColor3 = theme.TextPrimary
    mainLbl.Font = theme.FontRegular
    mainLbl.TextSize = 11
    mainLbl.TextXAlignment = Enum.TextXAlignment.Left
    mainLbl.TextTruncate = Enum.TextTruncate.AtEnd
    mainLbl.Parent = container

    local descLbl = nil
    if desc then
        descLbl = Instance.new("TextLabel")
        descLbl.Name = "Desc"
        descLbl.Size = UDim2.new(1, -16, 0, 14)
        descLbl.Position = UDim2.new(0, 10, 0, 20)
        descLbl.BackgroundTransparency = 1
        descLbl.Text = desc
        descLbl.TextColor3 = theme.TextMuted
        descLbl.Font = theme.FontRegular
        descLbl.TextSize = 10
        descLbl.TextXAlignment = Enum.TextXAlignment.Left
        descLbl.TextTruncate = Enum.TextTruncate.AtEnd
        descLbl.Parent = container
    end

    local self = setmetatable({
        _container = container,
        _mainLbl = mainLbl,
        _descLbl = descLbl,
        _theme = theme,
        _section = section,
    }, Label)

    if cleanup then
        cleanup:Add(container)
    end

    return self
end

function Label:SetText(newText)
    self._mainLbl.Text = tostring(newText or "")
end
Label.Set = Label.SetText

function Label:GetText()
    return self._mainLbl.Text
end

function Label:AddToggle(opt)
    return self._section and self._section:CreateToggle(opt)
end

function Label:AddDropdown(opt)
    return self._section and self._section:CreateDropdown(opt)
end

function Label:AddSlider(opt)
    return self._section and self._section:CreateSlider(opt)
end

function Label:AddButton(opt)
    return self._section and self._section:CreateButton(opt)
end

function Label:AddKeybind(opt)
    return self._section and self._section:CreateKeybind(opt)
end

function Label:AddInput(opt)
    return self._section and self._section:CreateInput(opt)
end
Label.AddTextbox = Label.AddInput

function Label:Destroy()
    if self._container then
        self._container:Destroy()
        self._container = nil
    end
end

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

function Section:CreateColorPicker(options)
    local cp = self._window._components.ColorPicker.new(
        self._body,
        options,
        self._window._theme,
        self._window._cleanup
    )
    table.insert(self._components, cp)
    return cp
end

function Section:CreateRow()
    local row = Row.new(self._body, self._window._theme, self._window._cleanup, self._window._components)
    table.insert(self._components, row)
    return row
end

function Section:CreateLabel(optionsOrText)
    local lbl = Label.new(self._body, optionsOrText, self._window._theme, self._window._cleanup, self)
    table.insert(self._components, lbl)
    return lbl
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
Section.AddColorPicker = Section.CreateColorPicker
Section.AddRow = Section.CreateRow
Section.AddLabel = Section.CreateLabel
Section.AddTextbox = Section.CreateInput
Section.CreateTextbox = Section.CreateInput

return Window
