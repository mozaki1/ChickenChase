local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ShowChickenGUI = ReplicatedStorage:WaitForChild("ShowChickenGUI")
local players = game:GetService("Players")
local player = players.LocalPlayer

local gui = script.Parent
gui.Enabled = false

local function updateGui()
	if player.Team and player.Team.Name == "Chickens" then
		gui.Enabled = true
		print("Chicken GUI showing now")
	else
		gui.Enabled = false
	end
end
updateGui()

player:GetPropertyChangedSignal("Team"):Connect(updateGui)