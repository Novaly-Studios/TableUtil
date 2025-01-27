--!native
--!optimize 2
--!nonstrict

local IsArray = require(script.Parent.IsArray)

--- Creates a new data structure, representing the recursive merge of one table into another.
--- Metatables are preserved, with new metatables overwrtiting old metatables.
--- Functions will map & replace respective values into the new table.
--- When it encounters an array, it will join both arrays instead of overwrite indexes.
local function MixedMergeDeep<K1, K2, V1, V2>(X: {[K1]: V1}, Y: {[K2]: V2}, FunctionsMap: boolean?): {[K1 | K2]: V1 | V2}
    local MergeArrays = (IsArray(X) and IsArray(Y))
    local Result = table.clone(X)
    local Equal = true

    for Key, Value in Y do
        if (MergeArrays and type(Key) == "number" and (Y[Key - 1] ~= nil or Key == 1)) then
            table.insert(Result, Value)
            Equal = false
            continue
        end

        local Type = type(Value)
        local LeftValue = Result[Key]
        local NewValue = (
            -- If both values are tables, recurse further and merge the two tables.
            ((Type == "table" and type(LeftValue) == "table") and MixedMergeDeep(LeftValue, Value, FunctionsMap)) or
            -- If it's a mapper function -> call it with the value and subtitute whatever it returns.
            if (FunctionsMap and Type == "function") then Value(LeftValue)
            -- Otherwise, put value in directly.
            else Value
        )
        Equal = (Equal and LeftValue == NewValue)
        Result[Key] = NewValue
    end

    local MT = getmetatable(Y :: any)
    if (MT) then
        Equal = Equal and (getmetatable(Result) == MT)
        if (not Equal) then
            setmetatable(Result, MT)
        end
    end

    return (Equal and X or Result)
end

return MixedMergeDeep