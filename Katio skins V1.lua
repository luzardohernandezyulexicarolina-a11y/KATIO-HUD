
--================================================
--             KATIO SKIN HUB V3
--               OUTFIT CATALOG
--================================================

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- KEY SYSTEM
local CorrectKey = "KATIOHUBV1FREE"
local KeyLink = "https://link-center.net/10742409/nKwAHWLgNMDo"

-- COLORS
local PURPLE = Color3.fromRGB(145,65,255)
local DARK = Color3.fromRGB(17,14,24)
local CARD = Color3.fromRGB(35,29,45)
local WHITE = Color3.fromRGB(255,255,255)
local GRAY = Color3.fromRGB(175,165,185)

-- CATALOG
local Skins = {

    EMO = {
        {
            Name = "Emo Black",
            Items = {
                {"Cabello emo","107885137425240"},
                {"Camisa emo negra","9580459045"},
                {"Pantalon negro","5246950670"},
                {"Cadenas","17285777146"},
                {"Zapatos negros","6111376717"},
                {"Camisa goth","6781346864"},
            }
        },
        {
            Name = "Purple Emo",
            Items = {
                {"Cabello morado","107885137425240"},
                {"Camisa morada","6680877688"},
                {"Pantalon oscuro","6111376717"},
                {"Accesorio morado","17285777146"},
            }
        },
    },

    EMO_MALE = {
        {
            Name = "Dark Boy",
            Items = {
                {"Cabello emo","107885137425240"},
                {"Camisa negra","9580459045"},
                {"Pantalon negro","5246950670"},
                {"Cadena","17285777146"},
                {"Zapatos negros","6111376717"},
            }
        },

        {
            Name = "Purple Boy",
            Items = {
                {"Cabello morado","107885137425240"},
                {"Camisa morada","6680877688"},
                {"Pantalon oscuro","6111376717"},
                {"Accesorio morado","17285777146"},
            }
        },

        -- NEW GOTH BOY
        {
            Name = "GOTH BOY 🖤",
            Items = {
                {"Cabello goth oscuro","107885137425240"},
                {"Camisa goth negra","6781346864"},
                {"Pantalon negro","5246950670"},
                {"Cadena goth","17285777146"},
                {"Zapatos negros","6111376717"},
                {"Camisa alternativa","9580459045"},
                {"Accesorio oscuro","17285777146"},
                {"Pantalon street","6111376717"},
            }
        },

        {
            Name = "Goth Street",
            Items = {
                {"Cabello oscuro","107885137425240"},
                {"Camisa negra","9580459045"},
                {"Pantalon street","5246950670"},
                {"Cadena","17285777146"},
                {"Zapatos street","6111376717"},
            }
        },
    },

    PREPPY = {
        {
            Name = "Pink Preppy",
            Items = {
                {"Cabello rubio","376526888"},
                {"Camisa rosa","104364361427987"},
                {"Pantalon","6560677472"},
                {"Llavero conejito","120403221534602"},
            }
        }
    },

    CUTE = {
        {
            Name = "Cute Pink",
            Items = {
                {"Cabello cute","121814793694589"},
                {"Camisa capybara","98151948460701"},
                {"Outfit rosa","1160488459"},
                {"Lentes cute","6934244289"},
            }
        }
    },

    DARK = {
        {
            Name = "Dark Street",
            Items = {
                {"Cabello oscuro","107885137425240"},
                {"Camisa goth","6781346864"},
                {"Pantalon oscuro","6111376717"},
                {"Zapatos street","5246950670"},
            }
        }
    },

    AESTHETIC = {
        {
            Name = "Soft Aesthetic",
            Items = {
                {"Cabello rojo","2956239660"},
                {"Camisa avocado","4902303192"},
                {"Jeans azules","5676503931"},
                {"Sombrero aesthetic","5033022878"},
            }
        }
    }
}

-- REMOVE OLD GUI
local old = PlayerGui:FindFirstChild("KATIO_SKIN_HUB")
if old then old:Destroy() end

-- GUI
local GUI = Instance.new("ScreenGui")
GUI.Name = "KATIO_SKIN_HUB"
GUI.ResetOnSpawn = false
GUI.Parent = PlayerGui

-- HELPERS
local function Corner(obj,radius)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0,radius)
    c.Parent = obj
end

local function Stroke(obj)
    local s = Instance.new("UIStroke")
    s.Color = PURPLE
    s.Thickness = 2
    s.Parent = obj
end

local function Label(parent,text,size,position,fontSize)
    local l = Instance.new("TextLabel")
    l.Size = size
    l.Position = position
    l.BackgroundTransparency = 1
    l.Text = text
    l.TextColor3 = WHITE
    l.TextSize = fontSize
    l.Font = Enum.Font.GothamBold
    l.Parent = parent
    return l
