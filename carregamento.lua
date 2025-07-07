
-- Tela de carregamento do Jogoroblox HUB com texto animado a partir da metade do carregamento

local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

-- Criar a interface principal
local tela = Instance.new("ScreenGui", CoreGui)
tela.Name = "JogorobloxCarregamento"
tela.ResetOnSpawn = false

local fundo = Instance.new("Frame", tela)
fundo.BackgroundColor3 = Color3.new(0, 0, 0)
fundo.Size = UDim2.new(1, 0, 1, 0)
fundo.Position = UDim2.new(0, 0, 0, 0)
fundo.BorderSizePixel = 0

-- Barra de carregamento
local barra = Instance.new("Frame", fundo)
barra.BackgroundColor3 = Color3.fromRGB(60, 0, 120)
barra.Size = UDim2.new(0.3, 0, 0.03, 0)
barra.Position = UDim2.new(0.5, 0, 0.65, 0)
barra.AnchorPoint = Vector2.new(0.5, 0.5)
barra.BorderSizePixel = 0
barra.BackgroundColor3 = Color3.fromRGB(80, 0, 180)
barra.BorderColor3 = Color3.fromRGB(180, 0, 255)
barra.BorderMode = Enum.BorderMode.Outline

local uicorner = Instance.new("UICorner", barra)
uicorner.CornerRadius = UDim.new(0, 25)

local progresso = Instance.new("Frame", barra)
progresso.BackgroundColor3 = Color3.fromRGB(180, 0, 255)
progresso.Size = UDim2.new(0, 0, 1, 0)
progresso.Position = UDim2.new(0, 0, 0, 0)
progresso.BorderSizePixel = 0
Instance.new("UICorner", progresso).CornerRadius = UDim.new(0, 25)

-- Texto do hub (centralizado acima da barra)
local texto = Instance.new("TextLabel", fundo)
texto.Text = ""
texto.Font = Enum.Font.GothamBold
texto.TextColor3 = Color3.new(1, 1, 1)
texto.TextScaled = true
texto.Size = UDim2.new(0.6, 0, 0.1, 0)
texto.Position = UDim2.new(0.2, 0, 0.52, 0)
texto.BackgroundTransparency = 1

-- Animação da barra
local progressoTween = TweenService:Create(progresso, TweenInfo.new(5, Enum.EasingStyle.Linear), {Size = UDim2.new(1, 0, 1, 0)})
progressoTween:Play()

-- Ativar animação do texto na metade
task.spawn(function()
	wait(2.5)  -- metade do tempo do tween
	local frase = "Jogoroblox HUB"
	for i = 1, #frase do
		texto.Text = string.sub(frase, 1, i)
		wait(0.05)
	end
end)

-- Remover a tela após animação
task.spawn(function()
	wait(6)
	tela:Destroy()
end)
