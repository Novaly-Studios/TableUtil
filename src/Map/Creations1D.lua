--- Finds keys in Y which are not in X (i.e. new values with respect to a base table).
local function Creations1D<K, V>(X: {[K]: V}, Y: {[K]: V}): {[K]: V}
    local Result = {}

    for Key, Value in Y do
        if (not X[Key]) then
            Result[Key] = Value
        end
    end

    return Result
end

return Creations1D