--- Flips all items in an array
local function Reverse1D<T>(Array: {T}): {T}
    local ArraySize = #Array
    local Result = table.create(ArraySize)

    for Index = 1, ArraySize do
        Result[Index] = Array[ArraySize - Index + 1]
    end

    return Result
end

return Reverse1D