Benchmarks:                               |   Iters |     Total |     Per Op
---------------------------------------------------------------------------
fembindables.new()                       |  100000 |  0.0040s |   39.51 ns
fembindables:Connect()                   |   50000 |  0.0058s |  116.08 ns
fembindables:Fire() [0 conns]            |   20000 |  0.0008s |   39.62 ns
fembindables:Fire() [1 conn]             |   20000 |  0.0008s |   40.75 ns
fembindables:Fire() [100 conns]          |   20000 |  0.0008s |   42.11 ns
Disconnect() [last of 100]               |   10000 |  0.1092s |  10.92 µs
Disconnect() [first of 100]              |   10000 |  0.1073s |  10.73 µs
DisconnectAll() [500 conns]              |    5000 |  0.2091s |  41.82 µs


Guide on usage:
-- Create a new signal instance
local MySignal = fembindables.new("OnSomethingHappened")

-- Connect a listener (callback) to the signal
local connection1 = MySignal:Connect(function(message)
	print("Listener 1 received:", message)
end)

-- Connect another listener
local connection2 = MySignal:Connect(function(message)
	print("Listener 2 received:", message)
end)

-- Fire the signal with an argument
MySignal:Fire("Event Fired!")

-- Output:
-- Listener 1 received: Event Fired!
-- Listener 2 received: Event Fired!

-- Disconnect the first listener
connection1:Disconnect()

-- Fire the signal again
MySignal:Fire("Fired again!")

-- Output:
-- Listener 2 received: Fired again!

-- Disconnect all remaining listeners
MySignal:DisconnectAll()

-- Fire again (no output since all listeners are removed)
MySignal:Fire("This won't be seen")
