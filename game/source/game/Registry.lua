local Registry = {
    data = {}
}

function Registry:loadRegistry(file)
    local data = love.filesystem.read(file)
end

function Registry:commit(file)
    local compiled = lume.serialize(self.data)
end

function Registry:createKey(path)
    local current = self.data

    for part in string.gmatch(path, "[^/]+") do
        current[part] = current[part] or {}
        current = current[part]
    end

    return current
end

function Registry:setValue(path, key, value)
    local folder = self:createKey(path)
    folder[key] = value
end

function Registry:getValue(path, key)
    local current = self.data

    for part in string.gmatch(path, "[^/]+") do
        current = current[part]

        if not current then
            return nil
        end
    end

    return current[key]
end

return Registry
