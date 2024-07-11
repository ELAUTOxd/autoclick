-- Configuración inicial
local UserInputService = game:GetService("UserInputService")

local activationKey = Enum.KeyCode.F6 -- Tecla de activación (en este caso, la tecla F6)

local function autoclick()
    while true do
        -- Simular un clic izquierdo del ratón
        local input = Instance.new("MouseButton1Down")
        input.Parent = game:GetService("Players").LocalPlayer
        wait(0.001) -- Intervalo de autoclick de 0.001 segundos (ajustar según sea necesario)
        input:Destroy()
    end
end

local function onActivationKeyPress(input)
    if input.KeyCode == activationKey then
        autoclick()
    end
end

-- Escuchar la tecla de activación
UserInputService.InputBegan:Connect(onActivationKeyPress)
