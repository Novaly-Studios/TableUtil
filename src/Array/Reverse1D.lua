local MutableReverse1D = require(script.Parent:WaitForChild("MutableReverse1D"))

--- Flips all items in an array.
local function Reverse1D<T>(Array: {T}): {T}
    local Copy = table.clone(Array)
    MutableReverse1D(Copy)
    return Copy
end

return Reverse1D