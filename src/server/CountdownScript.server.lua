local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local StartCountdown = ReplicatedStorage:FindFirstChild("StartCountdown") or Instance.new("RemoteEvent", ReplicatedStorage)
StartCountdown.Name = "StartCountdown"

local sendSignal = ReplicatedStorage:FindFirstChild("30SecondSignal") or Instance.new("RemoteEvent", ReplicatedStorage)
sendSignal.Name = "30SecondSignal"

local countStarted = false

local function TeleportPlayers(cframe)
	for _, player in ipairs(Players:GetPlayers()) do
		if player.Character then
			player.Character:PivotTo(cframe)
		end
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
				print("Game starting...")
				TeleportPlayers(workspace.SpawnFarmMap.CFrame * CFrame.new(0, 2, 0))
			end
		end

	elseif count < 2 then
		StartCountdown:FireAllClients("Waiting for players (" .. count .. ")")
		countStarted = false
	end

	task.wait(1) -- update faster so player count changes are shown quickly
end
