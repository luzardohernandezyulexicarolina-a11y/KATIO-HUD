local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local BLUE = Color3.fromRGB(45, 160, 255)
local DARK = Color3.fromRGB(9, 12, 23)
local PANEL = Color3.fromRGB(19, 35, 58)

local old = playerGui:FindFirstChild("REAL_KATIO_HUB")
if old then old:Destroy() end

local gui = Instance.new("ScreenGui")
gui.Name = "REAL_KATIO_HUB"
gui.ResetOnSpawn = false
gui.DisplayOrder = 100
gui.Parent = playerGui

-- BOTON FLOTANTE
local open = Instance.new("TextButton")
open.Size = UDim2.fromOffset(52, 52)
open.Position = UDim2.new(0, 18, 0.4, 0)
open.Text = "K"
open.TextSize = 27
open.Font = Enum.Font.GothamBold
open.TextColor3 = BLUE
open.BackgroundColor3 = DARK
open.Parent = gui

Instance.new("UICorner", open).CornerRadius =
    UDim.new(1, 0)

local os = Instance.new("UIStroke", open)
os.Color = BLUE
os.Thickness = 2

-- VENTANA
local main = Instance.new("Frame")
main.Size = UDim2.fromOffset(390, 330)
main.Position = UDim2.new(0.5, -195, 0.5, -165)
main.BackgroundColor3 = DARK
main.Visible = false
main.ClipsDescendants = true
main.Parent = gui

Instance.new("UICorner", main).CornerRadius =
    UDim.new(0, 13)

local border = Instance.new("UIStroke", main)
border.Color = BLUE
border.Thickness = 2

-- FONDO: coloca aquí el ID de tu imagen
local bg = Instance.new("ImageLabel")
bg.Size = UDim2.fromScale(1, 1)
bg.BackgroundTransparency = 1
bg.Image = "rbxassetid://0"
bg.ScaleType = Enum.ScaleType.Crop
bg.Parent = main

local shade = Instance.new("Frame")
shade.Size = UDim2.fromScale(1, 1)
shade.BackgroundColor3 = DARK
shade.BackgroundTransparency = 0.22
shade.Parent = main

-- ENCABEZADO
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -55, 0, 48)
title.Position = UDim2.fromOffset(12, 3)
title.BackgroundTransparency = 1
title.Text = "REAL KATIO HUB"
title.TextColor3 = BLUE
title.Font = Enum.Font.GothamBold
title.TextSize = 23
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = shade

local close = Instance.new("TextButton")
close.Size = UDim2.fromOffset(36, 36)
close.Position = UDim2.new(1, -44, 0, 8)
close.Text = "X"
close.TextColor3 = Color3.new(1, 1, 1)
close.BackgroundColor3 = PANEL
close.Font = Enum.Font.GothamBold
close.TextSize = 18
close.Parent = shade

Instance.new("UICorner", close).CornerRadius =
    UDim.new(0, 7)

-- BARRA DE PESTAÑAS
local bar = Instance.new("Frame")
bar.Size = UDim2.new(1, -20, 0, 42)
bar.Position = UDim2.fromOffset(10, 55)
bar.BackgroundTransparency = 1
bar.Parent = shade

local barLayout = Instance.new("UIListLayout")
barLayout.FillDirection = Enum.FillDirection.Horizontal
barLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
barLayout.Padding = UDim.new(0, 7)
barLayout.Parent = bar

-- CONTENIDO
local content = Instance.new("Frame")
content.Size = UDim2.new(1, -20, 1, -110)
content.Position = UDim2.fromOffset(10, 103)
content.BackgroundColor3 = DARK
content.BackgroundTransparency = 0.12
content.Parent = shade

Instance.new("UICorner", content).CornerRadius =
    UDim.new(0, 9)

local pages = {}
local tabButtons = {}

