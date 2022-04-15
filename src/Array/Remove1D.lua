--- Removes a single element from an array
local function Remove1D<T>(Array: {T}, Index: number): {T}
    local ArrayLength = #Array

    if (ArrayLength == 0) then
        return {}
    end

    Index = Index or ArrayLength

    assert(Index > 0, "Index must be greater than 0!")
    assert(Index <= ArrayLength, "Index out of bounds!")

    local Result = table.create(ArrayLength - 1)
    table.move(Array, 1, Index - 1, 1, Result)

    for SubIndex = Index + 1, ArrayLength do
        Result[SubIndex - 1] = Array[SubIndex]
    end

    return Result
end

return Remove1D