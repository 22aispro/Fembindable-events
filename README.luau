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
MySignal:Fire("This won't be seen")\
