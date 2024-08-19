--!native
--!optimize 2
--!nonstrict

--- Merges various tables together.
--- Metatables are preserved, with new metatables overwrtiting old metatables.
local function MergeMany(...)
    local Count = select("#", ...)
    if (Count == 0) then
        return {}
    end

    local Result = table.clone((select(1, ...)))
    for Index = 2, Count do
        local Table = (select(Index, ...))
        for Key, Value in Table do
            Result[Key] = Value
        end

        local MT = getmetatable(Table :: any)
        if (MT) then
            setmetatable(Result, MT)
        end
    end
    return Result
end

return MergeMany