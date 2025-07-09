-- Jogoroblox HUB - Interface Estilo Dashboard sem Rayfield
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")

-- Remover menu antigo (se houver)
if playerGui:FindFirstChild("JogorobloxMenu") then
    playerGui.JogorobloxMenu:Destroy()
end

-- Criar ScreenGui
local screenGui = Instance.new("ScreenGui", playerGui)
screenGui.Name = "JogorobloxMenu"
screenGui.ResetOnSpawn = false

-- Frame principal que será arrastado (deve conter TODOS os elementos visíveis)
local dragFrame = Instance.new("Frame", screenGui)
dragFrame.AnchorPoint = Vector2.new(0.5, 0.5)
dragFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
dragFrame.Size = UDim2.new(0, 600, 0, 350)
dragFrame.BackgroundTransparency = 1  -- Invisível, só serve para agrupar
dragFrame.Name = "DragFrame"
dragFrame.Active = true
dragFrame.Draggable = true
dragFrame.Selectable = true

-- Container com bordas arredondadas (filho do dragFrame)
local mainContainer = Instance.new("Frame", dragFrame)
mainContainer.Size = UDim2.new(1, 0, 1, 0)
mainContainer.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Fundo preto sólido
mainContainer.BackgroundTransparency = 0
mainContainer.ClipsDescendants = true

-- Adicionar bordas arredondadas ao container
local uiCorner = Instance.new("UICorner", mainContainer)
uiCorner.CornerRadius = UDim.new(0, 8) -- Bordas arredondadas

-- Janela principal (dentro do container)
local mainFrame = Instance.new("Frame", mainContainer)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.Size = UDim2.new(1, -10, 1, -10) -- Margem interna de 5px
mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
mainFrame.BackgroundTransparency = 0.3
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Name = "MainFrame"

-- Bordas arredondadas para a janela principal
local mainFrameCorner = Instance.new("UICorner", mainFrame)
mainFrameCorner.CornerRadius = UDim.new(0, 6)

-- Título (filho de mainFrame)
local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(1, -50, 0, 40)
title.Position = UDim2.new(0, 10, 0, 10)
title.Text = "Jogoroblox HUB"
title.TextSize = 28
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.TextXAlignment = Enum.TextXAlignment.Left

-- Botão de fechar (filho de mainFrame)
local closeBtn = Instance.new("TextButton", mainFrame)
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 10)
closeBtn.Text = "X"
closeBtn.Font = Enum.Font.Gotham
closeBtn.TextSize = 20
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.BackgroundColor3 = Color3.fromRGB(100, 0, 150)
closeBtn.BorderSizePixel = 0
closeBtn.AutoButtonColor = true
closeBtn.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- [CONTINUE COM O RESTO DO SEU CÓDIGO ORIGINAL, GARANTINDO QUE TODOS OS ELEMENTOS VISÍVEIS SEJAM FILHOS DE mainFrame]

-- Ícone e nome do usuário
local user = Instance.new("TextLabel", mainFrame)
user.Position = UDim2.new(0, 10, 1, -30)
user.Size = UDim2.new(1, -20, 0, 20)
user.Text = player.Name
user.Font = Enum.Font.Gotham
user.TextColor3 = Color3.fromRGB(180, 180, 180)
user.BackgroundTransparency = 1
user.TextSize = 14
user.TextXAlignment = Enum.TextXAlignment.Left

-- Abas
local tabs = {"Entrada", "Casas", "Carros", "Avatar", "Fun"}
local tabButtons = {}
local selectedTab = nil

-- Conteúdo dos botões
local tabContents = {
    Entrada = {"Início", "Login", "Status", "Sobre", "Ajuda"},
    Casas = {"Casa 1", "Casa 2", "Casa 3", "Casa 4", "Casa 5"},
    Carros = {"Carro 1", "Carro 2", "Carro 3", "Moto", "Bicicleta"},
    Avatar = {"Chapéus", "Roupas", "Acessórios", "Cores", "Tamanho"},
    Fun = {"Explosão", "Fogo", "Loop", "Speed", "Fly"}
}

-- Layout das abas
local tabFrame = Instance.new("Frame", mainFrame)
tabFrame.Position = UDim2.new(0, 10, 0, 60)
tabFrame.Size = UDim2.new(0, 140, 1, -80)
tabFrame.BackgroundTransparency = 1

local tabLayout = Instance.new("UIListLayout", tabFrame)
tabLayout.Padding = UDim.new(0, 6)

