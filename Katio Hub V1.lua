-- // KATIO HUB | V1 HUB //
local CorrectKey = "KATIOHUBV1FREE"
local KeyLink = "https://link-center.net/10742409/nKwAHWLgNMDo"

-- // 1. ULTRA EYECATCHING CUSTOM KEY UI //
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local UIGradient = Instance.new("UIGradient")
local Glow = Instance.new("ImageLabel")

ScreenGui.Name = "KATIOHUB_PremiumAccess"
ScreenGui.Parent = game.CoreGui

-- Main Frame with Glow Effect
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
MainFrame.Position = UDim2.new(0.5, -180, 0.5, -130)
MainFrame.Size = UDim2.new(0, 360, 0, 260)
MainFrame.Active = true
MainFrame.Draggable = true

UICorner.CornerRadius = UDim.new(0, 20)
UICorner.Parent = MainFrame

-- Neon Border
UIStroke.Parent = MainFrame
UIStroke.Thickness = 3
UIStroke.Color = Color3.fromRGB(255, 255, 255)
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

UIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 255)), -- Cyan
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(170, 0, 255)), -- Purple
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 255))
}
UIGradient.Parent = UIStroke

-- Title Design
local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 60)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold
Title.Text = "KATIO"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 32
Title.ZIndex = 2

local Subtitle = Instance.new("TextLabel", MainFrame)
Subtitle.Size = UDim2.new(1, 0, 0, 20)
Subtitle.Position = UDim2.new(0, 0, 0, 50)
Subtitle.BackgroundTransparency = 1
Subtitle.Font = Enum.Font.Gotham
Subtitle.Text = "KEY SYSTEM KATIO"
Subtitle.TextColor3 = Color3.fromRGB(150, 150, 150)
Subtitle.TextSize = 12

-- Key Input (Modern Style)
local KeyInput = Instance.new("TextBox", MainFrame)
KeyInput.Size = UDim2.new(0.8, 0, 0, 45)
KeyInput.Position = UDim2.new(0.1, 0, 0.4, 0)
KeyInput.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
KeyInput.PlaceholderText = "Enter Access Key..."
KeyInput.Text = ""
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.Font = Enum.Font.Gotham
KeyInput.TextSize = 16
Instance.new("UICorner", KeyInput).CornerRadius = UDim.new(0, 10)

-- Buttons Layout
local GetKeyBtn = Instance.new("TextButton", MainFrame)
GetKeyBtn.Size = UDim2.new(0.38, 0, 0, 45)
GetKeyBtn.Position = UDim2.new(0.1, 0, 0.7, 0)
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
GetKeyBtn.Text = "GET KEY"
GetKeyBtn.Font = Enum.Font.GothamBold
GetKeyBtn.TextColor3 = Color3.fromRGB(0, 255, 255)
GetKeyBtn.TextSize = 14
Instance.new("UICorner", GetKeyBtn).CornerRadius = UDim.new(0, 10)

local UnlockBtn = Instance.new("TextButton", MainFrame)
UnlockBtn.Size = UDim2.new(0.38, 0, 0, 45)
UnlockBtn.Position = UDim2.new(0.52, 0, 0.7, 0)
UnlockBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
UnlockBtn.Text = "UNLOCK"
UnlockBtn.Font = Enum.Font.GothamBold
UnlockBtn.TextColor3 = Color3.fromRGB(10, 10, 15)
UnlockBtn.TextSize = 14
Instance.new("UICorner", UnlockBtn).CornerRadius = UDim.new(0, 10)

-- // 2. FUNCTION TO LOAD HUB WITH MAX OPTIONS //
local function LoadFullHub()
    local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
    local Window = Rayfield:CreateWindow({
       Name = "KATIO HUB | VERSION V1",
       LoadingTitle = "Executing katio Engine...",
       LoadingSubtitle = "Welcome, Captain Miguel",
       ConfigurationSaving = { Enabled = true, FolderName = "SailorPieceV2" }
    })

    -- Combat Tab
    local CombatTab = Window:CreateTab("Combat", 4483362458)
    CombatTab:CreateToggle({
       Name = "Kill Aura",
       CurrentValue = false,
       Callback = function(v) print("KillAura:", v) end,
    })
    CombatTab:CreateToggle({
       Name = "Auto Clicker",
       CurrentValue = false,
       Callback = function(v) print("AutoClicker:", v) end,
    })
    CombatTab:CreateSlider({
        Name = "Hitbox Size",
        Range = {2, 50},
        Increment = 1,
        CurrentValue = 2,
        Callback = function(v) print("Hitbox:", v) end,
    })

    -- Movement Tab
    local MoveTab = Window:CreateTab("Movement", 4483362458)
    MoveTab:CreateSlider({
       Name = "WalkSpeed",
       Range = {16, 500},
       Increment = 1,
       CurrentValue = 16,
       Callback = function(v) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v end,
    })
    MoveTab:CreateSlider({
        Name = "Jump Power",
        Range = {50, 5000},
        Increment = 1,
        CurrentValue = 50,
        Callback = function(v) game.Players.LocalPlayer.Character.Humanoid.JumpPower = v end,
    })
    MoveTab:CreateToggle({
       Name = "Fly Mode",
       CurrentValue = false,
       Callback = function(v) print("Fly:", v) end,
    })

    -- Visuals Tab
    local VisualTab = Window:CreateTab("Visuals", 4483362458)
    VisualTab:CreateToggle({
       Name = "ESP Boxes",
       CurrentValue = false,
       Callback = function(v) print("ESP:", v) end,
    })
    VisualTab:CreateToggle({
       Name = "Full Bright",
       CurrentValue = false,
       Callback = function(v) game:GetService("Lighting").Brightness = 2; game:GetService("Lighting").ClockTime = 14 end,
    })

    -- Misc Tab
    local MiscTab = Window:CreateTab("Utility", 4483362458)
    MiscTab:CreateButton({
       Name = "Anti-AFK",
       Callback = function() 
           local vu = game:GetService("VirtualUser")
           game:GetService("Players").LocalPlayer.Idled:connect(function()
               vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
               wait(1)
               vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
           end)
       end,
    })
    MiscTab:CreateButton({
        Name = "Rejoin Server",
        Callback = function() game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer) end,
    })
    MiscTab:CreateSection("Performance")
    MiscTab:CreateButton({
        Name = "Low Graphics (Boost FPS)",
        Callback = function() 
            for _,v in pairs(game:GetDescendants()) do 
                if v:IsA("BasePart") or v:IsA("Decal") then v.Transparency = 0.5 end 
            end 
        end,
    })
end

-- // 3. BUTTON LOGIC //
GetKeyBtn.MouseButton1Click:Connect(function()
    setclipboard(KeyLink)
    GetKeyBtn.Text = "LINK COPIED!"
    task.wait(2)
    GetKeyBtn.Text = "GET KEY"
end)

UnlockBtn.MouseButton1Click:Connect(function()
    if KeyInput.Text == CorrectKey then
        UnlockBtn.Text = "AUTHENTICATED!"
        UnlockBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 100)
        task.wait(1)
        ScreenGui:Destroy()
        LoadFullHub()
    else
        UnlockBtn.Text = "INVALID KEY!"
        UnlockBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
        task.wait(1.5)
        UnlockBtn.Text = "UNLOCK"
        UnlockBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
    end
end)
