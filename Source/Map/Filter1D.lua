local function Filter1D(Array, Condition)
    local Result = {}

    for Key, Value in pairs(Array) do
        if (Condition(Value, Key)) then
            Result[Key] = Value
        end
    end

    return Result
end

return Filter1D