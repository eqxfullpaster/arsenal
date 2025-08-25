-- Arsenal Loader - made by equinox
local loaderversion = "1.0.0"

if game.PlaceId ~= 286090429 then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Arsenal Loader",
        Text = "Este script é apenas para Arsenal!",
        Duration = 5
    })
    return
end

-- Interface do Loader
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ArsenalLoaderUI"
ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 400, 0, 250)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -125)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
Title.TextColor3 = Color3.fromRGB(0, 150, 255)
Title.Text = "Arsenal Cheat - made by equinox"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.Parent = MainFrame

local VersionText = Instance.new("TextLabel")
VersionText.Name = "VersionText"
VersionText.Size = UDim2.new(0, 100, 0, 20)
VersionText.Position = UDim2.new(1, -100, 0, 0)
VersionText.BackgroundTransparency = 1
VersionText.TextColor3 = Color3.fromRGB(150, 150, 150)
VersionText.Text = "v" .. loaderversion
VersionText.Font = Enum.Font.Gotham
VersionText.TextSize = 12
VersionText.TextXAlignment = Enum.TextXAlignment.Right
VersionText.Parent = MainFrame

local LoadButton = Instance.new("TextButton")
LoadButton.Name = "LoadButton"
LoadButton.Size = UDim2.new(0, 200, 0, 50)
LoadButton.Position = UDim2.new(0.5, -100, 0.5, -25)
LoadButton.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
LoadButton.TextColor3 = Color3.fromRGB(255, 255, 255)
LoadButton.Text = "CARREGAR CHEAT"
LoadButton.Font = Enum.Font.GothamBold
LoadButton.TextSize = 18
LoadButton.Parent = MainFrame

local StatusText = Instance.new("TextLabel")
StatusText.Name = "StatusText"
StatusText.Size = UDim2.new(1, -20, 0, 20)
StatusText.Position = UDim2.new(0, 10, 0, 200)
StatusText.BackgroundTransparency = 1
StatusText.TextColor3 = Color3.fromRGB(200, 200, 200)
StatusText.Text = "Pronto para carregar..."
StatusText.Font = Enum.Font.Gotham
StatusText.TextSize = 12
StatusText.TextXAlignment = Enum.TextXAlignment.Left
StatusText.Parent = MainFrame

local FeaturesText = Instance.new("TextLabel")
FeaturesText.Name = "FeaturesText"
FeaturesText.Size = UDim2.new(1, -20, 0, 60)
FeaturesText.Position = UDim2.new(0, 10, 0, 100)
FeaturesText.BackgroundTransparency = 1
FeaturesText.TextColor3 = Color3.fromRGB(150, 150, 150)
FeaturesText.Text = "📋 Features:\n• Aimbot Avançado\n• Chams Coloridos\n• Interface por Abas\n• Detecção de Time"
FeaturesText.Font = Enum.Font.Gotham
FeaturesText.TextSize = 12
FeaturesText.TextXAlignment = Enum.TextXAlignment.Left
FeaturesText.Parent = MainFrame

