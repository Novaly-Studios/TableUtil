local RandomGenerator = Random.new()

--- Scrambles an array with an optional random seed
local function Shuffle1D<T>(Array: {T}, Seed: number?): {T}
    local Generator = Seed and Random.new(Seed) or RandomGenerator

    local ArraySize = #Array
    local Result = table.clone(Array)

    for Index = 1, ArraySize do
        local Generated = Generator:NextInteger(1, ArraySize)
        Result[Index], Result[Generated] = Result[Generated], Result[Index]
    end

    return Result
end

return Shuffle1D