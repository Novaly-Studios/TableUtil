return function()
    local FromKeys = require(script.Parent.FromKeys)

    describe("Set/FromKeys", function()
        it("should return an empty table given an empty table", function()
            local Result = FromKeys({})
            expect(next(Result)).never.to.be.ok()
        end)

        it("should return correctly for one item", function()
            local Result = FromKeys({A = 1234})
            expect(Result.A).to.equal(true)
        end)

        it("should return correctly for multiple items", function()
            local Result = FromKeys({A = 1, B = 2, C = 3})
            expect(Result.A).to.equal(true)
            expect(Result.B).to.equal(true)
            expect(Result.C).to.equal(true)
        end)
    end)
end