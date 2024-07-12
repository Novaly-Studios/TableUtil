--!optimize 2
--!native

--- Copies a data structure on all depth levels.
local function CloneDeep<K, V>(Structure: {[K]: V}): {[K]: V}
    local Result = {}
    for Key, Value in Structure do
        Result[Key] = if (type(Value) == "table") then CloneDeep(Value) else Value
    end
    return Result
end

return CloneDeep