-- Função para carregar o script principal
LoadButton.MouseButton1Click:Connect(function()
    LoadButton.Text = "CARREGANDO..."
    LoadButton.BackgroundColor3 = Color3.fromRGB(0, 150, 100)
    StatusText.Text = "Iniciando carregamento..."
    
    wait(0.5)
    
    -- Aqui você coloca o código completo do script que te passei anteriormente
    -- Vou colocar um exemplo reduzido, mas você deve colocar o código completo
    
    StatusText.Text = "Carregando módulos..."
    
-- Script de Aimbot e Chams Otimizado para Arsenal
-- made by equinox

-- Configurações iniciais
local UIS = game:GetService("UserInputService")
local Players = game:GetService("Players")
local RS = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local LP = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

-- Configurações do ESP
local ESPConfig = {
    Ativado = true,
    CorInimigos = Color3.fromRGB(255, 50, 50),
    CorAliados = Color3.fromRGB(50, 150, 255),
    Transparencia = 0.3,
    Brilho = 0.5
}

-- Configurações do Aimbot
local AimbotConfig = {
    Ativado = true,
    ParteCorpo = "Head",
    Suavidade = 0.2,
    CampoVisao = 120,
    TeclaAtivacao = "MouseButton2",
    VisivelApenas = true,
    DistanciaMaxima = 1000,
    ApenasInimigos = true,
    MostrarFOV = true,
    CorFOV = Color3.fromRGB(255, 255, 255)
}

-- Configurações da GUI
local GUIConfig = {
    CorFundo = Color3.fromRGB(30, 30, 35),
    CorTitulo = Color3.fromRGB(25, 25, 30),
    CorBotoes = Color3.fromRGB(60, 60, 70),
    CorTexto = Color3.fromRGB(255, 255, 255),
    CorDestaque = Color3.fromRGB(0, 150, 255)
}

-- Variáveis do sistema
local Conexoes = {}
local ChamsInstances = {}
local GUI
local MouseButtonPressed = false
local UltimaAtualizacao = 0
local IntervaloAtualizacao = 0.1
local MeuTime = nil
local CirculoFOV
local Abas = {}
local AbaAtual = "AIM"

-- Função para verificar se é partida solo
local function IsPartidaSolo()
    local count = 0
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LP then
            count = count + 1
        end
    end
    return count <= 1 -- Se tiver 1 ou menos jogadores além de você, é solo
end

-- Função para converter string para Enum
local function GetMouseButtonFromString(buttonName)
    if buttonName == "MouseButton2" then
        return Enum.UserInputType.MouseButton2
    elseif buttonName == "MouseButton3" then
        return Enum.UserInputType.MouseButton3
    else
        return Enum.UserInputType.MouseButton2
    end
end

-- Função para criar círculo FOV
local function CriarCirculoFOV()
    if CirculoFOV then CirculoFOV:Remove() end
    
    local circulo = Drawing.new("Circle")
    circulo.Visible = AimbotConfig.MostrarFOV
    circulo.Radius = AimbotConfig.CampoVisao
    circulo.Color = AimbotConfig.CorFOV
    circulo.Thickness = 2
    circulo.Filled = false
    circulo.Position = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
    circulo.Transparency = 1
    circulo.NumSides = 36
    
    CirculoFOV = circulo
    return circulo
end

-- Função para detectar o time do jogador
local function DetectarMeuTime()
    if LP and LP.Character then
        for _, part in pairs(LP.Character:GetChildren()) do
            if part:IsA("BasePart") and part.BrickColor ~= BrickColor.new("Institutional white") then
                MeuTime = part.BrickColor
                break
            end
        end
        
        if not MeuTime and LP.Team then
            MeuTime = LP.Team.TeamColor
        end
    end
    return MeuTime
end

-- Função para verificar se jogador é inimigo
local function IsInimigo(jogador)
    if not AimbotConfig.ApenasInimigos then return true end
    if IsPartidaSolo() then return true end -- Em partida solo, todos são inimigos
    if not MeuTime then DetectarMeuTime() end
    
    if jogador.Team and LP.Team then
        return jogador.Team ~= LP.Team
    end
    
    if jogador.Character then
        for _, part in pairs(jogador.Character:GetChildren()) do
            if part:IsA("BasePart") and part.BrickColor ~= MeuTime then
                return true
            end
        end
    end
    
    return true
end

-- Função para criar interface avançada
local function CriarInterface()
    if GUI then GUI:Destroy() end
    
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "ArsenalCheatMenu"
    screenGui.Parent = game.CoreGui
    screenGui.ResetOnSpawn = false

    -- Frame principal
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.new(0, 350, 0, 380)
    mainFrame.Position = UDim2.new(0.5, -175, 0.5, -190)
    mainFrame.BackgroundColor3 = GUIConfig.CorFundo
    mainFrame.BorderSizePixel = 0
    mainFrame.Active = true
    mainFrame.Draggable = true
    mainFrame.Parent = screenGui

    -- Título com made by equinox
    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Size = UDim2.new(1, 0, 0, 30)
    title.Position = UDim2.new(0, 0, 0, 0)
    title.BackgroundColor3 = GUIConfig.CorTitulo
    title.TextColor3 = GUIConfig.CorDestaque
    title.Text = "Arsenal Cheat - made by equinox https://discord.gg/qEMQq4XZjn"
    title.Font = Enum.Font.GothamBold
    title.TextSize = 14
    title.Parent = mainFrame

    -- Abas
    local abasFrame = Instance.new("Frame")
    abasFrame.Name = "AbasFrame"
    abasFrame.Size = UDim2.new(1, 0, 0, 30)
    abasFrame.Position = UDim2.new(0, 0, 0, 30)
    abasFrame.BackgroundColor3 = GUIConfig.CorBotoes
    abasFrame.BorderSizePixel = 0
    abasFrame.Parent = mainFrame

    -- Botão Aba AIM
    local aimTab = Instance.new("TextButton")
    aimTab.Name = "AimTab"
    aimTab.Size = UDim2.new(0.5, 0, 1, 0)
    aimTab.Position = UDim2.new(0, 0, 0, 0)
    aimTab.BackgroundColor3 = AbaAtual == "AIM" and GUIConfig.CorDestaque or GUIConfig.CorBotoes
    aimTab.TextColor3 = GUIConfig.CorTexto
    aimTab.Text = "AIM"
    aimTab.Font = Enum.Font.GothamBold
    aimTab.TextSize = 12
    aimTab.Parent = abasFrame

    -- Botão Aba ESP
    local espTab = Instance.new("TextButton")
    espTab.Name = "EspTab"
    espTab.Size = UDim2.new(0.5, 0, 1, 0)
    espTab.Position = UDim2.new(0.5, 0, 0, 0)
    espTab.BackgroundColor3 = AbaAtual == "ESP" and GUIConfig.CorDestaque or GUIConfig.CorBotoes
    espTab.TextColor3 = GUIConfig.CorTexto
    espTab.Text = "ESP"
    espTab.Font = Enum.Font.GothamBold
    espTab.TextSize = 12
    espTab.Parent = abasFrame

    -- Conteúdo das abas
    local contentFrame = Instance.new("Frame")
    contentFrame.Name = "ContentFrame"
    contentFrame.Size = UDim2.new(1, 0, 0, 320)
    contentFrame.Position = UDim2.new(0, 0, 0, 60)
    contentFrame.BackgroundTransparency = 1
    contentFrame.Parent = mainFrame

    -- Conteúdo Aba AIM
    local aimContent = Instance.new("Frame")
    aimContent.Name = "AimContent"
    aimContent.Size = UDim2.new(1, 0, 1, 0)
    aimContent.Position = UDim2.new(0, 0, 0, 0)
    aimContent.BackgroundTransparency = 1
    aimContent.Visible = AbaAtual == "AIM"
    aimContent.Parent = contentFrame

    -- Conteúdo Aba ESP
    local espContent = Instance.new("Frame")
    espContent.Name = "EspContent"
    espContent.Size = UDim2.new(1, 0, 1, 0)
    espContent.Position = UDim2.new(0, 0, 0, 0)
    espContent.BackgroundTransparency = 1
    espContent.Visible = AbaAtual == "ESP"
    espContent.Parent = contentFrame

    -- Configurações AIM
    local aimbotToggle = Instance.new("TextButton")
    aimbotToggle.Name = "AimbotToggle"
    aimbotToggle.Size = UDim2.new(0, 160, 0, 25)
    aimbotToggle.Position = UDim2.new(0, 15, 0, 10)
    aimbotToggle.BackgroundColor3 = AimbotConfig.Ativado and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(150, 0, 0)
    aimbotToggle.TextColor3 = GUIConfig.CorTexto
    aimbotToggle.Text = "Aimbot: " .. (AimbotConfig.Ativado and "ON" or "OFF")
    aimbotToggle.Font = Enum.Font.Gotham
    aimbotToggle.TextSize = 12
    aimbotToggle.Parent = aimContent

    local inimigosToggle = Instance.new("TextButton")
    inimigosToggle.Name = "InimigosToggle"
    inimigosToggle.Size = UDim2.new(0, 160, 0, 25)
    inimigosToggle.Position = UDim2.new(0, 15, 0, 45)
    inimigosToggle.BackgroundColor3 = AimbotConfig.ApenasInimigos and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(150, 0, 0)
    inimigosToggle.TextColor3 = GUIConfig.CorTexto
    inimigosToggle.Text = "Apenas Inimigos: " .. (AimbotConfig.ApenasInimigos and "ON" or "OFF")
    inimigosToggle.Font = Enum.Font.Gotham
    inimigosToggle.TextSize = 12
    inimigosToggle.Parent = aimContent

    local mouseButtonDropdown = Instance.new("TextButton")
    mouseButtonDropdown.Name = "MouseButtonDropdown"
    mouseButtonDropdown.Size = UDim2.new(0, 160, 0, 25)
    mouseButtonDropdown.Position = UDim2.new(0, 15, 0, 80)
    mouseButtonDropdown.BackgroundColor3 = GUIConfig.CorBotoes
    mouseButtonDropdown.TextColor3 = GUIConfig.CorTexto
    mouseButtonDropdown.Text = "Botão: " .. (AimbotConfig.TeclaAtivacao == "MouseButton2" and "Direito" or "Meio")
    mouseButtonDropdown.Font = Enum.Font.Gotham
    mouseButtonDropdown.TextSize = 12
    mouseButtonDropdown.Parent = aimContent

    local bodyPartDropdown = Instance.new("TextButton")
    bodyPartDropdown.Name = "BodyPartDropdown"
    bodyPartDropdown.Size = UDim2.new(0, 160, 0, 25)
    bodyPartDropdown.Position = UDim2.new(0, 15, 0, 115)
    bodyPartDropdown.BackgroundColor3 = GUIConfig.CorBotoes
    bodyPartDropdown.TextColor3 = GUIConfig.CorTexto
    bodyPartDropdown.Text = "Mira: " .. AimbotConfig.ParteCorpo
    bodyPartDropdown.Font = Enum.Font.Gotham
    bodyPartDropdown.TextSize = 12
    bodyPartDropdown.Parent = aimContent

    local fovToggle = Instance.new("TextButton")
    fovToggle.Name = "FovToggle"
    fovToggle.Size = UDim2.new(0, 160, 0, 25)
    fovToggle.Position = UDim2.new(0, 15, 0, 150)
    fovToggle.BackgroundColor3 = AimbotConfig.MostrarFOV and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(150, 0, 0)
    fovToggle.TextColor3 = GUIConfig.CorTexto
    fovToggle.Text = "Mostrar FOV: " .. (AimbotConfig.MostrarFOV and "ON" or "OFF")
    fovToggle.Font = Enum.Font.Gotham
    fovToggle.TextSize = 12
    fovToggle.Parent = aimContent

    local fovColorBtn = Instance.new("TextButton")
    fovColorBtn.Name = "FovColorBtn"
    fovColorBtn.Size = UDim2.new(0, 160, 0, 25)
    fovColorBtn.Position = UDim2.new(0, 15, 0, 185)
    fovColorBtn.BackgroundColor3 = AimbotConfig.CorFOV
    fovColorBtn.TextColor3 = GUIConfig.CorTexto
    fovColorBtn.Text = "Cor FOV"
    fovColorBtn.Font = Enum.Font.Gotham
    fovColorBtn.TextSize = 12
    fovColorBtn.Parent = aimContent

    local smoothLabel = Instance.new("TextLabel")
    smoothLabel.Name = "SmoothLabel"
    smoothLabel.Size = UDim2.new(0, 160, 0, 20)
    smoothLabel.Position = UDim2.new(0, 15, 0, 220)
    smoothLabel.BackgroundTransparency = 1
    smoothLabel.TextColor3 = GUIConfig.CorTexto
    smoothLabel.Text = "Suavidade: " .. AimbotConfig.Suavidade
    smoothLabel.Font = Enum.Font.Gotham
    smoothLabel.TextSize = 12
    smoothLabel.TextXAlignment = Enum.TextXAlignment.Left
    smoothLabel.Parent = aimContent

    -- Configurações ESP
    local chamsToggle = Instance.new("TextButton")
    chamsToggle.Name = "ChamsToggle"
    chamsToggle.Size = UDim2.new(0, 160, 0, 25)
    chamsToggle.Position = UDim2.new(0, 15, 0, 10)
    chamsToggle.BackgroundColor3 = ESPConfig.Ativado and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(150, 0, 0)
    chamsToggle.TextColor3 = GUIConfig.CorTexto
    chamsToggle.Text = "Chams: " .. (ESPConfig.Ativado and "ON" or "OFF")
    chamsToggle.Font = Enum.Font.Gotham
    chamsToggle.TextSize = 12
    chamsToggle.Parent = espContent

    local enemyColorBtn = Instance.new("TextButton")
    enemyColorBtn.Name = "EnemyColorBtn"
    enemyColorBtn.Size = UDim2.new(0, 160, 0, 25)
    enemyColorBtn.Position = UDim2.new(0, 15, 0, 45)
    enemyColorBtn.BackgroundColor3 = ESPConfig.CorInimigos
    enemyColorBtn.TextColor3 = GUIConfig.CorTexto
    enemyColorBtn.Text = "Cor Inimigos"
    enemyColorBtn.Font = Enum.Font.Gotham
    enemyColorBtn.TextSize = 12
    enemyColorBtn.Parent = espContent

    local transLabel = Instance.new("TextLabel")
    transLabel.Name = "TransLabel"
    transLabel.Size = UDim2.new(0, 160, 0, 20)
    transLabel.Position = UDim2.new(0, 15, 0, 80)
    transLabel.BackgroundTransparency = 1
    transLabel.TextColor3 = GUIConfig.CorTexto
    transLabel.Text = "Transparência: " .. ESPConfig.Transparencia
    transLabel.Font = Enum.Font.Gotham
    transLabel.TextSize = 12
    transLabel.TextXAlignment = Enum.TextXAlignment.Left
    transLabel.Parent = espContent

    -- Botão de fechar
    local closeBtn = Instance.new("TextButton")
    closeBtn.Name = "CloseBtn"
    closeBtn.Size = UDim2.new(0, 320, 0, 25)
    closeBtn.Position = UDim2.new(0, 15, 0, 285)
    closeBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
    closeBtn.TextColor3 = GUIConfig.CorTexto
    closeBtn.Text = "Fechar Menu (RightShift para abrir)"
    closeBtn.Font = Enum.Font.Gotham
    closeBtn.TextSize = 12
    closeBtn.Parent = contentFrame

    -- Informações
    local infoText = Instance.new("TextLabel")
    infoText.Name = "InfoText"
    infoText.Size = UDim2.new(1, -30, 0, 40)
    infoText.Position = UDim2.new(0, 15, 0, 245)
    infoText.BackgroundTransparency = 1
    infoText.TextColor3 = Color3.fromRGB(200, 200, 200)
    infoText.Text = "Modo: " .. (IsPartidaSolo() and "SOLO" or "MULTIJOGADOR") .. "\nmade by equinox https://discord.gg/qEMQq4XZjn"
    infoText.Font = Enum.Font.Gotham
    infoText.TextSize = 11
    infoText.TextXAlignment = Enum.TextXAlignment.Left
    infoText.Parent = contentFrame

    -- Eventos das abas
    aimTab.MouseButton1Click:Connect(function()
        AbaAtual = "AIM"
        aimTab.BackgroundColor3 = GUIConfig.CorDestaque
        espTab.BackgroundColor3 = GUIConfig.CorBotoes
        aimContent.Visible = true
        espContent.Visible = false
    end)

    espTab.MouseButton1Click:Connect(function()
        AbaAtual = "ESP"
        aimTab.BackgroundColor3 = GUIConfig.CorBotoes
        espTab.BackgroundColor3 = GUIConfig.CorDestaque
        aimContent.Visible = false
        espContent.Visible = true
    end)

    -- Eventos AIM
    aimbotToggle.MouseButton1Click:Connect(function()
        AimbotConfig.Ativado = not AimbotConfig.Ativado
        aimbotToggle.BackgroundColor3 = AimbotConfig.Ativado and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(150, 0, 0)
        aimbotToggle.Text = "Aimbot: " .. (AimbotConfig.Ativado and "ON" or "OFF")
    end)

    inimigosToggle.MouseButton1Click:Connect(function()
        AimbotConfig.ApenasInimigos = not AimbotConfig.ApenasInimigos
        inimigosToggle.BackgroundColor3 = AimbotConfig.ApenasInimigos and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(150, 0, 0)
        inimigosToggle.Text = "Apenas Inimigos: " .. (AimbotConfig.ApenasInimigos and "ON" or "OFF")
    end)

    mouseButtonDropdown.MouseButton1Click:Connect(function()
        if AimbotConfig.TeclaAtivacao == "MouseButton2" then
            AimbotConfig.TeclaAtivacao = "MouseButton3"
            mouseButtonDropdown.Text = "Botão: Meio"
        else
            AimbotConfig.TeclaAtivacao = "MouseButton2"
            mouseButtonDropdown.Text = "Botão: Direito"
        end
    end)

    bodyPartDropdown.MouseButton1Click:Connect(function()
        local parts = {"Head", "UpperTorso", "HumanoidRootPart"}
        local currentIndex = table.find(parts, AimbotConfig.ParteCorpo) or 1
        local nextIndex = currentIndex % #parts + 1
        AimbotConfig.ParteCorpo = parts[nextIndex]
        bodyPartDropdown.Text = "Mira: " .. AimbotConfig.ParteCorpo
    end)

    fovToggle.MouseButton1Click:Connect(function()
        AimbotConfig.MostrarFOV = not AimbotConfig.MostrarFOV
        fovToggle.BackgroundColor3 = AimbotConfig.MostrarFOV and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(150, 0, 0)
        fovToggle.Text = "Mostrar FOV: " .. (AimbotConfig.MostrarFOV and "ON" or "OFF")
        if CirculoFOV then
            CirculoFOV.Visible = AimbotConfig.MostrarFOV
        end
    end)

    fovColorBtn.MouseButton1Click:Connect(function()
        local cores = {
            Color3.fromRGB(255, 255, 255), -- Branco
            Color3.fromRGB(255, 50, 50),   -- Vermelho
            Color3.fromRGB(0, 255, 0),     -- Verde
            Color3.fromRGB(0, 150, 255),   -- Azul
            Color3.fromRGB(255, 255, 0),   -- Amarelo
        }
        local currentIndex = table.find(cores, AimbotConfig.CorFOV) or 1
        local nextIndex = currentIndex % #cores + 1
        AimbotConfig.CorFOV = cores[nextIndex]
        fovColorBtn.BackgroundColor3 = AimbotConfig.CorFOV
        if CirculoFOV then
            CirculoFOV.Color = AimbotConfig.CorFOV
        end
    end)

    -- Eventos ESP
    chamsToggle.MouseButton1Click:Connect(function()
        ESPConfig.Ativado = not ESPConfig.Ativado
        chamsToggle.BackgroundColor3 = ESPConfig.Ativado and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(150, 0, 0)
        chamsToggle.Text = "Chams: " .. (ESPConfig.Ativado and "ON" or "OFF")
        
        if not ESPConfig.Ativado then
            for _, cham in pairs(ChamsInstances) do
                if cham then
                    cham:Destroy()
                end
            end
            ChamsInstances = {}
        end
    end)

    enemyColorBtn.MouseButton1Click:Connect(function()
        local cores = {
            Color3.fromRGB(255, 50, 50),   -- Vermelho
            Color3.fromRGB(255, 100, 0),   -- Laranja
            Color3.fromRGB(255, 255, 0),   -- Amarelo
            Color3.fromRGB(0, 255, 0),     -- Verde
            Color3.fromRGB(0, 255, 255),   -- Ciano
        }
        local currentIndex = table.find(cores, ESPConfig.CorInimigos) or 1
        local nextIndex = currentIndex % #cores + 1
        ESPConfig.CorInimigos = cores[nextIndex]
        enemyColorBtn.BackgroundColor3 = ESPConfig.CorInimigos
    end)

    closeBtn.MouseButton1Click:Connect(function()
        screenGui.Enabled = false
    end)

    GUI = screenGui
end

-- Função para criar Chams otimizados
local function CriarChams(character, isEnemy)
    if not character or not character:IsDescendantOf(Workspace) then return end
    
    for part, cham in pairs(ChamsInstances) do
        if part.Parent == character then
            if not part:IsDescendantOf(Workspace) then
                cham:Destroy()
                ChamsInstances[part] = nil
            else
                cham.Color3 = isEnemy and ESPConfig.CorInimigos or ESPConfig.CorAliados
                return
            end
        end
    end
    
    local partsToCham = {
        "Head", "UpperTorso", "LowerTorso", 
        "LeftUpperArm", "RightUpperArm", 
        "LeftUpperLeg", "RightUpperLeg"
    }
    
    for _, partName in pairs(partsToCham) do
        local part = character:FindFirstChild(partName)
        if part and part:IsA("BasePart") then
            if ChamsInstances[part] then
                ChamsInstances[part]:Destroy()
            end
            
            local box = Instance.new("BoxHandleAdornment")
            box.Name = "Chams"
            box.Adornee = part
            box.AlwaysOnTop = true
            box.ZIndex = 5
            box.Size = part.Size * 1.05
            box.Transparency = ESPConfig.Transparencia
            box.Color3 = isEnemy and ESPConfig.CorInimigos or ESPConfig.CorAliados
            box.Parent = part
            
            ChamsInstances[part] = box
        end
    end
end

-- Função para remover Chams
local function RemoverChams(character)
    for part, cham in pairs(ChamsInstances) do
        if not part:IsDescendantOf(Workspace) or (character and part.Parent == character) then
            cham:Destroy()
            ChamsInstances[part] = nil
        end
    end
end

-- Função WorldToScreen otimizada
local function WorldToScreen(pos)
    local posTela, visivel = Camera:WorldToViewportPoint(pos)
    return Vector2.new(posTela.X, posTela.Y), visivel
end

-- Função para encontrar o melhor alvo otimizada
local function EncontrarAlvo()
    if not AimbotConfig.Ativado then return nil end
    
    local melhorAlvo = nil
    local menorDistancia = AimbotConfig.CampoVisao
    local posMouse = UIS:GetMouseLocation()
    
    for _, jogador in ipairs(Players:GetPlayers()) do
        if jogador ~= LP and jogador.Character then
            local character = jogador.Character
            local parteAlvo = character:FindFirstChild(AimbotConfig.ParteCorpo)
            local humanoide = character:FindFirstChild("Humanoid")
            
            if parteAlvo and humanoide and humanoide.Health > 0 then
                if AimbotConfig.ApenasInimigos and not IsInimigo(jogador) then
                    continue
                end
                
                local pos2D, visivel = WorldToScreen(parteAlvo.Position)
                if visivel then
                    local distancia = (pos2D - posMouse).Magnitude
                    
                    if distancia < menorDistancia then
                        local distancia3D = (parteAlvo.Position - Camera.CFrame.Position).Magnitude
                        if distancia3D <= AimbotConfig.DistanciaMaxima then
                            menorDistancia = distancia
                            melhorAlvo = {Jogador = jogador, Parte = parteAlvo}
                        end
                    end
                end
            end
        end
    end
    
    return melhorAlvo
end

-- Função de mira otimizada
local function MirarNoAlvo()
    if not AimbotConfig.Ativado then return end
    
    local alvo = EncontrarAlvo()
    if not alvo then return end
    
    local parte = alvo.Parte
    local posCamera = Camera.CFrame.Position
    local posAlvo = parte.Position
    
    if parte.Name == "Head" then
        posAlvo = posAlvo + Vector3.new(0, -0.3, 0)
    elseif parte.Name == "UpperTorso" then
        posAlvo = posAlvo + Vector3.new(0, 0.5, 0)
    end
    
    local direcao = (posAlvo - posCamera).Unit
    local suavidade = AimbotConfig.Suavidade
    local novaDirecao = Camera.CFrame.LookVector:Lerp(direcao, 1 - suavidade)
    
    Camera.CFrame = CFrame.new(posCamera, posCamera + novaDirecao)
end

-- Inicialização
DetectarMeuTime()
CriarInterface()
CriarCirculoFOV()

-- Detectar pressionamento do botão do mouse
UIS.InputBegan:Connect(function(input)
    if input.UserInputType == GetMouseButtonFromString(AimbotConfig.TeclaAtivacao) then
        MouseButtonPressed = true
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == GetMouseButtonFromString(AimbotConfig.TeclaAtivacao) then
        MouseButtonPressed = false
    end
end)

-- Loop principal otimizado
Conexoes.Render = RS.RenderStepped:Connect(function()
    local tempoAtual = tick()
    
    -- Atualizar FOV circle position
    if CirculoFOV then
        CirculoFOV.Position = UIS:GetMouseLocation()
        CirculoFOV.Radius = AimbotConfig.CampoVisao
    end
    
    -- Atualizar em intervalos para melhor performance
    if tempoAtual - UltimaAtualizacao >= IntervaloAtualizacao then
        UltimaAtualizacao = tempoAtual
        
        -- Atualizar info texto
        if GUI and GUI:FindFirstChild("MainFrame") then
            local infoText = GUI.MainFrame.ContentFrame:FindFirstChild("InfoText")
            if infoText then
                infoText.Text = "Modo: " .. (IsPartidaSolo() and "SOLO" or "MULTIJOGADOR") .. "\nmade by equinox https://discord.gg/qEMQq4XZjn"
            end
        end
        
        -- Processar Chams
        if ESPConfig.Ativado then
            for _, jogador in ipairs(Players:GetPlayers()) do
                if jogador ~= LP and jogador.Character then
                    local character = jogador.Character
                    local humanoide = character:FindFirstChild("Humanoid")
                    
                    if humanoide and humanoide.Health > 0 then
                        local isEnemy = IsInimigo(jogador)
                        CriarChams(character, isEnemy)
                    else
                        RemoverChams(character)
                    end
                end
            end
        end
    end
    
    -- Processar Aimbot (sempre ativo quando pressionado)
    if AimbotConfig.Ativado and MouseButtonPressed then
        MirarNoAlvo()
    end
end)

-- Tecla para abrir/fechar menu
UIS.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.RightShift then
        GUI.Enabled = not GUI.Enabled
    end
end)

