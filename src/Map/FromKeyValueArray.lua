--- Converts a table into an array of key-value objects.
local function FromKeyValueArray<K, V>(Structure: {K | V}): {[K]: V}
    local Result = {}

    for Index = 1, #Structure, 2 do
        Result[Structure[Index]] = Structure[Index + 1]
    end

    return Result
end

return FromKeyValueArray