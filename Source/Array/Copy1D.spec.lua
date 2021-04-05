return function()
    local Copy1D = require(script.Parent.Copy1D)

    describe("Array/Copy1D", function()
        it("should copy a blank table with no contents", function()
            local Original = {}
            local Copied = Copy1D(Original)

            expect(Copied).to.never.equal(Original)
            expect(next(Copied)).to.never.be.ok()
        end)

        it("should copy the first element of an array", function()
            local Original = {100}
            local Copied = Copy1D(Original)

            expect(Copied).never.to.equal(Original)
            expect(Copied[1]).to.equal(Original[1])
        end)

        it("should copy all elements of an array", function()
            local Original = {1, 2, 3, 4}
            local Copied = Copy1D(Original)

            expect(Copied).never.to.equal(Original)
            expect(Copied[1]).to.equal(Original[1])
            expect(Copied[2]).to.equal(Original[2])
            expect(Copied[3]).to.equal(Original[3])
            expect(Copied[4]).to.equal(Original[4])
        end)
    end)
end