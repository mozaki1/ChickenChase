local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StartCountdown = ReplicatedStorage:WaitForChild("RemoteEvent")
local textLabel = script.Parent

local connection
StartCountdown.OnClientEvent:Connect(function(data)
    if typeof(data) == "string" then
        textLabel.Text = data
        return
    end

    -- data is endTime (os.time() value)
    if connection then
        connection:Disconnect()
    end

    connection = game:GetService("RunService").RenderStepped:Connect(function()
        local remaining = math.max(0, data - os.time())
        textLabel.Text = "Game starts in: " .. remaining
        if remaining <= 0 then
            textLabel.Text = "Game Started!"
            connection:Disconnect()
        end
    end)
end)

