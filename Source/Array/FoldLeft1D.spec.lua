return function()
    local FoldLeft1D = require(script.Parent.FoldLeft1D)

    describe("Array/FoldLeft1D", function()
        it("should not call on an empty table", function()
            local Called = false

            FoldLeft1D({}, function()
                Called = true
            end, 1)

            expect(Called).to.equal(false)
        end)

        it("should return an initial value with no operations", function()
            local Result = FoldLeft1D({}, function() end, 1)

            expect(Result).to.equal(1)
        end)

        it("should call in order", function()
            local Indexes = {}

            FoldLeft1D({1, 2, 3, 4}, function(_, _, Index)
                table.insert(Indexes, Index)
            end)

            for Index = 1, 4 do
                expect(Indexes[Index]).to.equal(Index)
            end
        end)

        it("should correctly give the size of the array", function()
            FoldLeft1D({1, 2, 3, 4}, function(_, _, _, Size)
                expect(Size).to.equal(4)
            end)
        end)

        it("should sum up some values with a sum function", function()
            local Result = FoldLeft1D({1, 2, 3, 4}, function(Aggr, Value)
                return Aggr + Value
            end, 0)

            expect(Result).to.equal(10)
        end)
    end)
end