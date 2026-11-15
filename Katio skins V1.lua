
--==================================================
--             KATIO SKIN HUB V1
--                 BROOKHAVEN
--==================================================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local Purple = Color3.fromRGB(145, 65, 255)
local Dark = Color3.fromRGB(18, 15, 27)
local Card = Color3.fromRGB(34, 28, 46)
local White = Color3.fromRGB(255, 255, 255)

local Skins = {
    EMO = {
        {Name = "Emo Black", Description = "Estilo negro y oscuro"},
        {Name = "Purple Emo", Description = "Estilo emo morado"},
        {Name = "Dark Emo", Description = "Estilo oscuro"},
    },

    PREPPY = {
        {Name = "Pink Preppy", Description = "Estilo rosa"},
        {Name = "Classic Preppy", Description = "Estilo clásico"},
    },

    CUTE = {
        {Name = "Cute Pink", Description = "Estilo adorable"},
        {Name = "Soft Cute", Description = "Estilo suave"},
    },

    DARK = {
        {Name = "Dark Street", Description = "Estilo urbano"},
        {Name = "Black Style", Description = "Estilo negro"},
    },

    AESTHETIC = {
        {Name = "Soft Aesthetic", Description = "Estilo aesthetic"},
        {Name = "Purple Aesthetic", Description = "Estilo morado"},
    }
}

local GUI = Instance.new("ScreenGui")
GUI.Name = "KATIO_SKIN_HUB"
GUI.ResetOnSpawn = false
GUI.Parent = PlayerGui

local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 420, 0, 330)
Main.Position = UDim2.new(0.5, -210, 0.5, -165)
Main.BackgroundColor3 = Dark
Main.BorderSizePixel = 0
Main.Parent = GUI

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 14)
Corner.Parent = Main

local Stroke = Instance.new("UIStroke")
Stroke.Color = Purple
Stroke.Thickness = 2
Stroke.Parent = Main

local Header = Instance.new("TextLabel")
Header.Size = UDim2.new(1, -50, 0, 48)
Header.Position = UDim2.new(0, 12, 0, 0)
Header.BackgroundTransparency = 1
Header.Text = "KATIO SKIN HUB V1"
Header.TextColor3 = White
Header.Font = Enum.Font.GothamBold
Header.TextSize = 19
Header.TextXAlignment = Enum.TextXAlignment.Left
Header.Parent = Main

local Close = Instance.new("TextButton")
Close.Size = UDim2.new(0, 35, 0, 35)
Close.Position = UDim2.new(1, -42, 0, 7)
Close.BackgroundColor3 = Color3.fromRGB(190, 45, 65)
Close.Text = "X"
Close.TextColor3 = White
Close.Font = Enum.Font.GothamBold
Close.TextSize = 16
Close.Parent = Main

Close.MouseButton1Click:Connect(function()
    GUI:Destroy()
end)

local Categories = Instance.new("ScrollingFrame")
Categories.Size = UDim2.new(0, 125, 1, -65)
Categories.Position = UDim2.new(0, 10, 0, 55)
Categories.BackgroundColor3 = Card
Categories.BorderSizePixel = 0
Categories.ScrollBarThickness = 3
Categories.CanvasSize = UDim2.new(0, 0, 0, 350)
Categories.Parent = Main

local CategoryLayout = Instance.new("UIListLayout")
CategoryLayout.Padding = UDim.new(0, 7)
CategoryLayout.Parent = Categories

local List = Instance.new("ScrollingFrame")
List.Size = UDim2.new(1, -155, 1, -65)
List.Position = UDim2.new(0, 145, 0, 55)
List.BackgroundColor3 = Card
List.BorderSizePixel = 0
List.ScrollBarThickness = 3
List.Parent = Main

local ListLayout = Instance.new("UIListLayout")
ListLayout.Padding = UDim.new(0, 8)
ListLayout.Parent = List

local function ClearList()
    for _, item in ipairs(List:GetChildren()) do
        if item:IsA("TextButton") then
            item:Destroy()
        end
    end
end

local function ShowCategory(category)
    ClearList()

    for _, skin in ipairs(Skins[category]) do
        local Button = Instance.new("TextButton")
        Button.Size = UDim2.new(1, -12, 0, 65)
        Button.BackgroundColor3 = Dark
        Button.Text = ""
        Button.Parent = List

        local Name = Instance.new("TextLabel")
        Name.Size = UDim2.new(1, -10, 0, 28)
        Name.Position = UDim2.new(0, 10, 0, 5)
        Name.BackgroundTransparency = 1
        Name.Text = skin.Name
        Name.TextColor3 = White
        Name.Font = Enum.Font.GothamBold
        Name.TextSize = 14
        Name.TextXAlignment = Enum.TextXAlignment.Left
        Name.Parent = Button

        local Description = Instance.new("TextLabel")
        Description.Size = UDim2.new(1, -10, 0, 22)
        Description.Position = UDim2.new(0, 10, 0, 33)
        Description.BackgroundTransparency = 1
        Description.Text = skin.Description
        Description.TextColor3 = Color3.fromRGB(180, 170, 195)
        Description.Font = Enum.Font.Gotham
        Description.TextSize = 11
        Description.TextXAlignment = Enum.TextXAlignment.Left
        Description.Parent = Button

        Button.MouseButton1Click:Connect(function()
            Name.Text = skin.Name .. " ✓"
            print("Skin seleccionada: " .. skin.Name)
        end)
    end

    List.CanvasSize = UDim2.new(0, 0, 0, #Skins[category] * 73)
end

for category, _ in pairs(Skins) do
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, -10, 0, 42)
    Button.BackgroundColor3 = Purple
    Button.Text = category
    Button.TextColor3 = White
    Button.Font = Enum.Font.GothamBold
    Button.TextSize = 12
    Button.Parent = Categories

    Button.MouseButton1Click:Connect(function()
        ShowCategory(category)
    end)
end

ShowCategory("EMO")

print("KATIO SKIN HUB V1 cargado")
