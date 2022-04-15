return function()
    local Values1D = require(script.Parent.Values1D)

    describe("Map/Values1D", function()
        it("should return a blank table given a blank table", function()
            local Result = Values1D({})
            expect(Result).to.be.ok()
            expect(next(Result)).never.to.be.ok()
        end)

        it("should return one value given a one value table", function()
            local Result = Values1D({A = 1000})
            expect(table.find(Result, 1000)).to.be.ok()
        end)

        it("should return multiple values given a multiple value table", function()
            local Result = Values1D({A = 1000, B = 2000, C = true})
            expect(table.find(Result, 1000)).to.be.ok()
            expect(table.find(Result, 2000)).to.be.ok()
            expect(table.find(Result, true)).to.be.ok()
        end)
    end)
end