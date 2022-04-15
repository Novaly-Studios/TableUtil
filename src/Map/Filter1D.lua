--- Filters a table for all items which satisfy some condition
local function Filter1D(Structure, Condition)
    local Result = {}

    for Key, Value in pairs(Structure) do
        if (Condition(Value, Key)) then
            Result[Key] = Value
        end
    end

    return Result
end

return Filter1D