--!nonstrict
local SetType = require(script.Parent:WaitForChild("_SetType"))
type Set<T> = SetType.Set<T>

local function FromKeys<T>(KeysTable: {[T]: any}): Set<T>
    local Result = {}

    for Key in KeysTable do
        Result[Key] = true
    end

    return Result
end

return FromKeys