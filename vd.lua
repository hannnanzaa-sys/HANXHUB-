-- ==========================================
local NamaKamu = "HANXHUB"
local LinkTikTok = "https://www.tiktok.com/@whoohnbro_"
local LinkYouTube = "https://youtube.com/@hannxhub?si=FqmMCAE3nJhTD-u0"
local LinkWA = "https://whatsapp.com/channel/0029Vb94hQl3LdQTdlkiCf0P"
local LinkSaweria = "https://saweria.co/HANXHUB"
-- ==========================================

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local Status = {Survivor = false, Killer = false, Pallets = false, Windows = false, Gens = false, Traps = false, Pumpkins = false, Speed = false, Noclip = false, FOV = false}
local Colors = {Survivor = Color3.fromRGB(0, 255, 0), Killer = Color3.fromRGB(255, 0, 0), Pallets = Color3.fromRGB(0, 255, 255), Windows = Color3.fromRGB(255, 255, 0), Gens = Color3.fromRGB(150, 0, 255), Traps = Color3.fromRGB(255, 105, 180), Pumpkins = Color3.fromRGB(255, 140, 0)} -- Orange
local ColorList = {Color3.fromRGB(0, 255, 0), Color3.fromRGB(255, 0, 0), Color3.fromRGB(0, 170, 255), Color3.fromRGB(255, 255, 0), Color3.fromRGB(150, 0, 255), Color3.fromRGB(255, 255, 255), Color3.fromRGB(0, 255, 255), Color3.fromRGB(255, 105, 180), Color3.fromRGB(255, 140, 0)}
local ESP_Objects = {}

-- ==========================================
-- 1. ANIMASI LOADING (3 DETIK)
-- ==========================================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "HanxHubV40"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = CoreGui

local LoadFrame = Instance.new("Frame")
LoadFrame.Size = UDim2.new(0, 320, 0, 130)
LoadFrame.Position = UDim2.new(0.5, -160, 0.5, -65)
LoadFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
LoadFrame.BorderSizePixel = 0
LoadFrame.Parent = ScreenGui
Instance.new("UICorner", LoadFrame).CornerRadius = UDim.new(0, 10)

local LoadGrad = Instance.new("UIGradient")
LoadGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 100, 0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(150, 50, 200))
})
LoadGrad.Parent = LoadFrame

local TitleGlow = Instance.new("TextLabel")
TitleGlow.Size = UDim2.new(1, 0, 0, 40)
TitleGlow.Position = UDim2.new(0, 0, 0, 25)
TitleGlow.BackgroundTransparency = 1
TitleGlow.Text = NamaKamu .. " | HALLOWEEN"
TitleGlow.Font = Enum.Font.GothamBlack
TitleGlow.TextSize = 22
TitleGlow.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleGlow.Parent = LoadFrame

local GlowLine = Instance.new("Frame")
GlowLine.Size = UDim2.new(0, 0, 0, 3)
GlowLine.Position = UDim2.new(0.5, 0, 0.5, 25)
GlowLine.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
GlowLine.BorderSizePixel = 0
GlowLine.Parent = LoadFrame

local GlowUIStroke = Instance.new("UIStroke")
GlowUIStroke.Color = Color3.fromRGB(255, 140, 0)
GlowUIStroke.Thickness = 4
GlowUIStroke.Transparency = 0.5
GlowUIStroke.Parent = GlowLine

-- Animasi Loading 3 Detik
TweenService:Create(GlowLine, TweenInfo.new(2.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(1, 0, 0, 3), Position = UDim2.new(0, 0, 0.5, 25)}):Play()
task.wait(2.5)
TweenService:Create(GlowLine, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {BackgroundTransparency = 1}):Play()
TweenService:Create(GlowUIStroke, TweenInfo.new(0.5), {Transparency = 1}):Play()
task.wait(0.5)
LoadFrame:Destroy()

