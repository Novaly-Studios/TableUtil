return function()
    local ToKeyValueArray = require(script.Parent.ToKeyValueArray)

    describe("Map/ToKeyValueArray", function()
        it("should return a blank array given an empty table", function()
            expect(#ToKeyValueArray({})).to.equal(0)
        end)

        it("should return a single key-value pair for a single item table", function()
            local Result = ToKeyValueArray({A = 1})
            expect(#Result).to.equal(2)
            expect(Result[1]).to.equal("A")
            expect(Result[2]).to.equal(1)
        end)

        it("should return a key-value pair for each item in the table", function()
            local Result = ToKeyValueArray({A = 1, B = 2, C = 3})
            expect(#Result).to.equal(6)

            local function Satisfied(Condition)
                for Index = 1, #Result, 2 do
                    if (Condition(Result[Index], Result[Index + 1])) then
                        return true
                    end
                end

                return false
            end

            expect(Satisfied(function(X, Y)
                return X == "A" and Y == 1
            end)).to.equal(true)

            expect(Satisfied(function(X, Y)
                return X == "B" and Y == 2
            end)).to.equal(true)

            expect(Satisfied(function(X, Y)
                return X == "C" and Y == 3
            end)).to.equal(true)
        end)
    end)
end