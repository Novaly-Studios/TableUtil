local function FoldLeft1D(Array, Processor, Initial)
    local Aggregate = Initial
    local Size = #Array

    for Index = 1, Size do
        Aggregate = Processor(Aggregate, Array[Index], Index, Size)
    end

    return Aggregate
end

return FoldLeft1D