return function(lust)
    local iniparser = require 'source.game.utils.INIParser'

    local textSamples = {
        [1] = "[test1]\na = 1\nb=2",
        [2] = "[test2]\nbool = true\nbool2=false"
    }

    lust.describe("INI Parsing test", function()
        lust.it("Parse the first sample", function()
            local str = textSamples[1]

            local result = iniparser.decode(str)
            print(inspect(result))
            lust.expect(result["test1"]).to.exist()

            lust.expect(result["test1"]).to.be.a("table")
            lust.expect(result["test1"]["a"]).to.be.a("number")
            lust.expect(result["test1"]["a"]).to.equal(1)
        end)
    end)
end
