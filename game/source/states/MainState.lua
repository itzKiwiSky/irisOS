MainState = {}

function MainState:enter()
    self.enviroment = require 'source.game.controllers.Enviroment'

    loveView.registerLoveframesEvents()

    loveframes.SetActiveSkin("Dark crimson")

    loveView.unloadView()
    loveView.addView("source/game/views/DesktopEnv.lua")
    loveView.addView("source/game/views/Dockbar.lua")
end

function MainState:draw()
    loveView.draw()
end

function MainState:update(elapsed)
    loveView.update(elapsed)
end

function MainState:keypressed()
    loveView.reloadAll()
end

function MainState:leave()
    loveView.unloadView()
end

return MainState
