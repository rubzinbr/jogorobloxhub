
-- Tela de carregamento com animação antiga (texto animado letra por letra)
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

local tela = Instance.new("ScreenGui", CoreGui)
tela.Name = "JogorobloxLoading"

local fundo = Instance.new("Frame", tela)
fundo.BackgroundColor3 = Color3.new(0, 0, 0)
fundo.Size = UDim2.new(1, 0, 1, 0)

local textoContainer = Instance.new("Frame", fundo)
textoContainer.BackgroundTransparency = 1
textoContainer.Position = UDim2.new(0.5, 0, 0.4, 0)
textoContainer.AnchorPoint = Vector2.new(0.5, 0.5)
textoContainer.Size = UDim2.new(0, 600, 0, 60)

local texto = "Jogoroblox HUB"
for i = 1, #texto do
    local letra = Instance.new("TextLabel", textoContainer)
    letra.Text = texto:sub(i, i)
    letra.Font = Enum.Font.GothamBold
    letra.TextSize = 50
    letra.TextColor3 = Color3.fromRGB(255, 255, 255)
    letra.BackgroundTransparency = 1
    letra.Position = UDim2.new((i - 1) / #texto, 0, 0, 0)
    letra.Size = UDim2.new(1 / #texto, 0, 1, 0)
    letra.TextTransparency = 1

    local tween = TweenService:Create(letra, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, (i - 1) * 0.05), {TextTransparency = 0})
    tween:Play()
end

local barraFundo = Instance.new("Frame", fundo)
barraFundo.Position = UDim2.new(0.5, -150, 0.55, 0)
barraFundo.Size = UDim2.new(0, 300, 0, 20)
barraFundo.BackgroundColor3 = Color3.fromRGB(60, 0, 90)
barraFundo.BorderSizePixel = 0
barraFundo.BackgroundTransparency = 0
barraFundo.ClipsDescendants = true
barraFundo.AnchorPoint = Vector2.new(0.5, 0.5)
barraFundo.BorderColor3 = Color3.fromRGB(255, 0, 255)
barraFundo.BorderSizePixel = 2

local barra = Instance.new("Frame", barraFundo)
barra.BackgroundColor3 = Color3.fromRGB(160, 64, 255)
barra.Size = UDim2.new(0, 0, 1, 0)
barra.BorderSizePixel = 0

-- Animação da barra
local tween = TweenService:Create(barra, TweenInfo.new(4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Size = UDim2.new(1, 0, 1, 0)})
tween:Play()

-- Após terminar, remover (pode conectar com a key)
task.delay(5, function()
    tela:Destroy()
end)
