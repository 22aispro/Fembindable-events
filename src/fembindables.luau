local fembindables = {}
fembindables.__index = fembindables

local femconnection = {}
femconnection.__index = femconnection

function femconnection.new(signal, callback)
	return setmetatable({
		_signal = signal,
		_callback = callback,
	}, femconnection)
end

function femconnection:Disconnect()
	local i = table.find(self._signal, self)
	if i then
		table.remove(self._signal, i)
	end
end

function fembindables.new()
	local self = setmetatable({}, fembindables)
	return self
end

function fembindables:Connect(fn)
	local handler = femconnection.new(self, fn)
	table.insert(self, handler)
	return handler
end

function fembindables:Fire(...)
	for i = #self, 1, -1 do
		local conn = self[i]
		if conn._connected then
			task.spawn(conn._callback,...)
		end
	end
end

function fembindables:DisconnectAll()
	table.clear(self)
end

return fembindables
