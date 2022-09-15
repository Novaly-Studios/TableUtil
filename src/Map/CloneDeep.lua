local TYPE_TABLE = "table"

--- Copies a data structure on all depth levels
local function CopyDeep<K, V>(Structure: {[K]: V}): {[K]: V}
    local Result = {}

    for Key, Value in Structure do
        Result[Key] = if (typeof(Value) == TYPE_TABLE) then CopyDeep(Value) else Value
    end

    return Result
end

return CopyDeep