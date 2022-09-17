return function()
    local Creations1D = require(script.Parent.Creations1D)

    describe("Map/Creations1D", function()
        it("it should give no creations for two empty tables", function()
            expect(next(Creations1D({}, {}))).to.equal(nil)
        end)

        it("should give a creation for a created value", function()
            local Creations = Creations1D({}, {A = 1})
            expect(Creations.A).to.be.ok()
            expect(Creations.A).to.equal(1)
        end)

        it("should give no creations for a removed value", function()
            expect(next(Creations1D({A = 1}, {}))).to.equal(nil)
        end)

        it("should give no creations for an equal value", function()
            expect(next(Creations1D({A = 1}, {A = 1}))).to.equal(nil)
        end)

        it("should give no creations for a changed value", function()
            expect(next(Creations1D({A = 1}, {A = 2}))).to.equal(nil)
        end)

        it("should give creations for multiple created values", function()
            local Creations = Creations1D({}, {A = 1, B = 2})

            expect(Creations.A).to.be.ok()
            expect(Creations.A).to.equal(1)

            expect(Creations.B).to.be.ok()
            expect(Creations.B).to.equal(2)
        end)
    end)
end