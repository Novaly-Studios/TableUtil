return function()
    local Merge = require(script.Parent.Parent).Map.Merge

    describe("Map/Merge", function()
        it("should return the left table if the right is blank", function()
            local Left = {X = 1}
            local Right = {}

            expect(Merge(Left, Right)).to.equal(Left)
        end)

        it("should return a flat merge of two tables", function()
            local Left = {X = 1, Y = 2}
            local Right = {Z = 3, W = 4}
            local Result = Merge(Left, Right)

            expect(Result).to.be.ok()
            expect(Result).to.never.equal(Left)
            expect(Result).to.never.equal(Right)
            expect(Result.X).to.equal(1)
            expect(Result.Y).to.equal(2)
            expect(Result.Z).to.equal(3)
            expect(Result.W).to.equal(4)
        end)

        it("should overwrite values in the left table with values from the right", function()
            local Left = {X = 1, Y = 2}
            local Right = {Y = 3, Z = 4}
            local Result = Merge(Left, Right)

            expect(Result).to.be.ok()
            expect(Result).to.never.equal(Left)
            expect(Result).to.never.equal(Right)
            expect(Result.X).to.equal(1)
            expect(Result.Y).to.equal(3)
            expect(Result.Z).to.equal(4)
        end)

        it("should preserve left-side metatables when the right-side has no metatable", function()
            local MT = {__gt = function() return false end}

            -- With values inside.
            local Result = Merge(setmetatable({Value1 = 1}, MT), {})
            expect(getmetatable(Result)).to.equal(MT)

            -- With no values inside.
            Result = Merge(setmetatable({}, MT), {})
            expect(getmetatable(Result)).to.equal(MT)
        end)

        it("should overwrite left-side metatables with right-side metatables", function()
            local MT = {__gt = function() return false end}
            local MT2 = {__gt = function() return false end}

            -- With values inside.
            local Result = Merge(setmetatable({Value1 = 1}, MT), setmetatable({Value2 = 2}, MT2))
            expect(getmetatable(Result)).to.equal(MT2)

            -- With no values inside.
            local X = setmetatable({}, MT)
            local Y = setmetatable({}, MT2)
            Result = Merge(X, Y)
            expect(getmetatable(Result)).to.equal(MT2)
            expect(Result).never.to.equal(X)
            expect(Result).never.to.equal(Y)
        end)

        it("should preserve right-side metatables when a new value is added", function()
            local MT = {__gt = function() return false end}

            -- With values inside.
            local Result = Merge({Value1 = 1}, setmetatable({Value2 = 2}, MT))
            expect(getmetatable(Result)).to.equal(MT)

            -- With no values inside.
            Result = Merge({}, setmetatable({}, MT))
            expect(getmetatable(Result)).to.equal(MT)
        end)

        it("should apply mapper functions to values when enabled", function()
            expect(Merge({X = 1}, {X = function(Value)
                return Value + 1
            end}).X).to.be.a("function")

            expect(Merge({X = 1}, {X = function(Value)
                return Value + 1
            end}, true).X).to.equal(2)
        end)

        it("should correctly substitute in nil values with mapper functions", function()
            expect(Merge({X = 1}, {X = function(Value)
                return nil
            end}, true).X).to.equal(nil)
        end)
    end)
end