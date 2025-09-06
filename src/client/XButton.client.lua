local button = script.Parent
local shopFrame = button.Parent

-- Hide shop on click
button.MouseButton1Click:Connect(function()
    shopFrame.Visible = false
end)
