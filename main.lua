-- Main Script for Roblox GUI
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "GlobalScriptGUI"
screenGui.Parent = playerGui
screenGui.ResetOnSpawn = false

-- Create Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 800, 0, 600)
mainFrame.Position = UDim2.new(0.5, -400, 0.5, -300)
mainFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
mainFrame.BorderSizePixel = 1
mainFrame.BorderColor3 = Color3.new(0.2, 0.2, 0.2)
mainFrame.Parent = screenGui

-- Create Title
local title = Instance.new("TextLabel")
title.Name = "Title"
title.Size = UDim2.new(1, 0, 0, 50)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
title.BorderSizePixel = 0
title.Text = "Global Script - Roblox"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextScaled = true
title.Font = Enum.Font.SourceSansBold
title.Parent = mainFrame

-- Create Sidebar
local sidebar = Instance.new("Frame")
sidebar.Name = "Sidebar"
sidebar.Size = UDim2.new(0, 200, 1, -50)
sidebar.Position = UDim2.new(0, 0, 0, 50)
sidebar.BackgroundColor3 = Color3.new(0.05, 0.05, 0.05)
sidebar.BorderSizePixel = 0
sidebar.Parent = mainFrame

-- Create Content Area
local contentArea = Instance.new("ScrollingFrame")
contentArea.Name = "ContentArea"
contentArea.Size = UDim2.new(1, -200, 1, -50)
contentArea.Position = UDim2.new(0, 200, 0, 50)
contentArea.BackgroundColor3 = Color3.new(0.08, 0.08, 0.08)
contentArea.BorderSizePixel = 0
contentArea.ScrollBarThickness = 8
contentArea.Parent = mainFrame

-- Navigation Buttons
local navButtons = {"Dashboard", "Player", "Target", "Combat", "Visuals", "Following"}
local buttonY = 10

for _, buttonText in pairs(navButtons) do
    local button = Instance.new("TextButton")
    button.Name = buttonText .. "Btn"
    button.Size = UDim2.new(1, -20, 0, 40)
    button.Position = UDim2.new(0, 10, 0, buttonY)
    button.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
    button.BorderSizePixel = 1
    button.BorderColor3 = Color3.new(0.3, 0.3, 0.3)
    button.Text = buttonText
    button.TextColor3 = Color3.new(1, 1, 1)
    button.TextScaled = true
    button.Font = Enum.Font.SourceSans
    button.Parent = sidebar
    
    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    end)
    
    button.MouseLeave:Connect(function()
        button.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
    end)
    
    buttonY = buttonY + 50
end

-- Feature Functions
local features = {
    fly = {
        name = "Fly",
        enabled = false,
        flySpeed = 50,
        flyPart = nil,
        connection = nil
    },
    speed = {
        name = "Speed",
        enabled = false,
        multiplier = 2
    },
    jumpPower = {
        name = "Jump Power",
        enabled = false,
        power = 100
    },
    noclip = {
        name = "Noclip",
        enabled = false,
        connection = nil
    },
    esp = {
        name = "ESP",
        enabled = false,
        boxes = {}
    }
}

-- Create Feature Cards
function createFeatureCard(featureName, yPosition)
    local card = Instance.new("Frame")
    card.Name = featureName .. "Card"
    card.Size = UDim2.new(1, -40, 0, 120)
    card.Position = UDim2.new(0, 20, 0, yPosition)
    card.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
    card.BorderSizePixel = 1
    card.BorderColor3 = Color3.new(0.3, 0.3, 0.3)
    card.Parent = contentArea
    
    -- Title
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(1, -20, 0, 30)
    titleLabel.Position = UDim2.new(0, 10, 0, 10)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = featureName
    titleLabel.TextColor3 = Color3.new(1, 1, 1)
    titleLabel.TextScaled = true
    titleLabel.Font = Enum.Font.SourceSansBold
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = card
    
    -- Toggle Button
    local toggle = Instance.new("TextButton")
    toggle.Name = "Toggle"
    toggle.Size = UDim2.new(0, 80, 0, 30)
    toggle.Position = UDim2.new(1, -90, 0, 10)
    toggle.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
    toggle.BorderSizePixel = 1
    toggle.BorderColor3 = Color3.new(0.5, 0.5, 0.5)
    toggle.Text = "OFF"
    toggle.TextColor3 = Color3.new(1, 1, 1)
    toggle.TextScaled = true
    toggle.Font = Enum.Font.SourceSans
    toggle.Parent = card
    
    -- Status Label
    local statusLabel = Instance.new("TextLabel")
    statusLabel.Name = "Status"
    statusLabel.Size = UDim2.new(1, -20, 0, 20)
    statusLabel.Position = UDim2.new(0, 10, 0, 50)
    statusLabel.BackgroundTransparency = 1
    statusLabel.Text = "Status: Disabled"
    statusLabel.TextColor3 = Color3.new(0.7, 0.7, 0.7)
    statusLabel.TextScaled = true
    statusLabel.Font = Enum.Font.SourceSans
    statusLabel.TextXAlignment = Enum.TextXAlignment.Left
    statusLabel.Parent = card
    
    return card, toggle, statusLabel
