--!optimize 2
--!native

--- Converts a table into an array of key-value objects.
local function FromKeyValueArray<K, V>(Structure: {{Key: K, Value: V}}): {[K]: V}
    local Result = {}
    for _, Pairing in Structure do
        Result[Pairing.Key] = Pairing.Value
    end
    return Result
end

return FromKeyValueArray