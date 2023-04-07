return function()
    local MutableLockdown1D = require(script.Parent.MutableLockdown1D)

    describe("Map/MutableLockdown1D", function()
        it("should throw an error when attempting to index existing keys", function()
            local Subject = {X = 123}
            MutableLockdown1D(Subject)

            expect(function()
                local _ = Subject.X
            end).to.throw()
        end)

        it("should throw an error when attempting to index existing non-existing keys", function()
            local Subject = {X = 123}
            MutableLockdown1D(Subject)

            expect(function()
                local _ = Subject.Y
            end).to.throw()
        end)

        it("should throw an error when attempting to write to existing keys", function()
            local Subject = {A = 1}
            MutableLockdown1D(Subject)

            expect(function()
                Subject.A = 2
            end).to.throw()
        end)

        it("should throw an error when attempting to write to non-existing keys", function()
            local Subject = {X = 123}
            MutableLockdown1D(Subject)

            expect(function()
                Subject.A = 1
            end).to.throw()
        end)
    end)
end