--[[
    LiyHub UI - Progression Component
    A visual step workflow with step nodes, connection lines, status badges,
    step navigation buttons, and step-specific content containers.
]]

local TweenService = game:GetService("TweenService")

local Progression = {}
Progression.__index = Progression

-- Common Builder / Lucide icon asset IDs or symbol fallbacks
local DEFAULT_STEP_ICONS = {
    [1] = "rbxassetid://6031075931", -- Home
    [2] = "rbxassetid://6031075929", -- User
    [3] = "rbxassetid://6031094678", -- Check / Target
    [4] = "rbxassetid://6031091004", -- Play / Swords
    [5] = "rbxassetid://6031075936", -- Reward / Star
}

function Progression.new(parent, options, theme, cleanup)
    options = options or {}
    local titleText = options.Title or options.Name or "Progression"
    local subtitleText = options.Subtitle or "Step workflow progression"
    local steps = options.Steps or {
        { Label = "Step 1" },
        { Label = "Step 2" },
        { Label = "Step 3" },
    }
    local initialStep = math.clamp(options.CurrentStep or options.Default or 1, 1, #steps)
    local onStepChanged = options.OnStepChanged or options.Callback or function() end
    
    local container = Instance.new("Frame")
    container.Name = "Progression_" .. titleText
    container.Size = UDim2.new(1, 0, 0, 0)
    container.AutomaticSize = Enum.AutomaticSize.Y
    container.BackgroundColor3 = theme.Card
    container.BorderSizePixel = 0
    container.Parent = parent
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = theme.CornerRadius
    corner.Parent = container
    
    local padding = Instance.new("UIPadding")
    padding.PaddingTop = UDim.new(0, 12)
    padding.PaddingBottom = UDim.new(0, 12)
    padding.PaddingLeft = UDim.new(0, 14)
    padding.PaddingRight = UDim.new(0, 14)
    padding.Parent = container
    
    local list = Instance.new("UIListLayout")
    list.SortOrder = Enum.SortOrder.LayoutOrder
    list.Padding = UDim.new(0, 10)
    list.Parent = container
    
    -- Title & Subtitle
    local headerFrame = Instance.new("Frame")
    headerFrame.Name = "Header"
    headerFrame.Size = UDim2.new(1, 0, 0, 36)
    headerFrame.BackgroundTransparency = 1
    headerFrame.Parent = container
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(1, 0, 0, 20)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = titleText
    titleLabel.TextColor3 = theme.TextPrimary
    titleLabel.Font = theme.FontBold
    titleLabel.TextSize = theme.FontSizeRegular
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = headerFrame
    
    local subLabel = Instance.new("TextLabel")
    subLabel.Name = "Subtitle"
    subLabel.Size = UDim2.new(1, 0, 0, 16)
    subLabel.Position = UDim2.new(0, 0, 0, 20)
    subLabel.BackgroundTransparency = 1
    subLabel.Text = subtitleText
    subLabel.TextColor3 = theme.TextSecondary
    subLabel.Font = theme.FontRegular
    subLabel.TextSize = theme.FontSizeSmall
    subLabel.TextXAlignment = Enum.TextXAlignment.Left
    subLabel.Parent = headerFrame
    
    -- Stepper Line Container
    local stepperFrame = Instance.new("Frame")
    stepperFrame.Name = "StepperFrame"
    stepperFrame.Size = UDim2.new(1, 0, 0, 56)
    stepperFrame.BackgroundTransparency = 1
    stepperFrame.Parent = container
    
    -- Stepper Nodes and Connectors
    local nodeElements = {}
    local lineElements = {}
    local stepCount = #steps
    
    -- Background track lines between nodes
    for i = 1, stepCount - 1 do
        local line = Instance.new("Frame")
        line.Name = "Line_" .. i
        line.BorderSizePixel = 0
        line.BackgroundColor3 = theme.AccentStepInactive
        line.Parent = stepperFrame
        table.insert(lineElements, line)
    end
    
    -- Node circles and labels
    for i, stepInfo in ipairs(steps) do
        local stepLabelText = type(stepInfo) == "table" and (stepInfo.Label or stepInfo.Name) or tostring(stepInfo)
        local stepIcon = type(stepInfo) == "table" and stepInfo.Icon or DEFAULT_STEP_ICONS[i]
        
        local nodeFrame = Instance.new("Frame")
        nodeFrame.Name = "Node_" .. i
        nodeFrame.Size = UDim2.new(0, 32, 0, 32)
        nodeFrame.BackgroundTransparency = 1
        nodeFrame.Parent = stepperFrame
        
        local circle = Instance.new("TextButton")
        circle.Name = "Circle"
        circle.Size = UDim2.new(0, 30, 0, 30)
        circle.Position = UDim2.new(0.5, -15, 0, 0)
        circle.BackgroundColor3 = theme.AccentStepInactive
        circle.AutoButtonColor = false
        circle.Text = ""
        circle.BorderSizePixel = 0
        circle.Parent = nodeFrame
        
        local cCorner = Instance.new("UICorner")
        cCorner.CornerRadius = UDim.new(1, 0)
        cCorner.Parent = circle
        
        local icon = Instance.new("ImageLabel")
        icon.Name = "Icon"
        icon.Size = UDim2.new(0, 16, 0, 16)
        icon.Position = UDim2.new(0.5, -8, 0.5, -8)
        icon.BackgroundTransparency = 1
        icon.Image = stepIcon or ""
        icon.ImageColor3 = theme.TextPrimary
        icon.Parent = circle
        
        -- Text fallback if image not loaded
        local numText = Instance.new("TextLabel")
        numText.Name = "Number"
        numText.Size = UDim2.new(1, 0, 1, 0)
        numText.BackgroundTransparency = 1
        numText.Text = (stepIcon and #stepIcon > 0) and "" or tostring(i)
        numText.TextColor3 = theme.TextPrimary
        numText.Font = theme.FontBold
        numText.TextSize = 12
        numText.Parent = circle
        
        local label = Instance.new("TextLabel")
        label.Name = "Label"
        label.Size = UDim2.new(0, 70, 0, 16)
        label.Position = UDim2.new(0.5, -35, 0, 34)
        label.BackgroundTransparency = 1
        label.Text = stepLabelText
        label.TextColor3 = theme.TextMuted
        label.Font = theme.FontRegular
        label.TextSize = 10
        label.TextXAlignment = Enum.TextXAlignment.Center
        label.Parent = nodeFrame
        
        table.insert(nodeElements, {
            Frame = nodeFrame,
            Circle = circle,
            Icon = icon,
            Label = label,
        })
    end
    
    -- Buttons Frame: Next Step & Prev Step
    local buttonRow = Instance.new("Frame")
    buttonRow.Name = "ButtonRow"
    buttonRow.Size = UDim2.new(1, 0, 0, 34)
    buttonRow.BackgroundTransparency = 1
    buttonRow.Parent = container
    
    local btnLayout = Instance.new("UIListLayout")
    btnLayout.FillDirection = Enum.FillDirection.Horizontal
    btnLayout.SortOrder = Enum.SortOrder.LayoutOrder
    btnLayout.Padding = UDim.new(0, 8)
    btnLayout.Parent = buttonRow
    
    local nextBtn = Instance.new("TextButton")
    nextBtn.Name = "NextStepButton"
    nextBtn.Size = UDim2.new(0.5, -4, 1, 0)
    nextBtn.BackgroundColor3 = theme.Element
    nextBtn.AutoButtonColor = false
    nextBtn.Text = options.NextText or "Next Step (Maju)"
    nextBtn.TextColor3 = theme.TextPrimary
    nextBtn.Font = theme.FontBold
    nextBtn.TextSize = theme.FontSizeSmall
    nextBtn.BorderSizePixel = 0
    nextBtn.Parent = buttonRow
    
    local nextCorner = Instance.new("UICorner")
    nextCorner.CornerRadius = theme.SmallCornerRadius
    nextCorner.Parent = nextBtn
    
    local prevBtn = Instance.new("TextButton")
    prevBtn.Name = "PrevStepButton"
    prevBtn.Size = UDim2.new(0.5, -4, 1, 0)
    prevBtn.BackgroundColor3 = theme.Element
    prevBtn.AutoButtonColor = false
    prevBtn.Text = options.PrevText or "Prev Step (Mundur)"
    prevBtn.TextColor3 = theme.TextPrimary
    prevBtn.Font = theme.FontBold
    prevBtn.TextSize = theme.FontSizeSmall
    prevBtn.BorderSizePixel = 0
    prevBtn.Parent = buttonRow
    
    local prevCorner = Instance.new("UICorner")
    prevCorner.CornerRadius = theme.SmallCornerRadius
    prevCorner.Parent = prevBtn
    
    local self = setmetatable({
        _container = container,
        _titleLabel = titleLabel,
        _subLabel = subLabel,
        _stepperFrame = stepperFrame,
        _nodeElements = nodeElements,
        _lineElements = lineElements,
        _nextBtn = nextBtn,
        _prevBtn = prevBtn,
        _theme = theme,
        _steps = steps,
        _currentStep = initialStep,
        _onStepChanged = onStepChanged,
    }, Progression)
    
    local function layoutNodes()
        local count = #nodeElements
        if count == 0 then return end
        
        for i, node in ipairs(nodeElements) do
            local xRatio = (count == 1) and 0.5 or ((i - 1) / (count - 1))
            node.Frame.Position = UDim2.new(xRatio, -16, 0, 0)
            
            -- Position connection line to next node
            if i < count and lineElements[i] then
                local nextXRatio = i / (count - 1)
                lineElements[i].Position = UDim2.new(xRatio, 16, 0, 14)
                lineElements[i].Size = UDim2.new(nextXRatio - xRatio, -32, 0, 3)
            end
        end
    end
    layoutNodes()
    
    -- Node click handlers
    for i, node in ipairs(nodeElements) do
        local conn = node.Circle.Activated:Connect(function()
            self:SetStep(i, true)
        end)
        if cleanup then cleanup:Add(conn) end
    end
    
    -- Next / Prev button events
    local nextConn = nextBtn.Activated:Connect(function()
        self:NextStep()
    end)
    local prevConn = prevBtn.Activated:Connect(function()
        self:PrevStep()
    end)
    
    if cleanup then
        cleanup:Add(nextConn)
        cleanup:Add(prevConn)
        cleanup:Add(container)
    end
    
    self:SetStep(initialStep, false)
    return self
end

function Progression:GetStep()
    return self._currentStep
end

function Progression:GetValue()
    return self._currentStep
end

function Progression:SetStep(stepIndex, fireCallback)
    stepIndex = math.clamp(stepIndex, 1, #self._steps)
    self._currentStep = stepIndex
    
    for i, node in ipairs(self._nodeElements) do
        if i <= stepIndex then
            -- Active or Completed
            node.Circle.BackgroundColor3 = self._theme.AccentStep
            node.Icon.ImageColor3 = Color3.fromRGB(255, 255, 255)
            node.Label.TextColor3 = (i == stepIndex) and self._theme.AccentStep or self._theme.TextPrimary
        else
            -- Inactive
            node.Circle.BackgroundColor3 = self._theme.AccentStepInactive
            node.Icon.ImageColor3 = self._theme.TextMuted
            node.Label.TextColor3 = self._theme.TextMuted
        end
    end
    
    for i, line in ipairs(self._lineElements) do
        if i < stepIndex then
            line.BackgroundColor3 = self._theme.AccentStep
        else
            line.BackgroundColor3 = self._theme.AccentStepInactive
        end
    end
    
    if fireCallback ~= false then
        task.spawn(self._onStepChanged, self._currentStep, self._steps[self._currentStep])
    end
end

function Progression:SetValue(stepIndex, fireCallback)
    self:SetStep(stepIndex, fireCallback)
end

function Progression:NextStep()
    if self._currentStep < #self._steps then
        self:SetStep(self._currentStep + 1, true)
    end
end

function Progression:PrevStep()
    if self._currentStep > 1 then
        self:SetStep(self._currentStep - 1, true)
    end
end

function Progression:Destroy()
    if self._container then
        self._container:Destroy()
        self._container = nil
    end
end

return Progression

