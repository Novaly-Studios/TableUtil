local function ToKeyValueArray1D<K, V>(Structure: {[K]: V}): {{Key: K, Value: V}}
    local Result = {}

    for Key, Value in Structure do
        table.insert(Result, {
            Key = Key;
            Value = Value;
        })
    end

    return Result
end

return ToKeyValueArray1D