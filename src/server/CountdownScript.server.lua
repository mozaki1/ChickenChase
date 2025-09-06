local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- RemoteEvents
local StartCountdown = ReplicatedStorage:FindFirstChild("StartCountdown") or Instance.new("RemoteEvent")
StartCountdown.Name = "StartCountdown"
StartCountdown.Parent = ReplicatedStorage

local GetReadyCount = ReplicatedStorage:FindFirstChild("GetReadyCount") or Instance.new("RemoteEvent")
GetReadyCount.Name = "GetReadyCount"
GetReadyCount.Parent = ReplicatedStorage

local sendSignal = ReplicatedStorage:FindFirstChild("30SecondSignal") or Instance.new("RemoteEvent")
sendSignal.Name = "30SecondSignal"
sendSignal.Parent = ReplicatedStorage

-- State
local countStarted = false

local function TeleportPlayers(cframe)
	for _, player in ipairs(Players:GetPlayers()) do
		if player.Character and player.Character.PrimaryPart then
			player.Character:PivotTo(cframe)
		end
	end
end

while true do
	local count = #Players:GetPlayers()

	if count >= 2 and not countStarted then
		countStarted = true

		-- 30 second countdown
		for seconds = 30, 0, -1 do
			StartCountdown:FireAllClients(seconds)
			task.wait(1)
		end

		-- After countdown ends
		sendSignal:FireAllClients()
		print("Game starting...")

		-- Teleport players
		local spawnCF = workspace.SpawnFarmMap.CFrame * CFrame.new(0, 2, 0)
		TeleportPlayers(spawnCF)

		-- 5 second "get ready"
		for getReady = 5, 0, -1 do
			GetReadyCount:FireAllClients(getReady)
			task.wait(1)
		end

		-- Reset state so future rounds can start
		countStarted = false

	elseif count < 2 and not countStarted then
		-- Only fire waiting status if not already in countdown
		StartCountdown:FireAllClients("Waiting for players (" .. count .. ")")
	end

	task.wait(1)
end
