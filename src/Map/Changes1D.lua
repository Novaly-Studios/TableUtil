--- Finds unequal values with the same key, returns a table of the new values from Y.
local function Changes1D<K, V>(X: {[K]: V}, Y: {[K]: V}): {[K]: V}
    local Result = {}

    for Key, Value in X do
        local YValue = Y[Key]

        if (YValue and YValue ~= Value) then
            Result[Key] = YValue
        end
    end

    return Result
end

return Changes1D