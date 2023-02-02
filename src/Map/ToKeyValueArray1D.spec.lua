return function()
    local ToKeyValueArray1D = require(script.Parent.ToKeyValueArray1D)

    describe("Map/ToKeyValueArray1D", function()
        it("should return a blank array given an empty table", function()
            expect(#ToKeyValueArray1D({})).to.equal(0)
        end)

        it("should return a single key-value pair for a single item table", function()
            local Result = ToKeyValueArray1D({A = 1})
            expect(#Result).to.equal(1)
            expect(Result[1][1]).to.equal("A")
            expect(Result[1][2]).to.equal(1)
        end)

        it("should return a key-value pair for each item in the table", function()
            local Result = ToKeyValueArray1D({A = 1, B = 2, C = 3})
            expect(#Result).to.equal(3)

            local function ArrayItemSatisfies(Condition)
                for _, Pair in Result do
                    if Condition(Pair) then
                        return true
                    end
                end
            end

            expect(ArrayItemSatisfies(function(Pair)
                return Pair[1] == "A" and Pair[2] == 1
            end)).to.equal(true)

            expect(ArrayItemSatisfies(function(Pair)
                return Pair[1] == "B" and Pair[2] == 2
            end)).to.equal(true)

            expect(ArrayItemSatisfies(function(Pair)
                return Pair[1] == "C" and Pair[2] == 3
            end)).to.equal(true)
        end)
    end)
end