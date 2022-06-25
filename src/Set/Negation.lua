--!nonstrict
local SetType = require(script.Parent:WaitForChild("_SetType"))
type Set<T> = SetType.Set<T>

local function Negation<T>(Set1: Set<T>, Set2: Set<T>): Set<T>
    local Result = {}

    for Key in Set1 do
        if (Set2[Key] == nil) then
            Result[Key] = true
        end
    end

    return Result
end

return Negation