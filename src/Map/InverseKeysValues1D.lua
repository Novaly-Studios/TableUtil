--- Creates a new table with the keys and values swapped. Duplicate values will overwrite each other when swapped to keys.
local function InverseKeysValues1D<K, V>(Structure: {[K]: V}): {[V]: K}
    local Result = {}

    for Key, Value in Structure do
        Result[Value] = Key
    end

    return Result
end

return InverseKeysValues1D