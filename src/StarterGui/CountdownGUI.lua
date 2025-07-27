local label = script.Parent
label.BackgroundTransparency = 1
label.TextScaled = true
label.Visible = false
label.TextColor3 = Color3.new(0, 0, 0)
label.TextStrokeTransparency = 0

local event = game.ReplicatedStorage:WaitForChild("StartCountdown")

event.OnClientEvent:Connect(function(msg)
	label.Visible = true

	if typeof(msg) == "number" then
		if msg == 0 then
			label.Text = ""
		else
			label.Text = "Game starts in " .. msg .. " second" .. (msg == 1 and "" or "s")
		end

	elseif typeof(msg) == "string" then
		label.Text = msg

		if msg == "game starting!" then
			task.wait(2)
			label.Visible = false
		end
	end
end)
