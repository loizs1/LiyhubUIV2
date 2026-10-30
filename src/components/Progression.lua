local TweenService = game:GetService("TweenService")

local Progression = {}
Progression.__index = Progression

local DEFAULT_STEP_ICONS = {
    [1] = "rbxassetid://6031075931",
    [2] = "rbxassetid://6031075929",
    [3] = "rbxassetid://6031094678",
    [4] = "rbxassetid://6031091004",
    [5] = "rbxassetid://6031075936",
}

function Progression.new(parent, options, theme, cleanup)
    options = options or {}
    local titleText = options.Title or options.Name or "Progression"
    local subtitleText = options.Subtitle or "Step workflow progression"
    local steps = options.Steps or {
        { Label = "Accept" },
        { Label = "Teleport" },
        { Label = "Farm" },
        { Label = "Boss" },
        { Label = "Reward" },
    }
    local initialStep = math.clamp(options.CurrentStep or options.Default or 1, 1, #steps)
    local onStepChanged = options.OnStepChanged or options.Callback or function() end
    
    local container = Instance.new("Frame")
    container.Name = "Progression_" .. titleText
    container.Size = UDim2.new(1, 0, 0, 0)
    container.AutomaticSize = Enum.AutomaticSize.Y
    container.BackgroundColor3 = theme.Card
    container.BorderSizePixel = 0
    container.ClipsDescendants = true
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
    list.Padding = UDim.new(0, 8)
    list.Parent = container
    
    local headerFrame = Instance.new("Frame")
    headerFrame.Name = "Header"
    headerFrame.Size = UDim2.new(1, 0, 0, 32)
    headerFrame.BackgroundTransparency = 1
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
    stepperFrame.Size = UDim2.new(1, 0, 0, 52)
    stepperFrame.BackgroundTransparency = 1
    stepperFrame.Parent = container
    
    local margin = 32
    local lineBg = Instance.new("Frame")
    lineBg.Name = "LineBg"
    lineBg.AnchorPoint = Vector2.new(0, 0.5)
    lineBg.Size = UDim2.new(1, -margin * 2, 0, 2)
    lineBg.Position = UDim2.new(0, margin, 0, 14)
    lineBg.BackgroundColor3 = theme.SliderTrack
    lineBg.BorderSizePixel = 0
    lineBg.ZIndex = 1
    lineBg.Parent = stepperFrame
    
    local stepNodes = {}
    local numSteps = #steps
    
    for i, stepData in ipairs(steps) do
        local t = numSteps > 1 and ((i - 1) / (numSteps - 1)) or 0.5
        local xOffset = math.floor((1 - 2 * t) * margin)
        
        local nodeBtn = Instance.new("TextButton")
        nodeBtn.Name = "Node_" .. tostring(i)
        nodeBtn.AnchorPoint = Vector2.new(0.5, 0.5)
        nodeBtn.Size = UDim2.new(0, 28, 0, 28)
        nodeBtn.Position = UDim2.new(t, xOffset, 0, 14)
        nodeBtn.BackgroundColor3 = (i == initialStep) and theme.AccentStep or theme.SliderTrack
        nodeBtn.AutoButtonColor = false
        nodeBtn.Text = ""
        nodeBtn.BorderSizePixel = 0
        nodeBtn.Active = true
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
        icon.Image = stepData.Icon or DEFAULT_STEP_ICONS[i] or DEFAULT_STEP_ICONS[1]
        icon.ImageColor3 = (i == initialStep) and Color3.fromRGB(255, 255, 255) or theme.TextMuted
        icon.Active = false
        icon.ZIndex = 3
        icon.Parent = nodeBtn
        
        local stepLbl = Instance.new("TextLabel")
        stepLbl.Name = "Label"
        stepLbl.AnchorPoint = Vector2.new(0.5, 0)
        stepLbl.Size = UDim2.new(0, 60, 0, 14)
        stepLbl.Position = UDim2.new(t, xOffset, 0, 32)
        stepLbl.TextTruncate = Enum.TextTruncate.AtEnd
        stepLbl.BackgroundTransparency = 1
        stepLbl.Text = stepData.Label or ("Step " .. tostring(i))
        stepLbl.TextColor3 = (i == initialStep) and theme.AccentStep or theme.TextMuted
        stepLbl.Font = (i == initialStep) and theme.FontBold or theme.FontRegular
        stepLbl.TextSize = 10
        stepLbl.TextXAlignment = Enum.TextXAlignment.Center
        stepLbl.Active = false
        stepLbl.ZIndex = 2
        stepLbl.Parent = stepperFrame
        
        stepNodes[i] = {
            Button = nodeBtn,
            Icon = icon,
            Label = stepLbl,
        }
    end
    
    local self = setmetatable({
        _container = container,
        _stepNodes = stepNodes,
        _currentStep = initialStep,
        _steps = steps,
        _theme = theme,
        _callback = onStepChanged,
    }, Progression)
    
    local lastStep = 0
    for i, node in ipairs(stepNodes) do
        local function clickStep()
            local now = os.clock()
            if now - lastStep < 0.1 then return end
            lastStep = now
            self:SetStep(i)
        end
        local conn = node.Button.Activated:Connect(clickStep)
        if cleanup then
            cleanup:Add(conn)
        end
    end
    
    if cleanup then cleanup:Add(container) end
    return self
end

function Progression:SetStep(stepIndex)
    self._currentStep = math.clamp(stepIndex, 1, #self._steps)
    for i, node in ipairs(self._stepNodes) do
        local isActive = (i == self._currentStep)
        local targetColor = isActive and self._theme.AccentStep or self._theme.SliderTrack
        local targetIconColor = isActive and Color3.fromRGB(255, 255, 255) or self._theme.TextMuted
        local targetLabelColor = isActive and self._theme.AccentStep or self._theme.TextMuted
        
        TweenService:Create(node.Button, TweenInfo.new(self._theme.AnimationFast), {
            BackgroundColor3 = targetColor
        }):Play()
        node.Icon.ImageColor3 = targetIconColor
        node.Label.TextColor3 = targetLabelColor
        node.Label.Font = isActive and self._theme.FontBold or self._theme.FontRegular
    end
    task.spawn(self._callback, self._currentStep)
end

function Progression:GetStep()
    return self._currentStep
end

function Progression:Destroy()
    if self._container then
        self._container:Destroy()
    end
end

return Progression
