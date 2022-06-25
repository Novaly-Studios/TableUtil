--!nonstrict
local SetType = require(script.Parent:WaitForChild("_SetType"))
type Set<T> = SetType.Set<T>

local function Outer<T>(Set1: Set<T>, Set2: Set<T>): Set<T>
    local Result = {}

    for Key in Set1 do
        if (not (Set2[Key] and Set1[Key])) then
            Result[Key] = true
        end
    end

    for Key in Set2 do
        if (not (Set2[Key] and Set1[Key])) then
            Result[Key] = true
        end
    end

    return Result
end

return Outer