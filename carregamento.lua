-- Jogoroblox HUB - Tela de carregamento com animação personalizada
local TweenService = game:GetService("TweenService")
local TextService = game:GetService("TextService")

local gui = Instance.new("ScreenGui", game:GetService("CoreGui"))
gui.Name = "JogorobloxHub"
gui.IgnoreGuiInset = true

local fundo = Instance.new("Frame", gui)
fundo.Size = UDim2.new(1, 0, 1, 0)
fundo.Position = UDim2.new(0, 0, 0, 0)
fundo.BackgroundColor3 = Color3.new(0, 0, 0)

-- Contorno da barra
local contorno = Instance.new("Frame", fundo)
contorno.Size = UDim2.new(0.5, 0, 0, 20)
contorno.Position = UDim2.new(0.25, 0, 0.5, 0)
contorno.BackgroundColor3 = Color3.fromRGB(100, 0, 180)
Instance.new("UICorner", contorno).CornerRadius = UDim.new(0, 10)

local barra = Instance.new("Frame", contorno)
barra.Size = UDim2.new(0, 0, 1, 0)
barra.BackgroundColor3 = Color3.fromRGB(150, 0, 255)
Instance.new("UICorner", barra).CornerRadius = UDim.new(0, 10)

-- Texto animado com espaçamento ajustado
local textoOriginal = "Jogoroblox HUB"
local letras = {}

-- Função para iniciar animação do texto
local function iniciarAnimacaoTexto()
    -- Aumentei o espaçamento multiplicando por 0.028 em vez de 0.024
    local baseX = 0.5 - (#textoOriginal * 0.014) -- Ajuste para centralizar com novo espaçamento
    for i = 1, #textoOriginal do
        local letra = textoOriginal:sub(i,i)
        local letraLbl = Instance.new("TextLabel", fundo)
        letraLbl.Text = letra
        letraLbl.Size = UDim2.new(0, 25, 0, 55)
        letraLbl.Position = UDim2.new(baseX + (i-1)*0.028, 0, 0.39, 0) -- Espaçamento aumentado
        letraLbl.BackgroundTransparency = 1
        letraLbl.Font = Enum.Font.FredokaOne
        letraLbl.TextColor3 = Color3.new(1, 1, 1)
        letraLbl.TextScaled = true
        letraLbl.Name = "Letra_"..i
        table.insert(letras, letraLbl)

        -- Configurações de animação
        local info = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local props = {
            Position = letraLbl.Position - UDim2.new(0, 0, 0, 8),
            -- Aplica rotação apenas na letra "J"
            Rotation = letra == "J" and 360 or 0,
            TextColor3 = Color3.fromRGB(150, 0, 255)
        }
        
        local anim = TweenService:Create(letraLbl, info, props)
        
        -- Animação de volta para cor branca
        local infoVolta = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local propsVolta = {
            TextColor3 = Color3.new(1, 1, 1)
        }
        
        task.delay(0.05 * i, function()
            anim:Play()
            
            -- Animação de volta para branco após 0.5 segundos
            task.delay(0.5, function()
                local animVolta = TweenService:Create(letraLbl, infoVolta, propsVolta)
                animVolta:Play()
            end)
        end)
    end
end

-- Resto do código permanece igual...
-- Encher barra com trigger aos 50%
local animacaoIniciada = false
for i = 1, 100 do
    barra.Size = UDim2.new(i / 100, 0, 1, 0)
    
    if i >= 50 and not animacaoIniciada then
        animacaoIniciada = true
        iniciarAnimacaoTexto()
    end
    
    task.wait(0.01)
end

-- Reduzir barra para campo
task.wait(0.5)
local reduzir = TweenService:Create(contorno, TweenInfo.new(0.5), {
    Size = UDim2.new(0.3, 0, 0, 35),
    Position = UDim2.new(0.35, 0, 0.5, 0)
})
reduzir:Play()
reduzir.Completed:Wait()
barra:Destroy()

-- Campo de digitar
local caixa = Instance.new("TextBox", contorno)
caixa.Size = UDim2.new(1, 0, 1, 0)
caixa.Position = UDim2.new(0, 0, 0, 0)
caixa.BackgroundColor3 = Color3.fromRGB(150, 0, 255)
caixa.PlaceholderText = "Digite a Key"
caixa.Text = ""
caixa.TextColor3 = Color3.new(1, 1, 1)
caixa.Font = Enum.Font.FredokaOne
caixa.TextScaled = true
Instance.new("UICorner", caixa).CornerRadius = UDim.new(0, 10)

-- Botão verificar
local botao = Instance.new("TextButton", fundo)
botao.Text = "Verificar"
botao.Size = UDim2.new(0, 150, 0, 35)
botao.Position = UDim2.new(0.5, -75, 0.5, 50)
botao.BackgroundColor3 = Color3.fromRGB(100, 0, 180)
botao.TextColor3 = Color3.new(1, 1, 1)
botao.Font = Enum.Font.FredokaOne
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