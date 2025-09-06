-- In StarterPlayerScripts (synced from your src/client folder)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local trapTriggeredEvent = ReplicatedStorage:WaitForChild("TrapTriggeredEvent")

local camera = workspace.CurrentCamera

-- Listen for the event from the server
trapTriggeredEvent.OnClientEvent:Connect(function()
    print("Trap was triggered! Playing client effects.")
    
    -- Play a sound effect that only this player hears
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://135700778" -- Example sound ID (you'll need to change this)
    sound.Parent = workspace
    sound:Play()
    task.wait(sound.TimeLength)
    sound:Destroy()
    
    -- Add a camera shake effect
    for i = 1, 10 do
        camera.CFrame = camera.CFrame * CFrame.fromEulerAnglesXYZ(math.random(-0.1, 0.1), math.random(-0.1, 0.1), 0)
        task.wait(0.05)
    end
end)