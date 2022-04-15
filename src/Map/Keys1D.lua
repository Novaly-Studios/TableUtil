--- Obtains the keys from a table
local function Keys1D(Structure)
    local Result = {}
    local Index = 1

    for Key in pairs(Structure) do
        Result[Index] = Key
        Index += 1
    end

    return Result
end

return Keys1D