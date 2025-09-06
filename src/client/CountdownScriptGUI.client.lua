local label = script.Parent
label.BackgroundTransparency = 1
label.TextScaled = true
label.Visible = false -- Start hidden

-- ✨ Styling: black text with white outline
label.TextColor3 = Color3.new(0, 0, 0) -- black text
label.TextStrokeTransparency = 0       -- fully visible stroke
label.TextStrokeColor3 = Color3.new(1, 1, 1) -- white outline

local event = game.ReplicatedStorage:WaitForChild("StartCountdown")

event.OnClientEvent:Connect(function(msg)
    label.Visible = true

    if typeof(msg) == "number" then
        -- This is the countdown
        if msg > 0 then
            task.wait(2) -- Wait for 2 seconds to show the message
            label.Text = "Game starts in " .. msg .. " second" .. (msg == 1 and "" or "s")
        else
            -- The countdown has reached 0
            label.Text = "Game Starting!"
            label.Visible = false -- Then hide the label
        end

    elseif typeof(msg) == "string" then
        -- This is for messages like "Waiting for more players"
        label.Text = msg
    end
end)
