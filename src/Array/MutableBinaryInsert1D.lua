local BinarySearch1D = require(script.Parent:WaitForChild("BinarySearch1D"))

--- Binary insertion on an ordered array.
local function MutableBinaryInsert1D<T>(Array: {T}, Target: T)
    table.insert(Array, (BinarySearch1D(Array, Target, true) :: number) + 1, Target)
end

return MutableBinaryInsert1D