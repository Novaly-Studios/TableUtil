--- Reduces an array to a single value from its left-most value to its right-most value
local function FoldLeft1D<T>(Array: {T}, Processor: (T, T, number, number) -> T, Initial: T): T
    local Aggregate = Initial
    local Size = #Array

    for Index = 1, Size do
        Aggregate = Processor(Aggregate, Array[Index], Index, Size)
    end

    return Aggregate
end

return FoldLeft1D