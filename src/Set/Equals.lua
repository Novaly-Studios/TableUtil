--!nonstrict
local SetType = require(script.Parent:WaitForChild("_SetType"))
type Set<T> = SetType.Set<T>

local function Equals<T>(Set1: Set<T>, Set2: Set<T>): boolean
    for Key in Set1 do
        if (not Set2[Key]) then
            return false
        end
    end

    for Key in Set2 do
        if (not Set1[Key]) then
            return false
        end
    end

    return true
end

return Equals