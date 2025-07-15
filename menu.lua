-- Jogoroblox HUB - Estilo Dashboard (Com Animações e Sons)
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")
local player = Players.LocalPlayer

-- Verificar se já existe uma GUI e destruir
if game:GetService("CoreGui"):FindFirstChild("JogorobloxInterface") then
    game:GetService("CoreGui"):FindFirstChild("JogorobloxInterface"):Destroy()
end

-- Interface principal
local gui = Instance.new("ScreenGui", game:GetService("CoreGui"))
gui.Name = "JogorobloxInterface"

-- SISTEMA DE SOM
local function criarSom()
    local som = Instance.new("Sound")
    som.SoundId = "rbxasset://sounds/electronicpingshort.wav" -- Som padrão do Roblox
    som.Volume = 0.5
    som.Pitch = 1.2
    som.Parent = gui
    return som
end

-- Função para tocar som de clique
local function tocarSomClique()
    local som = criarSom()
    som:Play()
    
    -- Destruir o som após terminar
    som.Ended:Connect(function()
        som:Destroy()
    end)
    
    -- Failsafe para destruir o som após 2 segundos
    game:GetService("Debris"):AddItem(som, 2)
end

local main = Instance.new("Frame", gui)
main.Name = "MainMenu"
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.Position = UDim2.new(0.5, 0, 0.42, 0)
main.Size = UDim2.new(0, 700, 0, 350)
main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
main.BackgroundTransparency = 0
main.BorderSizePixel = 0
main.ClipsDescendants = true

-- Contorno roxo animado
local contorno = Instance.new("UIStroke", main)
contorno.Color = Color3.fromRGB(140, 0, 255)
contorno.Thickness = 3
contorno.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

-- Gradiente animado para o contorno
local gradiente = Instance.new("UIGradient", contorno)
gradiente.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(140, 0, 255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 0, 140)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(140, 0, 255))
})

-- Animação de rotação do gradiente
local function animarContorno()
    local rotacao = 0
    game:GetService("RunService").Heartbeat:Connect(function()
        rotacao = rotacao + 2
        gradiente.Rotation = rotacao
        if rotacao >= 360 then
            rotacao = 0
        end
    end)
end
animarContorno()

local corner = Instance.new("UICorner", main)
corner.CornerRadius = UDim.new(0, 12)

-- Painel esquerdo (Abas)
local sidebar = Instance.new("Frame", main)
sidebar.Size = UDim2.new(0, 160, 1, 0)
sidebar.Position = UDim2.new(0, 0, 0, 0)
sidebar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
sidebar.BorderSizePixel = 0

local corner3 = Instance.new("UICorner", sidebar)
corner3.CornerRadius = UDim.new(0, 10)

-- Painel de botões da direita
local painelBotoes = Instance.new("Frame", main)
painelBotoes.Size = UDim2.new(1, -170, 1, -20)
painelBotoes.Position = UDim2.new(0, 170, 0, 15)
painelBotoes.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
painelBotoes.BorderSizePixel = 0

local painelCorner = Instance.new("UICorner", painelBotoes)
painelCorner.CornerRadius = UDim.new(0, 8)

-- BOTÃO X NO CANTO SUPERIOR DIREITO DO MENU
local close = Instance.new("TextButton", main)
close.Text = "X"
close.Size = UDim2.new(0, 30, 0, 30)
close.Position = UDim2.new(1, -40, 0, 10)
close.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
close.TextColor3 = Color3.new(1, 1, 1)
close.AutoButtonColor = false
close.ZIndex = 10

-- Contorno animado para o botão X
local closeStroke = Instance.new("UIStroke", close)
closeStroke.Color = Color3.fromRGB(140, 0, 255)
closeStroke.Thickness = 2
closeStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
closeStroke.Transparency = 1

-- Gradiente para o contorno do botão X
local closeGradient = Instance.new("UIGradient", closeStroke)
closeGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(140, 0, 255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 0, 140)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(140, 0, 255))
})

-- Animação de rotação do gradiente do botão X
local function animarContonoBotaoX()
    local rotacao = 0
    game:GetService("RunService").Heartbeat:Connect(function()
        rotacao = rotacao + 3
        closeGradient.Rotation = rotacao
        if rotacao >= 360 then
            rotacao = 0
        end
    end)
end

-- Hover effects para o botão X
close.MouseEnter:Connect(function()
    closeStroke.Transparency = 0
    animarContonoBotaoX()
    close.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
end)

