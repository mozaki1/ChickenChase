local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Teams = game:GetService("Teams")
local player
local joinTeamEvent = ReplicatedStorage:WaitForChild("ChickenJoinTeam")


joinTeamEvent.OnServerEvent:Connect(function(player, teamName)
	local team = Teams:FindFirstChild("Chickens")
	if team then
		player.Team = team
		print(player.Name .. "joined chickens")
		warn("Team Chickens not found")
	else
		warn("Team Chickens not found")
	end
	
end)