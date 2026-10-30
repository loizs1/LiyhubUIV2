--[[
    LiyHub UI - Signals
    Lightweight, high-performance event / signal implementation in Luau.
]]

local Signal = {}
Signal.__index = Signal

local Connection = {}
Connection.__index = Connection

function Connection.new(signal, fn)
    return setmetatable({
        _signal = signal,
        _fn = fn,
        Connected = true,
    }, Connection)
end

function Connection:Disconnect()
    if not self.Connected then return end
    self.Connected = false
    if self._signal and self._signal._connections then
        for i, conn in ipairs(self._signal._connections) do
            if conn == self then
                table.remove(self._signal._connections, i)
                break
            end
        end
    end
    self._signal = nil
    self._fn = nil
end

Connection.Destroy = Connection.Disconnect

function Signal.new()
    return setmetatable({
        _connections = {},
        _destroyed = false,
    }, Signal)
end

function Signal:Connect(fn)
    assert(type(fn) == "function", "Signal:Connect expected a function")
    if self._destroyed then
        error("Cannot connect to a destroyed Signal")
    end
    local conn = Connection.new(self, fn)
    table.insert(self._connections, conn)
    return conn
end

function Signal:Fire(...)
    if self._destroyed then return end
    local connections = table.clone(self._connections)
    for _, conn in ipairs(connections) do
        if conn.Connected and conn._fn then
            task.spawn(conn._fn, ...)
        end
    end
end

function Signal:Wait()
    if self._destroyed then return nil end
    local runningThread = coroutine.running()
    local conn
    conn = self:Connect(function(...)
        conn:Disconnect()
        task.spawn(runningThread, ...)
    end)
    return coroutine.yield()
end

function Signal:Destroy()
    if self._destroyed then return end
    self._destroyed = true
    for _, conn in ipairs(self._connections) do
        conn.Connected = false
        conn._signal = nil
        conn._fn = nil
    end
    table.clear(self._connections)
end

return Signal

