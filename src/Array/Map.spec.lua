return function()
    local Map = require(script.Parent.Parent).Array.Map

    describe("Array/Map", function()
        it("should return a blank array if passed in a blank array", function()
            local Result = Map({}, function(Value, Key)
                return Key, Value
            end)

            expect(next(Result)).to.equal(nil)
        end)

        it("should return all items in an array with a function passing back the same value, in order", function()
            local Result = Map({1, 2, 3, 4}, function(Value)
                return Value
            end)

            for Index = 1, 4 do
                expect(Result[Index]).to.equal(Index)
            end
        end)

        it("should double all items in an array with a double function, in order", function()
            local Result = Map({1, 2, 3, 4}, function(Value)
                return Value * 2
            end)

            for Index = 1, 4 do
                expect(Result[Index]).to.equal(Index * 2)
            end
        end)

        it("should ignore nil returns from the operation function", function()
            local Result = Map({1, 2, 3, 4}, function(Value)
                if (Value < 3) then
                    return nil
                end

                return Value
            end)

            expect(Result[1]).to.equal(3)
            expect(Result[2]).to.equal(4)
            expect(Result[3]).never.to.be.ok()
        end)

        it("should send the index to the operation function", function()
            Map({2, 4, 6, 8}, function(Value, Index)
                expect(Value / 2).to.equal(Index)
            end)
        end)

        it("should return the same table if values are the same and the input table is frozen", function()
            local Base = table.freeze({1, 2, 7, 8})
            local Result = Map(Base, function(Value)
                return Value
            end)
            expect(Result).to.equal(Base)
        end)

        it("should return a copy of the original table if values are the same and the input table is not frozen", function()
            local Base = {1, 2, 7, 8}
            local Result = Map(Base, function(Value)
                return Value
            end)

            expect(Result).never.to.equal(Base)
            expect(Result[1]).to.equal(1)
            expect(Result[2]).to.equal(2)
            expect(Result[3]).to.equal(7)
            expect(Result[4]).to.equal(8)
        end)
    end)
end