local IsMap1D = require(script.Parent:WaitForChild("IsMap1D"))
local IsArray1D = require(script.Parent.Parent:WaitForChild("Array"):WaitForChild("IsArray1D"))

--- Checks if the input table has both a map / dictionary component, and an array component.
local function IsMixed1D(Structure: {[any]: any}): boolean
    return IsMap1D(Structure) and IsArray1D(Structure)
end

return IsMixed1D