local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local StartCountdown = ReplicatedStorage:FindFirstChild("StartCountdown") or Instance.new("RemoteEvent", ReplicatedStorage)
StartCountdown.Name = "StartCountdown"

local sendSignal = ReplicatedStorage:FindFirstChild("30SecondSignal") or Instance.new("RemoteEvent", ReplicatedStorage)
sendSignal.Name = "30SecondSignal"

local countStarted = false

local function TeleportPlayers(cframe)
	for i, player in Players:GetPlayers() do
		if not player.Character then continue end
		player.Character:PivotTo(cframe)
	end	
end

while true do
	local count = #Players:GetPlayers()

    


	if count >= 2 and not countStarted then
		countStarted = true

		for seconds = 30, 0, -1 do
			StartCountdown:FireAllClients(seconds)
			task.wait(1)

			if seconds == 0 then
				sendSignal:FireAllClients()
				print("Game starting penchodt")
				TeleportPlayers(workspace.SpawnFarmMap.CFrame * CFrame.new(0, 2, 0))
			end
		end

	elseif count < 2 then
		StartCountdown:FireAllClients("waiting for more players... (" .. count .. ")")
		countStarted = false
	end

	task.wait(2)
end
