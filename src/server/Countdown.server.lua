local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Create RemoteEvents if they don't already exist
local StartCountdown = ReplicatedStorage:FindFirstChild("StartCountdown") or Instance.new("RemoteEvent", ReplicatedStorage)
StartCountdown.Name = "StartCountdown"

local sendSignal = ReplicatedStorage:FindFirstChild("30SecondSignal") or Instance.new("RemoteEvent", ReplicatedStorage)
sendSignal.Name = "30SecondSignal"

local countStarted = false

while true do
	local count = #Players:GetPlayers()

	if count >= 2 and not countStarted then
		countStarted = true

		for seconds = 30, 0, -1 do
			StartCountdown:FireAllClients(seconds)
			task.wait(1)

			if seconds == 0 then
				sendSignal:FireAllClients()
			end
		end

	elseif count < 2 then
		StartCountdown:FireAllClients("Waiting for more players ......(" .. count .. ")")
		countStarted = false
	end

	task.wait(2)
end
