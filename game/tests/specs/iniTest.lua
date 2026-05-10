return function(lust)
    local iniparser = require 'source.game.utils.INIParser'

    local textSamples = {
        [1] = "[test1]\na = 1\nb=stringtest",
        [2] = [[
        [test2]
        bool = true
        bool2=false
        ]],
        [3] = "[test3]\non=enabled\noff=disabled"
    }

    lust.describe("INI Parsing test", function()
        lust.it("Parse the first sample", function()
            local str = textSamples[1]

            local result = iniparser.decode(str)
            lust.expect(result["test1"]).to.exist()

            lust.expect(result["test1"]).to.be.a("table")
            lust.expect(result["test1"]["a"]).to.be.a("number")
            lust.expect(result["test1"]["a"]).to.equal(1)

            lust.expect(result["test1"]["b"]).to.be.a("string")
            lust.expect(result["test1"]["b"]).to.equal("stringtest")
        end)

        lust.it("Parse the second sample", function()
            local str = textSamples[2]
            local result = iniparser.decode(str)

            lust.expect(result["test2"]).to.exist()
            lust.expect(result["test2"]).to.be.a("table")
            lust.expect(result["test2"]["bool"]).to.be.a("boolean")
            lust.expect(result["test2"]["bool"]).to.equal(true)

            lust.expect(result["test2"]["bool2"]).to.be.a("boolean")
            lust.expect(result["test2"]["bool2"]).to.equal(false)
        end)

        lust.it("Parse the third sample with special keywords", function()
            local str = textSamples[3]
            local result = iniparser.decode(str)

            lust.expect(result["test3"]).to.exist()
            lust.expect(result["test3"]).to.be.a("table")
            lust.expect(result["test3"]["on"]).to.be.a("boolean")
            lust.expect(result["test3"]["on"]).to.equal(true)

            lust.expect(result["test3"]["off"]).to.be.a("boolean")
            lust.expect(result["test3"]["off"]).to.equal(false)
        end)
    end)
end
