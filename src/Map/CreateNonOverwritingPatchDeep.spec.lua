return function()
    local CreateNonOverwritingPatchDeep = require(script.Parent.CreateNonOverwritingPatchDeep)

    describe("Map/CreateNonOverwritingPatchDeep", function()
        it("should return a blank table for no data", function()
            expect(next(CreateNonOverwritingPatchDeep({}, {}))).never.to.be.ok()
        end)

        it("should apply all new items in a flat table", function()
            local Result = CreateNonOverwritingPatchDeep({}, {
                X = 1;
                Y = 2;
                Z = 3;
            })

            expect(Result.X).to.equal(1)
            expect(Result.Y).to.equal(2)
            expect(Result.Z).to.equal(3)

            local Count = 0

            for _ in Result do
                Count += 1
            end

            expect(Count).to.equal(3)
        end)

        it("should not overwrite existing items in a flat table but apply new", function()
            local Result = CreateNonOverwritingPatchDeep({
                X = 20;
            }, {
                X = 1;
                Y = 2;
                Z = 3;
            })

            expect(Result.Y).to.equal(2)
            expect(Result.Z).to.equal(3)

            local Count = 0

            for _ in Result do
                Count += 1
            end

            expect(Count).to.equal(2)
        end)

        it("should apply all new items in a nested table", function()
            local Result = CreateNonOverwritingPatchDeep({}, {
                X = {
                    Y = {
                        Z = 1;
                    };
                };
            })

            expect(Result.X.Y.Z).to.equal(1)
        end)

        it("should not overwrite existing items in a nested table but apply new", function()
            local Result = CreateNonOverwritingPatchDeep({
                X = {
                    Y = {
                        Z = 20;
                    };
                };
            }, {
                X = {
                    Y = {
                        Z = 1;
                        H = 200;
                    };
                };
            })

            expect(Result.X.Y.Z).to.equal(nil)
            expect(Result.X.Y.H).to.equal(200)
        end)
    end)
end