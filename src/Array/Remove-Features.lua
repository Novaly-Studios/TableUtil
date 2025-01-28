--!native
--!optimize 2
--!nonstrict

local IsMap = require(script.Parent.Parent.Shared.IsMap)

return table.freeze({
    Freeze = function(Call)
        return function(Array, Index)
            return table.freeze(Call(Array, Index))
        end
    end;
    Assert = function(Call)
        return function(Array, Index)
            local IndexNil = (Index == nil)
            assert(type(Array) == "table" and not IsMap(Array), "Arg #1 was not an array")
            assert(IndexNil or type(Index) == "number", "Arg #2 was not a number or nil")

            if (not IndexNil) then
                assert(Index > 0, "Index must be greater than 0")
                assert(Index <= #Array, "Index out of bounds")
            end

            return Call(Array, Index)
        end
    end;
})