close.MouseLeave:Connect(function()
    closeStroke.Transparency = 1
    close.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
end)

close.MouseButton1Click:Connect(function()
    tocarSomClique()
	gui:Destroy()
end)

local corner2 = Instance.new("UICorner", close)
corner2.CornerRadius = UDim.new(1, 0)

-- TÍTULO MAIOR COM FONTE FREDOKA ONE
local titulo = Instance.new("TextLabel", sidebar)
titulo.Size = UDim2.new(1, 0, 0, 50)
titulo.Position = UDim2.new(0, 0, 0, 5)
titulo.BackgroundTransparency = 1
titulo.Text = "Jogoroblox HUB"
titulo.TextColor3 = Color3.new(1, 1, 1)
titulo.Font = Enum.Font.FredokaOne
titulo.TextSize = 20
titulo.TextXAlignment = Enum.TextXAlignment.Center

-- Container para as abas
local abasContainer = Instance.new("Frame", sidebar)
abasContainer.Size = UDim2.new(1, 0, 1, -60)
abasContainer.Position = UDim2.new(0, 0, 0, 65)
abasContainer.BackgroundTransparency = 1

-- Layout para as abas
local sidebarLayout = Instance.new("UIListLayout", abasContainer)
sidebarLayout.Padding = UDim.new(0, 5)
sidebarLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- Nome do usuário e imagem (NA PARTE INFERIOR ESQUERDA)
local profile = Instance.new("Frame", sidebar)
profile.Size = UDim2.new(1, -10, 0, 50)
profile.Position = UDim2.new(0, 5, 1, -60)
profile.BackgroundTransparency = 1
profile.ZIndex = 5

local icon = Instance.new("ImageLabel", profile)
icon.Size = UDim2.new(0, 32, 0, 32)
icon.Position = UDim2.new(0, 5, 0.5, -16)
icon.BackgroundTransparency = 1
icon.ZIndex = 6

-- Corner para a imagem do usuário
local iconCorner = Instance.new("UICorner", icon)
iconCorner.CornerRadius = UDim.new(1, 0)

-- Tratamento de erro para a imagem do usuário
local success, thumbnailId = pcall(function()
    return Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
end)
icon.Image = success and thumbnailId or "rbxasset://textures/ui/GuiImagePlaceholder.png"

local username = Instance.new("TextLabel", profile)
username.Position = UDim2.new(0, 42, 0.5, -10)
username.Size = UDim2.new(1, -47, 0, 20)
username.Text = player.DisplayName
username.TextColor3 = Color3.new(1, 1, 1)
username.BackgroundTransparency = 1
username.Font = Enum.Font.Gotham
username.TextSize = 12
username.TextXAlignment = Enum.TextXAlignment.Left
username.ZIndex = 6

-- Layout para os botões
local layout = Instance.new("UIListLayout", painelBotoes)
layout.Padding = UDim.new(0, 6)
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.VerticalAlignment = Enum.VerticalAlignment.Center

-- Variável para controlar a aba ativa
local abaAtiva = nil

-- Arrays para controlar animações
local todasAbas = {}
local todosBotoes = {}

-- Função para animar abas (ampliar selecionada, encolher outras)
local function animarAbas(abaSelecionada)
    for _, aba in pairs(todasAbas) do
        local tamanhoAlvo = (aba == abaSelecionada) and UDim2.new(1, -5, 0, 40) or UDim2.new(1, -15, 0, 32)
        local tween = TweenService:Create(aba, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {Size = tamanhoAlvo})
        tween:Play()
    end
end

-- Função para animar botões (ampliar selecionado, encolher outros)
local function animarBotoes(botaoSelecionado)
    for _, botao in pairs(todosBotoes) do
        local tamanhoAlvo = (botao == botaoSelecionado) and UDim2.new(1, -5, 0, 35) or UDim2.new(1, -15, 0, 28)
        local tween = TweenService:Create(botao, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {Size = tamanhoAlvo})
        tween:Play()
    end
end

-- Função para resetar tamanhos das abas
local function resetarAbasAnimacao()
    for _, aba in pairs(todasAbas) do
        local tween = TweenService:Create(aba, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {Size = UDim2.new(1, -10, 0, 35)})
        tween:Play()
    end
end

