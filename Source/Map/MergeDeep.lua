local function MergeDeep(Structure, Into)
    local Result = {}

    -- Copy top level
    for Key, Value in pairs(Into) do
        Result[Key] = Value
    end

    -- Structure overwrites
    for Key, Value in pairs(Structure) do
        if (typeof(Value) ~= "table") then
            Result[Key] = Value
            continue
        end

        local OtherValue = Into[Key]
        local IntoTarget = (typeof(OtherValue) == "table" and OtherValue or {})
        Result[Key] = MergeDeep(Value, IntoTarget)
    end

    return Result
end

return MergeDeep