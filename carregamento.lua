
-- Jogoroblox HUB - Carregamento com animação reduzida + efeito no texto
local TweenService = game:GetService("TweenService")

local gui = Instance.new("ScreenGui", game:GetService("CoreGui"))
gui.Name = "JogorobloxHub"
gui.IgnoreGuiInset = true

local fundo = Instance.new("Frame", gui)
fundo.Size = UDim2.new(1, 0, 1, 0)
fundo.Position = UDim2.new(0, 0, 0, 0)
fundo.BackgroundColor3 = Color3.new(0, 0, 0)

-- Texto "Jogoroblox HUB"
local texto = Instance.new("TextLabel", fundo)
texto.Text = "Jogoroblox HUB"
texto.Size = UDim2.new(1, 0, 0, 50)
texto.Position = UDim2.new(0, 0, 0.5, -70)
texto.BackgroundTransparency = 1
texto.TextColor3 = Color3.new(1, 1, 1)
texto.Font = Enum.Font.GothamBold
texto.TextScaled = true

-- Contorno da barra
local contorno = Instance.new("Frame", fundo)
contorno.Size = UDim2.new(0.5, 0, 0, 24)
contorno.Position = UDim2.new(0.25, 0, 0.5, 0)
contorno.BackgroundColor3 = Color3.fromRGB(100, 0, 180)
Instance.new("UICorner", contorno).CornerRadius = UDim.new(0, 12)

local barra = Instance.new("Frame", contorno)
barra.Size = UDim2.new(0, 0, 1, 0)
barra.BackgroundColor3 = Color3.fromRGB(150, 0, 255)
Instance.new("UICorner", barra).CornerRadius = UDim.new(0, 10)

-- Encher barra
for i = 1, 100 do
    barra.Size = UDim2.new(i / 100, 0, 1, 0)
    wait(0.01)
end

-- Animação no texto quando barra passa embaixo
task.spawn(function()
    for i = 1, #texto.Text do
        local letra = texto.Text:sub(i, i)
        texto.Text = texto.Text
        texto.TextStrokeTransparency = 1

        local nova = texto:Clone()
        nova.Parent = texto.Parent
        nova.Text = letra
        nova.Size = UDim2.new(0, 20, 0, 50)
        nova.Position = UDim2.new(0.5, -(#texto.Text * 10) + (i * 20), 0.5, -70)
        nova.BackgroundTransparency = 1
        nova.TextColor3 = Color3.new(1, 1, 1)
        nova.Font = Enum.Font.GothamBold
        nova.TextScaled = true

        local anim = TweenService:Create(nova, TweenInfo.new(0.3), {
            Position = nova.Position + UDim2.new(0, 0, 0, -10),
            Rotation = letra == "J" and 360 or 0
        })
        anim:Play()
        anim.Completed:Wait()
        nova:Destroy()
    end
end)

-- Espera e faz a barra diminuir horizontalmente
wait(0.5)
local reduzir = TweenService:Create(contorno, TweenInfo.new(0.5), {
    Size = UDim2.new(0.3, 0, 0, 40)
})
reduzir:Play()
reduzir.Completed:Wait()
barra:Destroy()

-- Campo de digitar (mesma cor da barra anterior)
local caixa = Instance.new("TextBox", contorno)
caixa.Size = UDim2.new(1, 0, 1, 0)
caixa.Position = UDim2.new(0, 0, 0, 0)
caixa.BackgroundColor3 = Color3.fromRGB(150, 0, 255)
caixa.PlaceholderText = "Digite a Key"
caixa.Text = ""
caixa.TextColor3 = Color3.new(1, 1, 1)
caixa.Font = Enum.Font.Gotham
caixa.TextScaled = true
Instance.new("UICorner", caixa).CornerRadius = UDim.new(0, 10)

-- Botão verificar
local botao = Instance.new("TextButton", fundo)
botao.Text = "Verificar"
botao.Size = UDim2.new(0, 150, 0, 35)
botao.Position = UDim2.new(0.5, -75, 0.5, 50)
botao.BackgroundColor3 = Color3.fromRGB(100, 0, 180)
botao.TextColor3 = Color3.new(1, 1, 1)
botao.Font = Enum.Font.GothamBold
botao.TextScaled = true
Instance.new("UICorner", botao).CornerRadius = UDim.new(0, 8)

-- Key correta
local keyCorreta = "jogoroblox123"

botao.MouseButton1Click:Connect(function()
    if caixa.Text == keyCorreta then
        gui:Destroy()
        -- Aqui carrega o menu
    else
        caixa.Text = ""
        caixa.PlaceholderText = "Key incorreta!"
    end
end)
