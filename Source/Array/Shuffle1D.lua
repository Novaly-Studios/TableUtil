local function Shuffle1D(Array, Seed)
    math.randomseed(Seed or os.clock())

    local ArraySize = #Array
    local Result = table.create(ArraySize)

    for Index = 1, #Array do
        Result[Index] = Array[Index]
    end

    for Index = 1, ArraySize do
        local Generated = math.random(1, ArraySize)
        Result[Index], Result[Generated] = Result[Generated], Result[Index]
    end

    return Result
end

return Shuffle1D