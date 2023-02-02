return function()
    local IsOrdered1D = require(script.Parent.IsOrdered1D)

    describe("Array/IsOrdered1D", function()
        it("should return true for an empty array", function()
            expect(IsOrdered1D({})).to.equal(true)
        end)

        it("should return true for a one-item array", function()
            expect(IsOrdered1D({1})).to.equal(true)
        end)

        it("should return true for an ascending ordered five-item array", function()
            expect(IsOrdered1D({1, 2, 3, 4, 5})).to.equal(true)
        end)

        it("should return true for a descending ordered five-item array", function()
            expect(IsOrdered1D({5, 4, 3, 2, 1})).to.equal(true)
        end)

        it("should return true for an ascending ordered three-item array given ascending is specified", function()
            expect(IsOrdered1D({1, 2, 3}, true)).to.equal(true)
        end)

        it("should return false for an ascending ordered three-item array given descending is specified", function()
            expect(IsOrdered1D({1, 2, 3}, false)).to.equal(false)
        end)

        it("should return true for a descending ordered three-item array given descending is specified", function()
            expect(IsOrdered1D({3, 2, 1}, false)).to.equal(true)
        end)

        it("should return false for a descending ordered three-item array given ascending is specified", function()
            expect(IsOrdered1D({3, 2, 1}, true)).to.equal(false)
        end)
    end)
end