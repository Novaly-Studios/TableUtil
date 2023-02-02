--- Checks if the input table has an *array component*. Not mutually exclusive to IsMap1D.
local function IsArray1D(Structure: {[any]: any}): boolean
    return Structure[1] ~= nil
end

return IsArray1D