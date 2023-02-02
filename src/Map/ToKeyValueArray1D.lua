--- Converts a table into an array of key-value objects.
local function ToKeyValueArray1D<K, V>(Structure: {[K]: V}): {{K | V}}
    local Result = {}

    for Key, Value in Structure do
        table.insert(Result, {Key, Value})
    end

    return Result
end

return ToKeyValueArray1D