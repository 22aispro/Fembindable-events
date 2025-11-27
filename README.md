# 🔗 fembindables

**fembindables** is a fast and minimal signal (event) system for Lua-based environments like Roblox. It provides simple APIs for creating, connecting, firing, and disconnecting events efficiently.

---

---

## 🚀 Usage

### Create a signal
```lua
local MySignal = fembindables.new()
```

### 🔗 Connect listeners
## Connect listeners (callbacks) to your signal using Connect. Each listener will be called when the signal fires.
```lua
local connection1 = MySignal:Connect(function(message)
	print("Listener 1 received:", message)
end)

local connection2 = MySignal:Connect(function(message)
	print("Listener 2 received:", message)
end)
```


### 🔥 Fire the Signal
## Trigger the signal with ```Fire```, passing any arguments to the listeners.
```lua
MySignal:Fire("Event Fired!")
```

### Output:
```
Listener 1 received: Event Fired!
Listener 2 received: Event Fired!
```

### ❌ Disconnect a Listener
## Disconnect a specific listener to stop receiving events.
```lua
connection1:Disconnect()
```

### 🔥Fire the signal again with a new message
## Only Listener 2 will respond now
```lua
MySignal:Fire("Fired again!")
```

### Output:
```
Listener 2 received: Fired again!
```

### 🔁 Disconnect All Listeners
## Remove all listeners at once.
```lua
MySignal:DisconnectAll()
```

### 🔥 Fire the Signal
## This wont output anything.
```lua
MySignal:Fire("Event Fired!")
```
### Output:
```
 no output
```

### NOTICE:
## To use events in other scripts you can make a module that holds the events.
