local Players = game:GetService("Players")
local Teams = game:GetService("Teams")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local farmerTeam = Teams:WaitForChild("Farmers")
local farmerAccessory = ReplicatedStorage:WaitForChild("Accessories"):WaitForChild("FarmerAccessory")

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        if player.Team == farmerTeam then
            local clone = farmerAccessory:Clone()
            clone.Parent = character
            print("Gave farmer accessory to " .. player.Name)
        end
    end)
end)
