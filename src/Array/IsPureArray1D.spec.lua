return function()
    local IsPureArray1D = require(script.Parent.IsPureArray1D)

    describe("Array/IsPureArray1D", function()
        it("should return false for an empty array", function()
            expect(IsPureArray1D({})).to.equal(false)
        end)

        it("should return true for a one-item array", function()
            expect(IsPureArray1D({1})).to.equal(true)
        end)

        it("should return true for a two-item array", function()
            expect(IsPureArray1D({1, 2})).to.equal(true)
        end)

        it("should return false for a two-item array with a string key", function()
            expect(IsPureArray1D({1, 2, X = 3})).to.equal(false)
        end)
    end)
end