end

-- Create Dashboard Features
local dashboardFeatures = {"Fly", "Speed", "Jump Power", "Noclip"}
local featureY = 10
local featureCards = {}

for _, featureName in pairs(dashboardFeatures) do
    local card, toggle, status = createFeatureCard(featureName, featureY)
    featureCards[featureName] = {card = card, toggle = toggle, status = status}
    featureY = featureY + 130
end

contentArea.CanvasSize = UDim2.new(0, 0, 0, featureY)

-- Feature Functions
function toggleFly(enabled)
    local character = player.Character or player.CharacterAdded:Wait()
    local rootPart = character:WaitForChild("HumanoidRootPart")
    local feature = features.fly
    
    if enabled then
        feature.enabled = true
        feature.flyPart = Instance.new("Part")
        feature.flyPart.Name = "FlyPart"
        feature.flyPart.Anchored = true
        feature.flyPart.CanCollide = false
        feature.flyPart.Transparency = 1
        feature.flyPart.Size = Vector3.new(2, 1, 1)
        feature.flyPart.Parent = workspace
        
        feature.connection = game:GetService("RunService").Heartbeat:Connect(function()
            if not feature.enabled then
                return
            end
            
            local moveVector = Vector3.new(0, 0, 0)
            
            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) then
                moveVector = moveVector + rootPart.CFrame.LookVector
            end
            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S) then
                moveVector = moveVector - rootPart.CFrame.LookVector
            end
            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.A) then
                moveVector = moveVector - rootPart.CFrame.RightVector
            end
            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.D) then
                moveVector = moveVector + rootPart.CFrame.RightVector
            end
            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Space) then
                moveVector = moveVector + Vector3.new(0, 1, 0)
            end
            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftShift) then
                moveVector = moveVector - Vector3.new(0, 1, 0)
            end
            
            if moveVector.Magnitude > 0 then
                moveVector = moveVector.Unit * feature.flySpeed
                rootPart.CFrame = rootPart.CFrame + moveVector * game:GetService("RunService").Heartbeat:Wait()
            end
            
            feature.flyPart.Position = rootPart.Position
        end)
        
        featureCards.Fly.status.Text = "Status: Flying (WASD + Space/Shift)"
    else
        feature.enabled = false
        if feature.connection then
            feature.connection:Disconnect()
        end
        if feature.flyPart then
            feature.flyPart:Destroy()
        end
        featureCards.Fly.status.Text = "Status: Disabled"
    end
end

function toggleSpeed(enabled)
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    
    if enabled then
        features.speed.enabled = true
        humanoid.WalkSpeed = 32 -- 2x speed
        featureCards.Speed.status.Text = "Status: 2x Speed Enabled"
    else
        features.speed.enabled = false
        humanoid.WalkSpeed = 16 -- normal speed
        featureCards.Speed.status.Text = "Status: Disabled"
    end
end

function toggleJumpPower(enabled)
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    
    if enabled then
        features.jumpPower.enabled = true
        humanoid.JumpPower = 100
        featureCards.JumpPower.status.Text = "Status: High Jump Enabled"
    else
        features.jumpPower.enabled = false
        humanoid.JumpPower = 50
        featureCards.JumpPower.status.Text = "Status: Disabled"
    end
end

function toggleNoclip(enabled)
    local character = player.Character or player.CharacterAdded:Wait()
    local feature = features.noclip
    
    if enabled then
        feature.enabled = true
        feature.connection = game:GetService("RunService").Stepped:Connect(function()
            if not feature.enabled then
                return
            end
            
            if character and character:FindFirstChild("HumanoidRootPart") then
                for _, part in pairs(character:GetDescendants()) do
                    if part:IsA("BasePart") and part.CanCollide then
                        part.CanCollide = false
                    end
                end
            end
        end)
        featureCards.Noclip.status.Text = "Status: Noclip Enabled"
    else
        feature.enabled = false
        if feature.connection then
            feature.connection:Disconnect()
        end
        if character then
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") and not part.CanCollide then
                    part.CanCollide = true
                end
            end
        end
        featureCards.Noclip.status.Text = "Status: Disabled"
    end
end

function toggleESP(enabled)
    local feature = features.esp
    
    if enabled then
        feature.enabled = true
        local players = game:GetService("Players")
        
        -- Create ESP for all players
        for _, targetPlayer in pairs(players:GetPlayers()) do
            if targetPlayer ~= player then
                createESPForPlayer(targetPlayer)
            end
        end
        
        -- Create ESP for new players
        players.PlayerAdded:Connect(function(targetPlayer)
            if feature.enabled then
                createESPForPlayer(targetPlayer)
            end
        end)
        
        featureCards.ESP.status.Text = "Status: ESP Enabled"
    else
        feature.enabled = false
        -- Remove all ESP
        for _, esp in pairs(feature.boxes) do
            if esp then
                esp:Destroy()
            end
        end
        feature.boxes = {}
        featureCards.ESP.status.Text = "Status: Disabled"
    end
