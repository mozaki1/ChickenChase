local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ShowChickenGUI = ReplicatedStorage:WaitForChild("ShowChickenGUI")
local players = game:GetService("Players")
local player = players.LocalPlayer

local gui = script.Parent
gui.Enabled = false

local function updateGui()
	local status = workspace:GetAttribute("Status")
	if player.Team and player.Team.Name == "Chickens" and status ~= "Waiting for players..." and status ~= "Game starting in" then
		gui.Enabled = true
	else
		gui.Enabled = false
	end
end

updateGui()

player:GetPropertyChangedSignal("Team"):Connect(updateGui)
workspace:GetAttributeChangedSignal("Status"):Connect(updateGui)
