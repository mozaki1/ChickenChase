local ReplicatedStorage = game:GetService("ReplicatedStorage")
local sendSignal = ReplicatedStorage:WaitForChild("30SecondSignal")
local buttonsGui = script.Parent  -- assuming this script is inside the Buttons GUI fff

sendSignal.OnClientEvent:Connect(function()
	buttonsGui.Enabled = true
end)
