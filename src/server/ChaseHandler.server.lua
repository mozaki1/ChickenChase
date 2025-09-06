-- In a server script

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local catchDistance = 1 -- The distance in studs for a catch

RunService.Heartbeat:Connect(function()
    local farmerCharacter = nil
    local chickenCharacter = nil
    
    -- Find the Farmer and Chicken characters in the game
    for _, player in ipairs(Players:GetPlayers()) do
        if player.Team and player.Team.Name == "Farmers" then
            farmerCharacter = player.Character
        elseif player.Team and player.Team.Name == "Chickens" then
            chickenCharacter = player.Character
        end
    end
    
    if farmerCharacter and chickenCharacter then
        local farmerRoot = farmerCharacter:FindFirstChild("HumanoidRootPart")
        local chickenRoot = chickenCharacter:FindFirstChild("HumanoidRootPart")
        
        if farmerRoot and chickenRoot then
            local distance = (farmerRoot.Position - chickenRoot.Position).Magnitude
            
            if distance < catchDistance then
                -- A catch has occurred!
                print("A catch has occurred!") -- Placeholder for your catch logic
            end
        end
    end
end)