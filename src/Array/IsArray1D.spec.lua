return function()
    local IsArray1D = require(script.Parent.IsArray1D)

    describe("Array/IsArray1D", function()
        it("should return false for an empty array", function()
            expect(IsArray1D({})).to.equal(false)
        end)

        it("should return true for a one-item array", function()
            expect(IsArray1D({1})).to.equal(true)
        end)

        it("should return true for a two-item array", function()
            expect(IsArray1D({1, 2})).to.equal(true)
        end)

        it("should return true for a two-item array with a string key", function()
            expect(IsArray1D({1, 2, X = 3})).to.equal(true)
        end)
    end)
end