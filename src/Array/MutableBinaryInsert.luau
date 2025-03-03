--!native
--!optimize 2
--!nonstrict

local BinarySearch = require("./BinarySearch")

--- Binary insertion on an ordered array.
local function MutableBinaryInsert<T>(Array: {T}, Target: T)
    table.insert(Array, (BinarySearch(Array, Target, true) :: number) + 1, Target)
end

return MutableBinaryInsert