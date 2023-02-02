local MutableShuffle1D = require(script.Parent:WaitForChild("MutableShuffle1D"))

--- Scrambles an array with an optional random seed.
local function Shuffle1D<T>(Array: {T}, Seed: number?): {T}
    local Copy = table.clone(Array)
    MutableShuffle1D(Copy, Seed)
    return Copy
end

return Shuffle1D