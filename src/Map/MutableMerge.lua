--!native
--!optimize 2
--!nonstrict

--- Merges two tables together.
--- Metatables are preserved, with new metatables overwrtiting old metatables.
local function MutableMerge(X: {[any]: any}, Y: {[any]: any})
    for Key, Value in Y do
        X[Key] = Value
    end
    local MT = getmetatable(Y :: any)
    if (MT) then
        setmetatable(X, MT)
    end
end

return MutableMerge