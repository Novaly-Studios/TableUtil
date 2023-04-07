--- Creates a new data structure, representing the recursive merge of one table into another. Ensures structural sharing.
local function MergeDeep(Into, Structure)
    if (next(Into) == nil) then
        return Structure
    end

    if (next(Structure) == nil) then
        return Into
    end

    if (Structure == Into) then
        return Structure
    end

    local Result = {}

    for Key, IntoValue in Into do
        Result[Key] = IntoValue
    end

    for Key, StructureValue in Structure do
        if (typeof(StructureValue) == "table") then
            local IntoValue = Into[Key]

            if (typeof(IntoValue) == "table") then
                Result[Key] = MergeDeep(IntoValue, StructureValue)
                continue
            end
        end

        Result[Key] = StructureValue
    end

    return Result
end

return MergeDeep