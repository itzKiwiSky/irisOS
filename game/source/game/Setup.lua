local registry = require 'source.game.Registry'

return function()
    local setupDone = registry:getValue("System/Machine", "MachineSetup")

    if setupDone then return end

    registry:setValue("System/CurrentUser/AudioSettings", "Volume", 100)
    --registry:setValue("System/CurrentUser/", "Background", "")
    registry:setValue("System/CurrentUser/ThemeSettings", "Background", "")

    registry:setValue("System/Machine", "MachineSetup", true)
end
