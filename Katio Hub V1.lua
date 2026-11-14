local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- CONFIGURACION
local BLUE = Color3.fromRGB(65, 165, 255)
local DARK = Color3.fromRGB(5, 7, 20)
local BUTTON = Color3.fromRGB(23, 58, 91)

-- LIMPIAR VERSION ANTERIOR
local old = playerGui:FindFirstChild("REAL_KATIO_HUB")
if old then old:Destroy() end

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "REAL_KATIO_HUB"
gui.ResetOnSpawn = false
gui.Parent = playerGui

-- BOTON FLOTANTE
local open = Instance.new("TextButton")
open.Size = UDim2.fromOffset(54, 54)
open.Position = UDim2.new(0, 20, 0.4, 0)
open.Text = "K"
open.TextSize = 27
open.Font = Enum.Font.GothamBold
open.TextColor3 = BLUE
open.BackgroundColor3 = DARK
open.Parent = gui

Instance.new("UICorner", open).CornerRadius =
    UDim.new(1, 0)

local openStroke = Instance.new("UIStroke")
openStroke.Color = BLUE
openStroke.Thickness = 2
openStroke.Parent = open

-- MENU PRINCIPAL
local main = Instance.new("Frame")
main.Name = "Main"
main.Size = UDim2.new(0.86, 0, 0.72, 0)
main.Position = UDim2.new(0.07, 0, 0.14, 0)
main.BackgroundColor3 = DARK
main.Visible = false
main.ClipsDescendants = true
main.Parent = gui

Instance.new("UICorner", main).CornerRadius =
    UDim.new(0, 14)

local stroke = Instance.new("UIStroke")
stroke.Color = BLUE
stroke.Thickness = 2
stroke.Parent = main

local limit = Instance.new("UISizeConstraint")
limit.MinSize = Vector2.new(300, 270)
limit.MaxSize = Vector2.new(650, 500)
limit.Parent = main

-- FONDO
local background = Instance.new("ImageLabel")
background.Name = "Background"
background.Size = UDim2.fromScale(1, 1)
background.BackgroundTransparency = 1
background.Image = "rbxassetid://0"
background.ScaleType = Enum.ScaleType.Crop
background.ZIndex = 1
background.Parent = main

-- CAPA OSCURA
local shade = Instance.new("Frame")
shade.Size = UDim2.fromScale(1, 1)
shade.BackgroundColor3 = DARK
shade.BackgroundTransparency = 0.24
shade.BorderSizePixel = 0
shade.ZIndex = 2
shade.Parent = main

-- TITULO
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -65, 0, 55)
title.Position = UDim2.fromOffset(10, 5)
title.BackgroundTransparency = 1
title.Text = "REAL KATIO HUB"
title.TextColor3 = BLUE
title.TextSize = 24
title.Font = Enum.Font.GothamBold
title.ZIndex = 4
title.Parent = shade

-- CERRAR
local close = Instance.new("TextButton")
close.Size = UDim2.fromOffset(42, 42)
close.Position = UDim2.new(1, -52, 0, 10)
close.Text = "X"
close.TextColor3 = Color3.new(1,1,1)
close.TextSize = 20
close.BackgroundColor3 = Color3.fromRGB(35,35,50)
close.ZIndex = 5
close.Parent = shade

Instance.new("UICorner", close).CornerRadius =
    UDim.new(0, 7)

-- BARRA DE PESTAÑAS
local tabBar = Instance.new("Frame")
tabBar.Size = UDim2.new(1, -24, 0, 48)
tabBar.Position = UDim2.fromOffset(12, 68)
tabBar.BackgroundTransparency = 1
tabBar.ZIndex = 4
tabBar.Parent = shade

local tabLayout = Instance.new("UIListLayout")
tabLayout.FillDirection = Enum.FillDirection.Horizontal
tabLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
tabLayout.Padding = UDim.new(0, 8)
tabLayout.Parent = tabBar

-- AREA DE CONTENIDO
local content = Instance.new("Frame")
content.Size = UDim2.new(1, -24, 1, -130)
content.Position = UDim2.fromOffset(12, 122)
content.BackgroundColor3 = Color3.fromRGB(9, 13, 28)
content.BackgroundTransparency = 0.15
content.BorderSizePixel = 0
content.ZIndex = 3
content.Parent = shade

