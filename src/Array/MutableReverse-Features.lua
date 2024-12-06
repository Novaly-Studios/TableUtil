--!native
--!optimize 2
--!nonstrict

local IsMap = require(script.Parent.Parent.Shared.IsMap)

return table.freeze({
    Assert = function(Call)
        return function(Array)
            assert(type(Array) == "table" and not IsMap(Array), `Arg #1 was not an array`)
            return Call(Array)
        end
    end;
})