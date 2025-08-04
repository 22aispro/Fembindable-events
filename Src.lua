local fembindables = {}
fembindables.__index = fembindables
fembindables.events = {}

function fembindables.OnEvent(params: {Flag: string, Callback: (params: {any}) -> ()})
    local self = setmetatable({}, fembindables)
    
    self.flag = params.Flag
    self.RecoveredCallback = params.Callback
    self.Callback = params.Callback
    self.Loaded = false
    fembindables.events[self.flag] = self
    
    return self
end

function fembindables.WaitForEvent(Flag: string)
    local event
    for i=1, 50 do
        event = fembindables.events[Flag]
        if event then print(`Successfully found event 'fembindables.events["{Flag}"]'`) break end
        print"Iterating"
        task.wait(.05)
    end

    if not event then warn(`Infinite yield possible on 'fembindables.WaitForEvent("{Flag}")`) return end
        
    event.Loaded = true
    return event
end

function fembindables:Fire(...)
    if not self.Loaded then return end
    if not self.Callback then return end
    
    self.Callback(...)
end

function fembindables:Unbind()
    fembindables.events[self.flag].Callback = nil
end

function fembindables:Rebind(NewCallback)
    fembindables.events[self.flag].Callback = NewCallback or self.RecoveredCallback
    print("Rebinded")
end

return fembindables
