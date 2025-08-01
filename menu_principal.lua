-- Jogoroblox HUB - Estilo Dashboard (Com Animações e Sons)
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Verificar se já existe uma GUI e destruir
if playerGui:FindFirstChild("JogorobloxInterface") then
    playerGui:FindFirstChild("JogorobloxInterface"):Destroy()
    print("GUI anterior destruída.")
end

-- Interface principal
local gui = Instance.new("ScreenGui", playerGui)
gui.Name = "JogorobloxInterface"
gui.ResetOnSpawn = false
print("ScreenGui criada em PlayerGui com ResetOnSpawn desativado.")

-- SISTEMA DE SOM
local function criarSom()
    local som = Instance.new("Sound")
    som.SoundId = "rbxasset://sounds/electronicpingshort.wav"
    som.Volume = 0.5
    som.Pitch = 1.2
    som.Parent = gui
    print("Som criado com ID:", som.SoundId)
    return som
end

local function tocarSomClique()
    local som = criarSom()
    som:Play()
    print("Som de clique tocado.")
    som.Ended:Connect(function()
        som:Destroy()
        print("Som destruído.")
    end)
    game:GetService("Debris"):AddItem(som, 2)
end

local main = Instance.new("Frame", gui)
main.Name = "MainMenu"
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.Position = UDim2.new(0.5, 0, 0.5, 0)
main.Size = UDim2.new(0, 0, 0, 0)
main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
main.BackgroundTransparency = 0
main.BorderSizePixel = 0
main.ClipsDescendants = true
main.Visible = false
print("Frame principal criado.")

-- Contorno roxo animado do menu principal
local contorno = Instance.new("UIStroke", main)
contorno.Color = Color3.fromRGB(140, 0, 255)
contorno.Thickness = 3
contorno.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
print("Contorno criado.")

local gradiente = Instance.new("UIGradient", contorno)
gradiente.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(140, 0, 255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 0, 140)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(140, 0, 255))
})
print("Gradiente criado.")

local function animarContorno(grad, velocidade)
    local rotacao = 0
    RunService.Heartbeat:Connect(function()
        rotacao = rotacao + (velocidade or 2)
        grad.Rotation = rotacao
        if rotacao >= 360 then
            rotacao = 0
        end
    end)
end
animarContorno(gradiente, 2)
print("Animação de contorno iniciada.")

local corner = Instance.new("UICorner", main)
corner.CornerRadius = UDim.new(0, 12)

-- Painel esquerdo (Abas)
local sidebar = Instance.new("Frame", main)
sidebar.Size = UDim2.new(0, 160, 1, 0)
sidebar.Position = UDim2.new(0, 0, 0, 0)
sidebar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
sidebar.BorderSizePixel = 0

local corner3 = Instance.new("UICorner", sidebar)
corner3.CornerRadius = UDim.new(0, 10)

-- Painel de botões da direita
local painelBotoes = Instance.new("Frame", main)
painelBotoes.Size = UDim2.new(1, -170, 1, -20)
painelBotoes.Position = UDim2.new(0, 170, 0, 15)
painelBotoes.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
painelBotoes.BorderSizePixel = 0

local painelCorner = Instance.new("UICorner", painelBotoes)
painelCorner.CornerRadius = UDim.new(0, 8)

-- BOTÃO X NO CANTO SUPERIOR DIREITO DO MENU
local close = Instance.new("TextButton", main)
close.Text = "X"
close.Size = UDim2.new(0, 30, 0, 30)
close.Position = UDim2.new(1, -40, 0, 10)
close.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
close.TextColor3 = Color3.new(1, 1, 1)
close.AutoButtonColor = false
close.ZIndex = 10

local closeStroke = Instance.new("UIStroke", close)
closeStroke.Color = Color3.fromRGB(140, 0, 255)
closeStroke.Thickness = 2
closeStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
closeStroke.Transparency = 1

local closeGradient = Instance.new("UIGradient", closeStroke)
closeGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(140, 0, 255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 0, 140)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(140, 0, 255))
})