-- Função para resetar tamanhos dos botões
local function resetarBotoesAnimacao()
    for _, botao in pairs(todosBotoes) do
        local tween = TweenService:Create(botao, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {Size = UDim2.new(1, -10, 0, 30)})
        tween:Play()
    end
end

-- Função para criar abas
local function criarAba(nome, callback)
	local aba = Instance.new("TextButton", abasContainer)
	aba.Size = UDim2.new(1, -10, 0, 35)
	aba.BackgroundColor3 = Color3.fromRGB(70, 0, 140)
	aba.Text = nome
	aba.TextColor3 = Color3.new(1, 1, 1)
	aba.Font = Enum.Font.Gotham
	aba.TextSize = 14
	aba.BorderSizePixel = 0

	local uiCorner = Instance.new("UICorner", aba)
	uiCorner.CornerRadius = UDim.new(0, 8)

	-- Adicionar à lista de abas
	table.insert(todasAbas, aba)

	-- Efeitos hover com animação
	aba.MouseEnter:Connect(function()
		if aba ~= abaAtiva then
			aba.BackgroundColor3 = Color3.fromRGB(100, 0, 180)
			animarAbas(aba)
		end
	end)
	
	aba.MouseLeave:Connect(function()
		if aba ~= abaAtiva then
			aba.BackgroundColor3 = Color3.fromRGB(70, 0, 140)
			resetarAbasAnimacao()
		end
	end)
	
	aba.MouseButton1Click:Connect(function()
		tocarSomClique() -- Som ao clicar na aba
		-- Resetar cor da aba anterior
		if abaAtiva then
			abaAtiva.BackgroundColor3 = Color3.fromRGB(70, 0, 140)
		end
		-- Destacar aba atual
		aba.BackgroundColor3 = Color3.fromRGB(140, 0, 255)
		abaAtiva = aba
		animarAbas(aba)
		callback()
	end)
	
	return aba
end

