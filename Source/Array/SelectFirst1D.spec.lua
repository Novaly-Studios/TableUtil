return function()
    local SelectFirst1D = require(script.Parent.SelectFirst1D)

    describe("Array/SelectFirst1D", function()
        it("should select nothing on an empty array", function()
            expect(SelectFirst1D({}, function() end)).never.to.be.ok()
        end)

        it("should select the first item in an array for a return-true function", function()
            expect(SelectFirst1D({1}, function()
                return true
            end)).to.equal(1)
        end)

        it("should select the first item greater than some number", function()
            expect(SelectFirst1D({1, 2, 4, 8, 16, 32}, function(Value)
                return Value >= 8
            end)).to.equal(8)
        end)

        it("should select the first index greater than some number", function()
            expect(SelectFirst1D({1, 2, 4, 8, 16, 32}, function(_, Index)
                return Index >= 3
            end)).to.equal(4)
        end)
    end)
end