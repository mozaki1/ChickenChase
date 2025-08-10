local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local buttonsGui = script.Parent
local disableGUIEvent = ReplicatedStorage:WaitForChild("DisableButtonsGUI")
local sendSignal = ReplicatedStorage:WaitForChild("30SecondSignal")

buttonsGui.Enabled = false

sendSignal.OnClientEvent:Connect(function()
	if player.Team == nil or player.Team.Name == "Neutral" then
		buttonsGui.Enabled = true
	end
end)

disableGUIEvent.OnClientEvent:Connect(function()
	buttonsGui.Enabled = false
end)

workspace:GetAttributeChangedSignal("Status"):Connect(function()
	local status = workspace:GetAttribute("Status")
	if status == "Game starting in" or status == "Waiting for players..." then
		buttonsGui.Enabled = false
	end
end)
