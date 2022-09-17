--- Finds keys in X which are not in Y (i.e. removed values with respect to a base table).
local function Removals1D<K, V>(X: {[K]: V}, Y: {[K]: V}): {[K]: V}
    local Result = {}

    for Key, Value in X do
        if (not Y[Key]) then
            Result[Key] = Value
        end
    end

    return Result
end

return Removals1D