local function animarContonoBotaoX()
    local rotacao = 0
    RunService.Heartbeat:Connect(function()
        rotacao = rotacao + 3
        closeGradient.Rotation = rotacao
        if rotacao >= 360 then
            rotacao = 0
        end
    end)
end

close.MouseEnter:Connect(function()
    closeStroke.Transparency = 0
    animarContonoBotaoX()
    close.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
end)

close.MouseLeave:Connect(function()
    closeStroke.Transparency = 1
    close.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
end)

local corner2 = Instance.new("UICorner", close)
corner2.CornerRadius = UDim.new(1, 0)

-- TÍTULO MAIOR COM FONTE FREDOKA ONE
local titulo = Instance.new("TextLabel", sidebar)
titulo.Size = UDim2.new(1, 0, 0, 50)
titulo.Position = UDim2.new(0, 0, 0, 5)
titulo.BackgroundTransparency = 1
titulo.Text = "Jogoroblox HUB"
titulo.TextColor3 = Color3.new(1, 1, 1)
titulo.Font = Enum.Font.FredokaOne
titulo.TextSize = 20
titulo.TextXAlignment = Enum.TextXAlignment.Center

-- Container para as abas
local abasContainer = Instance.new("Frame", sidebar)
abasContainer.Size = UDim2.new(1, 0, 1, -60)
abasContainer.Position = UDim2.new(0, 0, 0, 65)
abasContainer.BackgroundTransparency = 1

local sidebarLayout = Instance.new("UIListLayout", abasContainer)
sidebarLayout.Padding = UDim.new(0, 5)
sidebarLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- Nome do usuário e imagem (na parte inferior esquerda)
local profile = Instance.new("Frame", sidebar)
profile.Size = UDim2.new(1, -10, 0, 50)
profile.Position = UDim2.new(0, 5, 1, -60)
profile.BackgroundTransparency = 1
profile.ZIndex = 5

local icon = Instance.new("ImageLabel", profile)
icon.Size = UDim2.new(0, 32, 0, 32)
icon.Position = UDim2.new(0, 5, 0.5, -16)
icon.BackgroundTransparency = 1
icon.ZIndex = 6

local iconCorner = Instance.new("UICorner", icon)
iconCorner.CornerRadius = UDim.new(1, 0)

local success, thumbnailId = pcall(function()
    return Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
end)
icon.Image = success and thumbnailId or "rbxasset://textures/ui/GuiImagePlaceholder.png"

local username = Instance.new("TextLabel", profile)
username.Position = UDim2.new(0, 42, 0.5, -10)
username.Size = UDim2.new(1, -47, 0, 20)
username.Text = player.DisplayName
username.TextColor3 = Color3.new(1, 1, 1)
username.BackgroundTransparency = 1
username.Font = Enum.Font.Gotham
username.TextSize = 12
username.TextXAlignment = Enum.TextXAlignment.Left
username.ZIndex = 6

local layout = Instance.new("UIListLayout", painelBotoes)
layout.Padding = UDim.new(0, 6)
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.VerticalAlignment = Enum.VerticalAlignment.Center

local abaAtiva = nil
local todasAbas = {}
local todosBotoes = {}

local function animarAbas(abaSelecionada)
    for _, aba in pairs(todasAbas) do
        local tamanhoAlvo = (aba == abaSelecionada) and UDim2.new(1, -5, 0, 40) or UDim2.new(1, -15, 0, 32)
        local tween = TweenService:Create(aba, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {Size = tamanhoAlvo})
        tween:Play()
    end
end

local function animarBotoes(botaoSelecionado)
    for _, botao in pairs(todosBotoes) do
        local tamanhoAlvo = (botao == botaoSelecionado) and UDim2.new(1, -5, 0, 35) or UDim2.new(1, -15, 0, 28)
        local tween = TweenService:Create(botao, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {Size = tamanhoAlvo})
        tween:Play()
    end
end

local function resetarAbasAnimacao()
    for _, aba in pairs(todasAbas) do
        local tween = TweenService:Create(aba, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {Size = UDim2.new(1, -10, 0, 35)})
        tween:Play()
    end
end

local function resetarBotoesAnimacao()
    for _, botao in pairs(todosBotoes) do
        local tween = TweenService:Create(botao, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {Size = UDim2.new(1, -10, 0, 30)})
        tween:Play()
    end
