return function()
    local MutableUnresizable1D = require(script.Parent.MutableUnresizable1D)

    describe("Map/MutableUnresizable1D", function()
        it("should throw an error when attempting to write to non-existing keys", function()
            local Subject = {X = 123}
            MutableUnresizable1D(Subject)

            expect(function()
                Subject.A = 1
            end).to.throw()
        end)

        it("should not throw an error when attempting to write to existing keys", function()
            local Subject = {A = 1}
            MutableUnresizable1D(Subject)

            expect(function()
                Subject.A = 2
            end).never.to.throw()
        end)
    end)
end