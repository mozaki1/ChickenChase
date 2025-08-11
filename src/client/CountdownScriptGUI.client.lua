local label = script.Parent
label.BackgroundTransparency = 1
label.TextScaled = true
label.Visible = false
label.TextColor3 = Color3.new(0, 0, 0)
label.TextStrokeTransparency = 0

local event = game.ReplicatedStorage:WaitForChild("StartCountdown")

<<<<<<< HEAD
event.OnClientEvent:Connect(function(msg)
	label.Visible = true

	if typeof(msg) == "number" then
		if msg == 0 then
			label.Text = ""
		else
			label.Text = "game starts in " .. msg .. " second" .. (msg == 1 and "" or "s")
		end

	elseif typeof(msg) == "string" then
		label.Text = msg

		if msg == "game starting!" then
			task.wait(2)
			label.Visible = false
		end
	end
end)
=======
	if gameStatus == "In-Game" or gameStatus == "Game starting in" then
		gui.Text = (gameStatus == "In-Game" and "Game ending in: " or "Game starting in: ") .. clockTime
	else
		gui.Text = gameStatus
	end
end

workspace:GetAttributeChangedSignal("Clock"):Connect(UpdateStatus)
workspace:GetAttributeChangedSignal("Status"):Connect(UpdateStatus)

--gui.Text = "Game starting..."
>>>>>>> c2521cf5745653cba73b445ea9f82ef4f44e1fdb
