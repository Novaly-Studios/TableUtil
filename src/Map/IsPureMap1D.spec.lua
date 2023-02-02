return function()
    local IsPureMap1D = require(script.Parent.IsPureMap1D)

    describe("Map/IsPureMap1D", function()
        it("should return false a blank table", function()
            expect(IsPureMap1D({})).to.equal(false)
        end)

        it("should return true for a table with a single item", function()
            expect(IsPureMap1D({A = 1})).to.equal(true)
        end)

        it("should return true for a table with multiple items", function()
            expect(IsPureMap1D({A = 1, B = 2, C = 3})).to.equal(true)
        end)

        it("should return false for a mixed table", function()
            expect(IsPureMap1D({1, 2, 3, A = 1, B = 2, C = 3})).to.equal(false)
        end)

        it("should return false for an array", function()
            expect(IsPureMap1D({1, 2, 3})).to.equal(false)
        end)
    end)
end