-- ==========================================
-- 2. TOMBOL TOGGLE (DESAIN MEWAH)
-- ==========================================
local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Size = UDim2.new(0, 55, 0, 55)
ToggleBtn.Position = UDim2.new(0, 20, 0, 100)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 30) 
ToggleBtn.Text = ""
ToggleBtn.Parent = ScreenGui

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 12)
ToggleCorner.Parent = ToggleBtn

local ToggleStroke = Instance.new("UIStroke")
ToggleStroke.Color = Color3.fromRGB(255, 140, 0) 
ToggleStroke.Thickness = 2.5
ToggleStroke.Parent = ToggleBtn

local ToggleGrad = Instance.new("UIGradient")
ToggleGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 140, 0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(150, 50, 200))
})
ToggleGrad.Rotation = 90
ToggleGrad.Parent = ToggleBtn

local InnerFix = Instance.new("TextLabel")
InnerFix.Size = UDim2.new(1, 0, 1, 0)
InnerFix.BackgroundTransparency = 1
InnerFix.Text = "H"
InnerFix.TextColor3 = Color3.fromRGB(255, 255, 255)
InnerFix.Font = Enum.Font.GothamBlack
InnerFix.TextSize = 28
InnerFix.Rotation = -45
InnerFix.Parent = ToggleBtn

-- ==========================================
-- 3. MENU UTAMA (DESAIN RAPI)
-- ==========================================
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 560, 0, 340)
MainFrame.Position = UDim2.new(0.5, -280, 0.5, -170)
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = false
MainFrame.Parent = ScreenGui
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 12)

local TopLine = Instance.new("Frame")
TopLine.Size = UDim2.new(1, 0, 0, 4)
TopLine.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
TopLine.BorderSizePixel = 0
TopLine.Parent = MainFrame
Instance.new("UICorner", TopLine).CornerRadius = UDim.new(0, 12)

local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0, 150, 1, 0)
Sidebar.BackgroundColor3 = Color3.fromRGB(22, 22, 30)
Sidebar.BorderSizePixel = 0
Sidebar.Parent = MainFrame
Instance.new("UICorner", Sidebar).CornerRadius = UDim.new(0, 12)

-- Logo HANXHUB
local LogoFrame = Instance.new("Frame")
LogoFrame.Size = UDim2.new(1, -10, 0, 55)
LogoFrame.Position = UDim2.new(0, 5, 0, 5)
LogoFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
LogoFrame.Parent = Sidebar
Instance.new("UICorner", LogoFrame).CornerRadius = UDim.new(0, 8)
Instance.new("UIStroke", LogoFrame).Color = Color3.fromRGB(100, 100, 120)

local LogoGrad = Instance.new("UIGradient")
LogoGrad.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 140, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(150, 50, 200))})
LogoGrad.Parent = LogoFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 1, 0)
Title.BackgroundTransparency = 1
Title.Text = NamaKamu
Title.Font = Enum.Font.GothamBlack
Title.TextSize = 20
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Parent = LogoFrame

local EventText = Instance.new("TextLabel")
EventText.Size = UDim2.new(1, -10, 0, 30)
EventText.Position = UDim2.new(0, 5, 0, 65)
EventText.BackgroundTransparency = 1
EventText.Text = "VIOLENCE DISTRICT\nNEW NOKEY"
EventText.Font = Enum.Font.GothamBold
EventText.TextSize = 11
EventText.TextColor3 = Color3.fromRGB(255, 140, 0)
EventText.TextXAlignment = Enum.TextXAlignment.Left
EventText.Parent = Sidebar

local Credit = Instance.new("TextLabel")
Credit.Size = UDim2.new(1, -10, 0, 30)
Credit.Position = UDim2.new(0, 5, 1, -35)
Credit.BackgroundTransparency = 1
Credit.Text = "by HANXHUB 2026\nNew Dev Test"
Credit.Font = Enum.Font.Gotham
Credit.TextSize = 10
Credit.TextColor3 = Color3.fromRGB(100, 100, 110)
Credit.TextXAlignment = Enum.TextXAlignment.Left
Credit.Parent = Sidebar

