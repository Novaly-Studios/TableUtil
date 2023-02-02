return function()
    local MutableShuffle1D = require(script.Parent.MutableShuffle1D)

    describe("Array/MutableShuffle1D", function()
        it("should keep the first element in a one-item array in the same position", function()
            local Result = {1}
            MutableShuffle1D(Result)
            expect(Result[1]).to.equal(1)
        end)

        it("should shuffle a ten-item array", function()
            local Result = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
            MutableShuffle1D(Result)

            local Sum = 0

            for _, Value in Result do
                Sum += Value
            end

            expect(Sum).to.equal(55)
            
            local Same = 0

            for Index = 1, 10 do
                Same += (Result[Index] == Index and 1 or 0)
            end

            expect(Same < 10).to.equal(true)
        end)
    end)
end