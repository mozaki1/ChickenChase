local button = script.Parent
-- Try to find ShopFrame under MainFrame (the likely intended location)
local mainFrame = button.Parent.Parent
local shopFrame = nil
local soundService = game:GetService("SoundService")

if mainFrame then
	shopFrame = mainFrame:FindFirstChild("ShopFrame")
end



-- Hide shop at start
if shopFrame then
	shopFrame.Visible = false
end

-- Show shop on click
button.MouseButton1Click:Connect(function()
	if shopFrame then
		shopFrame.Visible = true
	end
end)

