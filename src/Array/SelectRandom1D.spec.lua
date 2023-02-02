return function()
    local SelectRandom1D = require(script.Parent.SelectRandom1D)

    describe("Array/SelectRandom1D", function()
        it("should return nil for an empty array", function()
            expect(SelectRandom1D({})).to.equal(nil)
        end)

        it("should return the only item in a one-item array", function()
            expect(SelectRandom1D({1})).to.equal(1)
        end)

        it("should return a random item in a two-item array", function()
            local Array = {1, 2}
            local Result = SelectRandom1D(Array)
            expect(Result == 1 or Result == 2).to.equal(true)
        end)

        it("should return a random item in a three-item array", function()
            local Array = {1, 2, 3}
            local Result = SelectRandom1D(Array)
            expect(Result == 1 or Result == 2 or Result == 3).to.equal(true)
        end)

        it("should accept a seed which selects the same item each time", function()
            local Array = {}

            for _ = 1, 10_000 do
                table.insert(Array, math.random())
            end

            local Result1 = SelectRandom1D(Array, 1)
            local Result2 = SelectRandom1D(Array, 1)
            local Result3 = SelectRandom1D(Array, 1)
            expect(Result1 == Result2 and Result2 == Result3).to.equal(true)
        end)
    end)
end