local ReplicatedStorage = game:GetService("ReplicatedStorage")
local FarmerButtonClicked = ReplicatedStorage:WaitForChild("FarmerButtonClicked")
local assignTeam = ReplicatedStorage:WaitForChild("FarmerJoinTeam")
local disableGUI = ReplicatedStorage:WaitForChild("DisableButtonsGUI") -- ?? Add this line

local farmerButton = script.Parent

farmerButton.MouseButton1Click:Connect(function()
	print("Farmer button clicked")
	FarmerButtonClicked:FireServer()
	assignTeam:FireServer("Farmers")
	disableGUI:FireServer() -- ?? Tell server to hide GUI for this player
end)