-- Função para criar botões com funcionalidade
local function criarBotao(nome, funcao, delay)
	local botao = Instance.new("TextButton", painelBotoes)
	botao.Size = UDim2.new(1, -10, 0, 30)
	botao.BackgroundColor3 = Color3.fromRGB(90, 0, 180)
	botao.Text = nome
	botao.TextColor3 = Color3.new(1, 1, 1)
	botao.Font = Enum.Font.Gotham
	botao.TextSize = 14
	botao.BorderSizePixel = 0
	
	-- Configurar posição inicial para animação mais suave (menos distância)
	botao.Position = UDim2.new(0, 0, 0, 30)
	botao.BackgroundTransparency = 1
	botao.TextTransparency = 1

	local bcorner = Instance.new("UICorner", botao)
	bcorner.CornerRadius = UDim.new(0, 6)

	-- Adicionar à lista de botões
	table.insert(todosBotoes, botao)

	-- Animação de entrada com delay mais suave
	wait(delay or 0)
	local tweenInfo = TweenInfo.new(0.6, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
	local tween = TweenService:Create(botao, tweenInfo, {
		Position = UDim2.new(0, 0, 0, 0),
		BackgroundTransparency = 0,
		TextTransparency = 0
	})
	tween:Play()

	-- Efeitos hover com animação
	botao.MouseEnter:Connect(function()
		botao.BackgroundColor3 = Color3.fromRGB(140, 0, 255)
		animarBotoes(botao)
	end)
	
	botao.MouseLeave:Connect(function()
		botao.BackgroundColor3 = Color3.fromRGB(90, 0, 180)
		resetarBotoesAnimacao()
	end)
	
	botao.MouseButton1Click:Connect(function()
		tocarSomClique() -- Som ao clicar no botão
		if funcao then
			funcao()
		end
	end)
	
	return botao
end

-- Função para limpar botões mantendo o layout
local function limparBotoes()
	-- Limpar array de botões
	todosBotoes = {}
	
	for _, child in pairs(painelBotoes:GetChildren()) do
		if child:IsA("TextButton") and child ~= close then
			child:Destroy()
		end
	end
end

-- Criar botões da aba
local function mostrarBotoes(nomeAba)
	limparBotoes()
	
	-- Botões específicos para cada aba com animação sequencial
	if nomeAba == "Entrada" then
		spawn(function()
			criarBotao("Teleportar Spawn", function()
				if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
					player.Character.HumanoidRootPart.CFrame = workspace.SpawnLocation.CFrame
				end
			end, 0.05)
		end)
		spawn(function()
			criarBotao("Reset Character", function()
				if player.Character and player.Character:FindFirstChild("Humanoid") then
					player.Character.Humanoid.Health = 0
				end
			end, 0.1)
		end)
		spawn(function()
			criarBotao("Fly Toggle", function()
				print("Fly ativado/desativado")
			end, 0.15)
		end)
		spawn(function()
			criarBotao("Noclip Toggle", function()
				print("Noclip ativado/desativado")
			end, 0.2)
		end)
		spawn(function()
			criarBotao("Speed Boost", function()
				if player.Character and player.Character:FindFirstChild("Humanoid") then
					player.Character.Humanoid.WalkSpeed = 50
				end
			end, 0.25)
		end)
		
	elseif nomeAba == "Casas" then
		spawn(function()
			criarBotao("Casa 1", function()
				print("Teleportando para Casa 1")
			end, 0.05)
		end)
		spawn(function()
			criarBotao("Casa 2", function()
				print("Teleportando para Casa 2")
			end, 0.1)
		end)
		spawn(function()
			criarBotao("Casa 3", function()
				print("Teleportando para Casa 3")
			end, 0.15)
		end)
		spawn(function()
			criarBotao("Casa Premium", function()
				print("Teleportando para Casa Premium")
			end, 0.2)
		end)
		spawn(function()
			criarBotao("Todas as Casas", function()
				print("Mostrando todas as casas")
			end, 0.25)
		end)
		
	elseif nomeAba == "Carros" then
		spawn(function()
			criarBotao("Spawnar Carro", function()
				print("Spawnando carro")
			end, 0.1)
		end)
		spawn(function()
			criarBotao("Carro Rápido", function()
				print("Spawnando carro rápido")
			end, 0.2)
		end)
		spawn(function()
			criarBotao("Carro Voador", function()
				print("Spawnando carro voador")
			end, 0.3)
		end)
		spawn(function()
			criarBotao("Remover Carros", function()
				print("Removendo todos os carros")
			end, 0.4)
		end)
		spawn(function()
			criarBotao("Teleportar Garagem", function()
				print("Teleportando para garagem")
			end, 0.5)
		end)
		
	elseif nomeAba == "Avatar" then
		spawn(function()
			criarBotao("Tamanho Normal", function()
				if player.Character and player.Character:FindFirstChild("Humanoid") then
					player.Character.Humanoid.HipHeight = 0
				end
			end, 0.1)
		end)
		spawn(function()
			criarBotao("Gigante", function()
				if player.Character and player.Character:FindFirstChild("Humanoid") then
					player.Character.Humanoid.HipHeight = 10
				end
			end, 0.2)
		end)
		spawn(function()
			criarBotao("Anão", function()
				if player.Character and player.Character:FindFirstChild("Humanoid") then
					player.Character.Humanoid.HipHeight = -2
				end
			end, 0.3)
		end)
		spawn(function()
			criarBotao("Invisível", function()
				print("Tornando invisível")
			end, 0.4)
		end)
		spawn(function()
			criarBotao("Restaurar Avatar", function()
				print("Restaurando avatar original")
			end, 0.5)
		end)
		
	elseif nomeAba == "Fun" then
		spawn(function()
			criarBotao("Spam Jump", function()
				print("Spam jump ativado")
			end, 0.1)
		end)
		spawn(function()
			criarBotao("Dança", function()
				print("Dançando")
			end, 0.2)
		end)
		spawn(function()
			criarBotao("Explosão", function()
				print("Criando explosão")
			end, 0.3)
		end)
		spawn(function()
			criarBotao("Chuva de Objetos", function()
				print("Chuva de objetos ativada")
			end, 0.4)
		end)
		spawn(function()
			criarBotao("Efeitos Especiais", function()
				print("Efeitos especiais ativados")
			end, 0.5)
		end)
	end
end

-- Criar abas
local abaEntrada = criarAba("Entrada", function() mostrarBotoes("Entrada") end)
criarAba("Casas", function() mostrarBotoes("Casas") end)
criarAba("Carros", function() mostrarBotoes("Carros") end)
criarAba("Avatar", function() mostrarBotoes("Avatar") end)
criarAba("Fun", function() mostrarBotoes("Fun") end)

-- Selecionar primeira aba por padrão
abaEntrada.BackgroundColor3 = Color3.fromRGB(140, 0, 255)
abaAtiva = abaEntrada
mostrarBotoes("Entrada")