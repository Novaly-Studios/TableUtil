--!optimize 2
--!native

--- Merges various tables together.
local function MergeMany(...)
    local Count = select("#", ...)
    if (Count == 0) then
        return {}
    end

    local Result = table.clone((select(1, ...)))
    for Index = 2, Count do
        for Key, Value in (select(Index, ...)) do
            Result[Key] = Value
        end
    end
    return Result
end

return MergeMany