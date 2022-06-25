--- Merges various tables together, into a union data type.
local function Merge1D(...)
    local Result = {}

    for Index = 1, select("#", ...) do
        for Key, Value in select(Index, ...) do
            Result[Key] = Value
        end
    end

    return Result
end

return Merge1D :: <K0, V0, K1, V1>({[K0]: V0}, {[K1]: V1}, ...any) -> ({[K0 | K1]: {V0 | V1}})