end

function createESPForPlayer(targetPlayer)
    local character = targetPlayer.Character
    if not character then return end
    
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then return end
    
    -- Create ESP box
    local espBox = Instance.new("BoxHandleAdornment")
    espBox.Name = "ESPBox"
    espBox.Adornee = humanoidRootPart
    espBox.Size = Vector3.new(4, 6, 2)
    espBox.Color3 = targetPlayer.TeamColor.Color
    espBox.Transparency = 0.7
    espBox.AlwaysOnTop = true
    espBox.ZIndex = 10
    espBox.Parent = humanoidRootPart
    
    -- Create name tag
    local nameTag = Instance.new("BillboardGui")
    nameTag.Name = "ESPName"
    nameTag.Adornee = humanoidRootPart
    nameTag.Size = UDim2.new(0, 100, 0, 50)
    nameTag.StudsOffset = Vector3.new(0, 3, 0)
    nameTag.Parent = humanoidRootPart
    
    local nameLabel = Instance.new("TextLabel")
    nameLabel.Name = "NameLabel"
    nameLabel.Size = UDim2.new(1, 0, 1, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = targetPlayer.Name
    nameLabel.TextColor3 = Color3.new(1, 1, 1)
    nameLabel.TextStrokeTransparency = 0
    nameLabel.TextScaled = true
    nameLabel.Parent = nameTag
    
    table.insert(features.esp.boxes, espBox)
    table.insert(features.esp.boxes, nameTag)
end

-- Connect Toggle Buttons
featureCards.Fly.toggle.MouseButton1Click:Connect(function()
    local currentState = featureCards.Fly.toggle.Text == "ON"
    toggleFly(not currentState)
    featureCards.Fly.toggle.Text = not currentState and "ON" or "OFF"
    featureCards.Fly.toggle.BackgroundColor3 = not currentState and Color3.new(0.2, 0.5, 0.2) or Color3.new(0.3, 0.3, 0.3)
end)

featureCards.Speed.toggle.MouseButton1Click:Connect(function()
    local currentState = featureCards.Speed.toggle.Text == "ON"
    toggleSpeed(not currentState)
    featureCards.Speed.toggle.Text = not currentState and "ON" or "OFF"
    featureCards.Speed.toggle.BackgroundColor3 = not currentState and Color3.new(0.2, 0.5, 0.2) or Color3.new(0.3, 0.3, 0.3)
end)

featureCards.JumpPower.toggle.MouseButton1Click:Connect(function()
    local currentState = featureCards.JumpPower.toggle.Text == "ON"
    toggleJumpPower(not currentState)
    featureCards.JumpPower.toggle.Text = not currentState and "ON" or "OFF"
    featureCards.JumpPower.toggle.BackgroundColor3 = not currentState and Color3.new(0.2, 0.5, 0.2) or Color3.new(0.3, 0.3, 0.3)
end)

featureCards.Noclip.toggle.MouseButton1Click:Connect(function()
    local currentState = featureCards.Noclip.toggle.Text == "ON"
    toggleNoclip(not currentState)
    featureCards.Noclip.toggle.Text = not currentState and "ON" or "OFF"
    featureCards.Noclip.toggle.BackgroundColor3 = not currentState and Color3.new(0.2, 0.5, 0.2) or Color3.new(0.3, 0.3, 0.3)
end)

-- Add ESP card
local espCard, espToggle, espStatus = createFeatureCard("ESP", featureY)
featureCards.ESP = {card = espCard, toggle = espToggle, status = espStatus}
featureY = featureY + 130
contentArea.CanvasSize = UDim2.new(0, 0, 0, featureY)

espToggle.MouseButton1Click:Connect(function()
    local currentState = espToggle.Text == "ON"
    toggleESP(not currentState)
    espToggle.Text = not currentState and "ON" or "OFF"
    espToggle.BackgroundColor3 = not currentState and Color3.new(0.2, 0.5, 0.2) or Color3.new(0.3, 0.3, 0.3)
end)

-- Close Button
local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 10)
closeButton.BackgroundColor3 = Color3.new(0.8, 0.2, 0.2)
closeButton.BorderSizePixel = 0
closeButton.Text = "X"
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.TextScaled = true
closeButton.Font = Enum.Font.SourceSansBold
closeButton.Parent = mainFrame

closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- Notification
local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("ChatMakeSystemMessage", {
    Text = "[Global Script] GUI Loaded! Press X to close GUI";
    Color = Color3.new(0, 1, 0);
    Font = Enum.Font.SourceSansBold;
})

print("Global Script GUI loaded successfully!")
