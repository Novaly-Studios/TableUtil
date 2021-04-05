return function()
    local Keys1D = require(script.Parent.Keys1D)

    describe("Map/Keys1D", function()
        it("should return a blank table given a blank table", function()
            local Result = Keys1D({})
            expect(Result).to.be.ok()
            expect(next(Result)).never.to.be.ok()
        end)

        it("should return one key given a one key table", function()
            local Result = Keys1D({A = 1000})
            expect(table.find(Result, "A")).to.be.ok()
        end)

        it("should return multiple keys given a multiple key table", function()
            local Result = Keys1D({A = 1000, B = 2000, C = true})
            expect(table.find(Result, "A")).to.be.ok()
            expect(table.find(Result, "B")).to.be.ok()
            expect(table.find(Result, "C")).to.be.ok()
        end)
    end)
end