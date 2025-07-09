-- Jogoroblox HUB - Tela de carregamento corrigida
local TweenService = game:GetService("TweenService")
local TextService = game:GetService("TextService")
local Players = game:GetService("Players")

-- Criação da interface
local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui", player.PlayerGui)  -- Alterado para PlayerGui
gui.Name = "JogorobloxHub"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true

-- Fundo preto
local fundo = Instance.new("Frame", gui)
fundo.Size = UDim2.new(1, 0, 1, 0)
fundo.Position = UDim2.new(0, 0, 0, 0)
fundo.BackgroundColor3 = Color3.new(0, 0, 0)
fundo.BackgroundTransparency = 0
fundo.BorderSizePixel = 0

-- Contorno da barra de carregamento (agora mais visível)
local contorno = Instance.new("Frame", fundo)
contorno.Size = UDim2.new(0.5, 0, 0, 20)
contorno.Position = UDim2.new(0.25, 0, 0.5, 0)
contorno.BackgroundColor3 = Color3.fromRGB(100, 0, 180)
contorno.BorderSizePixel = 0
local contornoCorner = Instance.new("UICorner", contorno)
contornoCorner.CornerRadius = UDim.new(0, 10)

-- Barra de progresso roxa
local barra = Instance.new("Frame", contorno)
barra.Size = UDim2.new(0, 0, 1, 0)
barra.BackgroundColor3 = Color3.fromRGB(150, 0, 255)
barra.BorderSizePixel = 0
local barraCorner = Instance.new("UICorner", barra)
barraCorner.CornerRadius = UDim.new(0, 10)

-- Texto principal (agora mais centralizado e visível)
local texto = Instance.new("TextLabel", fundo)
texto.Text = "Jogoroblox HUB"
texto.Size = UDim2.new(0, 300, 0, 55)  -- Tamanho fixo para melhor controle
texto.Position = UDim2.new(0.5, -150, 0.39, 0)  -- Centralizado horizontalmente
texto.AnchorPoint = Vector2.new(0.5, 0)
texto.BackgroundTransparency = 1
texto.Font = Enum.Font.FredokaOne
texto.TextColor3 = Color3.new(1, 1, 1)
texto.TextScaled = true
texto.TextSize = 30
texto.Name = "TextoAnimado"

-- Função de animação do texto (simplificada e mais visível)
local function animarTexto()
    local info = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local animacao = TweenService:Create(texto, info, {
        TextColor3 = Color3.fromRGB(150, 0, 255),
        Position = texto.Position - UDim2.new(0, 0, 0.02, 0)  -- Movimento mais suave
    })
    
    local infoVolta = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local animacaoVolta = TweenService:Create(texto, infoVolta, {
        TextColor3 = Color3.new(1, 1, 1),
        Position = texto.Position
    })
    
    animacao:Play()
    animacao.Completed:Connect(function()
        animacaoVolta:Play()
    end)
end

-- Animação da barra de carregamento
local animacaoIniciada = false
for i = 1, 100 do
    barra.Size = UDim2.new(i / 100, 0, 1, 0)
    
    if i >= 50 and not animacaoIniciada then
        animacaoIniciada = true
        animarTexto()
    end
    
    task.wait(0.01)
end

-- Transição para o campo de key
task.wait(0.5)
local reduzir = TweenService:Create(contorno, TweenInfo.new(0.5), {
    Size = UDim2.new(0.3, 0, 0, 35),
    Position = UDim2.new(0.35, 0, 0.5, 0)
})
reduzir:Play()
reduzir.Completed:Wait()
barra:Destroy()

-- Campo de digitação
local caixa = Instance.new("TextBox", contorno)
caixa.Size = UDim2.new(1, -10, 1, -10)
caixa.Position = UDim2.new(0, 5, 0, 5)
caixa.BackgroundColor3 = Color3.fromRGB(70, 0, 130)
caixa.PlaceholderText = "Digite a Key"
caixa.Text = ""
caixa.TextColor3 = Color3.new(1, 1, 1)
caixa.Font = Enum.Font.FredokaOne
caixa.TextScaled = true
caixa.ClearTextOnFocus = false
local caixaCorner = Instance.new("UICorner", caixa)
caixaCorner.CornerRadius = UDim.new(0, 8)

-- Botão de verificação
local botao = Instance.new("TextButton", fundo)
botao.Text = "Verificar"
botao.Size = UDim2.new(0, 150, 0, 35)
botao.Position = UDim2.new(0.5, -75, 0.6, 0)
botao.BackgroundColor3 = Color3.fromRGB(100, 0, 180)
botao.TextColor3 = Color3.new(1, 1, 1)
botao.Font = Enum.Font.FredokaOne
botao.TextScaled = true
botao.TextSize = 20
local botaoCorner = Instance.new("UICorner", botao)
botaoCorner.CornerRadius = UDim.new(0, 8)

-- Verificação da key
local keyCorreta = "jogoroblox123"
botao.MouseButton1Click:Connect(function()
    if caixa.Text == keyCorreta then
        gui:Destroy()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/rubzinbr/jogorobloxhub/main/menu.lua"))()
    else
        caixa.Text = ""
        caixa.PlaceholderText = "Key incorreta!"
        task.wait(1.5)
        caixa.PlaceholderText = "Digite a Key"
    end
end)