Instance.new("UICorner", content).CornerRadius =
    UDim.new(0, 9)

-- CREAR PAGINAS
local pages = {}
local tabButtons = {}

local function createPage(name)
    local page = Instance.new("ScrollingFrame")
    page.Name = name
    page.Size = UDim2.fromScale(1, 1)
    page.BackgroundTransparency = 1
    page.BorderSizePixel = 0
    page.ScrollBarThickness = 4
    page.AutomaticCanvasSize = Enum.AutomaticSize.Y
    page.CanvasSize = UDim2.new()
    page.Visible = false
    page.ZIndex = 4
    page.Parent = content

    local padding = Instance.new("UIPadding")
    padding.PaddingTop = UDim.new(0, 12)
    padding.PaddingLeft = UDim.new(0, 12)
    padding.PaddingRight = UDim.new(0, 12)
    padding.PaddingBottom = UDim.new(0, 12)
    padding.Parent = page

    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 9)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Parent = page

    pages[name] = page
    return page
end

-- TEXTOS DE CADA PAGINA
local function addText(page, text)
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -5, 0, 45)
    label.BackgroundColor3 = BUTTON
    label.Text = text
    label.TextColor3 = Color3.new(1,1,1)
    label.TextSize = 14
    label.Font = Enum.Font.GothamBold
    label.TextWrapped = true
    label.ZIndex = 5
    label.Parent = page

    Instance.new("UICorner", label).CornerRadius =
        UDim.new(0, 7)

    return label
end

-- PAGINAS
local localPage = createPage("LOCAL")
local exploitsPage = createPage("EXPLOITS")
local playersPage = createPage("PLAYERS")

-- LOCAL
addText(localPage, "BIENVENIDO A REAL KATIO HUB")
addText(localPage, "CREADOR: REAL KATIO")
addText(localPage, "YOUTUBE: @RealKatioScripts")

-- EXPLOITS
addText(exploitsPage, "MECANICAS DE TU EXPERIENCIA")
addText(exploitsPage, "Aquí puedes integrar funciones autorizadas de tu propio juego.")
addText(exploitsPage, "Las acciones de personaje necesitan implementación en el juego.")

-- PLAYERS
addText(playersPage, "PANEL DE JUGADORES")
addText(playersPage, "FOV VISUAL")
addText(playersPage, "PRACTICA CON NPCs")

-- CAMBIAR DE PESTAÑA
local function selectTab(name)
    for tab, page in pairs(pages) do
        page.Visible = (tab == name)
    end

    for tab, button in pairs(tabButtons) do
        button.BackgroundColor3 =
            tab == name and BLUE or BUTTON
    end
end

-- CREAR BOTONES
local function createTab(name)
    local button = Instance.new("TextButton")
    button.Name = name
    button.Size = UDim2.new(1/3, -8, 1, 0)
    button.Text = name
    button.TextColor3 = Color3.new(1,1,1)
    button.TextSize = 13
    button.Font = Enum.Font.GothamBold
    button.BackgroundColor3 = BUTTON
    button.ZIndex = 5
    button.Parent = tabBar

    Instance.new("UICorner", button).CornerRadius =
        UDim.new(0, 8)

    tabButtons[name] = button

    button.Activated:Connect(function()
        selectTab(name)
    end)
end

createTab("LOCAL")
createTab("EXPLOITS")
createTab("PLAYERS")

selectTab("LOCAL")

-- ABRIR Y CERRAR
open.Activated:Connect(function()
    main.Visible = not main.Visible
end)

close.Activated:Connect(function()
    main.Visible = false
end)

-- ARRASTRAR CON MOUSE O DEDO
local dragging = false
local dragStart
local startPosition

