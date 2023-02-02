return function()
    local IsMixed1D = require(script.Parent.IsMixed1D)

    describe("Map/IsMixed1D", function()
        it("should return false a blank table", function()
            expect(IsMixed1D({})).to.equal(false)
        end)

        it("should return false for a table with a single key-value", function()
            expect(IsMixed1D({A = 1})).to.equal(false)
        end)

        it("should return false for a table with multiple key-values", function()
            expect(IsMixed1D({A = 1, B = 2, C = 3})).to.equal(false)
        end)

        it("should return true for a mixed table", function()
            expect(IsMixed1D({1, 2, 3, A = 1, B = 2, C = 3})).to.equal(true)
        end)

        it("should return false for an array", function()
            expect(IsMixed1D({1, 2, 3})).to.equal(false)
        end)
    end)
end