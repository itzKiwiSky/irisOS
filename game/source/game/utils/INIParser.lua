local INIParser = {}

function INIParser.decode(str)
    assert(
        type(str) == "string",
        string.format(
            "[utils.INIParser.Error] : Invalid type, expected 'string' got %s",
            type(str)
        )
    )

    local data = {}
    local section = nil

    for line in (str .. "\n"):gmatch("(.-)\r?\n") do
        line = line:match("^%s*(.-)%s*$")

        if line ~= "" then
            local tempSection = line:match("^%[([^%[%]]+)%]$")

            if tempSection then
                section = tonumber(tempSection) or tempSection

                data[section] = data[section] or {}
            else
                local param, value = line:match("^([%w_]+)%s-=%s-(.+)$")

                if param and value ~= nil then
                    if tonumber(value) then
                        value = tonumber(value)
                    elseif value:match("true") or value:match("enabled") then
                        value = true
                    elseif value:match("false") or value:match("disabled") then
                        value = false
                    end

                    if tonumber(param) then
                        param = tonumber(param)
                    end

                    if section then
                        data[section][param] = value
                    else
                        data[param] = value
                    end
                end
            end
        end
    end

    return data
end

return INIParser
