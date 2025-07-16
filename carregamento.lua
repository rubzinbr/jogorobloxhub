-- Jogoroblox HUB - Tela de carregamento corrigida com contorno visível
local TweenService = game:GetService("TweenService")
local TextService = game:GetService("TextService")
local Players = game:GetService("Players")

-- Criação da interface
local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui", player.PlayerGui)
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

-- Texto principal (posicionado acima do campo de key, mais à direita)
local texto = Instance.new("TextLabel", fundo)
texto.Text = "Jogoroblox HUB"
texto.Size = UDim2.new(0, 300, 0, 55)
texto.Position = UDim2.new(0.5, 0, 0.38, 0)
texto.AnchorPoint = Vector2.new(0.5, 0)
texto.BackgroundTransparency = 1
texto.Font = Enum.Font.FredokaOne
texto.TextColor3 = Color3.new(1, 1, 1)
texto.TextScaled = true
texto.TextSize = 30
texto.Name = "TextoAnimado"
texto.TextTransparency = 1

-- Contorno da barra de carregamento (com estilo igual ao menu)
local contorno = Instance.new("Frame", fundo)
contorno.Size = UDim2.new(0.5, 0, 0, 20)
contorno.Position = UDim2.new(0.25, 0, 0.5, 0)
contorno.BackgroundColor3 = Color3.fromRGB(0, 0, 0)  -- Fundo preto igual ao menu
contorno.BorderSizePixel = 0
local contornoCorner = Instance.new("UICorner", contorno)
contornoCorner.CornerRadius = UDim.new(0, 10)

-- Contorno animado igual ao do menu
local contornoStroke = Instance.new("UIStroke", contorno)
contornoStroke.Color = Color3.fromRGB(140, 0, 255)
contornoStroke.Thickness = 3
contornoStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

-- Gradiente animado para o contorno
local contornoGradient = Instance.new("UIGradient", contornoStroke)
contornoGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(140, 0, 255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 0, 140)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(140, 0, 255))
})

-- Animação de rotação do gradiente
local function animarContornoBarra()
    local rotacao = 0
    local connection
    connection = game:GetService("RunService").Heartbeat:Connect(function()
        rotacao = rotacao + 2
        contornoGradient.Rotation = rotacao
        if rotacao >= 360 then
            rotacao = 0
        end
        -- Parar a animação quando o contorno for destruído
        if not contorno.Parent then
            connection:Disconnect()
        end
    end)
end
animarContornoBarra()

-- Barra de progresso roxa
local barra = Instance.new("Frame", contorno)
barra.Size = UDim2.new(0, 0, 1, -6)  -- Deixa espaço para o contorno
barra.Position = UDim2.new(0, 3, 0, 3)  -- Posicionada com margem interna
barra.BackgroundColor3 = Color3.fromRGB(150, 0, 255)
barra.BorderSizePixel = 0
local barraCorner = Instance.new("UICorner", barra)
barraCorner.CornerRadius = UDim.new(0, 7)

-- Animação fade in do título
local fadeInTitulo = TweenService:Create(texto, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    TextTransparency = 0
})
fadeInTitulo:Play()

-- Função de animação do texto (simplificada e mais visível)
local function animarTexto()
    local info = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local animacao = TweenService:Create(texto, info, {
        TextColor3 = Color3.fromRGB(150, 0, 255),
        Position = texto.Position - UDim2.new(0, 0, 0.02, 0)
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
    barra.Size = UDim2.new(i / 100, -6, 1, -6)  -- Mantém margem do contorno
    
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
caixa.Size = UDim2.new(1, -16, 1, -16)  -- Ajustado para o contorno UIStroke
caixa.Position = UDim2.new(0, 8, 0, 8)  -- Centralizado com margem
caixa.BackgroundColor3 = Color3.fromRGB(70, 0, 130)
caixa.PlaceholderText = "Digite a Key"
caixa.Text = ""
caixa.TextColor3 = Color3.new(1, 1, 1)
caixa.Font = Enum.Font.FredokaOne
caixa.TextScaled = true
caixa.ClearTextOnFocus = false
local caixaCorner = Instance.new("UICorner", caixa)
caixaCorner.CornerRadius = UDim.new(0, 5)

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
botao.BorderSizePixel = 0
local botaoCorner = Instance.new("UICorner", botao)
botaoCorner.CornerRadius = UDim.new(0, 8)

-- Contorno animado para o botão igual ao menu
local botaoStroke = Instance.new("UIStroke", botao)
botaoStroke.Color = Color3.fromRGB(140, 0, 255)
botaoStroke.Thickness = 2
botaoStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
botaoStroke.Transparency = 1

-- Gradiente para o contorno do botão
local botaoGradient = Instance.new("UIGradient", botaoStroke)
botaoGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(140, 0, 255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 0, 140)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(140, 0, 255))
})

-- Variável para controlar a animação do contorno do botão
local botaoAnimacao = nil

