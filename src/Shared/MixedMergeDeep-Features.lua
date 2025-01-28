--!native
--!optimize 2
--!nonstrict

local function Freezes(X, Y)
    if (X == Y) then
        return
    end

    for Key, Value in Y do
        local OtherValue = X[Key]
        if (type(OtherValue) == "table") then
            Freezes(OtherValue, Value)
        end
    end

    table.freeze(X)
end

return table.freeze({
    Freeze = function(Call)
        return function(X, Y, FunctionsMap)
            local Result = Call(X, Y, FunctionsMap)
            Freezes(Result, Y)
            return Result
        end
    end;
    Assert = function(Call)
        return function(X, Y, FunctionsMap)
            assert(type(X) == "table", "Arg #1 was not a table")
            assert(type(Y) == "table", "Arg #2 was not a table")
            assert(FunctionsMap == nil or type(FunctionsMap) == "boolean", `Arg #3 was not a boolean`)

            return Call(X, Y, FunctionsMap)
        end
    end;
})