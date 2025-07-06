
-- Jogoroblox HUB - Carregamento com animação antiga e campo de key roxo claro
local TweenService = game:GetService("TweenService")

-- Criar GUI principal
local screenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
screenGui.Name = "JogorobloxHubLoading"
screenGui.IgnoreGuiInset = true

-- Fundo preto
local fundo = Instance.new("Frame", screenGui)
fundo.Size = UDim2.new(1, 0, 1, 0)
fundo.Position = UDim2.new(0, 0, 0, 0)
fundo.BackgroundColor3 = Color3.new(0, 0, 0)

-- Texto "Jogoroblox HUB"
local textoLabel = Instance.new("TextLabel", fundo)
textoLabel.Text = "Jogoroblox HUB"
textoLabel.Size = UDim2.new(1, 0, 0, 40)
textoLabel.Position = UDim2.new(0, 0, 0.5, -60)
textoLabel.BackgroundTransparency = 1
textoLabel.TextColor3 = Color3.new(1, 1, 1)
textoLabel.Font = Enum.Font.GothamBold
textoLabel.TextScaled = true

-- Contorno e barra de carregamento
local contorno = Instance.new("Frame", fundo)
contorno.Size = UDim2.new(0.5, 4, 0, 24)
contorno.Position = UDim2.new(0.25, -2, 0.5, -2)
contorno.BackgroundColor3 = Color3.fromRGB(100, 0, 180)
Instance.new("UICorner", contorno).CornerRadius = UDim.new(0, 12)

local barra = Instance.new("Frame", contorno)
barra.Size = UDim2.new(0, 0, 1, 0)
barra.BackgroundColor3 = Color3.fromRGB(150, 0, 255)
Instance.new("UICorner", barra).CornerRadius = UDim.new(0, 10)

-- Animação da barra preenchendo
for i = 1, 100 do
    barra.Size = UDim2.new(i / 100, 0, 1, 0)
    wait(0.01)
end

-- Reduz barra para campo
local tweenPos = TweenService:Create(contorno, TweenInfo.new(0.5), {
    Size = UDim2.new(0.5, 4, 0, 40)
})
tweenPos:Play()
tweenPos.Completed:Wait()

-- Apaga barra
barra:Destroy()

-- Campo de key no lugar da barra (mesmo tamanho, roxo claro)
local caixa = Instance.new("TextBox", contorno)
caixa.PlaceholderText = "Digite a Key"
caixa.Size = UDim2.new(1, 0, 1, 0)
caixa.Position = UDim2.new(0, 0, 0, 0)
caixa.BackgroundColor3 = Color3.fromRGB(150, 0, 255) -- roxo claro como barra
caixa.TextColor3 = Color3.new(1, 1, 1)
caixa.Font = Enum.Font.Gotham
caixa.TextScaled = true
caixa.Text = ""
Instance.new("UICorner", caixa).CornerRadius = UDim.new(0, 10)

-- Botão verificar
local botao = Instance.new("TextButton", fundo)
botao.Text = "Verificar"
botao.Size = UDim2.new(0, 150, 0, 35)
botao.Position = UDim2.new(0.5, -75, 0.5, 30)
botao.BackgroundColor3 = Color3.fromRGB(100, 0, 180)
botao.TextColor3 = Color3.new(1, 1, 1)
botao.Font = Enum.Font.GothamBold
botao.TextScaled = true
Instance.new("UICorner", botao).CornerRadius = UDim.new(0, 8)

-- Verificação
local keyCorreta = "jogoroblox123"
botao.MouseButton1Click:Connect(function()
    if caixa.Text == keyCorreta then
        screenGui:Destroy()
        -- Aqui carrega o menu
    else
        caixa.Text = ""
        caixa.PlaceholderText = "Key incorreta!"
    end
end)
