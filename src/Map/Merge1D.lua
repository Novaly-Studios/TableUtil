local MutableMerge1D = require(script.Parent:WaitForChild("MutableMerge1D"))

--- Merges various tables together.
local function Merge1D(...)
    return MutableMerge1D({}, ...)
end

return Merge1D