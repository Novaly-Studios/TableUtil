return function()
    local Outer = require(script.Parent.Outer)
    local FromValues = require(script.Parent.FromValues)

    describe("Set/Outer", function()
        it("should return a blank set from two blank set inputs", function()
            local Result = Outer(FromValues( {} ), FromValues( {} ))
            expect(next(Result)).never.to.be.ok()
        end)

        it("should return the left items given a left set and a blank right set", function()
            local Result = Outer(FromValues( {1, 2, 3} ), FromValues( {} ))
            expect(Result[1]).to.be.ok()
            expect(Result[2]).to.be.ok()
            expect(Result[3]).to.be.ok()
        end)

        it("should return the right items given a blank left set and a right set", function()
            local Result = Outer(FromValues( {} ), FromValues( {1, 2, 3} ))
            expect(Result[1]).to.be.ok()
            expect(Result[2]).to.be.ok()
            expect(Result[3]).to.be.ok()
        end)

        it("should return the outer items without the intersections", function()
            local Result = Outer(FromValues( {1, 2, 3, 4} ), FromValues( {3, 4, 5, 6} ))
            expect(Result[1]).to.be.ok()
            expect(Result[2]).to.be.ok()
            expect(Result[3]).never.to.be.ok()
            expect(Result[4]).never.to.be.ok()
            expect(Result[5]).to.be.ok()
            expect(Result[6]).to.be.ok()
        end)
    end)
end