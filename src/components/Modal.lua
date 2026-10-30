--[[
    LiyHub UI - Modal & Notification Component
    Provides interactive confirmation modals and floating toast notifications.
]]

local TweenService = game:GetService("TweenService")

local Modal = {}

function Modal.ShowConfirmation(parentScreenGui, options, theme, cleanup)
    options = options or {}
    local title = options.Title or "Confirmation"
    local message = options.Message or options.Text or "Are you sure you want to proceed?"
    local confirmText = options.ConfirmText or "Confirm"
    local cancelText = options.CancelText or "Cancel"
    local onConfirm = options.OnConfirm or function() end
    local onCancel = options.OnCancel or function() end
    
    local overlay = Instance.new("TextButton")
    overlay.Name = "ModalOverlay"
    overlay.Size = UDim2.new(1, 0, 1, 0)
    overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    overlay.BackgroundTransparency = 1
    overlay.AutoButtonColor = false
    overlay.Text = ""
    overlay.ZIndex = 100
    overlay.Parent = parentScreenGui
    
    local dialog = Instance.new("Frame")
    dialog.Name = "Dialog"
    dialog.Size = UDim2.new(0, 320, 0, 160)
    dialog.Position = UDim2.new(0.5, -160, 0.5, -80)
    dialog.BackgroundColor3 = theme.Header
    dialog.BorderSizePixel = 0
    dialog.ZIndex = 101
    dialog.Parent = overlay
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = theme.CornerRadius
    corner.Parent = dialog
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(1, -24, 0, 24)
    titleLabel.Position = UDim2.new(0, 12, 0, 12)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = theme.TextPrimary
    titleLabel.Font = theme.FontBold
    titleLabel.TextSize = theme.FontSizeTitle
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.ZIndex = 102
    titleLabel.Parent = dialog
    
    local msgLabel = Instance.new("TextLabel")
    msgLabel.Name = "Message"
    msgLabel.Size = UDim2.new(1, -24, 0, 60)
    msgLabel.Position = UDim2.new(0, 12, 0, 40)
    msgLabel.BackgroundTransparency = 1
    msgLabel.Text = message
    msgLabel.TextColor3 = theme.TextSecondary
    msgLabel.Font = theme.FontRegular
    msgLabel.TextSize = theme.FontSizeRegular
    msgLabel.TextXAlignment = Enum.TextXAlignment.Left
    msgLabel.TextYAlignment = Enum.TextYAlignment.Top
    msgLabel.TextWrapped = true
    msgLabel.ZIndex = 102
    msgLabel.Parent = dialog
    
    local btnRow = Instance.new("Frame")
    btnRow.Name = "Buttons"
    btnRow.Size = UDim2.new(1, -24, 0, 32)
    btnRow.Position = UDim2.new(0, 12, 1, -44)
    btnRow.BackgroundTransparency = 1
    btnRow.ZIndex = 102
    btnRow.Parent = dialog
    
    local btnLayout = Instance.new("UIListLayout")
    btnLayout.FillDirection = Enum.FillDirection.Horizontal
    btnLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
    btnLayout.Padding = UDim.new(0, 8)
    btnLayout.Parent = btnRow
    
    local cancelBtn = Instance.new("TextButton")
    cancelBtn.Name = "CancelButton"
    cancelBtn.Size = UDim2.new(0, 90, 1, 0)
    cancelBtn.BackgroundColor3 = theme.Element
    cancelBtn.AutoButtonColor = false
    cancelBtn.Text = cancelText
    cancelBtn.TextColor3 = theme.TextSecondary
    cancelBtn.Font = theme.FontBold
    cancelBtn.TextSize = theme.FontSizeSmall
    cancelBtn.BorderSizePixel = 0
    cancelBtn.ZIndex = 103
    cancelBtn.Parent = btnRow
    
    local cCorner = Instance.new("UICorner")
    cCorner.CornerRadius = theme.SmallCornerRadius
    cCorner.Parent = cancelBtn
    
    local confirmBtn = Instance.new("TextButton")
    confirmBtn.Name = "ConfirmButton"
    confirmBtn.Size = UDim2.new(0, 90, 1, 0)
    confirmBtn.BackgroundColor3 = theme.ElementActive
    confirmBtn.AutoButtonColor = false
    confirmBtn.Text = confirmText
    confirmBtn.TextColor3 = theme.TextPrimary
    confirmBtn.Font = theme.FontBold
    confirmBtn.TextSize = theme.FontSizeSmall
    confirmBtn.BorderSizePixel = 0
    confirmBtn.ZIndex = 103
    confirmBtn.Parent = btnRow
    
    local cfCorner = Instance.new("UICorner")
    cfCorner.CornerRadius = theme.SmallCornerRadius
    cfCorner.Parent = confirmBtn
    
    -- Animate In
    TweenService:Create(overlay, TweenInfo.new(theme.AnimationFast), {
        BackgroundTransparency = 0.5
    }):Play()
    
    local function close(callback)
        local t = TweenService:Create(overlay, TweenInfo.new(theme.AnimationFast), {
            BackgroundTransparency = 1
        })
        t:Play()
        t.Completed:Connect(function()
            overlay:Destroy()
            if callback then
                task.spawn(callback)
            end
        end)
    end
    
    local cfConn = confirmBtn.Activated:Connect(function()
        close(onConfirm)
    end)
    local ccConn = cancelBtn.Activated:Connect(function()
        close(onCancel)
    end)
    
    if cleanup then
        cleanup:Add(cfConn)
        cleanup:Add(ccConn)
        cleanup:Add(overlay)
    end