-- Função para criar animação de hover nos botões
local function criarAnimacaoHover(elemento)
    local tamanhoOriginal = elemento.Size
    local posicaoOriginal = elemento.Position
    
    -- Animação de ampliar quando o mouse entra
    local function ampliar()
        -- Ativar contorno animado
        if elemento == botao then
            botaoStroke.Transparency = 0
            botaoAnimacao = game:GetService("RunService").Heartbeat:Connect(function()
                local rotacao = (botaoAnimacao and tick() * 100) or 0
                botaoGradient.Rotation = rotacao % 360
            end)
        end
        
        local tweenAmpliar = TweenService:Create(elemento, 
            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), 
            {
                Size = UDim2.new(tamanhoOriginal.X.Scale, tamanhoOriginal.X.Offset + 10, 
                               tamanhoOriginal.Y.Scale, tamanhoOriginal.Y.Offset + 5),
                Position = UDim2.new(posicaoOriginal.X.Scale, posicaoOriginal.X.Offset - 5, 
                                   posicaoOriginal.Y.Scale, posicaoOriginal.Y.Offset - 2.5)
            }
        )
        tweenAmpliar:Play()
    end
    
    -- Animação de encolher quando o mouse sai
    local function encolher()
        -- Desativar contorno animado
        if elemento == botao then
            botaoStroke.Transparency = 1
            if botaoAnimacao then
                botaoAnimacao:Disconnect()
                botaoAnimacao = nil
            end
        end
        
        local tweenEncolher = TweenService:Create(elemento, 
            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), 
            {
                Size = tamanhoOriginal,
                Position = posicaoOriginal
            }
        )
        tweenEncolher:Play()
    end
    
    -- Conectar os eventos
    elemento.MouseEnter:Connect(ampliar)
    elemento.MouseLeave:Connect(encolher)
end

-- Função para criar animação de clique nos botões
local function criarAnimacaoClique(elemento)
    local tamanhoOriginal = elemento.Size
    local posicaoOriginal = elemento.Position
    
    elemento.MouseButton1Down:Connect(function()
        local tweenClique = TweenService:Create(elemento, 
            TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), 
            {
                Size = UDim2.new(tamanhoOriginal.X.Scale, tamanhoOriginal.X.Offset - 5, 
                               tamanhoOriginal.Y.Scale, tamanhoOriginal.Y.Offset - 3),
                Position = UDim2.new(posicaoOriginal.X.Scale, posicaoOriginal.X.Offset + 2.5, 
                                   posicaoOriginal.Y.Scale, posicaoOriginal.Y.Offset + 1.5)
            }
        )
        tweenClique:Play()
    end)
    
    elemento.MouseButton1Up:Connect(function()
        local tweenSoltar = TweenService:Create(elemento, 
            TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), 
            {
                Size = tamanhoOriginal,
                Position = posicaoOriginal
            }
        )
        tweenSoltar:Play()
    end)
end

-- Aplicar animações no botão de verificação
criarAnimacaoHover(botao)
criarAnimacaoClique(botao)

-- Verificação da key
local keyCorreta = "jogoroblox123"
botao.MouseButton1Click:Connect(function()
    if caixa.Text == keyCorreta then
        gui:Destroy()
       
        -- Carregador automático por jogo (após key correta) - VERSÃO CORRIGIDA
        local placeId = game.PlaceId
        
        -- Debug: Mostrar PlaceId atual para diagnóstico
        print("PlaceId atual:", placeId)
        
        local scripts = {
            [537413528] = "https://raw.githubusercontent.com/rubzinbr/jogorobloxhub/main/menu_brookhaven.lua", -- Brookhaven antigo
            [4924922222] = "https://raw.githubusercontent.com/rubzinbr/jogorobloxhub/main/menu_brookhaven.lua", -- Brookhaven atual
            [15502339019] = "https://raw.githubusercontent.com/rubzinbr/jogorobloxhub/main/menuvape.lua",
            [6516141723] = "https://raw.githubusercontent.com/rubzinbr/jogorobloxhub/main/menudoors.lua"
        }
        
        -- Verificação específica para Brookhaven
        if string.find(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name:lower(), "brookhaven") then
            print("Brookhaven detectado pelo nome do jogo!")
            url = "https://raw.githubusercontent.com/rubzinbr/jogorobloxhub/main/menu_brookhaven.lua"
        end
        
        -- Verificação mais explícita para debug
        local url
        if scripts[placeId] then
            url = scripts[placeId]
            print("Jogo específico detectado! PlaceId:", placeId)
            print("Carregando menu específico:", url)
        else
            url = "https://raw.githubusercontent.com/rubzinbr/jogorobloxhub/main/menu_principal.lua"
            print("Jogo não reconhecido ou menu principal solicitado")
            print("Carregando menu principal:", url)
        end
        
        -- Verificação adicional: forçar menu principal se necessário
        -- Descomente a linha abaixo para sempre carregar o menu principal
        -- url = "https://raw.githubusercontent.com/rubzinbr/jogorobloxhub/main/menu_principal.lua"
        
        loadstring(game:HttpGet(url))()
    else
        caixa.Text = ""
        caixa.PlaceholderText = "Key incorreta!"
        task.wait(1.5)
        caixa.PlaceholderText = "Digite a Key"
    end
end)