local ContentArea = Instance.new("Frame")
ContentArea.Size = UDim2.new(1, -165, 1, -20)
ContentArea.Position = UDim2.new(0, 155, 0, 10)
ContentArea.BackgroundTransparency = 1
ContentArea.Parent = MainFrame

-- ==========================================
-- 4. PAGES
-- ==========================================
local Pages = {}

Pages.Home = Instance.new("Frame")
Pages.Home.Size = UDim2.new(1, 0, 1, 0)
Pages.Home.BackgroundTransparency = 1
Pages.Home.Visible = true
Pages.Home.Parent = ContentArea

local function buatLink(text, url, y)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 38)
    btn.Position = UDim2.new(0, 0, 0, y)
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    btn.Text = "  " .. text
    btn.TextColor3 = Color3.fromRGB(0, 170, 255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 12
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.Parent = Pages.Home
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    Instance.new("UIStroke", btn).Color = Color3.fromRGB(60, 60, 80)

    btn.MouseButton1Click:Connect(function()
        if setclipboard then pcall(function() setclipboard(url) end) end
        if RequestOpenBrowser then pcall(function() RequestOpenBrowser(url) end)
        elseif request then pcall(function() request({Url = url, Method = "GET"}) end) end
    end)
end

buatLink("TikTok: @whoohnbro_", LinkTikTok, 10)
buatLink("YouTube: @hannxhub", LinkYouTube, 58)
buatLink("WhatsApp Channel", LinkWA, 106)
buatLink("Saweria (Donate)", LinkSaweria, 154)

Pages.Fitur = Instance.new("Frame")
Pages.Fitur.Size = UDim2.new(1, 0, 1, 0)
Pages.Fitur.BackgroundTransparency = 1
Pages.Fitur.Visible = false
Pages.Fitur.Parent = ContentArea

local function buatTombol(teks, x, y, keyName)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 190, 0, 34)
    btn.Position = UDim2.new(0, x, 0, y)
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    btn.Text = "  " .. teks .. ": OFF"
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 12
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.Parent = Pages.Fitur
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    
    -- Garis Tepi Biar Mewah
    local stroke = Instance.new("UIStroke", btn)
    stroke.Color = Color3.fromRGB(60, 60, 80)
    stroke.Thickness = 1

    if Colors[keyName] then
        local colorBtn = Instance.new("TextButton")
        colorBtn.Size = UDim2.new(0, 20, 0, 20)
        colorBtn.Position = UDim2.new(1, -25, 0.5, -10)
        colorBtn.BackgroundColor3 = Colors[keyName]
        colorBtn.Text = ""
        colorBtn.Parent = btn
        Instance.new("UICorner", colorBtn).CornerRadius = UDim.new(0, 5)
        Instance.new("UIStroke", colorBtn).Color = Color3.fromRGB(150, 150, 150)

        colorBtn.MouseButton1Click:Connect(function()
            local currentColor = Colors[keyName]
            local nextIndex = 1
            for i, c in ipairs(ColorList) do
                if c == currentColor then
                    nextIndex = i + 1
                    if nextIndex > #ColorList then nextIndex = 1 end
                    break
                end
            end
            Colors[keyName] = ColorList[nextIndex]
            colorBtn.BackgroundColor3 = Colors[keyName]
            if Status[keyName] then applyESP() end
        end)
    end

    btn.MouseButton1Click:Connect(function()
        Status[keyName] = not Status[keyName]
        if Status[keyName] then
            btn.Text = "  " .. teks .. ": ON"
            btn.BackgroundColor3 = Color3.fromRGB(90, 60, 150)
        else
            btn.Text = "  " .. teks .. ": OFF"
            btn.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
        end
        applyESP()
    end)
    return btn
end

-- FITUR ESP
local b1 = buatTombol("Survivor ESP", 0, 0, "Survivor")
local b2 = buatTombol("Killer ESP", 0, 40, "Killer")
local b4 = buatTombol("Pallets ESP", 0, 80, "Pallets")
local b5 = buatTombol("Windows ESP", 0, 120, "Windows")
local b6 = buatTombol("Generators ESP", 0, 160, "Gens")
local b16 = buatTombol("Traps ESP", 0, 200, "Traps")
local b18 = buatTombol("Pumpkins ESP", 0, 240, "Pumpkins")

