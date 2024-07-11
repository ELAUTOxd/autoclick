-- Configuración inicial
local UserInputService = game:GetService("UserInputService")

local activationKey = Enum.KeyCode.F6 -- Tecla de activación (en este caso, la tecla F6)
local gameName = "Blade Ball" -- Nombre del juego específico

local function isInGame(game)
    return game and game.Name == gameName
end

local function autoclick()
    while true do
        -- Simular un clic izquierdo del ratón
        game:GetService("VirtualUser"):CaptureController()
        game:GetService("VirtualUser"):Button1Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        wait(0.001) -- Intervalo de autoclick de 0.001 segundos (ajustar según sea necesario)
        game:GetService("VirtualUser"):Button1Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    end
end

local function onActivationKeyPress(input)
    if input.KeyCode == activationKey then
        local game = game:GetService("Workspace").Metadata.Game
        if isInGame(game) then
            autoclick()
        else
            warn("El script de autoclick solo funciona en el juego '" .. gameName .. "'.")
        end
    end
end

-- Escuchar la tecla de activación
UserInputService.InputBegan:Connect(onActivationKeyPress)
