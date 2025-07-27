local ReplicatedStorage = game:GetService("ReplicatedStorage")
local chickenClicked = ReplicatedStorage:WaitForChild("ChickenButtonClicked")
local showChickenGui = ReplicatedStorage:WaitForChild("ShowChickenGUI")

chickenClicked.OnServerEvent:Connect(function(player)
	print(player.Name .. " clicked chicken button")
	showChickenGui:FireClient(player, "Assign chicken GUI")  -- fire only to that player
end)
