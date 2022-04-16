return function()
    local Remove1D = require(script.Parent.Remove1D)

    describe("Array/Remove1D", function()
        it("should return an empty array upon removing from an empty array", function()
            local Original = {}
            local Result = Remove1D(Original)

            expect(next(Result)).to.equal(nil)
            expect(Original).never.to.equal(Result)
        end)

        it("should remove the last item in a two-item array", function()
            local Result = Remove1D({1, 2})
            expect(Result[1]).to.equal(1)
            expect(Result[2]).never.to.be.ok()
        end)

        it("should remove the last item multiple times", function()
            local Result = Remove1D({1, 2, 3, 4})
            expect(Result[1]).to.equal(1)
            expect(Result[2]).to.equal(2)
            expect(Result[3]).to.equal(3)
            expect(Result[4]).never.to.be.ok()

            Result = Remove1D(Result)
            expect(Result[1]).to.equal(1)
            expect(Result[2]).to.equal(2)
            expect(Result[3]).never.to.be.ok()

            Result = Remove1D(Result)
            expect(Result[1]).to.equal(1)
            expect(Result[2]).never.to.be.ok()

            Result = Remove1D(Result)
            expect(Result[1]).never.to.be.ok()
        end)

        it("should remove an item in the middle", function()
            local Result = Remove1D({1, 2, 3, 4}, 2)
            expect(Result[1]).to.equal(1)
            expect(Result[2]).to.equal(3)
            expect(Result[3]).to.equal(4)
        end)
    end)
end