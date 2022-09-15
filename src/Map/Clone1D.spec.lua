return function()
    local Clone1D = require(script.Parent.Clone1D)
    local Equals1D = require(script.Parent.Equals1D)

    describe("Map/Clone1D", function()
        it("it should copy a blank array into a new blank array", function()
            local Target = {}
            local Copied = Clone1D(Target)

            expect(next(Copied)).never.to.be.ok()
            expect(Target).never.to.equal(Copied)
        end)

        it("should copy a single element", function()
            local Target = {X = 1}
            local Copied = Clone1D(Target)

            expect(Target).never.to.equal(Copied)
            expect(Equals1D(Target, Copied)).to.equal(true)
        end)

        it("should copy a multiple elements", function()
            local Target = {X = 1, Y = 2, Z = 3}
            local Copied = Clone1D(Target)

            expect(Target).never.to.equal(Copied)
            expect(Equals1D(Target, Copied)).to.equal(true)
        end)

        it("should copy a nested table", function()
            local Target = {X = 1, Y = {Z = 2, W = {P = "Test"}}}
            local Copied = Clone1D(Target)

            expect(Target).never.to.equal(Copied)
            expect(Copied.X).to.equal(1)
            expect(Copied.Y).to.be.ok()
            expect(Copied.Y).to.equal(Target.Y)
        end)
    end)
end