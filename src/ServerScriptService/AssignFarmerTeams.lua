local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Teams = game:GetService("Teams")
local player
local joinTeamEvent = ReplicatedStorage:WaitForChild("FarmerJoinTeam")


joinTeamEvent.OnServerEvent:Connect(function(player, teamName)
	local team = Teams:FindFirstChild("Farmers")
	if team then
		player.Team = team
		print(player.Name .. "joined farmers")
	else
		warn("Team Farmers not found")
	end

end)