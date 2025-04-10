local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local mainGui = Instance.new("ScreenGui", playerGui)

local function addBorder(frame)
local stroke = Instance.new("UIStroke", frame)
stroke.Thickness = 2
stroke.Color = Color3.new(1, 1, 1)
end

local infoFrame = Instance.new("Frame", mainGui)
infoFrame.Size = UDim2.new(0.5, 0, 0.15, 0)
infoFrame.Position = UDim2.new(0, 0, 0, 0)
infoFrame.AnchorPoint = Vector2.new(0, 0)
infoFrame.BackgroundColor3 = Color3.fromRGB(128, 128, 128)
infoFrame.BackgroundTransparency = 0.3
infoFrame.BorderSizePixel = 0
infoFrame.Active = true
infoFrame.Draggable = true
addBorder(infoFrame)

local nameFrame = Instance.new("Frame", infoFrame)
nameFrame.Size = UDim2.new(1, 0, 0.5, 0)
nameFrame.Position = UDim2.new(0, 0, 0, 0)
nameFrame.BackgroundTransparency = 1

local nameLabel = Instance.new("TextLabel", nameFrame)
nameLabel.Size = UDim2.new(1, 0, 1, 0)
nameLabel.Position = UDim2.new(0, 0, 0, 0)
nameLabel.BackgroundTransparency = 1

local nameToShow = player.Name:sub(1, 3)
local asterisksToShow = string.rep("*", #player.Name - 3)
0
nameLabel.Text = "Player: " .. nameToShow .. asterisksToShow
nameLabel.TextColor3 = Color3.fromRGB(255, 193, 37)
nameLabel.TextScaled = true
nameLabel.Font = Enum.Font.GothamBold
nameLabel.TextXAlignment = Enum.TextXAlignment.Center

local aliasFrame = Instance.new("Frame", infoFrame)
aliasFrame.Size = UDim2.new(1, 0, 0.5, 0)
aliasFrame.Position = UDim2.new(0, 0, 0.5, 0)
aliasFrame.BackgroundTransparency = 1

local aliasLabel = Instance.new("TextLabel", aliasFrame)
aliasLabel.Size = UDim2.new(1, 0, 1, 0)
aliasLabel.Position = UDim2.new(0, 0, 0, 0)
aliasLabel.BackgroundTransparency = 1
aliasLabel.Text = "Alias: Enter Alias"
aliasLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
aliasLabel.TextScaled = true
aliasLabel.Font = Enum.Font.GothamBold
aliasLabel.TextXAlignment = Enum.TextXAlignment.Center

local aliasInput = Instance.new("TextBox", aliasFrame)
aliasInput.Size = aliasLabel.Size
aliasInput.Position = aliasLabel.Position
aliasInput.BackgroundTransparency = 1
aliasInput.TextColor3 = Color3.new(1, 1, 1)
aliasInput.PlaceholderText = "Enter Alias..."
aliasInput.Font = Enum.Font.Gotham
aliasInput.TextScaled = true
aliasInput.ClearTextOnFocus = false
aliasInput.Text = ""

aliasInput.FocusLost:Connect(function(enterPressed)
if enterPressed and aliasInput.Text ~= "" then
aliasLabel.Text = "Alias: " .. aliasInput.Text
aliasInput.Visible = false
end
end)

local jobFrame = Instance.new("Frame", mainGui)
jobFrame.Size = UDim2.new(0.2, 0, 0.3, 0)
jobFrame.Position = UDim2.new(0, 0, 0.15, 0)
jobFrame.AnchorPoint = Vector2.new(0, 0)
jobFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
jobFrame.BackgroundTransparency = 0.3
jobFrame.BorderSizePixel = 0
jobFrame.Active = true
jobFrame.Draggable = true
addBorder(jobFrame)

local corner = Instance.new("UICorner", jobFrame)
corner.CornerRadius = UDim.new(0.15, 0)

local title = Instance.new("TextLabel", jobFrame)
title.Size = UDim2.new(1, 0, 0.2, 0)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "Enter ID Sever"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamSemibold
title.TextScaled = true

local jobBox = Instance.new("TextBox", jobFrame)
jobBox.Size = UDim2.new(0.85, 0, 0.35, 0)
jobBox.Position = UDim2.new(0.075, 0, 0.25, 0)
jobBox.PlaceholderText = "Jobid..."
jobBox.Text = ""
jobBox.Font = Enum.Font.GothamBold
jobBox.TextColor3 = Color3.new(0, 0, 0)
jobBox.TextScaled = true
jobBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
jobBox.ClearTextOnFocus = false
Instance.new("UICorner", jobBox).CornerRadius = UDim.new(1, 0)

local button = Instance.new("TextButton", jobFrame)
button.Size = UDim2.new(0.68, 0, 0.25, 0)
button.Position = UDim2.new(0.16, 0, 0.67, 0)
button.Text = "Switch Server"
button.Font = Enum.Font.GothamBold
button.TextColor3 = Color3.new(1, 1, 1)
button.TextScaled = true
button.BackgroundColor3 = Color3.fromRGB(30,144 , 255)
Instance.new("UICorner", button).CornerRadius = UDim.new(1, 0)

button.MouseButton1Click:Connect(function()
if jobBox.Text ~= "" then
game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, jobBox.Text, player)
end
end)
