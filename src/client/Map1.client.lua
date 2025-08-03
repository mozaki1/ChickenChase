local part = script.Parent
local players = game:GetService("Players")
local player = players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PlayerTouchedEvent = ReplicatedStorage:WaitForChild("PlayerTouchedEvent")
local getPlayerFromHit = ReplicatedStorage:WaitForChild("GetPlayerFromHit")

part.Touched:Connect(function(hit)

    local player = getPlayerFromHit(hit)
    if player then
        print("Player touched map1part: " .. player.Name)

    end
end)
