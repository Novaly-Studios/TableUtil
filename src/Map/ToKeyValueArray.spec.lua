return function()
    local ToKeyValueArray = require(script.Parent.ToKeyValueArray)

    describe("Map/ToKeyValueArray", function()
        it("should return a blank array given an empty table", function()
            expect(#ToKeyValueArray({})).to.equal(0)
        end)

        it("should return a single key-value pair for a single item table", function()
            local Result = ToKeyValueArray({A = 1})
            expect(#Result).to.equal(1)
            expect(Result[1][1]).to.equal("A")
            expect(Result[1][2]).to.equal(1)
        end)

        it("should return a key-value pair for each item in the table", function()
            local Result = ToKeyValueArray({A = 1, B = 2, C = 3})
            expect(#Result).to.equal(3)

            local function Satisfied(Condition)
                for _, Value in Result do
                    if (Condition(Value)) then
                        return true
                    end
                end

                return false
            end

            expect(Satisfied(function(Value)
                return Value[1] == "A" and Value[2] == 1
            end)).to.equal(true)

            expect(Satisfied(function(Value)
                return Value[1] == "B" and Value[2] == 2
            end)).to.equal(true)

            expect(Satisfied(function(Value)
                return Value[1] == "C" and Value[2] == 3
            end)).to.equal(true)
        end)
    end)
end