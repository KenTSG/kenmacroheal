local userInputService = game:GetService("UserInputService")
local replicatedStorage = game:GetService("ReplicatedStorage")

local interval = 0.1
local isFiring = false
local args = {[1] = 210}

local function fireEvent()
    while isFiring do
        replicatedStorage:WaitForChild("remoteInterface"):WaitForChild("interactions"):WaitForChild("eat"):FireServer(unpack(args))
        wait(interval)
    end
end

local function onTap()
    isFiring = not isFiring
    if isFiring then
        fireEvent()
    end
end

userInputService.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then -- Check for left mouse button click
        onTap()
    end
end)

userInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then -- Check for left mouse button release
        isFiring = false
    end
end)
