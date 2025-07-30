local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ShowChickenGUI = ReplicatedStorage:WaitForChild("ShowChickenGUI")

local gui = script.Parent
gui.Enabled = false

ShowChickenGUI.OnClientEvent:Connect(function(show)
	gui.Enabled = show
	print("Chicken GUI visible", show)
end)