-- FITUR HACK
local b7 = buatTombol("Noclip", 210, 0, "Noclip")
local b10 = buatTombol("WalkSpeed", 210, 40, "Speed")

local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(0, 190, 0, 20)
speedLabel.Position = UDim2.new(0, 210, 0, 80)
speedLabel.BackgroundTransparency = 1
speedLabel.Text = "Speed: 50"
speedLabel.Font = Enum.Font.GothamBold
speedLabel.TextSize = 12
speedLabel.TextColor3 = Color3.fromRGB(200, 200, 210)
speedLabel.TextXAlignment = Enum.TextXAlignment.Left
speedLabel.Parent = Pages.Fitur

local barSpeed = Instance.new("Frame")
barSpeed.Size = UDim2.new(0, 190, 0, 6)
barSpeed.Position = UDim2.new(0, 210, 0, 105)
barSpeed.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
barSpeed.Parent = Pages.Fitur
Instance.new("UICorner", barSpeed).CornerRadius = UDim.new(1, 0)

local fillSpeed = Instance.new("Frame")
fillSpeed.Size = UDim2.new(0.25, 0, 1, 0)
fillSpeed.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
fillSpeed.Parent = barSpeed
Instance.new("UICorner", fillSpeed).CornerRadius = UDim.new(1, 0)

local knobSpeed = Instance.new("TextButton")
knobSpeed.Size = UDim2.new(0, 16, 0, 16)
knobSpeed.Position = UDim2.new(0.25, -8, 0.5, -8)
knobSpeed.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
knobSpeed.Text = ""
knobSpeed.Parent = barSpeed
Instance.new("UICorner", knobSpeed).CornerRadius = UDim.new(1, 0)
Instance.new("UIStroke", knobSpeed).Color = Color3.fromRGB(200, 200, 200)

local b17 = buatTombol("FOV (Wide)", 210, 140, "FOV")

local fovLabel = Instance.new("TextLabel")
fovLabel.Size = UDim2.new(0, 190, 0, 20)
fovLabel.Position = UDim2.new(0, 210, 0, 180)
fovLabel.BackgroundTransparency = 1
fovLabel.Text = "FOV: 70"
fovLabel.Font = Enum.Font.GothamBold
fovLabel.TextSize = 12
fovLabel.TextColor3 = Color3.fromRGB(200, 200, 210)
fovLabel.TextXAlignment = Enum.TextXAlignment.Left
fovLabel.Parent = Pages.Fitur

local barFOV = Instance.new("Frame")
barFOV.Size = UDim2.new(0, 190, 0, 6)
barFOV.Position = UDim2.new(0, 210, 0, 205)
barFOV.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
barFOV.Parent = Pages.Fitur
Instance.new("UICorner", barFOV).CornerRadius = UDim.new(1, 0)

local fillFOV = Instance.new("Frame")
fillFOV.Size = UDim2.new(0, 0, 1, 0)
fillFOV.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
fillFOV.Parent = barFOV
Instance.new("UICorner", fillFOV).CornerRadius = UDim.new(1, 0)

local knobFOV = Instance.new("TextButton")
knobFOV.Size = UDim2.new(0, 16, 0, 16)
knobFOV.Position = UDim2.new(0, -8, 0.5, -8)
knobFOV.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
knobFOV.Text = ""
knobFOV.Parent = barFOV
Instance.new("UICorner", knobFOV).CornerRadius = UDim.new(1, 0)
Instance.new("UIStroke", knobFOV).Color = Color3.fromRGB(200, 200, 200)

