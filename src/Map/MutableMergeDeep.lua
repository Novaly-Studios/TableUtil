local function CoreMerge(Into, Data)
    for Key, Value in Data do
        if (typeof(Value) == "table") then
            local Got = Into[Key]

            if (not Got) then
                Got = {}
                Into[Key] = Got
            end

            CoreMerge(Got, Value)

            continue
        end

        Into[Key] = Value
    end
end

--- Merges multiple tables into one, mutating the first table.
local function MutableMergeDeep(...: {any}): {any}
    local Target = select(1, ...)

    for Index = 2, select("#", ...) do
        local Table = select(Index, ...)

        if (not Table) then
            continue
        end

        CoreMerge(Target, Table)
    end

    return Target
end

return MutableMergeDeep