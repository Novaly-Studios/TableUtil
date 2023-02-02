local IsArray1D = require(script.Parent:WaitForChild("IsArray1D"))
local IsMap1D = require(script.Parent.Parent:WaitForChild("Map"):WaitForChild("IsMap1D"))

--- Checks if the input table has a map / dictionary component and no array component.
local function IsPureArray1D(Structure: {[any]: any}): boolean
    return IsArray1D(Structure) and not IsMap1D(Structure)
end

return IsPureArray1D