-- Limpeza quando o jogador sai
Players.PlayerRemoving:Connect(function(jogador)
    if jogador == LP then
        for _, conexao in pairs(Conexoes) do
            conexao:Disconnect()
        end
        RemoverChams()
        if GUI then
            GUI:Destroy()
        end
        if CirculoFOV then
            CirculoFOV:Remove()
        end
    else
        RemoverChams(jogador.Character)
    end
end)

warn("=== Arsenal Cheat - made by equinox / https://discord.gg/qEMQq4XZjn   ===")
warn("Pressione RightShift para abrir/fechar o menu")
warn("Botão do Aimbot: " .. (AimbotConfig.TeclaAtivacao == "MouseButton2" and "Direito" or "Meio"))
warn("Apenas Inimigos: " .. (AimbotConfig.ApenasInimigos and "ON" or "OFF"))
warn("Modo: " .. (IsPartidaSolo() and "SOLO" or "MULTIJOGADOR"))
warn("================================")
    
    wait(1)
    
    StatusText.Text = "Cheat carregado com sucesso!"
    LoadButton.Text = "CARREGADO ✓"
    LoadButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
    
    -- Fechar o loader após 2 segundos
    wait(2)
    ScreenGui:Destroy()
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Arsenal Cheat",
        Text = "Cheat carregado com sucesso!",
        Duration = 5
    })
end)

-- Botão de fechar
local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -35, 0, 5)
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Text = "X"
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 14
CloseButton.Parent = MainFrame

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

warn("=== Arsenal Loader v" .. loaderversion .. " - made by equinox ===")
warn("Loader inicializado. Clique para carregar o cheat.")