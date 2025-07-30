local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Teams = game:GetService("Teams")

local disableGUIEvent = ReplicatedStorage:WaitForChild("DisableButtonsGUI")
local joinTeamEvent = ReplicatedStorage:WaitForChild("ChickenJoinTeam")
local showChickenGUI = ReplicatedStorage:WaitForChild("ShowChickenGUI") -- optional if you're showing GUI
-- You had 'Di' instead of correct name

joinTeamEvent.OnServerEvent:Connect(function(player)
	local team = Teams:FindFirstChild("Chickens")
	if team then
		player.Team = team
		print(player.Name .. " joined Chickens")
		showChickenGUI:FireClient(player) -- optional
		disableGUIEvent:FireClient(player)
	else
		warn("Team 'Chickens' not found")
	end
end)
