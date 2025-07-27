local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ShowFarmerGUI = ReplicatedStorage:WaitForChild("ShowFarmerGUI")

local gui = script.Parent
gui.Enabled = false

ShowFarmerGUI.OnClientEvent:Connect(function(show)
	gui.Enabled = show
	print("Farmer GUI visibility:", show)
end)
