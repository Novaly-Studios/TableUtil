--!native
--!optimize 2
--!nonstrict

--- Merges both given tables recursively.
--- Metatables are preserved, with new metatables overwrtiting old metatables.
local function MutableMergeDeep(X, Y, FunctionsMap: boolean?)
    for Key, Value in Y do
        local Type = type(Value)

        if (Type == "table") then
            local Got = X[Key]
            if (not Got) then
                Got = {}
                X[Key] = Got
            end

            MutableMergeDeep(Got, Value, FunctionsMap)
            continue
        elseif (FunctionsMap and Type == "function") then
            Value = Value(X[Key])
        end

        X[Key] = Value
    end

    local MT = getmetatable(Y :: any)
    if (MT) then
        setmetatable(X, MT)
    end
end

return MutableMergeDeep