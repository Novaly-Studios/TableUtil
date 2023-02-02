--- Creates a new data structure, representing the recursive merge of one table into another. Ensures structural sharing.
local function MergeDeep(Into, Structure)
    local Result = {}

    -- Copy top level
    for Key, Value in Into do
        Result[Key] = Value
    end

    -- Structure overwrites
    for Key, Value in Structure do
        if (type(Value) == "table") then
            local OtherValue = Into[Key]
            Result[Key] = MergeDeep(type(OtherValue) == "table" and OtherValue or {}, Value)
            continue
        end

        Result[Key] = Value
    end

    return Result
end

return MergeDeep