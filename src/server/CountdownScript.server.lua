local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local lobby_time = 20
local round_time = 12
local min_players = 1

local sendSignal = ReplicatedStorage:FindFirstChild("30SecondSignal")
if not sendSignal then
	sendSignal = Instance.new("RemoteEvent")
	sendSignal.Name = "30SecondSignal"
	sendSignal.Parent = ReplicatedStorage
end

local function TeleportPlayers(cframe)
	for _, player in ipairs(Players:GetPlayers()) do
		if player.Character and player.Character.PrimaryPart then
			player.Character:PivotTo(cframe)
		end
	end
end

local function Countdown(duration)
	for i = duration, 1, -1 do
		print(i)
		workspace:SetAttribute("Clock", i)
		task.wait(1)
	end
end

local function Intermission()
	print("Lobby")
	workspace:SetAttribute("Status", "Game starting in")
	for _, player in ipairs(Players:GetPlayers()) do
		player.Team = nil
	end
	TeleportPlayers(workspace.SpawnLocation.CFrame * CFrame.new(0, 2, 0))
	Countdown(lobby_time)
	sendSignal:FireAllClients()
end

local function RunGame(map)
	print("Game starting")
	workspace:SetAttribute("Status", "In-Game")
	TeleportPlayers(map.Spawn.CFrame)
	Countdown(round_time)
	map:Destroy()
end

while true do
	if #Players:GetPlayers() >= min_players then
		Intermission()
		workspace:SetAttribute("Status", "Loading map...")
		local maps = ReplicatedStorage.Maps:GetChildren()
		local randomMap = maps[math.random(#maps)]
		local newMap = randomMap:Clone()
		newMap.Parent = workspace
		task.wait(1)
		RunGame(newMap)
	else
		print("Waiting for players")
		workspace:SetAttribute("Status", "Waiting for players...")
		task.wait(1)
	end
end
