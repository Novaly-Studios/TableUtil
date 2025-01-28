--!native
--!optimize 2
--!nonstrict

local IsMap = require(script.Parent.Parent.Shared.IsMap)

return table.freeze({
    Freeze = function(Call)
        return function(Array, Value, At)
            return table.freeze(Call(Array, Value, At))
        end
    end;
    Assert = function(Call)
        return function(Array, Value, At)
            local NewSize = #Array + 1
            At = At or NewSize

            assert(type(Array) == "table" and not IsMap(Array), "Arg #1 was not an array")
            assert(type(At) == "number", "Arg #3 was not a number")
            assert(At >= 1 and At <= NewSize, "Insert index out of array range")

            return Call(Array, Value, At)
        end
    end;
})