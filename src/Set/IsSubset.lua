--!nonstrict
local SetType = require(script.Parent:WaitForChild("_SetType"))
type Set<T> = SetType.Set<T>

local function IsSubset<T>(Set1: Set<T>, Set2: Set<T>): boolean
    for Value in Set1 do
        if (not Set2[Value]) then
            return false
        end
    end

    return true
end

return IsSubset