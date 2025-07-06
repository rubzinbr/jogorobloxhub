
-- Jogoroblox HUB - Carregamento com campo centralizado e animação clássica no texto
local TweenService = game:GetService("TweenService")

local gui = Instance.new("ScreenGui", game:GetService("CoreGui"))
gui.Name = "JogorobloxHub"
gui.IgnoreGuiInset = true

local fundo = Instance.new("Frame", gui)
fundo.Size = UDim2.new(1, 0, 1, 0)
fundo.Position = UDim2.new(0, 0, 0, 0)
fundo.BackgroundColor3 = Color3.new(0, 0, 0)

-- Texto "Jogoroblox HUB" GRANDE e centralizado acima da barra
local texto = Instance.new("TextLabel", fundo)
texto.Text = "Jogoroblox HUB"
texto.Size = UDim2.new(1, 0, 0, 60)
texto.Position = UDim2.new(0, 0, 0.5, -100)
texto.BackgroundTransparency = 1
texto.TextColor3 = Color3.new(1, 1, 1)
texto.Font = Enum.Font.GothamBlack
texto.TextScaled = true
texto.Name = "TextoAnimado"

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

-- Animação simples do texto (como a antiga)
local function animarTexto()
    for i = 1, #texto.Text do
        local letra = texto.Text:sub(i,i)
        local letraClone = Instance.new("TextLabel", fundo)
        letraClone.Text = letra
        letraClone.Size = UDim2.new(0, 30, 0, 60)
        letraClone.Position = UDim2.new(0.5, -(#texto.Text * 15) + (i * 30), 0.5, -100)
        letraClone.BackgroundTransparency = 1
        letraClone.Font = Enum.Font.GothamBlack
        letraClone.TextColor3 = Color3.new(1, 1, 1)
        letraClone.TextScaled = true

        local subir = TweenService:Create(letraClone, TweenInfo.new(0.3), {
            Position = letraClone.Position + UDim2.new(0, 0, 0, -10),
            Rotation = letra == "J" and 360 or 0
        })
        subir:Play()
        subir.Completed:Wait()
        letraClone:Destroy()
    end
end

animarTexto()

-- Reduzir horizontalmente
wait(0.5)
local reduzir = TweenService:Create(contorno, TweenInfo.new(0.5), {
    Size = UDim2.new(0.3, 0, 0, 40),
    Position = UDim2.new(0.35, 0, 0.5, 0)
})
reduzir:Play()
reduzir.Completed:Wait()
barra:Destroy()

-- Campo de digitar (roxo claro)
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

-- Verificação
local keyCorreta = "jogoroblox123"
botao.MouseButton1Click:Connect(function()
    if caixa.Text == keyCorreta then
        gui:Destroy()
        -- Carrega menu
    else
        caixa.Text = ""
        caixa.PlaceholderText = "Key incorreta!"
    end
end)
