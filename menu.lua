-- Jogoroblox HUB - Menu Estilo Dashboard Personalizado (sem Rayfield)
local CoreGui = game:GetService("CoreGui")
local Interface = Instance.new("ScreenGui", CoreGui)
Interface.Name = "JogorobloxInterface"

-- Fundo principal com bordas arredondadas
local MainFrame = Instance.new("Frame", Interface)
MainFrame.Name = "MainMenu"
MainFrame.Size = UDim2.new(0.6, 0, 0.7, 0)
MainFrame.Position = UDim2.new(0.2, 0, 0.15, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BackgroundTransparency = 0.2

local corner = Instance.new("UICorner", MainFrame)
corner.CornerRadius = UDim.new(0, 12)

-- Layout horizontal do menu
local UIGrid = Instance.new("UIGridLayout", MainFrame)
UIGrid.FillDirection = Enum.FillDirection.Horizontal
UIGrid.HorizontalAlignment = Enum.HorizontalAlignment.Left
UIGrid.SortOrder = Enum.SortOrder.LayoutOrder

-- Retângulo lateral para abas
local LeftPanel = Instance.new("Frame", MainFrame)
LeftPanel.Size = UDim2.new(0.25, 0, 1, 0)
LeftPanel.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Instance.new("UICorner", LeftPanel).CornerRadius = UDim.new(0, 8)

-- Layout vertical para as abas
local LeftLayout = Instance.new("UIListLayout", LeftPanel)
LeftLayout.FillDirection = Enum.FillDirection.Vertical
LeftLayout.Padding = UDim.new(0, 8)

-- Título do menu
local Title = Instance.new("TextLabel", MainFrame)
Title.Text = "Jogoroblox HUB"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 28
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundColor3 = Color3.fromRGB(85, 0, 255)
Title.Size = UDim2.new(0.25, 0, 0.1, 0)
Title.Position = UDim2.new(0, 0, -0.1, 0)
Instance.new("UICorner", Title).CornerRadius = UDim.new(0, 8)

-- Criar abas
local abas = { "Entrada", "Casas", "Carros", "Avatar", "Fun" }
for _, nome in ipairs(abas) do
    local Aba = Instance.new("TextButton", LeftPanel)
    Aba.Text = nome
    Aba.Size = UDim2.new(1, -10, 0, 40)
    Aba.BackgroundColor3 = Color3.fromRGB(100, 0, 200)
    Aba.TextColor3 = Color3.fromRGB(255, 255, 255)
    Aba.Font = Enum.Font.Gotham
    Aba.TextSize = 14
    Instance.new("UICorner", Aba).CornerRadius = UDim.new(0, 8)

    Aba.MouseEnter:Connect(function()
        Aba.BackgroundColor3 = Color3.fromRGB(140, 0, 255)
    end)
    Aba.MouseLeave:Connect(function()
        Aba.BackgroundColor3 = Color3.fromRGB(100, 0, 200)
    end)
end
