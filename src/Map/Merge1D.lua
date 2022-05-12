--- Merges various tables together, into a union data type.
local function Merge1D(...)
    local Result = {}

    for Index = 1, select("#", ...) do
        for Key, Value in pairs(select(Index, ...)) do
            Result[Key] = Value
        end
    end

    return Result
end

return Merge1D