end

local function MakeButton(parent,text,position,size)
    local b = Instance.new("TextButton")
    b.Size = size
    b.Position = position
    b.BackgroundColor3 = PURPLE
    b.Text = text
    b.TextColor3 = WHITE
    b.Font = Enum.Font.GothamBold
    b.TextSize = 13
    b.TextWrapped = true
    b.Parent = parent
    Corner(b,8)
    return b
end

-- KEY WINDOW
local KeyFrame = Instance.new("Frame")
KeyFrame.Size = UDim2.fromOffset(340,245)
KeyFrame.Position = UDim2.new(.5,-170,.5,-122)
KeyFrame.BackgroundColor3 = DARK
KeyFrame.Parent = GUI
Corner(KeyFrame,14)
Stroke(KeyFrame)

Label(KeyFrame,"KATIO ACCESS",
    UDim2.new(1,0,0,48),
    UDim2.fromOffset(0,8),23)

local KeyBox = Instance.new("TextBox")
KeyBox.Size = UDim2.new(1,-30,0,42)
KeyBox.Position = UDim2.fromOffset(15,65)
KeyBox.BackgroundColor3 = CARD
KeyBox.PlaceholderText = "ENTER YOUR KEY"
KeyBox.Text = ""
KeyBox.TextColor3 = WHITE
KeyBox.Font = Enum.Font.Gotham
KeyBox.TextSize = 14
KeyBox.Parent = KeyFrame
Corner(KeyBox,8)

local GetKey = MakeButton(
    KeyFrame,"GET KEY",
    UDim2.fromOffset(15,120),
    UDim2.new(.45,-8,0,40)
)

local Unlock = MakeButton(
    KeyFrame,"UNLOCK",
    UDim2.new(.55,0,0,120),
    UDim2.new(.45,-15,0,40)
)

local KeyStatus = Label(
    KeyFrame,"WAITING FOR KEY...",
    UDim2.new(1,-20,0,30),
    UDim2.fromOffset(10,175),12
)
KeyStatus.TextColor3 = GRAY

-- MAIN MENU
local Main = Instance.new("Frame")
Main.Size = UDim2.fromOffset(440,390)
Main.Position = UDim2.new(.5,-220,.5,-195)
Main.BackgroundColor3 = DARK
Main.Visible = false
Main.Parent = GUI
Corner(Main,14)
Stroke(Main)

local Header = Instance.new("TextButton")
Header.Size = UDim2.new(1,-55,0,55)
Header.BackgroundTransparency = 1
Header.Text = "KATIO SKIN HUB V3"
Header.TextColor3 = WHITE
Header.Font = Enum.Font.GothamBold
Header.TextSize = 19
Header.Parent = Main

-- DRAGGING
local dragging = false
local dragStart
local startPos

Header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = Main.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch
    ) then
        local delta = input.Position - dragStart
        Main.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

local Close = MakeButton(
    Main,"X",
    UDim2.new(1,-45,0,8),
    UDim2.fromOffset(35,35)
)
Close.BackgroundColor3 = Color3.fromRGB(180,40,60)

-- FLOATING BUTTON
local Open = MakeButton(
    GUI,"SKIN\nABRIR",
    UDim2.fromOffset(15,200),
    UDim2.fromOffset(85,60)
)
Open.Visible = false

-- CATEGORIES
local Categories = Instance.new("ScrollingFrame")
Categories.Size = UDim2.fromOffset(125,315)
Categories.Position = UDim2.fromOffset(10,65)
Categories.BackgroundColor3 = CARD
Categories.BorderSizePixel = 0
Categories.ScrollBarThickness = 3
Categories.Parent = Main

local CatLayout = Instance.new("UIListLayout")
CatLayout.Padding = UDim.new(0,7)
CatLayout.Parent = Categories

-- ITEMS
local List = Instance.new("ScrollingFrame")
List.Size = UDim2.fromOffset(290,225)
List.Position = UDim2.fromOffset(140,65)
List.BackgroundColor3 = CARD
List.BorderSizePixel = 0
List.ScrollBarThickness = 3
List.AutomaticCanvasSize = Enum.AutomaticSize.Y
List.CanvasSize = UDim2.new(0,0,0,0)
List.Parent = Main

local ListLayout = Instance.new("UIListLayout")
ListLayout.Padding = UDim.new(0,8)
ListLayout.Parent = List

ListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    List.CanvasSize = UDim2.fromOffset(
        0,ListLayout.AbsoluteContentSize.Y + 15
    )
end)

