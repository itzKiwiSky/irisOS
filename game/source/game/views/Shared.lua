return {
    blank = function() end,
    roundedPanel = function(obj)
        local skin = obj:GetSkin()
        local x = obj:GetX()
        local y = obj:GetY()
        local width = obj:GetWidth()
        local height = obj:GetHeight()
        local bornerRadius = obj:GetBorderRadius()

        love.graphics.setColor(skin.controls.color_back1)
        love.graphics.rectangle("fill", x, y, width, height, bornerRadius)
        love.graphics.setLineWidth(5)
        love.graphics.setColor(skin.controls.color_fore1)
        love.graphics.rectangle("line", x, y, width, height, bornerRadius)
        love.graphics.setLineWidth(1)
    end,
    buttonHitbox = function(obj)
        local skin   = obj:GetSkin()
        local x      = obj:GetX()
        local y      = obj:GetY()
        local width  = obj:GetWidth()
        local height = obj:GetHeight()
        local hover  = obj:GetHover()

        local top    = hover and skin.controls.color_active or { 0, 0, 0, 0 }

        love.graphics.setColor(top)
        love.graphics.rectangle("fill", x, y, width, height)
        love.graphics.setColor(1, 1, 1, 1)
    end,
}
