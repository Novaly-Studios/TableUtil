--!native
--!optimize 2
--!nonstrict

local IsArray = require("./IsArray")
local IsMap = require("./IsMap")

--- Checks if the input table has a map / dictionary component and no array component.
local function IsPureArray(Structure: {[any]: any}): boolean
    return (IsArray(Structure) and not IsMap(Structure))
end

return IsPureArray