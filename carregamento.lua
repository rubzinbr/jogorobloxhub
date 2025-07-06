
-- Jogoroblox HUB - Tela de carregamento com fundo preto e contorno giratório
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

-- Criar a GUI
local screenGui = Instance.new("ScreenGui", game.CoreGui)
screenGui.Name = "JogorobloxLoading"

-- Fundo preto
local fundo = Instance.new("Frame", screenGui)
fundo.Size = UDim2.new(1, 0, 1, 0)
fundo.Position = UDim2.new(0, 0, 0, 0)
fundo.BackgroundColor3 = Color3.new(0, 0, 0)

-- Barra de carregamento
local barra = Instance.new("Frame", fundo)
barra.Size = UDim2.new(0, 0, 0, 20)
barra.Position = UDim2.new(0.25, 0, 0.5, 0)
barra.BackgroundColor3 = Color3.fromRGB(128, 0, 255)
Instance.new("UICorner", barra).CornerRadius = UDim.new(0, 10)

-- Texto
local texto = Instance.new("TextLabel", fundo)
texto.Text = "Jogoroblox HUB"
texto.Position = UDim2.new(0.25, 0, 0.5, -40)
texto.Size = UDim2.new(0.5, 0, 0.05, 0)
texto.TextColor3 = Color3.new(1, 1, 1)
texto.BackgroundTransparency = 1
texto.Font = Enum.Font.GothamBold
texto.TextSize = 24

-- Contorno giratório (usando círculo visível)
local contorno = Instance.new("ImageLabel")
contorno.Name = "ContornoGiratorio"
contorno.Parent = fundo
contorno.Size = UDim2.new(1, 40, 1, 40)
contorno.Position = UDim2.new(0, -20, 0, -20)
contorno.BackgroundTransparency = 1
contorno.Image = "rbxassetid://13533683303" -- ID de círculo decorativo
contorno.ImageColor3 = Color3.fromRGB(128, 0, 255)
contorno.ZIndex = 0

-- Animação do contorno
RunService.RenderStepped:Connect(function()
    contorno.Rotation = (contorno.Rotation + 1) % 360
end)

-- Animação da barra
for i = 1, 100 do
    barra.Size = UDim2.new(i / 200, 0, 0, 20)
    wait(0.01)
end

screenGui:Destroy()
