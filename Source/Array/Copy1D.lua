local function Copy1D(Array)
    local ArraySize = #Array
    local Result = table.create(ArraySize)

    for Index = 1, ArraySize do
        Result[Index] = Array[Index]
    end

    return Result
end

return Copy1D