return function()
    local Merge1D = require(script.Parent.Merge1D)

    describe("Array/Merge1D", function()
        it("should merge two blank arrays into a blank array", function()
            local Result = Merge1D({}, {})
            expect(next(Result)).to.never.be.ok()
        end)

        it("should merge more than two blank arrays into a blank array", function()
            local Result = Merge1D({}, {}, {}, {})
            expect(next(Result)).to.never.be.ok()
        end)

        it("should merge several one-item arrays into a final array, in order", function()
            local Result = Merge1D({1}, {2}, {3}, {4})

            for Index = 1, 4 do
                expect(Result[Index]).to.equal(Index)
            end
        end)

        it("should merge several multiple-item arrays into a final array, in order", function()
            local Result = Merge1D({1, 2, 3}, {4}, {5, 6}, {7, 8, 9, 10})

            for Index = 1, 10 do
                expect(Result[Index]).to.equal(Index)
            end
        end)
    end)
end