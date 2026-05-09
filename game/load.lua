local function newImage(key, name)
    local root = "assets/images"
    local path = string.format("%s/%s", root, name)

    assetManager.loadImage(key, path)
end

local function newAudio(key, name, importMode)
    local root = "assets/sounds"
    local path = string.format("%s/%s", root, name)

    assetManager.loadAudio(key, path, importMode)
end

local function newFont(key, name)
    local root = "assets/fonts"
    local path = string.format("%s/%s", root, name)

    assetManager.loadFont(key, path)
end

return function()
    newImage("bg_dark", "bgs/bg_dark.png")
    newImage("bg_light", "bgs/bg_light.png")
    newImage("logo", "icon.png")

    newFont("arial", "arial.ttf")
    --newFont("arial", "arial.ttf")
end
