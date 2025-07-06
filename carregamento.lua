
-- Jogoroblox HUB - Tela de carregamento com animação nas letras quando barra passa por baixo
local TweenService = game:GetService("TweenService")

-- Criar GUI
local screenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
screenGui.Name = "JogorobloxLoading"
screenGui.IgnoreGuiInset = true

-- Fundo preto
local fundo = Instance.new("Frame", screenGui)
fundo.Size = UDim2.new(1, 0, 1, 0)
fundo.Position = UDim2.new(0, 0, 0, 0)
fundo.BackgroundColor3 = Color3.new(0, 0, 0)

-- Contorno da barra
local contorno = Instance.new("Frame", fundo)
contorno.Size = UDim2.new(0.5, 4, 0, 24)
contorno.Position = UDim2.new(0.25, -2, 0.5, -2)
contorno.BackgroundColor3 = Color3.fromRGB(100, 0, 180)
Instance.new("UICorner", contorno).CornerRadius = UDim.new(0, 12)

-- Barra de progresso
local barra = Instance.new("Frame", contorno)
barra.Size = UDim2.new(0, 0, 1, 0)
barra.Position = UDim2.new(0, 0, 0, 0)
barra.BackgroundColor3 = Color3.fromRGB(150, 0, 255)
Instance.new("UICorner", barra).CornerRadius = UDim.new(0, 10)

-- Texto "Jogoroblox HUB" dividido por letras
local textoContainer = Instance.new("Frame", fundo)
textoContainer.Position = UDim2.new(0.25, 0, 0.5, -50)
textoContainer.Size = UDim2.new(0.5, 0, 0.05, 0)
textoContainer.BackgroundTransparency = 1

local texto = "Jogoroblox HUB"
local letras = {}

for i = 1, #texto do
    local letra = texto:sub(i, i)
    local label = Instance.new("TextLabel", textoContainer)
    label.Text = letra
    label.Size = UDim2.new(1 / #texto, 0, 1, 0)
    label.Position = UDim2.new((i - 1) / #texto, 0, 0, 0)
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.new(1, 1, 1)
    label.Font = Enum.Font.GothamBold
    label.TextScaled = true
    table.insert(letras, label)
end

-- Função para animar letras
local function animarLetras()
    for i, letra in ipairs(letras) do
        local original = letra.Position
        local tweenInfo = TweenInfo.new(0.15, Enum.EasingStyle.Back, Enum.EasingDirection.Out)

        local props = {Position = original + UDim2.new(0, 0, -0.2, 0)}
        local tween = TweenService:Create(letra, tweenInfo, props)
        tween:Play()

        tween.Completed:Wait()

        -- Girar o J
        if i == 1 then
            local rotTween = TweenService:Create(letra, TweenInfo.new(0.3), {Rotation = 360})
            rotTween:Play()
            rotTween.Completed:Wait()
            letra.Rotation = 0
        end

        local returnTween = TweenService:Create(letra, TweenInfo.new(0.1), {Position = original})
        returnTween:Play()
    end
end

-- Animação da barra + trigger de animação
for i = 1, 100 do
    barra.Size = UDim2.new(i / 100, 0, 1, 0)
    if i == 50 then -- No meio do carregamento
        animarLetras()
    end
    wait(0.01)
end

screenGui:Destroy()
