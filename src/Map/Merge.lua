--!native
--!optimize 2
--!nonstrict

--- Merges two tables together, returning a new one.
--- Metatables are preserved, with new metatables overwrtiting old metatables.
local function Merge<K1, K2, V1, V2>(X: {[K1]: V1}, Y: {[K2]: V2}): {[K1 | K2]: V1 | V2}
    if (next(X) == nil) then
        local MT = getmetatable(Y :: any) or getmetatable(X :: any)
        if (MT) then
            return setmetatable(table.clone(Y) :: any, MT)
        end
        return Y
    end

    if (next(Y) == nil) then
        local MT = getmetatable(Y :: any) -- or getmetatable(X :: any)
        if (MT) then
            return setmetatable(table.clone(X) :: any, MT)
        end
        return X
    end

    local Result = table.clone(X)
    for Key, Value in Y do
        Result[Key] = Value
    end

    local MT = getmetatable(Y :: any)
    if (MT) then
        setmetatable(Result, MT)
    end
    return Result
end

return Merge