end

local function criarAba(nome, callback)
    local aba = Instance.new("TextButton", abasContainer)
    aba.Size = UDim2.new(1, -10, 0, 35)
    aba.BackgroundColor3 = Color3.fromRGB(70, 0, 140)
    aba.Text = nome
    aba.TextColor3 = Color3.new(1, 1, 1)
    aba.Font = Enum.Font.Gotham
    aba.TextSize = 14
    aba.BorderSizePixel = 0

    local uiCorner = Instance.new("UICorner", aba)
    uiCorner.CornerRadius = UDim.new(0, 8)

    table.insert(todasAbas, aba)

    aba.MouseEnter:Connect(function()
        if aba ~= abaAtiva then
            aba.BackgroundColor3 = Color3.fromRGB(100, 0, 180)
            animarAbas(aba)
        end
    end)

    aba.MouseLeave:Connect(function()
        if aba ~= abaAtiva then
            aba.BackgroundColor3 = Color3.fromRGB(70, 0, 140)
            resetarAbasAnimacao()
        end
    end)

    aba.MouseButton1Click:Connect(function()
        tocarSomClique()
        if abaAtiva then
            abaAtiva.BackgroundColor3 = Color3.fromRGB(70, 0, 140)
        end
        aba.BackgroundColor3 = Color3.fromRGB(140, 0, 255)
        abaAtiva = aba
        animarAbas(aba)
        if callback then
            callback()
        end
    end)

    return aba
end

