--- Obtains the values from a table
local function Values1D<T>(Structure: {[any]: T}): T
    local Result = {}
    local Index = 1

    for _, Value in Structure do
        Result[Index] = Value
        Index += 1
    end

    return Result
end

return Values1D