local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Wait for the FarmerCountdown GUI to be in PlayerGui
local gui = player:WaitForChild("PlayerGui"):WaitForChild("FarmerCountdown")
local frame = gui:WaitForChild("Frame")
local title = frame:FindFirstChild("Title")
local countdown = frame:WaitForChild("Countdown")

local shownThisRound = false

-- Helper: Show intro for Farmers
local function showFarmerIntro()
	if shownThisRound then return end
	shownThisRound = true

	local char = player.Character or player.CharacterAdded:Wait()
	local humanoid = char:FindFirstChildOfClass("Humanoid")
	if not humanoid then return end

	gui.Enabled = true
	humanoid.WalkSpeed = 0
	humanoid.JumpPower = 0

	for i = 5, 1, -1 do
		countdown.Text = tostring(i)
		task.wait(1)
	end

	countdown.Text = "GO!"
	task.wait(1)

	gui.Enabled = false
	humanoid.WalkSpeed = 16
	humanoid.JumpPower = 50
end

-- Listen for status changes
workspace:GetAttributeChangedSignal("Status"):Connect(function()
	local status = workspace:GetAttribute("Status")

	if status == "In-Game" then
		if player.Team and player.Team.Name == "Farmers" then
			showFarmerIntro()
		end
	elseif status == "Waiting for players..." or status == "Game starting in" then
		shownThisRound = false
	end
end)

-- Also check team change (in case someone gets switched during the round)
player:GetPropertyChangedSignal("Team"):Connect(function()
	local status = workspace:GetAttribute("Status")

	if player.Team and player.Team.Name == "Farmers" and status == "In-Game" then
		showFarmerIntro()
	end
end)
