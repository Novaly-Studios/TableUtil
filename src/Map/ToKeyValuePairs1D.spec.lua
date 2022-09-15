return function()
    local ToKeyValuePairs1D = require(script.Parent.ToKeyValuePairs1D)

    describe("Map/ToKeyValuePairs1D", function()
        it("should return a blank array given an empty table", function()
            expect(#ToKeyValuePairs1D({})).to.equal(0)
        end)

        it("should return a single key-value pair for a single item table", function()
            local Result = ToKeyValuePairs1D({A = 1})
            expect(#Result).to.equal(1)
            expect(Result[1].Key).to.equal("A")
            expect(Result[1].Value).to.equal(1)
        end)

        it("should return a key-value pair for each item in the table", function()
            local Result = ToKeyValuePairs1D({A = 1, B = 2, C = 3})
            expect(#Result).to.equal(3)

            local function ArrayItemSatisfies(Condition)
                for _, Pair in Result do
                    if Condition(Pair) then
                        return true
                    end
                end
            end

            expect(ArrayItemSatisfies(function(Pair)
                return Pair.Key == "A" and Pair.Value == 1
            end)).to.equal(true)

            expect(ArrayItemSatisfies(function(Pair)
                return Pair.Key == "B" and Pair.Value == 2
            end)).to.equal(true)

            expect(ArrayItemSatisfies(function(Pair)
                return Pair.Key == "C" and Pair.Value == 3
            end)).to.equal(true)
        end)
    end)
end