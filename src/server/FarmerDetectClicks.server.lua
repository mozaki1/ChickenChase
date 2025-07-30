local ReplicatedStorage = game:GetService("ReplicatedStorage")
local farmerClicked = ReplicatedStorage:WaitForChild("FarmerButtonClicked")
local showFarmerGUI = ReplicatedStorage:WaitForChild("ShowFarmerGUI")

farmerClicked.OnServerEvent:Connect(function(player)
	print(player.Name .. " clicked farmer button")
	showFarmerGUI:FireClient(player, "Assign farmer GUI")  -- fire only to that player
end)
