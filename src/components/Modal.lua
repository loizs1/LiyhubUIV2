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
    
    local uiScaleVal = options.Scale
    if not uiScaleVal then
        local mf = parentScreenGui:FindFirstChild("MainFrame")
        local ws = mf and mf:FindFirstChild("WindowScale")
        if ws and ws:IsA("UIScale") then
            uiScaleVal = ws.Scale
        end
    end
    if uiScaleVal and uiScaleVal ~= 1 then
        local oScale = Instance.new("UIScale")
        oScale.Scale = uiScaleVal
        oScale.Parent = overlay
    end
    
    local dialog = Instance.new("Frame")
    dialog.Name = "Dialog"
    dialog.AnchorPoint = Vector2.new(0.5, 0.5)
    dialog.Position = UDim2.new(0.5, 0, 0.5, 0)
    dialog.Size = UDim2.new(0.85, 0, 0, 0)
    dialog.AutomaticSize = Enum.AutomaticSize.Y
    dialog.BackgroundColor3 = theme.Header
    dialog.BorderSizePixel = 0
    dialog.ZIndex = 101
    dialog.Parent = overlay
    
    local dConstraint = Instance.new("UISizeConstraint")
    dConstraint.MinSize = Vector2.new(280, 130)
    dConstraint.MaxSize = Vector2.new(420, 500)
    dConstraint.Parent = dialog
    
    local dPad = Instance.new("UIPadding")
    dPad.PaddingTop = UDim.new(0, 14)
    dPad.PaddingBottom = UDim.new(0, 14)
    dPad.PaddingLeft = UDim.new(0, 16)
    dPad.PaddingRight = UDim.new(0, 16)
    dPad.Parent = dialog
    
    local dList = Instance.new("UIListLayout")
    dList.SortOrder = Enum.SortOrder.LayoutOrder
    dList.Padding = UDim.new(0, 10)
    dList.Parent = dialog
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = theme.CornerRadius
    corner.Parent = dialog
    
    if theme.UseStrokes then
        local stroke = Instance.new("UIStroke")
        stroke.Name = "DialogStroke"
        stroke.Color = theme.BorderWindow or theme.Border
        stroke.Thickness = 1
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Parent = dialog
    end
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(1, 0, 0, 22)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = theme.TextPrimary
    titleLabel.Font = theme.FontBold
    titleLabel.TextSize = theme.FontSizeTitle
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.TextTruncate = Enum.TextTruncate.AtEnd
    titleLabel.LayoutOrder = 1
    titleLabel.ZIndex = 102
    titleLabel.Parent = dialog
    
    local msgLabel = Instance.new("TextLabel")
    msgLabel.Name = "Message"
    msgLabel.Size = UDim2.new(1, 0, 0, 0)
    msgLabel.AutomaticSize = Enum.AutomaticSize.Y
    msgLabel.BackgroundTransparency = 1
    msgLabel.Text = message
    msgLabel.TextColor3 = theme.TextSecondary
    msgLabel.Font = theme.FontRegular
    msgLabel.TextSize = theme.FontSizeRegular
    msgLabel.TextXAlignment = Enum.TextXAlignment.Left
    msgLabel.TextYAlignment = Enum.TextYAlignment.Top
    msgLabel.TextWrapped = true
    msgLabel.LayoutOrder = 2
    msgLabel.ZIndex = 102
    msgLabel.Parent = dialog
    
    local btnRow = Instance.new("Frame")
    btnRow.Name = "Buttons"
    btnRow.Size = UDim2.new(1, 0, 0, 32)
    btnRow.BackgroundTransparency = 1
    btnRow.LayoutOrder = 3
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
    
    TweenService:Create(overlay, TweenInfo.new(theme.AnimationFast), {
        BackgroundTransparency = 0.5
    }):Play()
    
    local isClosing = false
    local function close(callback)
        if isClosing then return end
        isClosing = true
        local t = TweenService:Create(overlay, TweenInfo.new(theme.AnimationFast), {
            BackgroundTransparency = 1
        })
        t:Play()
        t.Completed:Connect(function()
            if overlay and overlay.Parent then
                overlay:Destroy()
            end
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
    local duration = options.Duration or 3.0
    
    local holder = parentScreenGui:FindFirstChild("NotificationHolder")
    if not holder then
        holder = Instance.new("Frame")
        holder.Name = "NotificationHolder"
        holder.Size = UDim2.new(0, 260, 1, -20)
        holder.Position = UDim2.new(1, -270, 0, 10)
        holder.BackgroundTransparency = 1
        holder.ZIndex = 90
        holder.Parent = parentScreenGui
        
        local hList = Instance.new("UIListLayout")
        hList.VerticalAlignment = Enum.VerticalAlignment.Bottom
        hList.HorizontalAlignment = Enum.HorizontalAlignment.Right
        hList.SortOrder = Enum.SortOrder.LayoutOrder
        hList.Padding = UDim.new(0, 6)
        hList.Parent = holder
    end
    
    local toast = Instance.new("Frame")
    toast.Name = "Toast"
    toast.Size = UDim2.new(1, 0, 0, 48)
    toast.Position = UDim2.new(1, 300, 0, 0)
    toast.BackgroundColor3 = theme.Header
    toast.BorderSizePixel = 0
    toast.ClipsDescendants = true
    toast.ZIndex = 91
    toast.Parent = holder
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = theme.CornerRadius or UDim.new(0, 7)
    corner.Parent = toast
    
    if theme.UseStrokes then
        local stroke = Instance.new("UIStroke")
        stroke.Name = "ToastStroke"
        stroke.Color = theme.BorderWindow or theme.Border
        stroke.Thickness = 1
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Parent = toast
    end
    
    local bar = Instance.new("Frame")
    bar.Name = "Bar"
    bar.Size = UDim2.new(0, 3, 1, -12)
    bar.Position = UDim2.new(0, 5, 0, 6)
    bar.BackgroundColor3 = theme.Accent
    bar.BorderSizePixel = 0
    bar.ZIndex = 92
    bar.Parent = toast
    
    local bCorner = Instance.new("UICorner")
    bCorner.CornerRadius = UDim.new(1, 0)
    bCorner.Parent = bar
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(1, -20, 0, 16)
    titleLabel.Position = UDim2.new(0, 14, 0, 8)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = theme.TextPrimary
    titleLabel.Font = theme.FontBold
    titleLabel.TextSize = theme.FontSizeSmall
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.TextTruncate = Enum.TextTruncate.AtEnd
    titleLabel.ZIndex = 92
    titleLabel.Parent = toast
    
    local msgLabel = Instance.new("TextLabel")
    msgLabel.Name = "Message"
    msgLabel.Size = UDim2.new(1, -20, 0, 14)
    msgLabel.Position = UDim2.new(0, 14, 0, 26)
    msgLabel.BackgroundTransparency = 1
    msgLabel.Text = message
    msgLabel.TextColor3 = theme.TextSecondary
    msgLabel.Font = theme.FontRegular
    msgLabel.TextSize = 10
    msgLabel.TextXAlignment = Enum.TextXAlignment.Left
    msgLabel.TextTruncate = Enum.TextTruncate.AtEnd
    msgLabel.ZIndex = 92
    msgLabel.Parent = toast
    
    TweenService:Create(toast, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Position = UDim2.new(0, 0, 0, 0)
    }):Play()
    
    local isDismissed = false
    task.delay(duration, function()
        if isDismissed then return end
        isDismissed = true
        if toast and toast.Parent then
            local t = TweenService:Create(toast, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                Position = UDim2.new(1, 300, 0, 0)
            })
            t:Play()
            t.Completed:Connect(function()
                if toast and toast.Parent then
                    toast:Destroy()
                end
            end)
        end
    end)
end

return Modal
