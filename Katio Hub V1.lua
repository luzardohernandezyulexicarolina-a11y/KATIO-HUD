local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local GuiService = game:GetService("GuiService")

local player = Players.LocalPlayer
local channel = "https://www.youtube.com/@RealKatioScripts"

-- CAMBIA ESTO POR EL ID DE TU IMAGEN SUBIDA A ROBLOX
local BACKGROUND_IMAGE = "rbxassetid://0"

local gui = Instance.new("ScreenGui")
gui.Name = "RealKatioHubV1"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- BOTON YT FLOTANTE
local reopen = Instance.new("TextButton")
reopen.Name = "K"
reopen.Size = UDim2.fromOffset(52, 52)
reopen.Position = UDim2.new(0, 15, 0.5, 0)
reopen.BackgroundColor3 = Color3.fromRGB(5, 15, 30)
reopen.Text = "K"
reopen.TextColor3 = Color3.new(1,1,1)
reopen.TextSize = 19
reopen.Font = Enum.Font.GothamBold
reopen.Visible = false
reopen.Parent = gui

local reopenCorner = Instance.new("UICorner")
reopenCorner.CornerRadius = UDim.new(1, 0)
reopenCorner.Parent = reopen

local reopenStroke = Instance.new("UIStroke")
reopenStroke.Thickness = 2
reopenStroke.Parent = reopen

-- MENU PRINCIPAL
local main = Instance.new("Frame")
main.Name = "Main"
main.Size = UDim2.fromScale(0.72, 0.62)
main.Position = UDim2.fromScale(0.5, 0.5)
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.BackgroundColor3 = Color3.fromRGB(5, 10, 22)
main.ClipsDescendants = true
main.Parent = gui

local constraint = Instance.new("UISizeConstraint")
constraint.MinSize = Vector2.new(270, 300)
constraint.MaxSize = Vector2.new(430, 470)
constraint.Parent = main

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 13)
corner.Parent = main

local stroke = Instance.new("UIStroke")
stroke.Thickness = 2.5
stroke.Parent = main

-- FONDO
local background = Instance.new("ImageLabel")
background.Size = UDim2.fromScale(1, 1)
background.BackgroundTransparency = 1
background.Image = BACKGROUND_IMAGE
background.ScaleType = Enum.ScaleType.Crop
background.ImageTransparency = 0.18
background.Parent = main

local overlay = Instance.new("Frame")
overlay.Size = UDim2.fromScale(1, 1)
overlay.BackgroundColor3 = Color3.fromRGB(0, 5, 18)
overlay.BackgroundTransparency = 0.28
overlay.Parent = main

local overlayCorner = Instance.new("UICorner")
overlayCorner.CornerRadius = UDim.new(0, 13)
overlayCorner.Parent = overlay

-- TITULO
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -65, 0, 48)
title.Position = UDim2.fromOffset(12, 8)
title.BackgroundTransparency = 1
title.Text = "xX REAL KATIO HUB Xx"
title.TextColor3 = Color3.new(1,1,1)
title.TextSize = 19
title.Font = Enum.Font.GothamBlack
title.Parent = overlay

-- CERRAR
local close = Instance.new("TextButton")
close.Size = UDim2.fromOffset(35, 35)
close.Position = UDim2.new(1, -43, 0, 12)
close.BackgroundColor3 = Color3.fromRGB(20, 25, 40)
close.Text = "X"
close.TextColor3 = Color3.new(1,1,1)
close.TextSize = 18
close.Font = Enum.Font.GothamBold
close.Parent = overlay

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 8)
closeCorner.Parent = close

-- CONTENIDO
local content = Instance.new("Frame")
content.Size = UDim2.new(1, -24, 1, -75)
content.Position = UDim2.fromOffset(12, 65)
content.BackgroundTransparency = 1
content.Parent = overlay

local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0, 9)
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Parent = content

local function makeButton(name)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 0, 39)
    button.BackgroundColor3 = Color3.fromRGB(5, 20, 40)
    button.BackgroundTransparency = 0.12
    button.Text = name
    button.TextColor3 = Color3.new(1,1,1)
    button.TextSize = 14
    button.Font = Enum.Font.GothamBold
    button.Parent = content

    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 8)
    c.Parent = button

    local s = Instance.new("UIStroke")
    s.Thickness = 1
    s.Color = Color3.fromRGB(0, 180, 255)
    s.Parent = button

    return button
