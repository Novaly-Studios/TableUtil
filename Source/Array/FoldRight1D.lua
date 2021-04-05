local function FoldRight1D(Array, Processor, Initial)
    local Aggregate = Initial
    local Size = #Array

    for Index = Size, 1, -1 do
        Aggregate = Processor(Aggregate, Array[Index], Index, Size)
    end

    return Aggregate
end

return FoldRight1D