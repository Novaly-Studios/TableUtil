--!native
--!optimize 2
--!nonstrict

--- Creates a new data structure, representing the recursive merge of one table into another.
--- Metatables are preserved, with new metatables overwrtiting old metatables.
--- Functions will map & replace respective values into the new table.
local function MergeDeep<K1, K2, V1, V2>(X: {[K1]: V1}, Y: {[K2]: V2}, FunctionsMap: boolean?): {[K1 | K2]: V1 | V2}
    local Result = table.clone(X)
    local Equal = true

    for Key, Value in Y do
        local Type = type(Value)
        local LeftValue = Result[Key]
        local NewValue = (
            -- If both values are tables, recurse further and merge the two tables.
            ((Type == "table" and type(LeftValue) == "table") and MergeDeep(LeftValue, Value, FunctionsMap)) or
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

return MergeDeep