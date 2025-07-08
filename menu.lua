
-- Jogoroblox HUB - Estilo Dashboard (sem Rayfield)
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Interface principal
local gui = Instance.new("ScreenGui", game:GetService("CoreGui"))
gui.Name = "JogorobloxInterface"

local main = Instance.new("Frame", gui)
main.Name = "MainMenu"
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.Position = UDim2.new(0.5, 0, 0.5, 0)
main.Size = UDim2.new(0, 500, 0, 300)
main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
main.BackgroundTransparency = 0.2
main.BorderSizePixel = 0
main.ClipsDescendants = true

local corner = Instance.new("UICorner", main)
corner.CornerRadius = UDim.new(0, 12)

-- Botão de fechar
local close = Instance.new("TextButton", main)
close.Text = "X"
close.Size = UDim2.new(0, 30, 0, 30)
close.Position = UDim2.new(1, -35, 0, 5)
close.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
close.TextColor3 = Color3.new(1, 1, 1)
close.AutoButtonColor = true
close.MouseButton1Click:Connect(function()
	gui:Destroy()
end)

local corner2 = Instance.new("UICorner", close)
corner2.CornerRadius = UDim.new(1, 0)

-- Painel esquerdo (Abas)
local sidebar = Instance.new("Frame", main)
sidebar.Size = UDim2.new(0, 120, 1, 0)
sidebar.Position = UDim2.new(0, 0, 0, 0)
sidebar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
sidebar.BorderSizePixel = 0

local corner3 = Instance.new("UICorner", sidebar)
corner3.CornerRadius = UDim.new(0, 10)

-- Nome do usuário e imagem
local profile = Instance.new("Frame", sidebar)
profile.Size = UDim2.new(1, 0, 0, 50)
profile.Position = UDim2.new(0, 0, 1, -50)
profile.BackgroundTransparency = 1

local icon = Instance.new("ImageLabel", profile)
icon.Size = UDim2.new(0, 32, 0, 32)
icon.Position = UDim2.new(0, 10, 0.5, -16)
icon.BackgroundTransparency = 1
icon.Image = Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)

local username = Instance.new("TextLabel", profile)
username.Position = UDim2.new(0, 50, 0.5, -10)
username.Size = UDim2.new(1, -60, 0, 20)
username.Text = player.DisplayName
username.TextColor3 = Color3.new(1, 1, 1)
username.BackgroundTransparency = 1
username.Font = Enum.Font.Gotham
username.TextSize = 14
username.TextXAlignment = Enum.TextXAlignment.Left

-- Função para criar abas
local function criarAba(nome, callback)
	local aba = Instance.new("TextButton", sidebar)
	aba.Size = UDim2.new(1, 0, 0, 35)
	aba.BackgroundColor3 = Color3.fromRGB(70, 0, 140)
	aba.Text = nome
	aba.TextColor3 = Color3.new(1, 1, 1)
	aba.Font = Enum.Font.Gotham
	aba.TextSize = 14
	aba.BorderSizePixel = 0

	local uiCorner = Instance.new("UICorner", aba)
	uiCorner.CornerRadius = UDim.new(0, 8)

	aba.MouseEnter:Connect(function()
		aba.BackgroundColor3 = Color3.fromRGB(140, 0, 255)
	end)
	aba.MouseLeave:Connect(function()
		aba.BackgroundColor3 = Color3.fromRGB(70, 0, 140)
	end)
	aba.MouseButton1Click:Connect(callback)
end

-- Painel de botões da direita
local painelBotoes = Instance.new("Frame", main)
painelBotoes.Size = UDim2.new(1, -130, 1, -10)
painelBotoes.Position = UDim2.new(0, 130, 0, 5)
painelBotoes.BackgroundTransparency = 1

local layout = Instance.new("UIListLayout", painelBotoes)
layout.Padding = UDim.new(0, 6)
layout.SortOrder = Enum.SortOrder.LayoutOrder

-- Criar botões da aba
local function mostrarBotoes(nomeAba)
	painelBotoes:ClearAllChildren()
	layout.Parent = painelBotoes
	for i = 1, 5 do
		local botao = Instance.new("TextButton", painelBotoes)
		botao.Size = UDim2.new(1, -10, 0, 30)
		botao.BackgroundColor3 = Color3.fromRGB(90, 0, 180)
		botao.Text = nomeAba .. " Botão " .. i
		botao.TextColor3 = Color3.new(1, 1, 1)
		botao.Font = Enum.Font.Gotham
		botao.TextSize = 14
		botao.BorderSizePixel = 0

		local bcorner = Instance.new("UICorner", botao)
		bcorner.CornerRadius = UDim.new(0, 6)

		botao.MouseEnter:Connect(function()
			botao.BackgroundColor3 = Color3.fromRGB(140, 0, 255)
		end)
		botao.MouseLeave:Connect(function()
			botao.BackgroundColor3 = Color3.fromRGB(90, 0, 180)
		end)
	end
end

-- Criar abas
criarAba("Entrada", function() mostrarBotoes("Entrada") end)
criarAba("Casas", function() mostrarBotoes("Casas") end)
criarAba("Carros", function() mostrarBotoes("Carros") end)
criarAba("Avatar", function() mostrarBotoes("Avatar") end)
criarAba("Fun", function() mostrarBotoes("Fun") end)
