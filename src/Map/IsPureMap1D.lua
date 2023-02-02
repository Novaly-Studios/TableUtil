local IsArray1D = require(script.Parent.Parent:WaitForChild("Array"):WaitForChild("IsArray1D"))
local IsMap1D = require(script.Parent:WaitForChild("IsMap1D"))

--- Checks if the input table has an array component and no map / dictionary component.
local function IsPureMap1D(Structure: {[any]: any}): boolean
    return IsMap1D(Structure) and not IsArray1D(Structure)
end

return IsPureMap1D