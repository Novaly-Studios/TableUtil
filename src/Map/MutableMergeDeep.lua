--!native
--!optimize 2
--!nonstrict

--- Merges both given tables recursively.
--- Metatables are preserved, with new metatables overwrtiting old metatables.
local function MutableMergeDeep(X, Y)
    local MT = getmetatable(Y :: any)
    if (MT) then
        setmetatable(X, MT)
    end

    for Key, Value in Y do
        if (type(Value) == "table") then
            local Got = X[Key]
            if (not Got) then
                Got = {}
                X[Key] = Got
            end

            MutableMergeDeep(Got, Value)
            continue
        end

        X[Key] = Value
    end
end

return MutableMergeDeep