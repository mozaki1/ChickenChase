-- In the Server folder inside ServerScriptService

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

-- Get references to the trap model and its parts from the Workspace
-- Use WaitForChild to ensure the parts exist before the script tries to use them
local trapModel = Workspace:WaitForChild("BearTrap")
local trapOpenPart = trapModel:WaitForChild("Open")
local trapClosePart = trapModel:WaitForChild("Close")
local hitBoxPart = trapModel:WaitForChild("HitBox")
local bangSound = hitBoxPart:WaitForChild("Bang")
local capturedValue = hitBoxPart:WaitForChild("Captured") -- A BoolValue object
local trapTriggeredEvent = ReplicatedStorage:WaitForChild("TrapTriggeredEvent")

local debounce = true
local cooldown = 10 -- seconds until trap resets
local debounce = true
local cooldown = 10 -- seconds until trap resets

-- Trap trigger function
local function onTouched(hitPart)
    -- Check if a player's character touched the part and if the trap is not already captured
    local humanoid = hitPart.Parent:FindFirstChild("Humanoid")
    if humanoid and debounce and not capturedValue.Value then
        
        debounce = false
        
        local player = game.Players:GetPlayerFromCharacter(hitPart.Parent)
        if not player then return end

        -- Damage player
        humanoid.Health -= 30
        
        -- Fire the RemoteEvent to the client who triggered the trap to play effects
        trapTriggeredEvent:FireClient(player)

        -- Freeze player
        local oldSpeed = humanoid.WalkSpeed
        local oldJump = humanoid.JumpPower
        humanoid.WalkSpeed = 0
        humanoid.JumpPower = 0
        humanoid:ChangeState(Enum.HumanoidStateType.Physics)

        -- Anchor feet
        local character = hitPart.Parent
        if character:FindFirstChild("LeftFoot") then
            character.LeftFoot.Anchored = true
        end
        if character:FindFirstChild("RightFoot") then
            character.RightFoot.Anchored = true
        end

        -- Close trap visuals
        trapOpenPart.Transparency = 1
        trapClosePart.Transparency = 0

        -- Play sound (it's best to fire a RemoteEvent for this to the client)
        bangSound:Play()

        -- Mark as captured
        capturedValue.Value = true
        
        -- Hold for 3 seconds
        task.wait(3)
        
        -- Release player
        if character:FindFirstChild("RightFoot") then
            character.RightFoot.Anchored = false
        end
        if character:FindFirstChild("LeftFoot") then
            character.LeftFoot.Anchored = false
        end
        humanoid.WalkSpeed = oldSpeed
        humanoid.JumpPower = oldJump
        humanoid:ChangeState(Enum.HumanoidStateType.Running)
        humanoid.Jump = true
    end
end
-- Reset loop
task.spawn(function()
    while true do
        if capturedValue.Value then
            task.wait(cooldown) -- wait cooldown before reopening
            trapOpenPart.Transparency = 0
            trapClosePart.Transparency = 1
            capturedValue.Value = false
            debounce = true
        end
        task.wait(0.1) -- small delay to prevent tight loop
    end
end)
-- Connect the Touched event to the HitBox part
hitBoxPart.Touched:Connect(onTouched)
