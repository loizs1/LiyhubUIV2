local TweenService = game:GetService("TweenService")

local TweenUtil = {}

function TweenUtil.Tween(instance, duration, properties, easingStyle, easingDirection)
    if not instance or not instance.Parent then return nil end
    local info = TweenInfo.new(
        duration or 0.2,
        easingStyle or Enum.EasingStyle.Quad,
        easingDirection or Enum.EasingDirection.Out
    )
    local tween = TweenService:Create(instance, info, properties)
    tween:Play()
    return tween
end

function TweenUtil.Color(instance, propertyName, targetColor, duration)
    return TweenUtil.Tween(instance, duration or 0.2, { [propertyName] = targetColor })
end

function TweenUtil.Transparency(instance, propertyName, targetTransparency, duration)
    return TweenUtil.Tween(instance, duration or 0.2, { [propertyName] = targetTransparency })
end

function TweenUtil.Size(instance, targetSize, duration)
    return TweenUtil.Tween(instance, duration or 0.2, { Size = targetSize })
end

function TweenUtil.Position(instance, targetPosition, duration)
    return TweenUtil.Tween(instance, duration or 0.2, { Position = targetPosition })
end

return TweenUtil