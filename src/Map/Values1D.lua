--- Obtains the values from a table
local function Values1D(Structure)
    local Result = {}
    local Index = 1

    for _, Value in pairs(Structure) do
        Result[Index] = Value
        Index += 1
    end

    return Result
end

return Values1D