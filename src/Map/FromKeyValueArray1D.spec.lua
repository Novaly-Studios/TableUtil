return function()
    local FromKeyValueArray1D = require(script.Parent.FromKeyValueArray1D)

    describe("Map/FromKeyValueArray1D", function()
        it("should return a blank map given an empty array", function()
            expect(next(FromKeyValueArray1D({}))).never.to.be.ok()
        end)

        it("should create a map with one key-value pair given a single item array", function()
            local Result = FromKeyValueArray1D({{"A", 1}})
            expect(Result.A).to.equal(1)
        end)

        it("should create a map with key-value pairs given an array of key-value pairs", function()
            local Result = FromKeyValueArray1D({{"A", 1}, {"B", 2}, {"C", 3}})
            expect(Result.A).to.equal(1)
            expect(Result.B).to.equal(2)
            expect(Result.C).to.equal(3)
        end)
    end)
end