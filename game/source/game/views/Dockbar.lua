package.loaded["source.game.views.Shared"] = nil
local Shared = require 'source.game.views.Shared'

return function(new)
    local panelDock = new("panel")
    panelDock:SetProperty("links", {})
    panelDock:SetBorderRadius(15)
    panelDock:SetSize(shove.getViewportWidth() - 200, 75)
    panelDock:CenterX()
    panelDock:SetY(shove.getViewportHeight() - 96)
    panelDock.drawfunc = Shared.roundedPanel

    local panelGrid = new("grid")
    local gridSize = 48
    panelGrid:SetParent(panelDock)
    panelGrid:SetRows(1)
    panelGrid:SetItemAutoSize(false)
    --panelGrid:SetCellSize(gridSize, gridSize)
    panelGrid:SetCellWidth(gridSize)
    panelGrid:SetCellHeight(gridSize)
    panelGrid:SetColumns(math.floor(panelDock.width / gridSize))
    panelGrid:SetCellPadding(0)
    panelGrid:SetY(panelGrid.y + gridSize * 0.3)
    panelGrid:SetX(panelGrid.x + gridSize * 0.5)


    local logoIconBase = new("panel")
    logoIconBase:SetSize(60, 60)
    logoIconBase.drawfunc = Shared.blank

    local logoBGButton = new("button")
    logoBGButton:SetParent(logoIconBase)
    logoBGButton:SetSize(64, 64)
    logoBGButton:SetText("")
    logoBGButton:SetHover(true)
    logoBGButton.drawfunc = Shared.buttonHitbox
    logoBGButton.OnClick = function(obj)
        print("aaa")
    end
    local logoIcon = new("image")
    local icon = assetManager.getImage("logo")
    local padding = 8
    logoIcon:SetParent(logoIconBase)
    logoIcon:SetImage(icon)
    logoIcon:SetScale((logoIconBase.width - padding) / icon:getWidth(), (logoIconBase.height - padding) / icon:getHeight())
    logoIcon:SetPos((logoIconBase.x + padding) * 0.5, (logoIconBase.y + padding) * 0.5)
    --logoIcon:SetOffset(icon:getWidth() * 0.5, icon:getHeight() * 0.5)

    panelGrid:AddItem(logoIconBase, 1, math.floor(panelGrid:GetColumns() * 0.5))
end