end

local home = makeButton("🏠  HOME")
local playerTab = makeButton("👤  JUGADOR")
local effects = makeButton("✨  EFECTOS")
local fly = makeButton("✈️  FLY")

-- ABRIR Y CERRAR
local function closeMenu()
    main.Visible = false
    reopen.Visible = true
end

local function openMenu()
    main.Visible = true
    reopen.Visible = false
end

close.MouseButton1Click:Connect(closeMenu)
reopen.MouseButton1Click:Connect(openMenu)

-- BOTON DEL CANAL
local welcome = Instance.new("Frame")
welcome.Size = UDim2.fromScale(1, 1)
welcome.BackgroundColor3 = Color3.fromRGB(3, 8, 22)
welcome.BackgroundTransparency = 0.08
welcome.ZIndex = 5
welcome.Parent = gui

local welcomeCorner = Instance.new("UICorner")
welcomeCorner.CornerRadius = UDim.new(0, 13)
welcomeCorner.Parent = welcome

local welcomeTitle = Instance.new("TextLabel")
welcomeTitle.Size = UDim2.new(1, -20, 0, 65)
welcomeTitle.Position = UDim2.fromOffset(10, 35)
welcomeTitle.BackgroundTransparency = 1
welcomeTitle.Text = "xX REAL KATIO HUB Xx"
welcomeTitle.TextColor3 = Color3.new(1,1,1)
welcomeTitle.TextSize = 22
welcomeTitle.Font = Enum.Font.GothamBlack
welcomeTitle.ZIndex = 6
welcomeTitle.Parent = welcome

local welcomeText = Instance.new("TextLabel")
welcomeText.Size = UDim2.new(1, -30, 0, 65)
welcomeText.Position = UDim2.fromOffset(15, 105)
welcomeText.BackgroundTransparency = 1
welcomeText.Text = "¡Bienvenido!\nVisita nuestro canal oficial"
welcomeText.TextColor3 = Color3.new(1,1,1)
welcomeText.TextSize = 15
welcomeText.Font = Enum.Font.Gotham
welcomeText.ZIndex = 6
welcomeText.Parent = welcome

local channelButton = Instance.new("TextButton")
channelButton.Size = UDim2.new(0.8, 0, 0, 48)
channelButton.Position = UDim2.new(0.1, 0, 0, 190)
channelButton.BackgroundColor3 = Color3.fromRGB(0, 100, 220)
channelButton.Text = "▶ VISITAR CANAL YOUTUBE"
channelButton.TextColor3 = Color3.new(1,1,1)
channelButton.TextSize = 13
channelButton.Font = Enum.Font.GothamBold
channelButton.ZIndex = 6
channelButton.Parent = welcome

local channelCorner = Instance.new("UICorner")
channelCorner.CornerRadius = UDim.new(0, 10)
channelCorner.Parent = channelButton

channelButton.MouseButton1Click:Connect(function()
    GuiService:OpenBrowserWindow(channel)
end)

local enter = Instance.new("TextButton")
enter.Size = UDim2.new(0.8, 0, 0, 42)
enter.Position = UDim2.new(0.1, 0, 0, 250)
enter.BackgroundColor3 = Color3.fromRGB(0, 160, 230)
enter.Text = "ENTRAR AL HUB"
enter.TextColor3 = Color3.new(1,1,1)
enter.TextSize = 15
enter.Font = Enum.Font.GothamBold
enter.ZIndex = 6
enter.Parent = welcome

local enterCorner = Instance.new("UICorner")
enterCorner.CornerRadius = UDim.new(0, 10)
enterCorner.Parent = enter

enter.MouseButton1Click:Connect(function()
    welcome:Destroy()
    openMenu()
end)

-- BORDE RGB ANIMADO
local hue = 0

RunService.RenderStepped:Connect(function(dt)
    hue = (hue + dt * 0.25) % 1
    local color = Color3.fromHSV(hue, 1, 1)
    stroke.Color = color
    reopenStroke.Color = color
end)

print("REAL KATIO HUB V5 iniciado")