-- Conteúdo de botões
local contentFrame = Instance.new("Frame", mainFrame)
contentFrame.Position = UDim2.new(0, 160, 0, 60)
contentFrame.Size = UDim2.new(1, -170, 1, -80)
contentFrame.BackgroundTransparency = 1

local contentLayout = Instance.new("UIListLayout", contentFrame)
contentLayout.Padding = UDim.new(0, 6)

-- Configurações de animação
local hoverTweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local defaultTweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

-- Função para animar botões
local function setupButtonHoverEffect(button)
    local defaultSize = button.Size
    local hoverSize = UDim2.new(defaultSize.X.Scale * 1.05, defaultSize.X.Offset, 
                              defaultSize.Y.Scale * 1.05, defaultSize.Y.Offset)
    
    button.MouseEnter:Connect(function()
        -- Anima o botão hover para aumentar
        TweenService:Create(button, hoverTweenInfo, {
            Size = hoverSize,
            BackgroundColor3 = Color3.fromRGB(150, 0, 220)
        }):Play()
        
        -- Anima os outros botões para diminuir
        for _, otherButton in pairs(tabButtons) do
            if otherButton ~= button then
                TweenService:Create(otherButton, hoverTweenInfo, {
                    Size = UDim2.new(defaultSize.X.Scale * 0.95, defaultSize.X.Offset, 
                                   defaultSize.Y.Scale * 0.95, defaultSize.Y.Offset),
                    BackgroundColor3 = Color3.fromRGB(100, 0, 150)
                }):Play()
            end
        end
    end)
    
    button.MouseLeave:Connect(function()
        -- Restaura todos os botões para o tamanho padrão
        for _, otherButton in pairs(tabButtons) do
            TweenService:Create(otherButton, defaultTweenInfo, {
                Size = defaultSize,
                BackgroundColor3 = (otherButton == selectedTab and Color3.fromRGB(180, 0, 255)) 
                                  or Color3.fromRGB(120, 0, 180)
            }):Play()
        end
    end)
end

-- Função para trocar abas
local function switchTab(tab)
    selectedTab = tab
    for _, btn in pairs(tabButtons) do
        btn.BackgroundColor3 = Color3.fromRGB(120, 0, 180)
    end
    tabButtons[tab].BackgroundColor3 = Color3.fromRGB(180, 0, 255)

    -- Limpar conteúdo
    for _, c in ipairs(contentFrame:GetChildren()) do
        if c:IsA("TextButton") then c:Destroy() end
    end

    -- Adicionar botões
    for _, name in ipairs(tabContents[tab]) do
        local b = Instance.new("TextButton", contentFrame)
        b.Size = UDim2.new(1, 0, 0, 32)
        b.Text = name
        b.TextSize = 18
        b.Font = Enum.Font.Gotham
        b.TextColor3 = Color3.fromRGB(255, 255, 255)
        b.BackgroundColor3 = Color3.fromRGB(120, 0, 180)
        b.BorderSizePixel = 0
        b.AutoButtonColor = true
        b.TextXAlignment = Enum.TextXAlignment.Left
        b.BackgroundTransparency = 0
        b.Name = name
        b.TextWrapped = true
        b.ClipsDescendants = true
        b.TextStrokeTransparency = 0.8
        b.BackgroundTransparency = 0
        b.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        b.AutoButtonColor = true
        b.MouseEnter:Connect(function()
            TweenService:Create(b, hoverTweenInfo, {
                BackgroundColor3 = Color3.fromRGB(150, 0, 220)
            }):Play()
        end)
        b.MouseLeave:Connect(function()
            TweenService:Create(b, hoverTweenInfo, {
                BackgroundColor3 = Color3.fromRGB(120, 0, 180)
            }):Play()
        end)
    end
end

-- Criar botões das abas
for _, name in ipairs(tabs) do
    local tabBtn = Instance.new("TextButton", tabFrame)
    tabBtn.Size = UDim2.new(1, 0, 0, 36)
    tabBtn.Text = name
    tabBtn.TextSize = 18
    tabBtn.Font = Enum.Font.GothamBold
    tabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    tabBtn.BackgroundColor3 = Color3.fromRGB(120, 0, 180)
    tabBtn.BorderSizePixel = 0
    tabBtn.AutoButtonColor = true
    tabButtons[name] = tabBtn
    
    -- Configurar efeito hover
    setupButtonHoverEffect(tabBtn)
    
    tabBtn.MouseButton1Click:Connect(function()
        switchTab(name)
    end)
end

-- Ativar primeira aba por padrão
switchTab("Entrada")