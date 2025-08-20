local button = script.Parent
-- Try to find ShopFrame under MainFrame (the likely intended location)
local mainFrame = button.Parent.Parent
local shopFrame = nil
if mainFrame then
	shopFrame = mainFrame:FindFirstChild("ShopFrame")
end

-- Warn if ShopFrame is not found
if not shopFrame then
	warn("ShopFrame not found! Please make sure there is a Frame named 'ShopFrame' under MainFrame.")
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