local function makePage(name)
    local page = Instance.new("ScrollingFrame")
    page.Name = name
    page.Size = UDim2.fromScale(1, 1)
    page.BackgroundTransparency = 1
    page.BorderSizePixel = 0
    page.ScrollBarThickness = 3
    page.AutomaticCanvasSize = Enum.AutomaticSize.Y
    page.CanvasSize = UDim2.new()
    page.Visible = false
    page.Parent = content

    local padding = Instance.new("UIPadding")
    padding.PaddingTop = UDim.new(0, 12)
    padding.PaddingLeft = UDim.new(0, 10)
    padding.PaddingRight = UDim.new(0, 10)
    padding.Parent = page

    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 8)
    layout.Parent = page

    pages[name] = page
    return page
end

local function addLabel(page, message)
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -5, 0, 38)
    label.BackgroundTransparency = 1
    label.Text = message
    label.TextColor3 = Color3.new(1, 1, 1)
    label.Font = Enum.Font.GothamBold
    label.TextSize = 14
    label.Parent = page
    return label
end

local function addToggle(page, message)
    local active = false

    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -5, 0, 42)
    button.BackgroundColor3 = PANEL
    button.TextColor3 = Color3.new(1, 1, 1)
    button.Font = Enum.Font.GothamBold
    button.TextSize = 14
    button.Parent = page

    Instance.new("UICorner", button).CornerRadius =
        UDim.new(0, 7)

    local function refresh()
        button.Text = message .. (active and "   [ON]" or "   [OFF]")
        button.BackgroundColor3 = active and
            Color3.fromRGB(20, 95, 145) or PANEL
    end

    button.Activated:Connect(function()
        active = not active
        refresh()
    end)

    refresh()
    return button
end

-- PAGINAS
local home = makePage("HOME")
local exploits = makePage("EXPLOITS")
local playersPage = makePage("PLAYERS")

-- HOME
addLabel(home, "BIENVENIDO A REAL KATIO HUB")
addLabel(home, "CREADOR: REAL KATIO")
addLabel(home, "YOUTUBE: @RealKatioScripts")

-- EXPLOITS
addLabel(exploits, "CONTROLES VISUALES")
addToggle(exploits, "Efecto de brillo")
addToggle(exploits, "Borde azul")
addToggle(exploits, "Fondo oscuro")

-- PLAYERS
addLabel(playersPage, "HERRAMIENTAS DE PRACTICA")
addToggle(playersPage, "Círculo FOV visual")
addToggle(playersPage, "Indicadores de NPC")

-- NAVEGACION
local function selectPage(name)
    for tab, page in pairs(pages) do
        page.Visible = tab == name
    end

    for tab, button in pairs(tabButtons) do
        button.BackgroundColor3 =
            tab == name and BLUE or PANEL
    end
end

local function addTab(name)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1/3, -5, 1, 0)
    button.Text = name
    button.TextColor3 = Color3.new(1, 1, 1)
    button.BackgroundColor3 = PANEL
    button.Font = Enum.Font.GothamBold
    button.TextSize = 12
    button.Parent = bar

    Instance.new("UICorner", button).CornerRadius =
        UDim.new(0, 7)

    tabButtons[name] = button

    button.Activated:Connect(function()
        selectPage(name)
    end)
end

addTab("HOME")
addTab("EXPLOITS")
addTab("PLAYERS")

selectPage("HOME")

-- ABRIR Y CERRAR
open.Activated:Connect(function()
    main.Visible = not main.Visible
end)

close.Activated:Connect(function()
    main.Visible = false
end)

-- ARRASTRAR
local dragging = false
local dragStart
local initialPosition

title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        initialPosition = main.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch
    ) then
        local delta = input.Position - dragStart
        main.Position = UDim2.new(
            initialPosition.X.Scale,
            initialPosition.X.Offset + delta.X,
            initialPosition.Y.Scale,
            initialPosition.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

print("REAL KATIO HUB V1 READY")