title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then

        dragging = true
        dragStart = input.Position
        startPosition = main.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch
    ) then
        local delta = input.Position - dragStart

        main.Position = UDim2.new(
            startPosition.X.Scale,
            startPosition.X.Offset + delta.X,
            startPosition.Y.Scale,
            startPosition.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

print("REAL KATIO HUB V3 LOADED")
--========================================
--          REAL KATIO HUB V3
--========================================

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- CONFIGURACION
local BLUE = Color3.fromRGB(65, 165, 255)
local DARK = Color3.fromRGB(5, 7, 20)
local BUTTON = Color3.fromRGB(23, 58, 91)

-- LIMPIAR VERSION ANTERIOR
local old = playerGui:FindFirstChild("REAL_KATIO_HUB")
if old then old:Destroy() end

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "REAL_KATIO_HUB"
gui.ResetOnSpawn = false
gui.Parent = playerGui

-- BOTON FLOTANTE
local open = Instance.new("TextButton")
open.Size = UDim2.fromOffset(54, 54)
open.Position = UDim2.new(0, 20, 0.4, 0)
open.Text = "K"
open.TextSize = 27
open.Font = Enum.Font.GothamBold
open.TextColor3 = BLUE
open.BackgroundColor3 = DARK
open.Parent = gui

Instance.new("UICorner", open).CornerRadius =
    UDim.new(1, 0)

local openStroke = Instance.new("UIStroke")
openStroke.Color = BLUE
openStroke.Thickness = 2
openStroke.Parent = open

-- MENU PRINCIPAL
local main = Instance.new("Frame")
main.Name = "Main"
main.Size = UDim2.new(0.86, 0, 0.72, 0)
main.Position = UDim2.new(0.07, 0, 0.14, 0)
main.BackgroundColor3 = DARK
main.Visible = false
main.ClipsDescendants = true
main.Parent = gui

Instance.new("UICorner", main).CornerRadius =
    UDim.new(0, 14)

local stroke = Instance.new("UIStroke")
stroke.Color = BLUE
stroke.Thickness = 2
stroke.Parent = main

local limit = Instance.new("UISizeConstraint")
limit.MinSize = Vector2.new(300, 270)
limit.MaxSize = Vector2.new(650, 500)
limit.Parent = main

-- FONDO
local background = Instance.new("ImageLabel")
background.Name = "Background"
background.Size = UDim2.fromScale(1, 1)
background.BackgroundTransparency = 1
background.Image = "rbxassetid://0"
background.ScaleType = Enum.ScaleType.Crop
background.ZIndex = 1
background.Parent = main

-- CAPA OSCURA
local shade = Instance.new("Frame")
shade.Size = UDim2.fromScale(1, 1)
shade.BackgroundColor3 = DARK
shade.BackgroundTransparency = 0.24
shade.BorderSizePixel = 0
shade.ZIndex = 2
shade.Parent = main

-- TITULO
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -65, 0, 55)
title.Position = UDim2.fromOffset(10, 5)
title.BackgroundTransparency = 1
title.Text = "REAL KATIO HUB"
title.TextColor3 = BLUE
title.TextSize = 24
title.Font = Enum.Font.GothamBold
title.ZIndex = 4
title.Parent = shade

-- CERRAR
local close = Instance.new("TextButton")
close.Size = UDim2.fromOffset(42, 42)
close.Position = UDim2.new(1, -52, 0, 10)
close.Text = "X"
close.TextColor3 = Color3.new(1,1,1)
close.TextSize = 20
close.BackgroundColor3 = Color3.fromRGB(35,35,50)
close.ZIndex = 5
close.Parent = shade

Instance.new("UICorner", close).CornerRadius =
    UDim.new(0, 7)

-- BARRA DE PESTAÑAS
local tabBar = Instance.new("Frame")
tabBar.Size = UDim2.new(1, -24, 0, 48)
tabBar.Position = UDim2.fromOffset(12, 68)
tabBar.BackgroundTransparency = 1
tabBar.ZIndex = 4
tabBar.Parent = shade

local tabLayout = Instance.new("UIListLayout")
tabLayout.FillDirection = Enum.FillDirection.Horizontal
tabLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
tabLayout.Padding = UDim.new(0, 8)
tabLayout.Parent = tabBar

-- AREA DE CONTENIDO
local content = Instance.new("Frame")
content.Size = UDim2.new(1, -24, 1, -130)
content.Position = UDim2.fromOffset(12, 122)
content.BackgroundColor3 = Color3.fromRGB(9, 13, 28)
content.BackgroundTransparency = 0.15
content.BorderSizePixel = 0
content.ZIndex = 3
content.Parent = shade

