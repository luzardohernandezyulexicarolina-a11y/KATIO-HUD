
--========================================
--          REAL KATIO HUB V1
--========================================

local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local CorrectKey = "KATIOHUBV1FREE"
local KeyLink = "https://link-center.net/10742409/nKwAHWLgNMDo"

-- Imagen alojada externamente.
-- Roblox puede requerir un asset ID propio.
local BackgroundURL =
"https://i.ibb.co/TDG2zyD1/file-0000000030a481f5816bb8331a7b033d.png"

local Cyan = Color3.fromRGB(0,220,255)
local Dark = Color3.fromRGB(8,12,20)
local White = Color3.fromRGB(255,255,255)

local Gui = Instance.new("ScreenGui")
Gui.Name = "KATIO_HUB"
Gui.ResetOnSpawn = false
Gui.Parent = PlayerGui

local function Corner(obj, radius)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0,radius)
    c.Parent = obj
end

local function Border(obj)
    local s = Instance.new("UIStroke")
    s.Color = Cyan
    s.Thickness = 2
    s.Parent = obj
end

local function Label(parent,text,size)
    local l = Instance.new("TextLabel")
    l.Parent = parent
    l.BackgroundTransparency = 1
    l.Size = UDim2.new(1,0,0,40)
    l.Text = text
    l.TextColor3 = White
    l.Font = Enum.Font.GothamBold
    l.TextSize = size
    return l
end

local function Button(parent,text)
    local b = Instance.new("TextButton")
    b.Parent = parent
    b.Size = UDim2.new(1,-12,0,42)
    b.BackgroundColor3 = Color3.fromRGB(5,35,52)
    b.Text = text
    b.TextColor3 = White
    b.Font = Enum.Font.GothamBold
    b.TextSize = 13
    Corner(b,8)
    Border(b)
    return b
end

--========================================
-- KEY SYSTEM
--========================================

local KeyFrame = Instance.new("Frame")
KeyFrame.Parent = Gui
KeyFrame.Size = UDim2.fromOffset(340,250)
KeyFrame.Position = UDim2.new(.5,-170,.5,-125)
KeyFrame.BackgroundColor3 = Dark
Corner(KeyFrame,16)
Border(KeyFrame)

Label(KeyFrame,"KATIO 🔓",30).Position =
    UDim2.new(0,0,0,15)

local Subtitle = Label(KeyFrame,"PREMIUM ACCESS",12)
Subtitle.Position = UDim2.new(0,0,0,55)

local Input = Instance.new("TextBox")
Input.Parent = KeyFrame
Input.Position = UDim2.new(.08,0,.38,0)
Input.Size = UDim2.new(.84,0,0,42)
Input.BackgroundColor3 = Color3.fromRGB(20,30,40)
Input.PlaceholderText = "ENTER YOUR KEY"
Input.Text = ""
Input.TextColor3 = White
Input.Font = Enum.Font.Gotham
Input.TextSize = 14
Corner(Input,8)

local GetKey = Button(KeyFrame,"GET KEY")
GetKey.Position = UDim2.new(.08,0,.68,0)
GetKey.Size = UDim2.new(.39,0,0,42)

local Unlock = Button(KeyFrame,"UNLOCK")
Unlock.Position = UDim2.new(.53,0,.68,0)
Unlock.Size = UDim2.new(.39,0,0,42)

local Status = Label(KeyFrame,"WAITING FOR KEY...",11)
Status.Position = UDim2.new(0,0,.88,0)

GetKey.MouseButton1Click:Connect(function()
    Status.Text = "KEY LINK: " .. KeyLink
end)

--========================================
-- MAIN MENU
--========================================

