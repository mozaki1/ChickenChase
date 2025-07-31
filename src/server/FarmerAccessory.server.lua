local Players = game:GetService("Players")
local Teams = game:GetService("Teams")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local farmerTeam = Teams:WaitForChild("Farmers")
local farmerAccessory = ReplicatedStorage:WaitForChild("Accessories"):WaitForChild("FarmerAccessory")

local function updateAccessory(player)
    local character = player.Character
    if not character then return end

    local hasAccessory = character:FindFirstChild(farmerAccessory.Name)

    if player.Team == farmerTeam then
        if not hasAccessory then
            farmerAccessory:Clone().Parent = character
        end
    else
        if hasAccessory then
            hasAccessory:Destroy()
        end
    end
end

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        updateAccessory(player)
    end)
    player:GetPropertyChangedSignal("Team"):Connect(function()
        updateAccessory(player)
    end)
end)
