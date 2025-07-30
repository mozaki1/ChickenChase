local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ChickenButtonClicked = ReplicatedStorage:WaitForChild("ChickenButtonClicked")
local assignTeam = ReplicatedStorage:WaitForChild("ChickenJoinTeam")
local disableGUI = ReplicatedStorage:WaitForChild("DisableButtonsGUI")

local chickenButton = script.Parent

chickenButton.MouseButton1Click:Connect(function()
	print("Chicken button clicked")
	ChickenButtonClicked:FireServer()
	assignTeam:FireServer("Chickens")
	disableGUI:FireServer() -- ?? Tell server to disable Buttons GUI for this player
end)
