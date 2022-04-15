--- Merges various tables together, into a union data type.
local function Merge1D(...)
    local Result = {}
    local Args = {...}

    for Index = 1, #Args do
        for Key, Value in pairs(Args[Index]) do
            Result[Key] = Value
        end
    end

    return Result
end

return Merge1D