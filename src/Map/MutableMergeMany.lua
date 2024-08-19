--!native
--!optimize 2
--!nonstrict

local MutableMerge = require(script.Parent:WaitForChild("MutableMerge"))

--- Merges various tables together.
--- Metatables are preserved, with new metatables overwrtiting old metatables.
local function MutableMergeMany(...: {any}): {any}
    local Target = select(1, ...)

    for Index = 2, select("#", ...) do
        local Table = select(Index, ...)
        if (not Table) then
            continue
        end
        MutableMerge(Target, Table)

        local MT = getmetatable(Table :: any)
        if (MT) then
            setmetatable(Target, MT)
        end
    end

    return Target
end

return MutableMergeMany