local function Sort1D(Array, Condition)
    local ArraySize = #Array
    local Result = table.create(ArraySize)

    -- Copy over
    for Index = 1, ArraySize do
        Result[Index] = Array[Index]
    end

    table.sort(Result, Condition)

    return Result
end

return Sort1D