local Players = game:GetService("Players")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "RealKatioHub"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- Botón flotante
local open = Instance.new("TextButton")
open.Size = UDim2.fromOffset(48, 48)
open.Position = UDim2.new(0, 20, 0.4, 0)
open.Text = "ABRIR..."
open.TextSize = 25
open.TextColor3 = Color3.new(1, 1, 1)
open.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
open.Parent = gui

Instance.new("UICorner", open).CornerRadius = UDim.new(1, 0)

-- Menú principal
local main = Instance.new("Frame")
main.Size = UDim2.fromOffset(440, 290)
main.Position = UDim2.new(0.5, -220, 0.5, -145)
main.BackgroundColor3 = Color3.fromRGB(12, 12, 20)
main.Visible = false
main.ClipsDescendants = true
main.Parent = gui

Instance.new("UICorner", main).CornerRadius = UDim.new(0, 14)

-- IMAGEN DE FONDO
local background = Instance.new("ImageLabel")
background.Name = "MenuBackground"
background.Size = UDim2.fromScale(1, 1)
background.Position = UDim2.fromScale(0, 0)
background.BackgroundTransparency = 1
background.Image = "rbxassetid://0" -- Coloca aquí el ID de tu imagen
background.ScaleType = Enum.ScaleType.Crop
background.Parent = main

-- Oscurecer un poco la imagen
local overlay = Instance.new("Frame")
overlay.Size = UDim2.fromScale(1, 1)
overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 15)
overlay.BackgroundTransparency = 0.35
overlay.Parent = main

-- Título
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -50, 0, 45)
title.Position = UDim2.fromOffset(12, 5)
title.BackgroundTransparency = 1
title.Text = "REAL KATIO HUB"
title.TextColor3 = Color3.fromRGB(80, 180, 255)
title.TextSize = 23
title.Font = Enum.Font.GothamBold
title.Parent = overlay

-- Botón cerrar
local close = Instance.new("TextButton")
close.Size = UDim2.fromOffset(35, 35)
close.Position = UDim2.new(1, -40, 0, 8)
close.Text = "X"
close.TextColor3 = Color3.new(1, 1, 1)
close.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
close.Parent = overlay

-- Pestañas
local tabs = {"HOME", "EXPLOITS", "PLAYERS"}

for i, name in ipairs(tabs) do
    local button = Instance.new("TextButton")
    button.Size = UDim2.fromOffset(125, 38)
    button.Position = UDim2.fromOffset(10 + (i-1)*135, 65)
    button.Text = name
    button.TextColor3 = Color3.new(1, 1, 1)
    button.BackgroundColor3 = Color3.fromRGB(20, 55, 90)
    button.Font = Enum.Font.GothamBold
    button.Parent = overlay
    Instance.new("UICorner", button).CornerRadius = UDim.new(0, 7)
end

open.MouseButton1Click:Connect(function()
    main.Visible = not main.Visible
end)

close.MouseButton1Click:Connect(function()
    main.Visible = false
end)
