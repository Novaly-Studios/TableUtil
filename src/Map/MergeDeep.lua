--!native
--!optimize 2
--!nonstrict

--- Creates a new data structure, representing the recursive merge of one table into another.
--- Metatables are preserved, with new metatables overwrtiting old metatables.
local function MergeDeep<K1, K2, V1, V2>(X: {[K1]: V1}, Y: {[K2]: V2}): {[K1 | K2]: V1 | V2}
    if (next(X) == nil) then
        local MT = getmetatable(Y :: any) or getmetatable(X :: any)
        if (MT) then
            return setmetatable(table.clone(Y) :: any, MT)
        end
        return Y
    end

    if (next(Y) == nil) then
        local MT = getmetatable(Y :: any)
        if (MT) then
            return setmetatable(table.clone(X) :: any, MT)
        end
        return X
    end

    if (X == Y) then
        return X
    end

    local Result = table.clone(X)
    for Key, Value in Y do
        local Type = type(Value)
        Result[Key] = (
            (Type == "table" and MergeDeep(Result[Key] or {}, Value)) or
            (Type == "function" and Value(Result[Key])) or
            Value
        )
    end

    local MT = getmetatable(Y :: any)
    if (MT) then
        setmetatable(Result, MT)
    end
    return Result
end

return MergeDeep