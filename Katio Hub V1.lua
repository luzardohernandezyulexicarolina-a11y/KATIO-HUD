--========================================
--          REAL KATIO HUB V1
--========================================

local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- KEY ORIGINAL: SIN CAMBIOS
local CorrectKey = "KATIOHUBV1FREE"
local KeyLink = "https://link-center.net/10742409/nKwAHWLgNMDo"

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

-- KEY SYSTEM
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

-- MAIN MENU
local function LoadHub()
    KeyFrame:Destroy()

    local Main = Instance.new("Frame")
    Main.Parent = Gui
    Main.Size = UDim2.new(.88,0,.62,0)
    Main.Position = UDim2.new(.06,0,.19,0)
    Main.BackgroundColor3 = Dark
    Main.ClipsDescendants = true
    Corner(Main,15)
    Border(Main)

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

    local Header = Instance.new("Frame")
    Header.Parent = Main
    Header.Size = UDim2.new(1,0,0,50)
    Header.BackgroundColor3 = Dark
    Header.BackgroundTransparency = .15

    local Title = Label(Header,"KATIO | HUB V1",23)
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Position = UDim2.new(0,12,0,5)

    -- BOTÓN FLOTANTE K
    local Reopen = Instance.new("TextButton")
    Reopen.Parent = Gui
    Reopen.Size = UDim2.fromOffset(58,58)
    Reopen.Position = UDim2.new(0,15,.5,-29)
    Reopen.BackgroundColor3 = Dark
    Reopen.Text = "K"
    Reopen.TextColor3 = Cyan
    Reopen.Font = Enum.Font.GothamBlack
    Reopen.TextSize = 30
    Reopen.Visible = false
    Corner(Reopen,50)
    Border(Reopen)

    local Abrir = Instance.new("TextLabel")
    Abrir.Parent = Reopen
    Abrir.BackgroundTransparency = 1
    Abrir.Size = UDim2.new(1,0,0,15)
    Abrir.Position = UDim2.new(0,0,1,-16)
    Abrir.Text = "ABRIR"
    Abrir.TextColor3 = White
    Abrir.Font = Enum.Font.GothamBold
    Abrir.TextSize = 8

    Reopen.MouseButton1Click:Connect(function()
        Main.Visible = true
        Reopen.Visible = false
    end)

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
        Main.Visible = false
        Reopen.Visible = true
    end)

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

    local function PlayerOptions()
        Clear()
        Section("PLAYER OPTIONS")

        local flying = false
        local flyConnection
        local bodyVelocity
        local bodyGyro

        Option("FLY: OFF",function(button)
            flying = not flying
            button.Text = flying and "FLY: ON" or "FLY: OFF"

            local character = Player.Character
            local root = character and character:FindFirstChild("HumanoidRootPart")
            local hum = character and character:FindFirstChildOfClass("Humanoid")

            if not root or not hum then
                flying = false
                button.Text = "FLY: OFF"
                return
            end

            if flying then
                bodyVelocity = Instance.new("BodyVelocity")
                bodyVelocity.MaxForce = Vector3.new(1e5,1e5,1e5)
                bodyVelocity.Velocity = Vector3.zero
                bodyVelocity.Parent = root

                bodyGyro = Instance.new("BodyGyro")
                bodyGyro.MaxTorque = Vector3.new(1e5,1e5,1e5)
                bodyGyro.P = 1e4
                bodyGyro.Parent = root

                flyConnection = RunService.RenderStepped:Connect(function()
                    if not flying or not root.Parent then return end

                    local camera = workspace.CurrentCamera
                    local direction = Vector3.zero

                    if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                        direction += camera.CFrame.LookVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                        direction -= camera.CFrame.LookVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                        direction += camera.CFrame.RightVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                        direction -= camera.CFrame.RightVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                        direction += Vector3.yAxis
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
                        direction -= Vector3.yAxis
                    end

                    bodyVelocity.Velocity = direction.Magnitude > 0
                        and direction.Unit * 50 or Vector3.zero
                    bodyGyro.CFrame = camera.CFrame
                end)
            else
                if flyConnection then flyConnection:Disconnect() end
                if bodyVelocity then bodyVelocity:Destroy() end
                if bodyGyro then bodyGyro:Destroy() end
            end
        end)

        local invincible = false
        Option("INVINCIBLE: OFF",function(button)
            invincible = not invincible
            button.Text = invincible and "INVINCIBLE: ON" or "INVINCIBLE: OFF"

            local hum = Player.Character and
                Player.Character:FindFirstChildOfClass("Humanoid")

            if hum then
                hum:SetAttribute("KatioInvincibleRequested",invincible)
                if invincible then
                    hum.MaxHealth = 1000000
                    hum.Health = hum.MaxHealth
                else
                    hum.MaxHealth = 100
                    hum.Health = math.min(hum.Health,100)
                end
            end
        end)

        local sp = false
        Option("SP: OFF",function(button)
            sp = not sp
            button.Text = sp and "SP: ON" or "SP: OFF"
        end)
    end

    local function Visuals()
        Clear()
        Section("VISUALS")

        local enabled = false
        local oldBrightness = Lighting.Brightness
        local fullBrightButton

        fullBrightButton = Option("FULL BRIGHT: OFF",function()
            enabled = not enabled
            Lighting.Brightness = enabled and 2 or oldBrightness
            fullBrightButton.Text =
                "FULL BRIGHT: " .. (enabled and "ON" or "OFF")
        end)
    end

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
            Main.Visible = false
            Reopen.Visible = true
        end)
    end

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
            Option("PLAYER OPTIONS",PlayerOptions)
            Option("VISUALS",Visuals)
            Option("UTILITY",Utility)
        end},
        {"COMBAT",Combat},
        {"MOVEMENT",Movement},
        {"PLAYER",PlayerOptions},
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
