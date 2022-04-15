--- Puts each key-value pair in a table through a transformation function, mapping the outputs into a new table
local function Map1D(Structure, Operation)
    local Result = {}

    for Key, Value in pairs(Structure) do
        local NewValue, NewKey = Operation(Value, Key)
        Result[NewKey or Key] = NewValue
    end

    return Result
end

return Map1D