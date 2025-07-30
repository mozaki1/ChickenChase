local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Teams = game:GetService("Teams")

local joinTeamEvent = ReplicatedStorage:WaitForChild("FarmerJoinTeam")
local disableGUIEvent = ReplicatedStorage:WaitForChild("DisableButtonsGUI")

joinTeamEvent.OnServerEvent:Connect(function(player)
	local team = Teams:FindFirstChild("Farmers")
	if team then
		player.Team = team
		print(player.Name .. " joined Farmers")
		disableGUIEvent:FireClient(player)
	else
		warn("Team 'Farmers' not found.")
	end
end)
