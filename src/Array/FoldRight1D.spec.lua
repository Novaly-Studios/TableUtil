return function()
    local FoldRight1D = require(script.Parent.FoldRight1D)

    describe("Array/FoldRight1D", function()
        it("should not call on an empty table", function()
            local Called = false

            FoldRight1D({}, function()
                Called = true
            end, 1)

            expect(Called).to.equal(false)
        end)

        it("should return an initial value with no operations", function()
            local Result = FoldRight1D({}, function() end, 1)

            expect(Result).to.equal(1)
        end)

        it("should call in order", function()
            local Indexes = {}

            FoldRight1D({1, 2, 3, 4}, function(_, _, Index)
                table.insert(Indexes, Index)
            end)

            for Index = 1, 4 do
                expect(Indexes[Index]).to.equal(5 - Index)
            end
        end)

        it("should correctly give the size of the array", function()
            FoldRight1D({1, 2, 3, 4}, function(_, _, _, Size)
                expect(Size).to.equal(4)
            end)
        end)

        it("should sum up some values with a sum function", function()
            local Result = FoldRight1D({1, 2, 3, 4}, function(Aggr, Value)
                return Aggr + Value
            end, 0)

            expect(Result).to.equal(10)
        end)
    end)
end