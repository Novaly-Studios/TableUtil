local function Insert1D(Array, Value, At)
    local ArraySize = #Array
    local NewSize = ArraySize + 1
    local Result = table.create(NewSize)
    At = At or NewSize

    assert(At >= 1 and At <= NewSize, "Insert index out of array range")

    for Index = 1, At - 1 do
        Result[Index] = Array[Index]
    end

    Result[At] = Value

    for Index = At + 1, NewSize do
        Result[Index] = Array[Index - 1]
    end

    return Result
end

return Insert1D