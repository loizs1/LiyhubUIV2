--[[
    LiyHub UI - Cleanup (Maid / Janitor)
    Handles deterministic lifecycle tracking, connection disconnection,
    instance destruction, task cancellation, and safe repeated destruction.
]]

local Cleanup = {}
Cleanup.__index = Cleanup

function Cleanup.new()
    return setmetatable({
        _tasks = {},
        _destroyed = false,
    }, Cleanup)
end

function Cleanup:Add(taskItem)
    if self._destroyed then
        self:_cleanupItem(taskItem)
        return nil
    end
    table.insert(self._tasks, taskItem)
    return taskItem
end

function Cleanup:Remove(taskItem)
    for i, item in ipairs(self._tasks) do
        if item == taskItem then
            table.remove(self._tasks, i)
            return item
        end
    end
    return nil
end

function Cleanup:_cleanupItem(item)
    if item == nil then return end
    
    local itemType = typeof(item)
    if itemType == "RBXScriptConnection" then
        if item.Connected then
            item:Disconnect()
        end
    elseif itemType == "Instance" then
        pcall(function()
            item:Destroy()
        end)
    elseif itemType == "thread" then
        pcall(function()
            task.cancel(item)
        end)
    elseif itemType == "function" then
        pcall(item)
    elseif itemType == "table" then
        if typeof(item.Disconnect) == "function" then
            pcall(function() item:Disconnect() end)
        elseif typeof(item.destroy) == "function" then
            pcall(function() item:destroy() end)
        elseif typeof(item.Destroy) == "function" then
            pcall(function() item:Destroy() end)
        elseif typeof(item.Cancel) == "function" then
            pcall(function() item:Cancel() end)
        elseif typeof(item.cancel) == "function" then
            pcall(function() item:cancel() end)
        end
    end
end

function Cleanup:Clean()
    local tasks = self._tasks
    self._tasks = {}
    for i = #tasks, 1, -1 do
        self:_cleanupItem(tasks[i])
    end
end

function Cleanup:Destroy()
    if self._destroyed then return end
    self._destroyed = true
    self:Clean()
end

return Cleanup

