return function()
    local MutableMerge1D = require(script.Parent.MutableMerge1D)

    describe("Map/MutableMerge1D", function()
        it("should not modify a blank table given a blank table to merge in", function()
            local Result = {}
            MutableMerge1D(Result, {})
            expect(next(Result)).never.to.be.ok()
        end)

        it("should flat modify a table given a single item table to merge in", function()
            local Result = {}
            MutableMerge1D(Result, {A = 1})
            expect(Result.A).to.equal(1)
        end)

        it("should flat modify a table given a multiple item table to merge in", function()
            local Result = {}
            MutableMerge1D(Result, {A = 1, B = 2, C = 3})
            expect(Result.A).to.equal(1)
            expect(Result.B).to.equal(2)
            expect(Result.C).to.equal(3)
        end)

        it("should overwrite former tables", function()
            local Result = {A = 1, B = 2}
            MutableMerge1D(Result, {B = 3}, {B = 4})
            expect(Result.A).to.equal(1)
            expect(Result.B).to.equal(4)
        end)

        it("should merge in false values", function()
            local Result = {A = 1, B = 2}
            MutableMerge1D(Result, {B = false})
            expect(Result.A).to.equal(1)
            expect(Result.B).to.equal(false)
        end)
    end)
end