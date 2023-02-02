--- Creates a "patch template" into another object recursively.
--- This allows us to apply an additional merge to add new fields to values which were not originally nil.
--- Good use case: want to merge in new default fields to a player's data structure without overwriting existing fields.
--- @todo Return nil if result is empty & wrap top level with another function? That way we trim recursive merge work for the resulting empty tables, which will be the common use case.
--- @todo Deep copy for intuitiveness.
local TYPE_TABLE = "table"

local function CreatePatchDeep(Previous, Template)
    local Result = {}

    for Key, Value in Template do
        local ExistingValue = Previous[Key]

        if (type(Value) == TYPE_TABLE and type(ExistingValue) == TYPE_TABLE) then
            Result[Key] = CreatePatchDeep(ExistingValue or {}, Value)
            continue
        end

        if (ExistingValue ~= nil) then
            continue
        end

        Result[Key] = Value
    end

    return Result
end

return CreatePatchDeep