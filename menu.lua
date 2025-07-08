
-- Jogoroblox HUB - Menu Principal
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "JogorobloxMenu"
gui.ResetOnSpawn = false

-- Fundo do Menu (quase toda a tela)
local fundo = Instance.new("Frame", gui)
fundo.Name = "FundoMenu"
fundo.Size = UDim2.new(0.85, 0, 0.85, 0)
fundo.AnchorPoint = Vector2.new(0.5, 0.5)
fundo.Position = UDim2.new(0.5, 0, 0.5, 0)
fundo.BackgroundColor3 = Color3.new(0, 0, 0)
fundo.BorderSizePixel = 0
fundo.AnchorPoint = Vector2.new(0.5, 0.5)

-- Layout de Abas (coluna vertical à esquerda)
local abasLayout = Instance.new("Frame", fundo)
abasLayout.Name = "LayoutAbas"
abasLayout.Size = UDim2.new(0.2, 0, 1, 0)
abasLayout.Position = UDim2.new(0, 0, 0, 0)
abasLayout.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

local abasList = Instance.new("UIListLayout", abasLayout)
abasList.SortOrder = Enum.SortOrder.LayoutOrder
abasList.Padding = UDim.new(0, 5)

-- Layout do Título acima das abas
local tituloLayout = Instance.new("Frame", fundo)
tituloLayout.Name = "LayoutTitulo"
tituloLayout.Size = UDim2.new(0.2, 0, 0.1, 0)
tituloLayout.Position = UDim2.new(0, 0, -0.1, 0)
tituloLayout.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

local titulo = Instance.new("TextLabel", tituloLayout)
titulo.Name = "TituloHub"
titulo.Size = UDim2.new(1, 0, 1, 0)
titulo.Position = UDim2.new(0, 0, 0, 0)
titulo.BackgroundTransparency = 1
titulo.Text = "Jogoroblox HUB"
titulo.TextColor3 = Color3.fromRGB(255, 255, 255)
titulo.Font = Enum.Font.GothamBold
titulo.TextScaled = true

-- Área para botões dinâmicos (direita)
local botoesArea = Instance.new("Frame", fundo)
botoesArea.Name = "BotoesArea"
botoesArea.Size = UDim2.new(0.8, 0, 1, 0)
botoesArea.Position = UDim2.new(0.2, 0, 0, 0)
botoesArea.BackgroundTransparency = 1

-- UIList para botões dinâmicos
local botoesList = Instance.new("UIListLayout", botoesArea)
botoesList.SortOrder = Enum.SortOrder.LayoutOrder
botoesList.Padding = UDim.new(0, 6)

-- Função para criar botões da aba
local function criarBotoes(nome)
    botoesArea:ClearAllChildren()
    botoesList.Parent = botoesArea
    for i = 1, 5 do
        local botao = Instance.new("TextButton", botoesArea)
        botao.Size = UDim2.new(0.9, 0, 0, 40)
        botao.BackgroundColor3 = Color3.fromRGB(180, 100, 255)
        botao.Text = nome .. " Opção " .. i
        botao.Font = Enum.Font.Gotham
        botao.TextColor3 = Color3.fromRGB(255, 255, 255)
        botao.TextScaled = true
        Instance.new("UICorner", botao).CornerRadius = UDim.new(0, 6)
    end
end

-- Criar as 5 abas
local nomesAbas = {"Entrada", "Casas", "Carros", "Avatar", "Fun"}

for _, nome in ipairs(nomesAbas) do
    local aba = Instance.new("TextButton", abasLayout)
    aba.Size = UDim2.new(1, 0, 0, 40)
    aba.BackgroundColor3 = Color3.fromRGB(180, 100, 255)
    aba.Text = nome
    aba.Font = Enum.Font.Gotham
    aba.TextColor3 = Color3.fromRGB(255, 255, 255)
    aba.TextScaled = true
    aba.MouseButton1Click:Connect(function()
        criarBotoes(nome)
    end)
    Instance.new("UICorner", aba).CornerRadius = UDim.new(0, 6)
end
