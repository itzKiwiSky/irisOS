return function(lust)
    local registry = require 'source.game.Registry'

    lust.describe("Testing registry component", function()
        lust.it("Return the path of a registry", function()
            registry:setValue("test/path", "data", 1)
            local registryResult = registry:getValue("test/path", "data")
            lust.expect(registryResult).to.exist()
            lust.expect(registryResult).to.be.a("number")
            lust.expect(registryResult).to.equal(1)
        end)
    end)
end
