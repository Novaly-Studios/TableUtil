--- Merges various tables together.
local function Merge1D(...: {any}): {any}
    local Target = select(1, ...)

    for Index = 2, select("#", ...) do
        local Table = select(Index, ...)

        if (not Table) then
            continue
        end

        for Key, Value in Table do
            Target[Key] = Value
        end
    end

    return Target
end

return Merge1D