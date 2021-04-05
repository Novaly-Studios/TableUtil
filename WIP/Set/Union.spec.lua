return function()
    local Union = require(script.Parent.Union)
    local FromValues = require(script.Parent.FromValues)

    describe("Set/Union", function()
        it("should combine two empty sets into an empty set", function()
            local Result = Union({}, {})
            expect(next(Result)).never.to.be.ok()
        end)

        it("should ")
    end)
end