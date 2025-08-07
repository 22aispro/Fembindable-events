# 🔗 fembindables

**fembindables** is a fast and minimal signal (event) system for Lua-based environments like Roblox. It provides simple APIs for creating, connecting, firing, and disconnecting events efficiently.

---

## 📊 Benchmarks

| Operation                                | Iterations |   Total Time |  Time per Op |
|-----------------------------------------|------------|---------------|---------------|
| `fembindables.new()`                    | 100,000    | 0.0040 s     | 39.51 ns      |
| `fembindables:Connect()`                | 50,000     | 0.0058 s     | 116.08 ns     |
| `fembindables:Fire()` [0 connections]   | 20,000     | 0.0008 s     | 39.62 ns      |
| `fembindables:Fire()` [1 connection]    | 20,000     | 0.0008 s     | 40.75 ns      |
| `fembindables:Fire()` [100 connections] | 20,000     | 0.0008 s     | 42.11 ns      |
| `Disconnect()` [last of 100]            | 10,000     | 0.1092 s     | 10.92 µs      |
| `Disconnect()` [first of 100]           | 10,000     | 0.1073 s     | 10.73 µs      |
| `DisconnectAll()` [500 connections]     | 5,000      | 0.2091 s     | 41.82 µs      |

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
```md
# Listener 1 received: Event Fired!
# Listener 2 received: Event Fired!
```

### ❌ Disconnect a Listener
## Disconnect a specific listener to stop receiving events.
```lua
connection1:Disconnect()
```

###🔥Fire the signal again with a new message
## Only Listener 2 will respond now
```lua
MySignal:Fire("Fired again!")
```

### Output:
```md
# Listener 2 received: Fired again!
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
```md
 # no output
```

### NOTICE:
## To use events in other scripts you can make a module that holds the events.
