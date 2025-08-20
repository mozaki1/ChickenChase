local splash = script.Parent  -- StartScreen (ScreenGui)
local tweenService = game:GetService("TweenService")
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Grab UI objects
local splashFrame = splash:WaitForChild("Frame")
local splashImage = splash:WaitForChild("ImageLabel")
-- Frame stays fullscreen
splashFrame.Size = UDim2.new(1, 0, 1, 0)
splashFrame.AnchorPoint = Vector2.new(0.5, 0.5)
splashFrame.Position = UDim2.new(0.5, 0, -1, 0)

-- ImageLabel also fullscreen BUT constrained by UIAspectRatioConstraint
splashImage.Size = UDim2.new(1, 0, 1, 0)
splashImage.AnchorPoint = Vector2.new(0.5, 0.5)
splashImage.Position = UDim2.new(0.5, 0, -1, 0)

splash.Enabled = true

-- Tween settings
local tweenInfo = TweenInfo.new(
	1, -- duration
	Enum.EasingStyle.Quad,
	Enum.EasingDirection.Out
)

-- Slide in
local slideInFrame = tweenService:Create(splashFrame, tweenInfo, {
	Position = UDim2.new(0.5, 0, 0.5, 0)
})
local slideInImage = tweenService:Create(splashImage, tweenInfo, {
	Position = UDim2.new(0.5, 0, 0.5, 0)
})

slideInFrame:Play()
slideInImage:Play()
slideInFrame.Completed:Wait()

-- Stay on screen
task.wait(2)

-- Slide out (down)
local slideOutFrame = tweenService:Create(splashFrame, tweenInfo, {
	Position = UDim2.new(0.5, 0, 2, 0)
})
local slideOutImage = tweenService:Create(splashImage, tweenInfo, {
	Position = UDim2.new(0.5, 0, 2, 0)
})

slideOutFrame:Play()
slideOutImage:Play()
slideOutFrame.Completed:Wait()

-- Destroy splash
splash:Destroy()


