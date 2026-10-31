local TweenService = game:GetService("TweenService")

local IconService = nil
pcall(function()
    IconService = _require("src/services/IconService")
end)
if not IconService then
    pcall(function()
        IconService = require(script.Parent.Parent.services.IconService)
    end)
end

local Progression = {}
Progression.__index = Progression

function Progression.new(parent, options, theme, cleanup, componentRegistry)
    options = options or {}
    local titleText = options.Title or options.Name or "Progression"
    local subtitleText = options.Subtitle or options.SubTitle or "Step workflow progression"
    local steps = options.Steps or {
        { Name = "Accept", Icon = "check" },
        { Name = "Teleport", Icon = "teleport" },
        { Name = "Farm", Icon = "swords" },
        { Name = "Boss", Icon = "shield" },
        { Name = "Reward", Icon = "zap" },
    }
    local initialStep = math.clamp(options.CurrentStep or options.Default or 1, 1, #steps)
    local onStepChanged = options.Callback or options.OnStepChanged or function() end
    local accentColor = options.AccentColor or theme.AccentStep or Color3.fromRGB(0, 162, 255)
    local hasControls = options.Controls == true
    local nextText = options.NextText or "Next"
    local prevText = options.PrevText or "Previous"
    
    local container = Instance.new("Frame")
    container.Name = "Progression_" .. titleText
    container.Size = UDim2.new(1, 0, 0, 0)
    container.AutomaticSize = Enum.AutomaticSize.Y
    container.BackgroundColor3 = theme.Card
    container.BorderSizePixel = 0
    container.ClipsDescendants = false
    container.Parent = parent
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = theme.CornerRadius
    corner.Parent = container
    
    if theme.UseStrokes then
        local stroke = Instance.new("UIStroke")
        stroke.Name = "BorderStroke"
        stroke.Color = theme.Border
        stroke.Thickness = 1
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Parent = container
    end
    
    local padding = Instance.new("UIPadding")
    padding.PaddingTop = UDim.new(0, 10)
    padding.PaddingBottom = UDim.new(0, 12)
    padding.PaddingLeft = UDim.new(0, 12)
    padding.PaddingRight = UDim.new(0, 12)
    padding.Parent = container
    
    local list = Instance.new("UIListLayout")
    list.SortOrder = Enum.SortOrder.LayoutOrder
    list.Padding = UDim.new(0, 10)
    list.Parent = container
    
    local headerFrame = Instance.new("Frame")
    headerFrame.Name = "Header"
    headerFrame.Size = UDim2.new(1, 0, 0, 32)
    headerFrame.BackgroundTransparency = 1
    headerFrame.LayoutOrder = 1
    headerFrame.Parent = container
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(1, 0, 0, 16)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = titleText
    titleLabel.TextColor3 = theme.TextPrimary
    titleLabel.Font = theme.FontBold
    titleLabel.TextSize = theme.FontSizeRegular
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Active = false
    titleLabel.Parent = headerFrame
    
    local subLabel = Instance.new("TextLabel")
    subLabel.Name = "Subtitle"
    subLabel.Size = UDim2.new(1, 0, 0, 14)
    subLabel.Position = UDim2.new(0, 0, 0, 17)
    subLabel.BackgroundTransparency = 1
    subLabel.Text = subtitleText
    subLabel.TextColor3 = theme.TextMuted
    subLabel.Font = theme.FontRegular
    subLabel.TextSize = theme.FontSizeSmall
    subLabel.TextXAlignment = Enum.TextXAlignment.Left
    subLabel.Active = false
    subLabel.Parent = headerFrame
    
    local stepperFrame = Instance.new("Frame")
    stepperFrame.Name = "Stepper"
    stepperFrame.Size = UDim2.new(1, 0, 0, 48)
    stepperFrame.BackgroundTransparency = 1
    stepperFrame.LayoutOrder = 2
    stepperFrame.Parent = container
    
    local numSteps = math.max(1, #steps)
    local lineBg = Instance.new("Frame")
    lineBg.Name = "LineBg"
    lineBg.AnchorPoint = Vector2.new(0, 0.5)
    lineBg.Size = UDim2.new((numSteps - 1) / numSteps, 0, 0, 2)
    lineBg.Position = UDim2.new(0.5 / numSteps, 0, 0, 13)
    lineBg.BackgroundColor3 = theme.SliderTrack
    lineBg.BorderSizePixel = 0
    lineBg.ZIndex = 1
    lineBg.Parent = stepperFrame

    local initRel = numSteps > 1 and ((initialStep - 1) / (numSteps - 1)) or 0
    local lineFill = Instance.new("Frame")
    lineFill.Name = "LineFill"
    lineFill.AnchorPoint = Vector2.new(0, 0.5)
    lineFill.Position = UDim2.new(0.5 / numSteps, 0, 0, 13)
    lineFill.Size = UDim2.new(initRel * ((numSteps - 1) / numSteps), 0, 0, 2)
    lineFill.BackgroundColor3 = accentColor
    lineFill.BorderSizePixel = 0
    lineFill.ZIndex = 1
    lineFill.Parent = stepperFrame
    
    local stepNodes = {}
    
    for i, stepData in ipairs(steps) do
        local nodeBtn = Instance.new("TextButton")
        nodeBtn.Name = "Node_" .. tostring(i)
        nodeBtn.AnchorPoint = Vector2.new(0.5, 0.5)
        nodeBtn.Size = UDim2.new(0, 26, 0, 26)
        nodeBtn.Position = UDim2.new((i - 0.5) / numSteps, 0, 0, 13)
        nodeBtn.BackgroundColor3 = (i == initialStep) and accentColor or ((i < initialStep) and Color3.fromRGB(35, 75, 125) or theme.SliderTrack)
        nodeBtn.AutoButtonColor = false
        nodeBtn.Text = ""
        nodeBtn.BorderSizePixel = 0
        nodeBtn.ZIndex = 2
        nodeBtn.Parent = stepperFrame
        
        local nbCorner = Instance.new("UICorner")
        nbCorner.CornerRadius = UDim.new(1, 0)
        nbCorner.Parent = nodeBtn
        
        local icon = Instance.new("ImageLabel")
        icon.Name = "Icon"
        icon.Size = UDim2.new(0, 14, 0, 14)
        icon.Position = UDim2.new(0.5, -7, 0.5, -7)
        icon.BackgroundTransparency = 1
        icon.ScaleType = Enum.ScaleType.Fit
        icon.Active = false
        icon.ZIndex = 3
        icon.Parent = nodeBtn

        local rawIcon = stepData.Icon or stepData.icon or "check"
        local initColor = (i <= initialStep) and Color3.fromRGB(255, 255, 255) or theme.TextMuted
        if IconService and IconService.Apply then
            IconService.Apply(icon, rawIcon, initColor)
        else
            icon.Image = tostring(rawIcon)
            icon.ImageColor3 = initColor
        end
        
        local stepLbl = Instance.new("TextButton")
        stepLbl.Name = "Label"
        stepLbl.AnchorPoint = Vector2.new(0.5, 0)
        stepLbl.Size = UDim2.new(1 / numSteps, -4, 0, 16)
        stepLbl.Position = UDim2.new((i - 0.5) / numSteps, 0, 0, 29)
        stepLbl.BackgroundTransparency = 1
        stepLbl.AutoButtonColor = false
        stepLbl.Text = stepData.Name or stepData.Label or ("Step " .. tostring(i))
        stepLbl.TextColor3 = (i == initialStep) and accentColor or theme.TextMuted
        stepLbl.Font = (i == initialStep) and theme.FontBold or theme.FontRegular
        stepLbl.TextSize = 10
        stepLbl.TextXAlignment = Enum.TextXAlignment.Center
        stepLbl.TextTruncate = Enum.TextTruncate.None
        stepLbl.Active = true
        stepLbl.ZIndex = 5
        stepLbl.Parent = stepperFrame
        
        stepNodes[i] = {
            Button = nodeBtn,
            Icon = icon,
            IconName = rawIcon,
            Label = stepLbl,
            Data = stepData,
        }
    end
    
    local controlsFrame = nil
    if hasControls then
        controlsFrame = Instance.new("Frame")
        controlsFrame.Name = "Controls"
        controlsFrame.Size = UDim2.new(1, 0, 0, 28)
        controlsFrame.BackgroundTransparency = 1
        controlsFrame.LayoutOrder = 3
        controlsFrame.Parent = container
        
        local cLayout = Instance.new("UIListLayout")
        cLayout.FillDirection = Enum.FillDirection.Horizontal
        cLayout.SortOrder = Enum.SortOrder.LayoutOrder
        cLayout.Padding = UDim.new(0, 8)
        cLayout.Parent = controlsFrame
        
        local prevBtn = Instance.new("TextButton")
        prevBtn.Name = "PrevButton"
        prevBtn.Size = UDim2.new(0.5, -4, 1, 0)
        prevBtn.BackgroundColor3 = (theme.IsLight ~= true and theme.Name ~= "Pure White") and Color3.fromRGB(22, 22, 27) or Color3.fromRGB(236, 238, 243)
        prevBtn.Text = prevText
        prevBtn.TextColor3 = (theme.IsLight ~= true and theme.Name ~= "Pure White") and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(18, 20, 24)
        prevBtn.Font = theme.FontBold
        prevBtn.TextSize = theme.FontSizeSmall
        prevBtn.AutoButtonColor = false
        prevBtn.Parent = controlsFrame
        
        local pCorner = Instance.new("UICorner")
        pCorner.CornerRadius = theme.SmallCornerRadius or UDim.new(0, 4)
        pCorner.Parent = prevBtn
        
        local pStroke = Instance.new("UIStroke")
        pStroke.Name = "ButtonStroke"
        pStroke.Color = (theme.IsLight ~= true and theme.Name ~= "Pure White") and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(18, 20, 24)
        pStroke.Thickness = 1
        pStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        pStroke.Parent = prevBtn
        
        local nextBtn = Instance.new("TextButton")
        nextBtn.Name = "NextButton"
        nextBtn.Size = UDim2.new(0.5, -4, 1, 0)
        nextBtn.BackgroundColor3 = (theme.IsLight ~= true and theme.Name ~= "Pure White") and Color3.fromRGB(22, 22, 27) or Color3.fromRGB(236, 238, 243)
        nextBtn.Text = nextText
        nextBtn.TextColor3 = (theme.IsLight ~= true and theme.Name ~= "Pure White") and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(18, 20, 24)
        nextBtn.Font = theme.FontBold
        nextBtn.TextSize = theme.FontSizeSmall
        nextBtn.AutoButtonColor = false
        nextBtn.Parent = controlsFrame
        
        local nCorner = Instance.new("UICorner")
        nCorner.CornerRadius = theme.SmallCornerRadius or UDim.new(0, 4)
        nCorner.Parent = nextBtn
        
        local nStroke = Instance.new("UIStroke")
        nStroke.Name = "ButtonStroke"
        nStroke.Color = (theme.IsLight ~= true and theme.Name ~= "Pure White") and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(18, 20, 24)
        nStroke.Thickness = 1
        nStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        nStroke.Parent = nextBtn
    end
    
    local nestedContainer = Instance.new("Frame")
    nestedContainer.Name = "NestedContent"
    nestedContainer.Size = UDim2.new(1, 0, 0, 0)
    nestedContainer.AutomaticSize = Enum.AutomaticSize.Y
    nestedContainer.BackgroundTransparency = 1
    nestedContainer.LayoutOrder = 4
    nestedContainer.Parent = container
    
    local nestedList = Instance.new("UIListLayout")
    nestedList.SortOrder = Enum.SortOrder.LayoutOrder
    nestedList.Padding = UDim.new(0, 6)
    nestedList.Parent = nestedContainer
    
    local self = setmetatable({
        _container = container,
        _nestedContainer = nestedContainer,
        _stepNodes = stepNodes,
        _currentStep = initialStep,
        _steps = steps,
        _theme = theme,
        _accentColor = accentColor,
        _lineFill = lineFill,
        _numSteps = numSteps,
        _callback = onStepChanged,
        _components = componentRegistry or {},
        _cleanup = cleanup,
        _conns = {},
    }, Progression)
    
    local lastStep = 0
    for i, node in ipairs(stepNodes) do
        local function clickStep()
            local now = os.clock()
            if now - lastStep < 0.1 then return end
            lastStep = now
            self:SetStep(i)
        end
        local connBtn = node.Button.Activated:Connect(clickStep)
        local connLbl = node.Label.Activated:Connect(clickStep)
        table.insert(self._conns, connBtn)
        table.insert(self._conns, connLbl)
        if cleanup then
            cleanup:Add(connBtn)
            cleanup:Add(connLbl)
        end
    end
    
    if controlsFrame then
        local prevBtn = controlsFrame:FindFirstChild("PrevButton")
        local nextBtn = controlsFrame:FindFirstChild("NextButton")
        if prevBtn then
            local prevConn = prevBtn.Activated:Connect(function()
                self:Previous()
            end)
            table.insert(self._conns, prevConn)
            if cleanup then cleanup:Add(prevConn) end
        end
        if nextBtn then
            local nextConn = nextBtn.Activated:Connect(function()
                self:Next()
            end)
            table.insert(self._conns, nextConn)
            if cleanup then cleanup:Add(nextConn) end
        end
    end
    
    if cleanup then cleanup:Add(container) end
    return self
end

function Progression:SetStep(stepIndex)
    self._currentStep = math.clamp(stepIndex, 1, #self._steps)
    local numSteps = self._numSteps
    local progressRel = numSteps > 1 and ((self._currentStep - 1) / (numSteps - 1)) or 0
    if self._lineFill then
        TweenService:Create(self._lineFill, TweenInfo.new(self._theme.AnimationFast), {
            Size = UDim2.new(progressRel * ((numSteps - 1) / numSteps), 0, 0, 2)
        }):Play()
    end

    for i, node in ipairs(self._stepNodes) do
        local isActive = (i == self._currentStep)
        local isCompleted = (i < self._currentStep)
        local targetColor = isActive and self._accentColor or (isCompleted and Color3.fromRGB(35, 75, 125) or self._theme.SliderTrack)
        local targetIconColor = (isActive or isCompleted) and Color3.fromRGB(255, 255, 255) or self._theme.TextMuted
        local targetLabelColor = isActive and self._accentColor or (isCompleted and Color3.fromRGB(180, 205, 235) or self._theme.TextMuted)
        
        TweenService:Create(node.Button, TweenInfo.new(self._theme.AnimationFast), {
            BackgroundColor3 = targetColor
        }):Play()
        if IconService and IconService.Apply then
            IconService.Apply(node.Icon, node.IconName or "check", targetIconColor)
        else
            node.Icon.ImageColor3 = targetIconColor
        end
        node.Label.TextColor3 = targetLabelColor
        node.Label.Font = isActive and self._theme.FontBold or self._theme.FontRegular
    end
    task.spawn(self._callback, self._currentStep, self._steps[self._currentStep])
end

function Progression:Next()
    if self._currentStep < #self._steps then
        self:SetStep(self._currentStep + 1)
    end
end

function Progression:Previous()
    if self._currentStep > 1 then
        self:SetStep(self._currentStep - 1)
    end
end

function Progression:GetStep()
    return self._currentStep
end

function Progression:CreateToggle(options)
    local toggleCtor = self._components.Toggle
    if not toggleCtor then
        pcall(function() toggleCtor = _require("src/components/Toggle") end)
    end
    if toggleCtor then
        return toggleCtor.new(self._nestedContainer, options, self._theme, self._cleanup)
    end
    return nil
end

function Progression:CreateDropdown(options)
    local dropdownCtor = self._components.Dropdown
    if not dropdownCtor then
        pcall(function() dropdownCtor = _require("src/components/Dropdown") end)
    end
    if dropdownCtor then
        return dropdownCtor.new(self._nestedContainer, options, self._theme, self._cleanup)
    end
    return nil
end

function Progression:CreateSlider(options)
    local sliderCtor = self._components.Slider
    if not sliderCtor then
        pcall(function() sliderCtor = _require("src/components/Slider") end)
    end
    if sliderCtor then
        return sliderCtor.new(self._nestedContainer, options, self._theme, self._cleanup)
    end
    return nil
end

function Progression:CreateButton(options)
    local buttonCtor = self._components.Button
    if not buttonCtor then
        pcall(function() buttonCtor = _require("src/components/Button") end)
    end
    if buttonCtor then
        return buttonCtor.new(self._nestedContainer, options, self._theme, self._cleanup)
    end
    return nil
end

function Progression:CreateInput(options)
    local inputCtor = self._components.Input
    if not inputCtor then
        pcall(function() inputCtor = _require("src/components/Input") end)
    end
    if inputCtor then
        return inputCtor.new(self._nestedContainer, options, self._theme, self._cleanup)
    end
    return nil
end

function Progression:Destroy()
    if self._conns then
        for _, c in ipairs(self._conns) do
            if c and c.Connected then c:Disconnect() end
        end
        self._conns = {}
    end
    if self._container then
        self._container:Destroy()
        self._container = nil
    end
end

return Progression
