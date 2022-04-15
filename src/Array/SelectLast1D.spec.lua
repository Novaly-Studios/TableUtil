return function()
    local SelectLast1D = require(script.Parent.SelectLast1D)

    describe("Array/SelectLast1D", function()
        it("should select nothing on an empty array", function()
            expect(SelectLast1D({}, function() end)).never.to.be.ok()
        end)

        it("should select the last item in an array for a return-true function", function()
            expect(SelectLast1D({1}, function()
                return true
            end)).to.equal(1)
        end)

        it("should select the last item greater than some number", function()
            expect(SelectLast1D({1, 2, 4, 8, 16, 32}, function(Value)
                return Value >= 8
            end)).to.equal(32)
        end)

        it("should select the last index greater than some number", function()
            expect(SelectLast1D({1, 2, 4, 8, 16, 32}, function(_, Index)
                return Index >= 3
            end)).to.equal(32)
        end)
    end)
end