end

function Modal.Notify(parentScreenGui, options, theme, cleanup)
    options = options or {}
    local title = options.Title or "Notification"
    local message = options.Content or options.Message or ""
    local duration = options.Duration or 3.5
    
    -- Notification Container Frame in bottom-right corner
    local holder = parentScreenGui:FindFirstChild("NotificationHolder")
    if not holder then
        holder = Instance.new("Frame")
        holder.Name = "NotificationHolder"
        holder.Size = UDim2.new(0, 280, 1, -20)
        holder.Position = UDim2.new(1, -290, 0, 10)
        holder.BackgroundTransparency = 1
        holder.ZIndex = 90
        holder.Parent = parentScreenGui
        
        local hList = Instance.new("UIListLayout")
        hList.VerticalAlignment = Enum.VerticalAlignment.Bottom
        hList.SortOrder = Enum.SortOrder.LayoutOrder
        hList.Padding = UDim.new(0, 8)
        hList.Parent = holder
    end
    
    local toast = Instance.new("Frame")
    toast.Name = "Toast"
    toast.Size = UDim2.new(1, 0, 0, 60)
    toast.Position = UDim2.new(1, 300, 0, 0)
    toast.BackgroundColor3 = theme.Header
    toast.BorderSizePixel = 0
    toast.ZIndex = 91
    toast.Parent = holder
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = theme.CornerRadius
    corner.Parent = toast
    
    -- Accent line on the left edge
    local bar = Instance.new("Frame")
    bar.Name = "Bar"
    bar.Size = UDim2.new(0, 3, 1, -12)
    bar.Position = UDim2.new(0, 6, 0, 6)
    bar.BackgroundColor3 = theme.Accent
    bar.BorderSizePixel = 0
    bar.ZIndex = 92
    bar.Parent = toast
    
    local bCorner = Instance.new("UICorner")
    bCorner.CornerRadius = UDim.new(1, 0)
    bCorner.Parent = bar
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(1, -24, 0, 20)
    titleLabel.Position = UDim2.new(0, 16, 0, 8)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = theme.TextPrimary
    titleLabel.Font = theme.FontBold
    titleLabel.TextSize = theme.FontSizeSmall
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.ZIndex = 92
    titleLabel.Parent = toast
    
    local msgLabel = Instance.new("TextLabel")
    msgLabel.Name = "Message"
    msgLabel.Size = UDim2.new(1, -24, 0, 24)
    msgLabel.Position = UDim2.new(0, 16, 0, 28)
    msgLabel.BackgroundTransparency = 1
    msgLabel.Text = message
    msgLabel.TextColor3 = theme.TextSecondary
    msgLabel.Font = theme.FontRegular
    msgLabel.TextSize = 10
    msgLabel.TextXAlignment = Enum.TextXAlignment.Left
    msgLabel.TextWrapped = true
    msgLabel.ZIndex = 92
    msgLabel.Parent = toast
    
    -- Slide In
    toast.Position = UDim2.new(1, 0, 0, 0)
    TweenService:Create(toast, TweenInfo.new(theme.AnimationMedium), {
        Position = UDim2.new(0, 0, 0, 0)
    }):Play()
    
    -- Auto Dismiss
    task.delay(duration, function()
        if toast and toast.Parent then
            local t = TweenService:Create(toast, TweenInfo.new(theme.AnimationFast), {
                Position = UDim2.new(1, 50, 0, 0)
            })
            t:Play()
            t.Completed:Connect(function()
                toast:Destroy()
            end)
        end
    end)
end

return Modal

