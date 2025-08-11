local gui = script.Parent

local function UpdateStatus()
	local clockTime = workspace:GetAttribute("Clock")
	local gameStatus = workspace:GetAttribute("Status")

	if gameStatus == "In-Game" or gameStatus == "Game starting in" then
		gui.Text = (gameStatus == "In-Game" and "Game ending in: " or "Game starting in: ") .. clockTime
	else
		gui.Text = gameStatus
	end
end

workspace:GetAttributeChangedSignal("Clock"):Connect(UpdateStatus)
workspace:GetAttributeChangedSignal("Status"):Connect(UpdateStatus)

--gui.Text = "Game starting..."