local function LoadHub()

    KeyFrame:Destroy()

    local Main = Instance.new("Frame")
    Main.Parent = Gui
    Main.Size = UDim2.new(.88,0,.72,0)
    Main.Position = UDim2.new(.06,0,.14,0)
    Main.BackgroundColor3 = Dark
    Main.ClipsDescendants = true
    Corner(Main,15)
    Border(Main)

    -- IMAGE BACKGROUND
    local Background = Instance.new("ImageLabel")
    Background.Parent = Main
    Background.Size = UDim2.new(1,0,1,0)
    Background.BackgroundTransparency = 1
    Background.Image = BackgroundURL
    Background.ScaleType = Enum.ScaleType.Crop

    local Shade = Instance.new("Frame")
    Shade.Parent = Main
    Shade.Size = UDim2.new(1,0,1,0)
    Shade.BackgroundColor3 = Dark
    Shade.BackgroundTransparency = .25

    -- HEADER
    local Header = Instance.new("Frame")
    Header.Parent = Main
    Header.Size = UDim2.new(1,0,0,50)
    Header.BackgroundColor3 = Dark
    Header.BackgroundTransparency = .15

    local Title = Label(Header,"KATIO 🔓",23)
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Position = UDim2.new(0,12,0,5)

    local Close = Instance.new("TextButton")
    Close.Parent = Header
    Close.Size = UDim2.fromOffset(35,35)
    Close.Position = UDim2.new(1,-43,0,7)
    Close.Text = "X"
    Close.TextColor3 = White
    Close.BackgroundColor3 = Color3.fromRGB(100,20,30)
    Close.Font = Enum.Font.GothamBold
    Corner(Close,8)

    Close.MouseButton1Click:Connect(function()
        Gui:Destroy()
    end)

    -- SIDEBAR
    local Side = Instance.new("Frame")
    Side.Parent = Main
    Side.Position = UDim2.new(0,8,0,58)
    Side.Size = UDim2.new(0,112,1,-66)
    Side.BackgroundColor3 = Dark
    Side.BackgroundTransparency = .15
    Corner(Side,10)

    local SideLayout = Instance.new("UIListLayout")
    SideLayout.Parent = Side
    SideLayout.Padding = UDim.new(0,8)

    local SidePadding = Instance.new("UIPadding")
    SidePadding.Parent = Side
    SidePadding.PaddingTop = UDim.new(0,10)
    SidePadding.PaddingLeft = UDim.new(0,6)
    SidePadding.PaddingRight = UDim.new(0,6)

    -- CONTENT
    local Content = Instance.new("ScrollingFrame")
    Content.Parent = Main
    Content.Position = UDim2.new(0,128,0,58)
    Content.Size = UDim2.new(1,-136,1,-66)
    Content.BackgroundColor3 = Dark
    Content.BackgroundTransparency = .18
    Content.BorderSizePixel = 0
    Content.ScrollBarThickness = 3
    Content.ScrollBarImageColor3 = Cyan

    local ContentLayout = Instance.new("UIListLayout")
    ContentLayout.Parent = Content
    ContentLayout.Padding = UDim.new(0,9)

    local ContentPadding = Instance.new("UIPadding")
    ContentPadding.Parent = Content
    ContentPadding.PaddingTop = UDim.new(0,10)
    ContentPadding.PaddingLeft = UDim.new(0,8)
    ContentPadding.PaddingRight = UDim.new(0,8)

    ContentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        Content.CanvasSize = UDim2.new(0,0,0,
            ContentLayout.AbsoluteContentSize.Y+20)
    end)

    local function Clear()
        for _,v in ipairs(Content:GetChildren()) do
            if v:IsA("GuiObject") and
                v ~= ContentLayout and v ~= ContentPadding then
                v:Destroy()
            end
        end
    end

    local function Section(text)
        local l = Label(Content,text,16)
        l.TextColor3 = Cyan
        l.TextXAlignment = Enum.TextXAlignment.Left
    end

    local function Option(text,callback)
        local b = Button(Content,text)
        b.MouseButton1Click:Connect(callback)
        return b
    end

    -- MOVEMENT
    local function Movement()
        Clear()
        Section("MOVEMENT")

        local speed = 16
        local jump = 50

        Option("WALK SPEED +",function()
            speed = math.min(speed+5,100)
            local hum = Player.Character and
                Player.Character:FindFirstChildOfClass("Humanoid")
            if hum then hum.WalkSpeed = speed end
        end)

        Option("WALK SPEED -",function()
            speed = math.max(speed-5,16)
            local hum = Player.Character and
                Player.Character:FindFirstChildOfClass("Humanoid")
            if hum then hum.WalkSpeed = speed end
        end)

        Option("JUMP POWER +",function()
            jump = math.min(jump+10,150)
            local hum = Player.Character and
                Player.Character:FindFirstChildOfClass("Humanoid")
            if hum then
                hum.UseJumpPower = true
                hum.JumpPower = jump
            end
        end)

        Option("JUMP POWER -",function()
            jump = math.max(jump-10,50)
            local hum = Player.Character and
                Player.Character:FindFirstChildOfClass("Humanoid")
            if hum then hum.JumpPower = jump end
        end)
    end

    -- VISUALS
    local function Visuals()
        Clear()
        Section("VISUALS")

        local enabled = false
        local oldBrightness = Lighting.Brightness

        Option("FULL BRIGHT: OFF",function()
            enabled = not enabled
            Lighting.Brightness = enabled and 2 or oldBrightness
            Content:FindFirstChildWhichIsA("TextButton").Text =
                "FULL BRIGHT: " .. (enabled and "ON" or "OFF")
        end)
    end

    -- UTILITY
    local function Utility()
        Clear()
        Section("UTILITY")

        Option("RESET CHARACTER",function()
            local hum = Player.Character and
                Player.Character:FindFirstChildOfClass("Humanoid")
            if hum then hum.Health = 0 end
        end)

        Option("REJOIN SERVER",function()
            game:GetService("TeleportService"):Teleport(
                game.PlaceId,Player)
        end)

        Option("CLOSE MENU",function()
            Gui:Destroy()
        end)
    end

    -- COMBAT
    local function Combat()
        Clear()
        Section("COMBAT")
        Option("COMBAT SETTINGS",function()
            Section("No combat actions are enabled.")
        end)
    end

    local tabs = {
        {"HOME",function()
            Clear()
            Section("WELCOME TO KATIO")
            Section("REAL KATIO HUB V1")
            Option("MOVEMENT",Movement)
            Option("VISUALS",Visuals)
            Option("UTILITY",Utility)
        end},
        {"COMBAT",Combat},
        {"MOVEMENT",Movement},
        {"VISUALS",Visuals},
        {"UTILITY",Utility}
    }

    for _,tab in ipairs(tabs) do
        local b = Button(Side,tab[1])
        b.Size = UDim2.new(1,0,0,38)
        b.MouseButton1Click:Connect(tab[2])
    end

    -- DRAG HEADER
    local dragging = false
    local dragStart, startPos

    Header.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
            or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = Main.Position
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and (
            input.UserInputType == Enum.UserInputType.MouseMovement
            or input.UserInputType == Enum.UserInputType.Touch) then

            local delta = input.Position-dragStart
            Main.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset+delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset+delta.Y
            )
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
            or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)

    tabs[1][2]()
end

--========================================
-- UNLOCK
--========================================

Unlock.MouseButton1Click:Connect(function()
    if Input.Text == CorrectKey then
        Status.Text = "ACCESS GRANTED!"
        Unlock.BackgroundColor3 = Color3.fromRGB(0,200,100)
        task.wait(.5)
        LoadHub()
    else
        Status.Text = "INVALID KEY!"
    end
end)