Instance.new("UICorner", content).CornerRadius =
    UDim.new(0, 9)

-- CREAR PAGINAS
local pages = {}
local tabButtons = {}

local function createPage(name)
    local page = Instance.new("ScrollingFrame")
    page.Name = name
    page.Size = UDim2.fromScale(1, 1)
    page.BackgroundTransparency = 1
    page.BorderSizePixel = 0
    page.ScrollBarThickness = 4
    page.AutomaticCanvasSize = Enum.AutomaticSize.Y
    page.CanvasSize = UDim2.new()
    page.Visible = false
    page.ZIndex = 4
    page.Parent = content

    local padding = Instance.new("UIPadding")
    padding.PaddingTop = UDim.new(0, 12)
    padding.PaddingLeft = UDim.new(0, 12)
    padding.PaddingRight = UDim.new(0, 12)
    padding.PaddingBottom = UDim.new(0, 12)
    padding.Parent = page

    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 9)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Parent = page

    pages[name] = page
    return page
end

-- TEXTOS DE CADA PAGINA
local function addText(page, text)
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -5, 0, 45)
    label.BackgroundColor3 = BUTTON
    label.Text = text
    label.TextColor3 = Color3.new(1,1,1)
    label.TextSize = 14
    label.Font = Enum.Font.GothamBold
    label.TextWrapped = true
    label.ZIndex = 5
    label.Parent = page

    Instance.new("UICorner", label).CornerRadius =
        UDim.new(0, 7)

    return label
end

-- PAGINAS
local localPage = createPage("LOCAL")
local exploitsPage = createPage("EXPLOITS")
local playersPage = createPage("PLAYERS")

-- LOCAL
addText(localPage, "BIENVENIDO A REAL KATIO HUB")
addText(localPage, "CREADOR: REAL KATIO")
addText(localPage, "YOUTUBE: @RealKatioScripts")

-- EXPLOITS
addText(exploitsPage, "MECANICAS DE TU EXPERIENCIA")
addText(exploitsPage, "Aquí puedes integrar funciones autorizadas de tu propio juego.")
addText(exploitsPage, "Las acciones de personaje necesitan implementación en el juego.")

-- PLAYERS
addText(playersPage, "PANEL DE JUGADORES")
addText(playersPage, "FOV VISUAL")
addText(playersPage, "PRACTICA CON NPCs")

-- CAMBIAR DE PESTAÑA
local function selectTab(name)
    for tab, page in pairs(pages) do
        page.Visible = (tab == name)
    end

    for tab, button in pairs(tabButtons) do
        button.BackgroundColor3 =
            tab == name and BLUE or BUTTON
    end
end

-- CREAR BOTONES
local function createTab(name)
    local button = Instance.new("TextButton")
    button.Name = name
    button.Size = UDim2.new(1/3, -8, 1, 0)
    button.Text = name
    button.TextColor3 = Color3.new(1,1,1)
    button.TextSize = 13
    button.Font = Enum.Font.GothamBold
    button.BackgroundColor3 = BUTTON
    button.ZIndex = 5
    button.Parent = tabBar

    Instance.new("UICorner", button).CornerRadius =
        UDim.new(0, 8)

    tabButtons[name] = button

    button.Activated:Connect(function()
        selectTab(name)
    end)
end

createTab("LOCAL")
createTab("EXPLOITS")
createTab("PLAYERS")

selectTab("LOCAL")

-- ABRIR Y CERRAR
open.Activated:Connect(function()
    main.Visible = not main.Visible
end)

close.Activated:Connect(function()
    main.Visible = false
end)

-- ARRASTRAR CON MOUSE O DEDO
local dragging = false
local dragStart
local startPosition

title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then

        dragging = true
        dragStart = input.Position
        startPosition = main.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch
    ) then
        local delta = input.Position - dragStart

        main.Position = UDim2.new(
            startPosition.X.Scale,
            startPosition.X.Offset + delta.X,
            startPosition.Y.Scale,
            startPosition.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

print("REAL KATIO HUB V1 LOADED")
