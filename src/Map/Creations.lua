--!native
--!optimize 2
--!nonstrict

--- Finds keys in Y which are not in X (i.e. new values with respect to a base table).
local function Creations<K, V>(X: {[K]: V}, Y: {[K]: V}): {[K]: V}
    if (next(Y) == nil) then
        return Y
    end

    if (next(X) == nil) then
        return Y
    end

    local Result = {}

    for Key, Value in Y do
        if (X[Key] == nil) then
            Result[Key] = Value
        end
    end

    return Result
end

return Creations