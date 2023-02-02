return function()
    local BinarySearch1D = require(script.Parent.BinarySearch1D)

    describe("Array/BinarySearch1D", function()
        it("should return nothing for an empty array", function()
            expect(BinarySearch1D({}, 10))
        end)

        it("should return the first element of an array", function()
            expect(BinarySearch1D({10}, 10)).to.equal(1)
        end)

        it("should return the last element of an array", function()
            expect(BinarySearch1D({10, 20, 30, 40, 50}, 50)).to.equal(5)
        end)

        it("should return the middle element of an array", function()
            expect(BinarySearch1D({10, 20, 30, 40, 50}, 30)).to.equal(3)
        end)

        it("should return the closest element of an array given 'ReturnClosestIndex' arg", function()
            expect(BinarySearch1D({10, 20, 30, 40, 50}, 35, true)).to.equal(3)
        end)

        it("should return nil for a non-existent element of an array", function()
            expect(BinarySearch1D({10, 20, 30, 40, 50}, 35)).never.to.be.ok()
        end)
    end)
end