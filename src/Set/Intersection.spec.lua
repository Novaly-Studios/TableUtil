return function()
    local Set = require(script.Parent.Parent).Set
        local Intersection = Set.Intersection
        local FromValues = Set.FromValues

    describe("Set/Intersection", function()
        it("should find no intersection with two empty sets", function()
            local Result = Intersection({}, {})
            expect(next(Result)).never.to.be.ok()
        end)

        it("should find an intersection between one common element", function()
            local Result = Intersection(FromValues( {"A", "B"} ), FromValues( {"A", "C"} ))
            expect(Result.A).to.be.ok()
            expect(Result.B).never.to.be.ok()
            expect(Result.C).never.to.be.ok()
        end)

        it("should find multiple intersecting elements", function()
            local Result = Intersection(FromValues( {"A", "B", "X"} ), FromValues( {"A", "B", "Y"} ))
            expect(Result.A).to.be.ok()
            expect(Result.B).to.be.ok()
            expect(Result.X).never.to.be.ok()
            expect(Result.Y).never.to.be.ok()
        end)
    end)
end