local function criarBotao(nome, funcao, delay)
    local botao = Instance.new("TextButton", painelBotoes)
    botao.Size = UDim2.new(1, -10, 0, 30)
    botao.BackgroundColor3 = Color3.fromRGB(90, 0, 180)
    botao.Text = nome
    botao.TextColor3 = Color3.new(1, 1, 1)
    botao.Font = Enum.Font.Gotham
    botao.TextSize = 14
    botao.BorderSizePixel = 0
    botao.Position = UDim2.new(0, 0, 0, 30)
    botao.BackgroundTransparency = 1
    botao.TextTransparency = 1

    local bcorner = Instance.new("UICorner", botao)
    bcorner.CornerRadius = UDim.new(0, 6)

    table.insert(todosBotoes, botao)
    wait(delay or 0)

    local tweenInfo = TweenInfo.new(0.6, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
    local tween = TweenService:Create(botao, tweenInfo, {
        Position = UDim2.new(0, 0, 0, 0),
        BackgroundTransparency = 0,
        TextTransparency = 0
    })
    tween:Play()

    botao.MouseEnter:Connect(function()
        botao.BackgroundColor3 = Color3.fromRGB(140, 0, 255)
        animarBotoes(botao)
    end)

    botao.MouseLeave:Connect(function()
        botao.BackgroundColor3 = Color3.fromRGB(90, 0, 180)
        resetarBotoesAnimacao()
    end)

    botao.MouseButton1Click:Connect(function()
        tocarSomClique()
        if funcao then
            funcao()
        end
    end)

    return botao
end

local function limparBotoes()
    todosBotoes = {}
    for _, child in pairs(painelBotoes:GetChildren()) do
        if (child:IsA("TextButton") and child ~= close) or child:IsA("Frame") then
            child:Destroy()
        end
    end
end

local sound = Instance.new("Sound")
sound.Volume = 0.5
sound.Parent = gui
local playlist = {}
local currentIndex = 1
local isPlaying = false

local savedPlaylist = {}
local function createListItem(id, index, listFrame)
    local item = Instance.new("TextButton")
    item.Name = "Item_" .. index
    item.Size = UDim2.new(1, -10, 0, 30)
    item.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    item.TextColor3 = Color3.fromRGB(255, 255, 255)
    item.Font = Enum.Font.SourceSans
    item.TextSize = 14
    item.Text = "🎵 ID: " .. id
    item.TextXAlignment = Enum.TextXAlignment.Left
    item.Parent = listFrame

    local itemCorner = Instance.new("UICorner")
    itemCorner.CornerRadius = UDim.new(0, 3)
    itemCorner.Parent = item

    if index == currentIndex and isPlaying then
        item.BackgroundColor3 = Color3.fromRGB(140, 0, 255)
    end

    item.MouseButton1Click:Connect(function()
        currentIndex = index
        playMusic()
        for _, child in pairs(listFrame:GetChildren()) do
            if child:IsA("TextButton") then
                child.BackgroundColor3 = (child.Name == "Item_"..currentIndex) and Color3.fromRGB(140, 0, 255) or Color3.fromRGB(50, 50, 50)
            end
        end
    end)
    return item
end

function playMusic()
    if #playlist > 0 then
        sound:Stop()
        sound.SoundId = "rbxassetid://" .. playlist[currentIndex]
        sound:Play()
        isPlaying = true
        local listFrame = painelBotoes:FindFirstChild("MusicPlayerFrame") and painelBotoes.MusicPlayerFrame:FindFirstChild("ListFrame")
        if listFrame then
            for _, child in pairs(listFrame:GetChildren()) do
                if child:IsA("TextButton") then
                    child.BackgroundColor3 = (child.Name == "Item_" .. currentIndex) and Color3.fromRGB(140, 0, 255) or Color3.fromRGB(50, 50, 50)
                end
            end
        end
    end
end

function pauseMusic()
    sound:Pause()
    isPlaying = false
end

local function addMusic(id, listFrame)
    if id and id ~= "" then
        table.insert(playlist, id)
        createListItem(id, #playlist, listFrame)
        table.insert(savedPlaylist, id)
        listFrame.CanvasSize = UDim2.new(0, 0, 0, #playlist * 32)
        print("Música adicionada e salva localmente: " .. id)
    end
end

local function loadSavedPlaylist(listFrame)
    for _, id in pairs(savedPlaylist) do
        table.insert(playlist, id)
        createListItem(id, #playlist, listFrame)
    end
    listFrame.CanvasSize = UDim2.new(0, 0, 0, #playlist * 32)
end

local function mostrarBotoes(nomeAba)
    limparBotoes()

    if nomeAba == "Entrada" then
        spawn(function()
            criarBotao("Teleportar Spawn", function()
                if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    player.Character.HumanoidRootPart.CFrame = workspace.SpawnLocation.CFrame
                end
            end, 0.05)
        end)
        spawn(function()
            criarBotao("Reset Character", function()
                if player.Character and player.Character:FindFirstChild("Humanoid") then
                    player.Character.Humanoid.Health = 0
                end
            end, 0.1)
        end)
        spawn(function()
            criarBotao("Fly Toggle", function()
                print("Fly ativado/desativado")
            end, 0.15)
        end)
        spawn(function()
            criarBotao("Noclip Toggle", function()
                print("Noclip ativado/desativado")
            end, 0.2)
        end)
        spawn(function()
            criarBotao("Speed Boost", function()
                if player.Character and player.Character:FindFirstChild("Humanoid") then
                    player.Character.Humanoid.WalkSpeed = 50
                end
            end, 0.25)
        end)

    elseif nomeAba == "Casas" then
        spawn(function()
            criarBotao("Casa 1", function()
                print("Teleportando para Casa 1")
            end, 0.05)
        end)
        spawn(function()
            criarBotao("Casa 2", function()
                print("Teleportando para Casa 2")
            end, 0.1)
        end)
        spawn(function()
            criarBotao("Casa 3", function()
                print("Teleportando para Casa 3")
            end, 0.15)
        end)
        spawn(function()
            criarBotao("Casa Premium", function()
                print("Teleportando para Casa Premium")
            end, 0.2)
        end)
        spawn(function()
            criarBotao("Todas as Casas", function()
                print("Mostrando todas as casas")
            end, 0.25)
        end)

    elseif nomeAba == "Carros" then
        spawn(function()
            criarBotao("Spawnar Carro", function()
                print("Spawnando carro")
            end, 0.1)
        end)
        spawn(function()
            criarBotao("Carro Rápido", function()
                print("Spawnando carro rápido")
            end, 0.2)
        end)
        spawn(function()
            criarBotao("Carro Voador", function()
                print("Spawnando carro voador")
            end, 0.3)
        end)
        spawn(function()
            criarBotao("Remover Carros", function()
                print("Removendo todos os carros")
            end, 0.4)
        end)
        spawn(function()
            criarBotao("Teleportar Garagem", function()
                print("Teleportando para garagem")
            end, 0.5)
        end)

    elseif nomeAba == "Avatar" then
        spawn(function()
            criarBotao("Tamanho Normal", function()
                if player.Character and player.Character:FindFirstChild("Humanoid") then
                    player.Character.Humanoid.HipHeight = 0
                end
            end, 0.1)
        end)
        spawn(function()
            criarBotao("Gigante", function()
                if player.Character and player.Character:FindFirstChild("Humanoid") then
                    player.Character.Humanoid.HipHeight = 10
                end
            end, 0.2)
        end)
        spawn(function()
            criarBotao("Anão", function()
                if player.Character and player.Character:FindFirstChild("Humanoid") then
                    player.Character.Humanoid.HipHeight = -2
                end
            end, 0.3)
        end)
        spawn(function()
            criarBotao("Invisível", function()
                print("Tornando invisível")
            end, 0.4)
        end)
        spawn(function()
            criarBotao("Restaurar Avatar", function()
                print("Restaurando avatar original")
            end, 0.5)
        end)

    elseif nomeAba == "Fun" then
        spawn(function()
            criarBotao("Spam Jump", function()
                print("Spam jump ativado")
            end, 0.1)
        end)
        spawn(function()
            criarBotao("Dança", function()
                print("Dançando")
            end, 0.2)
        end)
        spawn(function()
            criarBotao("Explosão", function()
                print("Criando explosão")
            end, 0.3)
        end)
        spawn(function()
            criarBotao("Chuva de Objetos", function()
                print("Chuva de objetos ativada")
            end, 0.4)
        end)
        spawn(function()
            criarBotao("Efeitos Especiais", function()
                print("Efeitos especiais ativados")
            end, 0.5)
        end)

    elseif nomeAba == "Música" then
        local mainFrame = Instance.new("Frame")
        mainFrame.Name = "MusicPlayerFrame"
        mainFrame.Size = UDim2.new(0, 400, 0, 300)
        mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
        mainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        mainFrame.BorderSizePixel = 0
        mainFrame.Parent = painelBotoes

        local corner = Instance.new("UICorner", mainFrame)
        corner.CornerRadius = UDim.new(0, 10)

        local title = Instance.new("TextLabel", mainFrame)
        title.Name = "Title"
        title.Size = UDim2.new(1, 0, 0, 40)
        title.Position = UDim2.new(0, 0, 0, 0)
        title.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        title.TextColor3 = Color3.fromRGB(255, 255, 255)
        title.Font = Enum.Font.SourceSansBold
        title.TextSize = 20
        title.Text = "🎵 Music Player"

        local titleCorner = Instance.new("UICorner", title)
        titleCorner.CornerRadius = UDim.new(0, 10)

        local inputFrame = Instance.new("Frame", mainFrame)
        inputFrame.Name = "InputFrame"
        inputFrame.Size = UDim2.new(1, -20, 0, 40)
        inputFrame.Position = UDim2.new(0, 10, 0, 50)
        inputFrame.BackgroundTransparency = 1

        local inputBox = Instance.new("TextBox", inputFrame)
        inputBox.Name = "InputBox"
        inputBox.Size = UDim2.new(1, -80, 1, 0)
        inputBox.Position = UDim2.new(0, 0, 0, 0)
        inputBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        inputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
        inputBox.Font = Enum.Font.SourceSans
        inputBox.TextSize = 16
        inputBox.PlaceholderText = "Digite o ID da música..."

        local inputCorner = Instance.new("UICorner", inputBox)
        inputCorner.CornerRadius = UDim.new(0, 5)

        local addButton = Instance.new("TextButton", inputFrame)
        addButton.Name = "AddButton"
        addButton.Size = UDim2.new(0, 70, 1, 0)
        addButton.Position = UDim2.new(1, -70, 0, 0)
        addButton.BackgroundColor3 = Color3.fromRGB(90, 0, 180)
        addButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        addButton.Font = Enum.Font.Gotham
        addButton.TextSize = 14
        addButton.Text = "Adicionar"

        local addCorner = Instance.new("UICorner", addButton)
        addCorner.CornerRadius = UDim.new(0, 6)

        local listFrame = Instance.new("ScrollingFrame", mainFrame)
        listFrame.Name = "ListFrame"
        listFrame.Size = UDim2.new(1, -20, 0, 120)
        listFrame.Position = UDim2.new(0, 10, 0, 100)
        listFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        listFrame.BorderSizePixel = 0
        listFrame.ScrollBarThickness = 8

        local listCorner = Instance.new("UICorner", listFrame)
        listCorner.CornerRadius = UDim.new(0, 5)

        local listLayout = Instance.new("UIListLayout", listFrame)
        listLayout.SortOrder = Enum.SortOrder.LayoutOrder
        listLayout.Padding = UDim.new(0, 2)

        local controlsFrame = Instance.new("Frame", mainFrame)
        controlsFrame.Name = "ControlsFrame"
        controlsFrame.Size = UDim2.new(1, -20, 0, 50)
        controlsFrame.Position = UDim2.new(0, 10, 0, 230)
        controlsFrame.BackgroundTransparency = 1

        local prevButton = Instance.new("TextButton", controlsFrame)
        prevButton.Name = "PrevButton"
        prevButton.Size = UDim2.new(0, 70, 0, 40)
        prevButton.Position = UDim2.new(0.5, -110, 0, 5)
        prevButton.BackgroundColor3 = Color3.fromRGB(90, 0, 180)
        prevButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        prevButton.Font = Enum.Font.Gotham
        prevButton.TextSize = 14
        prevButton.Text = "Voltar"

        local prevCorner = Instance.new("UICorner", prevButton)
        prevCorner.CornerRadius = UDim.new(0, 6)

        local playButton = Instance.new("TextButton", controlsFrame)
        playButton.Name = "PlayButton"
        playButton.Size = UDim2.new(0, 70, 0, 50)
        playButton.Position = UDim2.new(0.5, -35, 0, 0)
        playButton.BackgroundColor3 = Color3.fromRGB(90, 0, 180)
        playButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        playButton.Font = Enum.Font.Gotham
        playButton.TextSize = 20
        playButton.Text = isPlaying and "⏸" or "▶"

        local playCorner = Instance.new("UICorner", playButton)
        playCorner.CornerRadius = UDim.new(0, 6)

        local nextButton = Instance.new("TextButton", controlsFrame)
        nextButton.Name = "NextButton"
        nextButton.Size = UDim2.new(0, 70, 0, 40)
        nextButton.Position = UDim2.new(0.5, 40, 0, 5)
        nextButton.BackgroundColor3 = Color3.fromRGB(90, 0, 180)
        nextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        nextButton.Font = Enum.Font.Gotham
        nextButton.TextSize = 14
        nextButton.Text = "Próxima"

        local nextCorner = Instance.new("UICorner", nextButton)
        nextCorner.CornerRadius = UDim.new(0, 6)

        addButton.MouseButton1Click:Connect(function()
            addMusic(inputBox.Text, listFrame)
            inputBox.Text = ""
        end)

        inputBox.FocusLost:Connect(function(enterPressed)
            if enterPressed then
                addMusic(inputBox.Text, listFrame)
                inputBox.Text = ""
            end
        end)

        playButton.MouseButton1Click:Connect(function()
            if isPlaying then
                pauseMusic()
                playButton.Text = "▶"
            else
                playMusic()
                playButton.Text = "⏸"
            end
        end)

        prevButton.MouseButton1Click:Connect(function()
            if #playlist > 0 then
                currentIndex = currentIndex - 1
                if currentIndex < 1 then
                    currentIndex = #playlist
                end
                playMusic()
                playButton.Text = "⏸"
            end
        end)

        nextButton.MouseButton1Click:Connect(function()
            if #playlist > 0 then
                currentIndex = currentIndex + 1
                if currentIndex > #playlist then
                    currentIndex = 1
                end
                playMusic()
                playButton.Text = "⏸"
            end
        end)

        local function addHoverEffect(button)
            button.MouseEnter:Connect(function()
                button.BackgroundColor3 = Color3.fromRGB(140, 0, 255)
            end)
            button.MouseLeave:Connect(function()
                button.BackgroundColor3 = Color3.fromRGB(90, 0, 180)
            end)
        end

        addHoverEffect(addButton)
        addHoverEffect(prevButton)
        addHoverEffect(playButton)
        addHoverEffect(nextButton)

        loadSavedPlaylist(listFrame)
    end
end

local abaEntrada = criarAba("Entrada", function() mostrarBotoes("Entrada") end)
criarAba("Casas", function() mostrarBotoes("Casas") end)
criarAba("Carros", function() mostrarBotoes("Carros") end)
criarAba("Avatar", function() mostrarBotoes("Avatar") end)
criarAba("Fun", function() mostrarBotoes("Fun") end)
criarAba("Música", function() mostrarBotoes("Música") end)

abaEntrada.BackgroundColor3 = Color3.fromRGB(140, 0, 255)
abaAtiva = abaEntrada
mostrarBotoes("Entrada")
print("Abas e botões inicializados.")

-- BOTÃO FLUTUANTE PARA REABRIR MENU
local botaoReabrir = Instance.new("TextButton", gui)
botaoReabrir.Size = UDim2.new(0, 0, 0, 0)
botaoReabrir.Position = UDim2.new(0, 20, 0.5, -25)
botaoReabrir.BackgroundColor3 = Color3.fromRGB(140, 0, 255)
botaoReabrir.Text = "+"
botaoReabrir.TextColor3 = Color3.new(1, 1, 1)
botaoReabrir.Font = Enum.Font.GothamBold
botaoReabrir.TextSize = 30
botaoReabrir.Visible = false
botaoReabrir.AutoButtonColor = false

local reabrirCorner = Instance.new("UICorner", botaoReabrir)
reabrirCorner.CornerRadius = UDim.new(1, 0)

local reabrirStroke = Instance.new("UIStroke", botaoReabrir)
reabrirStroke.Color = Color3.fromRGB(140, 0, 255)
reabrirStroke.Thickness = 3
reabrirStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

local reabrirGrad = Instance.new("UIGradient", reabrirStroke)
reabrirGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(140, 0, 255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 0, 140)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(140, 0, 255))
})

animarContorno(reabrirGrad, 3)

local dragging, dragInput, dragStart, startPos
botaoReabrir.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = botaoReabrir.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

botaoReabrir.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        botaoReabrir.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

local function animarAberturaBotao()
    botaoReabrir.Visible = true
    local tweenInfo = TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
    local tween = TweenService:Create(botaoReabrir, tweenInfo, {Size = UDim2.new(0, 50, 0, 50)})
    tween:Play()
    print("Animação de abertura do botão iniciada.")
    tween.Completed:Connect(function()
        print("Animação de abertura do botão concluída.")
    end)
end

animarAberturaBotao()

local function animarAbertura()
    botaoReabrir.Visible = false
    main.Visible = true
    local tweenInfo = TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
    local tween = TweenService:Create(main, tweenInfo, {
        Size = UDim2.new(0, 700, 0, 350),
        Position = UDim2.new(0.5, 0, 0.42, 0)
    })
    tween:Play()
    print("Animação de abertura iniciada.")
    tween.Completed:Connect(function()
        botaoReabrir.Visible = false
        print("Animação de abertura concluída.")
    end)
end

botaoReabrir.MouseButton1Click:Connect(function()
    tocarSomClique()
    animarAbertura()
    print("Botão de reabrir clicado, iniciando abertura.")
end)

local function animarFechamento()
    local tweenInfo = TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
    local tween = TweenService:Create(main, tweenInfo, {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0)
    })
    tween:Play()
    print("Animação de fechamento iniciada.")
    tween.Completed:Connect(function()
        main.Visible = false
        animarAberturaBotao()
        print("Animação concluída, menu oculto.")
    end)
end

close.MouseButton1Click:Connect(function()
    tocarSomClique()
    animarFechamento()
    print("Botão X clicado, iniciando fechamento.")
end)
