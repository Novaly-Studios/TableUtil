return function()
    local Filter1D = require(script.Parent.Filter1D)

    describe("Map/Filter1D", function()
        it("should return a blank table for no data", function()
            local Results = Filter1D({}, function()
                return true
            end)

            expect(next(Results)).never.to.be.ok()
        end)

        it("should return all items for true condition", function()
            local Results = Filter1D({A = 1, B = 2, C =3}, function()
                return true
            end)

            expect(Results.A).to.equal(1)
            expect(Results.B).to.equal(2)
            expect(Results.C).to.equal(3)
        end)

        it("should return all items greater than 3", function()
            local Results = Filter1D({A = 2, B = 4, C =8}, function(Value)
                return Value > 3
            end)

            expect(Results.A).never.to.be.ok()
            expect(Results.B).to.equal(4)
            expect(Results.C).to.equal(8)
        end)

        it("should pass the keys", function()
            local Results = Filter1D({A = 2, B = 4, C =8}, function(_, Key)
                return Key == "A" or Key == "B"
            end)

            expect(Results.A).to.equal(2)
            expect(Results.B).to.equal(4)
            expect(Results.C).never.to.be.ok()
        end)
    end)
end