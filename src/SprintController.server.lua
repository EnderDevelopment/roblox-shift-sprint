-- Sprint Controller Script

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local function onCharacterAdded(character)
    local humanoid = character:WaitForChild("Humanoid")
    local sprinting = false

    local function onInputChanged(input, gameProcessed)
        if input.KeyCode == Enum.KeyCode.LeftShift then
            sprinting = input.UserInputState == Enum.UserInputState.Begin
        end
    end

    local function onHeartbeat()
        if sprinting then
            humanoid.WalkSpeed = 24
        else
            humanoid.WalkSpeed = 16
        end
    end

    UserInputService.InputChanged:Connect(onInputChanged)
    game:GetService("RunService").Heartbeat:Connect(onHeartbeat)
end

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(onCharacterAdded)
end)