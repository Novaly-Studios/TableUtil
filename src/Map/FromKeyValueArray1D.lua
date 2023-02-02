--- Converts a table into an array of key-value objects.
local function FromKeyValueArray1D<K, V>(Structure: {{K | V}}): {[K]: V}
    local Result = {}

    for _, Pair in Structure do
        Result[Pair[1]] = Pair[2]
    end

    return Result
end

return FromKeyValueArray1D