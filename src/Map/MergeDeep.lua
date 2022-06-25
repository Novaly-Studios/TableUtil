local TYPE_TABLE = "table"

--- Creates a new data structure, representing the recursive merge of one table into another. Ensures structural sharing.
local function MergeDeep(Structure, Into)
    local Result = {}

    -- Copy top level
    for Key, Value in Into do
        Result[Key] = Value
    end

    -- Structure overwrites
    for Key, Value in Structure do
        if (type(Value) ~= TYPE_TABLE) then
            Result[Key] = Value
            continue
        end

        local OtherValue = Into[Key]
        local IntoTarget = (type(OtherValue) == TYPE_TABLE and OtherValue or {})
        Result[Key] = MergeDeep(Value, IntoTarget)
    end

    return Result
end

return MergeDeep