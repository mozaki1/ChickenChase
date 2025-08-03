local splash = script.Parent  -- StartScreen (ScreenGui)

splash.Enabled = true
task.wait(3)
splash:Destroy()

-- Now show the main menu GUI
local playerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local mainMenu = playerGui:FindFirstChild("MainMenuGUI")
if mainMenu then
	mainMenu.Enabled = true
end
