
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local gui = script.Parent
local disableGUIEvent = ReplicatedStorage:WaitForChild("DisableButtonsGUI")

-- Make sure ButtonsGUI is initially disabled
gui.Enabled = false

-- Listen for countdown start (30SecondSignal)
local sendSignal = ReplicatedStorage:WaitForChild("30SecondSignal")
sendSignal.OnClientEvent:Connect(function()
	if player.Team == nil or player.Team.Name == "Neutral" then
		gui.Enabled = true
	end
end)

-- Disable GUI if team has been picked
disableGUIEvent.OnClientEvent:Connect(function()
	gui.Enabled = false
end)
