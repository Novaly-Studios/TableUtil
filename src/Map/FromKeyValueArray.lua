--- Converts a table into an array of key-value objects.
local function FromKeyValueArray<K, V>(Structure: {{K | V}}): {[K]: V}
    local Result = {}

    for _, Pairing in Structure do
        Result[Pairing[1]] = Pairing[2]
    end

    return Result
end

return FromKeyValueArray