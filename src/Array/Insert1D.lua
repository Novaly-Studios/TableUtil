--- Inserts a value into an array with an optional "insert at" index
local function Insert1D<T>(Array: {T}, Value: T, At: number?): {T}
    local ArraySize = #Array
    local NewSize = ArraySize + 1
    local Result = table.create(NewSize)
    At = At or NewSize

    assert(At >= 1 and At <= NewSize, "Insert index out of array range")

    table.move(Array, 1, At - 1, 1, Result)
    Result[At] = Value

    for Index = At + 1, NewSize do
        Result[Index] = Array[Index - 1]
    end

    return Result
end

return Insert1D