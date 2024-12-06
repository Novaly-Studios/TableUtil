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
            assert(type(Array) == "table" and not IsMap(Array), "Arg #1 was not an array")
            assert(Index == nil or type(Index) == "number", "Arg #2 was not a number or nil")
            return Call(Array, Index)
        end
    end;
})