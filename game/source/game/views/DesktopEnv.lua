package.loaded["source.game.views.Shared"] = nil
local Shared = require 'source.game.views.Shared'

return function(new)
    local imageBG = new("image")
    local img = assetManager.getImage("bg_dark")
    imageBG:SetImage(img)
    imageBG:SetScaleX(shove.getViewportWidth() / img:getWidth())
    imageBG:SetScaleY(shove.getViewportHeight() / img:getHeight())

    -- environment grid for the files --

    local main = new("panel")
    main:SetSize(shove.getViewportDimensions())
    main.drawfunc = Shared.blank

    local mainGrid = new("grid")
    local margin = 24
    local gridSize = 96
    local columns = math.floor((main.width - margin) / gridSize)
    mainGrid:SetParent(main)
    mainGrid:SetItemAutoSize(false)
    mainGrid:SetCellPadding(0)
    mainGrid:SetColumns(columns)
    mainGrid:SetRows(math.floor((main.height - margin) / gridSize) - 1)
    mainGrid:SetCellWidth(gridSize)
    mainGrid:SetCellHeight(gridSize)
    local totalWidth = columns * gridSize
    local centeredX = (main.width - totalWidth) / 2
    mainGrid:SetX(centeredX)
    mainGrid:SetY(margin * 0.45)
end
