return function()
    local Insert1D = require(script.Parent.Insert1D)

    describe("Array/Insert1D", function()
        it("should insert an item in the first position in an empty array", function()
            local Result = Insert1D({}, 1)

            expect(Result[1]).to.be.ok()
            expect(Result[1]).to.equal(1)
        end)

        it("should insert two items in order into an empty array", function()
            local Result = {}
            Result = Insert1D(Insert1D(Result, 1), 2)

            for Index = 1, 2 do
                expect(Result[Index]).to.be.ok()
                expect(Result[Index]).to.equal(Index)
            end
        end)

        it("should allow insertion at an inner index", function()
            local Result = {1, 2, 4, 5}
            Result = Insert1D(Result, 3, 3)

            for Index = 1, 5 do
                expect(Result[Index]).to.be.ok()
                expect(Result[Index]).to.equal(Index)
            end
        end)

        it("should allow insertion at index 1", function()
            local Result = {2, 3}
            Result = Insert1D(Result, 1, 1)

            for Index = 1, 3 do
                expect(Result[Index]).to.be.ok()
                expect(Result[Index]).to.equal(Index)
            end
        end)

        it("should disallow insertion at index length+2", function()
            expect(function()
                Insert1D({1, 2}, 1000, 4, true)
            end).to.throw()
        end)
    end)
end