-- COPY PANEL
local CopyPanel = Instance.new("Frame")
CopyPanel.Size = UDim2.new(1,-20,0,75)
CopyPanel.Position = UDim2.new(0,10,1,-85)
CopyPanel.BackgroundColor3 = CARD
CopyPanel.Visible = false
CopyPanel.Parent = Main
Corner(CopyPanel,8)

local SelectedLabel = Label(
    CopyPanel,"SELECTED ITEM",
    UDim2.new(1,-10,0,25),
    UDim2.fromOffset(5,0),12
)

local SelectedID = Instance.new("TextBox")
SelectedID.Size = UDim2.new(1,-20,0,35)
SelectedID.Position = UDim2.fromOffset(10,30)
SelectedID.BackgroundColor3 = DARK
SelectedID.TextColor3 = WHITE
SelectedID.Text = ""
SelectedID.ClearTextOnFocus = false
SelectedID.TextEditable = true
SelectedID.Font = Enum.Font.GothamBold
SelectedID.TextSize = 14
SelectedID.Parent = CopyPanel
Corner(SelectedID,6)

-- SHOW CATEGORY
local function ShowCategory(category)

    for _,child in ipairs(List:GetChildren()) do
        if child:IsA("Frame") then
            child:Destroy()
        end
    end

    CopyPanel.Visible = false

    for _,skin in ipairs(Skins[category]) do

        local CardFrame = Instance.new("Frame")
        CardFrame.Size = UDim2.new(1,-10,0,45)
        CardFrame.BackgroundColor3 = DARK
        CardFrame.Parent = List
        Corner(CardFrame,8)

        local Expand = MakeButton(
            CardFrame,skin.Name.."  +",
            UDim2.fromOffset(5,5),
            UDim2.new(1,-10,0,35)
        )

        local Details = Instance.new("Frame")
        Details.Size = UDim2.new(1,-10,0,0)
        Details.Position = UDim2.fromOffset(5,45)
        Details.BackgroundTransparency = 1
        Details.Visible = false
        Details.Parent = CardFrame

        local DetailLayout = Instance.new("UIListLayout")
        DetailLayout.Padding = UDim.new(0,5)
        DetailLayout.Parent = Details

        local expanded = false

        Expand.MouseButton1Click:Connect(function()

            expanded = not expanded
            Details.Visible = expanded

            Expand.Text = skin.Name..
                (expanded and "  -" or "  +")

            if expanded then

                for _,item in ipairs(skin.Items) do

                    local Item = MakeButton(
                        Details,item[1],
                        UDim2.new(0,0,0,0),
                        UDim2.new(1,0,0,34)
                    )

                    Item.BackgroundColor3 = CARD
                    Item.TextSize = 11

                    Item.MouseButton1Click:Connect(function()
                        SelectedLabel.Text = "ID: "..item[1]
                        SelectedID.Text = item[2]
                        CopyPanel.Visible = true
                        SelectedID:CaptureFocus()
                    end)
                end

                Details.Size = UDim2.new(
                    1,-10,0,#skin.Items * 39
                )
            else
                Details.Size = UDim2.new(1,-10,0,0)
            end

            CardFrame.Size = UDim2.new(
                1,-10,0,
                expanded and (50 + #skin.Items * 39) or 45
            )
        end)
    end
end

-- CATEGORY BUTTONS
local CategoryOrder = {
    "EMO",
    "EMO_MALE",
    "PREPPY",
    "CUTE",
    "DARK",
    "AESTHETIC"
}

for _,category in ipairs(CategoryOrder) do

    local Button = MakeButton(
        Categories,
        category == "EMO_MALE" and "EMO HOMBRE"
            or category,
        UDim2.new(0,0,0,0),
        UDim2.new(1,-8,0,45)
    )

    Button.MouseButton1Click:Connect(function()
        ShowCategory(category)
    end)
end

Categories.CanvasSize = UDim2.fromOffset(
    0,#CategoryOrder * 52
)

-- KEY ACTIONS
GetKey.MouseButton1Click:Connect(function()
    KeyStatus.Text = "VISIT THE KEY LINK"
end)

Unlock.MouseButton1Click:Connect(function()

    if KeyBox.Text == CorrectKey then
        KeyStatus.Text = "ACCESS GRANTED!"
        KeyFrame.Visible = false
        Main.Visible = true
        Open.Visible = true
        ShowCategory("EMO")
    else
        KeyStatus.Text = "INVALID KEY!"
    end
end)

Close.MouseButton1Click:Connect(function()
    Main.Visible = false
end)

Open.MouseButton1Click:Connect(function()
    Main.Visible = not Main.Visible
end)

print("KATIO SKIN HUB V3 LOADED")