local dragSpeed = false
local function getSpeed() return math.floor(16 + ((150 - 16) * fillSpeed.Size.X.Scale)) end
knobSpeed.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then dragSpeed = true end
end)
UserInputService.InputChanged:Connect(function(input)
    if dragSpeed and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local mouseX = math.clamp(input.Position.X, barSpeed.AbsolutePosition.X, barSpeed.AbsolutePosition.X + barSpeed.AbsoluteSize.X)
        local percent = (mouseX - barSpeed.AbsolutePosition.X) / barSpeed.AbsoluteSize.X
        fillSpeed.Size = UDim2.new(percent, 0, 1, 0)
        knobSpeed.Position = UDim2.new(percent, -8, 0.5, -8)
        speedLabel.Text = "Speed: " .. getSpeed()
    end
end)
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then dragSpeed = false end
end)

local dragFOV = false
local function getFOV() return math.floor(70 + ((120 - 70) * fillFOV.Size.X.Scale)) end
knobFOV.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then dragFOV = true end
end)
UserInputService.InputChanged:Connect(function(input)
    if dragFOV and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local mouseX = math.clamp(input.Position.X, barFOV.AbsolutePosition.X, barFOV.AbsolutePosition.X + barFOV.AbsoluteSize.X)
        local percent = (mouseX - barFOV.AbsolutePosition.X) / barFOV.AbsoluteSize.X
        fillFOV.Size = UDim2.new(percent, 0, 1, 0)
        knobFOV.Position = UDim2.new(percent, -8, 0.5, -8)
        fovLabel.Text = "FOV: " .. getFOV()
    end
end)
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then dragFOV = false end
end)

Pages.Soon = Instance.new("Frame")
Pages.Soon.Size = UDim2.new(1, 0, 1, 0)
Pages.Soon.BackgroundTransparency = 1
Pages.Soon.Visible = false
Pages.Soon.Parent = ContentArea

local SoonFrame = Instance.new("Frame")
SoonFrame.Size = UDim2.new(1, 0, 0, 120)
SoonFrame.Position = UDim2.new(0, 0, 0, 20)
SoonFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
SoonFrame.Parent = Pages.Soon
Instance.new("UICorner", SoonFrame).CornerRadius = UDim.new(0, 8)
Instance.new("UIStroke", SoonFrame).Color = Color3.fromRGB(60, 60, 80)

local SoonText = Instance.new("TextLabel")
SoonText.Size = UDim2.new(1, 0, 1, 0)
SoonText.BackgroundTransparency = 1
SoonText.Text = "Coming Soon!\n\n- Auto Parry\n- Auto Gen\n- Auto Perfect\n- Auto Heal"
SoonText.Font = Enum.Font.GothamBold
SoonText.TextSize = 14
SoonText.TextColor3 = Color3.fromRGB(150, 150, 160)
SoonText.Parent = SoonFrame

-- ==========================================
-- 5. NAVIGASI
-- ==========================================
local function buatTombolSidebar(teks, y)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 35)
    btn.Position = UDim2.new(0, 5, 0, y)
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    btn.Text = "  " .. teks
    btn.TextColor3 = Color3.fromRGB(150, 150, 150)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 12
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.Parent = Sidebar
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    return btn
end

local btnHome = buatTombolSidebar("🏠 Home", 105) -- Digeser karena teks event
local btnFitur = buatTombolSidebar("⚔️ Features", 150)
local btnSoon = buatTombolSidebar("⏳ Soon Update", 195)

local function pindahTab(tabAktif, btnAktif)
    for _, p in pairs(Pages) do p.Visible = false end
    Pages[tabAktif].Visible = true

    btnHome.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    btnHome.TextColor3 = Color3.fromRGB(150, 150, 150)
    btnFitur.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    btnFitur.TextColor3 = Color3.fromRGB(150, 150, 150)
    btnSoon.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    btnSoon.TextColor3 = Color3.fromRGB(150, 150, 150)

    btnAktif.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
    btnAktif.TextColor3 = Color3.fromRGB(255, 255, 255)
end

btnHome.MouseButton1Click:Connect(function() pindahTab("Home", btnHome) end)
btnFitur.MouseButton1Click:Connect(function() pindahTab("Fitur", btnFitur) end)
btnSoon.MouseButton1Click:Connect(function() pindahTab("Soon", btnSoon) end)

ToggleBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- ==========================================
-- 6. LOGIKA ESP & SETTINGS
-- ==========================================
local function setNoclip(state)
    if not LocalPlayer.Character then return end
    for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
        if part:IsA("BasePart") then part.CanCollide = not state end
    end
end

local function findObj(keyword)
    local found = {}
    local map = workspace:FindFirstChild("Map") or workspace
    for _, obj in ipairs(map:GetDescendants()) do
        if (obj:IsA("Model") or obj:IsA("BasePart")) and obj.Name:lower():find(keyword) then
            if obj:IsA("BasePart") and (obj.Size.X < 2 or obj.Size.Y < 2 or obj.Size.Z < 2) then
            else table.insert(found, obj) end
        end
    end
    return found
end

function applyESP()
    for _, obj in pairs(ESP_Objects) do if obj then obj:Destroy() end end
    ESP_Objects = {}

    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            local isKiller = false
            local team = plr.Team and plr.Team.Name:lower() or ""
            if team:find("killer") then isKiller = true end

            if (isKiller and Status.Killer) or (not isKiller and Status.Survivor) then
                local hl = Instance.new("Highlight")
                hl.Adornee = plr.Character
                hl.FillColor = isKiller and Colors.Killer or Colors.Survivor
                hl.Parent = plr.Character
                table.insert(ESP_Objects, hl)
            end
        end
    end

    if Status.Pallets then
        for _, obj in ipairs(findObj("pallet")) do
            local hl = Instance.new("Highlight"); hl.Adornee = obj; hl.FillColor = Colors.Pallets; hl.Parent = obj
            table.insert(ESP_Objects, hl)
        end
    end

    if Status.Windows then
        for _, obj in ipairs(findObj("window")) do
            local hl = Instance.new("Highlight"); hl.Adornee = obj; hl.FillColor = Colors.Windows; hl.Parent = obj
            table.insert(ESP_Objects, hl)
        end
    end

    if Status.Gens then
        for _, obj in ipairs(findObj("generator")) do
            local hl = Instance.new("Highlight"); hl.Adornee = obj; hl.FillColor = Colors.Gens; hl.Parent = obj
            table.insert(ESP_Objects, hl)
        end
    end

    if Status.Traps then
        local traps = findObj("trap")
        for _, obj in ipairs(findObj("bear")) do table.insert(traps, obj) end
        for _, obj in ipairs(findObj("snare")) do table.insert(traps, obj) end
        for _, obj in ipairs(traps) do
            local hl = Instance.new("Highlight"); hl.Adornee = obj; hl.FillColor = Colors.Traps; hl.Parent = obj
            table.insert(ESP_Objects, hl)
        end
    end

    -- ESP LABU
    if Status.Pumpkins then
        local pumpkins = findObj("pumpkin")
        for _, obj in ipairs(findObj("labu")) do table.insert(pumpkins, obj) end
        
        for _, obj in ipairs(pumpkins) do
            local hl = Instance.new("Highlight"); hl.Adornee = obj; hl.FillColor = Colors.Pumpkins; hl.Parent = obj
            table.insert(ESP_Objects, hl)
        end
    end
end

-- ==========================================
-- 7. LOOPING
-- ==========================================
RunService.Heartbeat:Connect(function()
    if not LocalPlayer.Character then return end
    local hum = LocalPlayer.Character:FindFirstChild("Humanoid")
    if not hum then return end

    if Status.Speed then hum.WalkSpeed = getSpeed() else hum.WalkSpeed = 16 end
    setNoclip(Status.Noclip)

    local cam = workspace.CurrentCamera
    if cam then
        if Status.FOV then cam.FieldOfView = getFOV() else cam.FieldOfView = 70 end
    end
end)

LocalPlayer.CharacterAdded:Connect(function()
    task.wait(1)
    applyESP()
end)

print("HANX HUB V40 berhasil dimuat.")
