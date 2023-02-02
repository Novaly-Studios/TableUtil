local RandomGen = Random.new()

local function SelectRandom1D<T>(Structure: {[number]: T}, Seed: number?): (T, number)
    local RandomObject = Seed and Random.new(Seed) or RandomGen
    local Index = RandomObject:NextInteger(1, #Structure)
    return Structure[Index], Index
end

return SelectRandom1D