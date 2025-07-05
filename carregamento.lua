
-- Jogoroblox HUB - Tela de carregamento com fundo roxo personalizado
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

-- Criar a GUI
local screenGui = Instance.new("ScreenGui", game.CoreGui)
screenGui.Name = "JogorobloxLoading"

-- Fundo com imagem do GitHub
local fundo = Instance.new("ImageLabel", screenGui)
fundo.Size = UDim2.new(1, 0, 1, 0)
fundo.Position = UDim2.new(0, 0, 0, 0)
fundo.BackgroundTransparency = 1
fundo.Image = "https://raw.githubusercontent.com/rubzinbr/jogorobloxhub/main/teladeloadimage.png"
fundo.ImageColor3 = Color3.new(1, 1, 1)
fundo.ScaleType = Enum.ScaleType.Crop

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

-- Contorno giratório
local borderFrame = Instance.new("Frame", fundo)
borderFrame.Size = UDim2.new(1, 0, 1, 0)
borderFrame.BackgroundTransparency = 1
borderFrame.ZIndex = 2

local border = Instance.new("ImageLabel", borderFrame)
border.Size = UDim2.new(1, 0, 1, 0)
border.BackgroundTransparency = 1
border.Image = "rbxassetid://13533683303" -- Círculo decorativo
border.ImageColor3 = Color3.fromRGB(128, 0, 255)
border.ZIndex = 2

-- Rotação contínua do contorno
RunService.RenderStepped:Connect(function()
    border.Rotation = (border.Rotation + 1) % 360
end)

-- Animação da barra
for i = 1, 100 do
    barra.Size = UDim2.new(i / 200, 0, 0, 20)
    wait(0.01)
end

screenGui:Destroy()
