local function Map1D(Array, Operator)
    local Result = {}
    local Index = 1

    for ItemIndex = 1, #Array do
        local Value = Array[ItemIndex]
        local Transformed = Operator(Value, ItemIndex)

        if (Transformed == nil) then
            -- Skip nil values
            continue
        end

        Result[Index] = Transformed
        Index += 1
    end

    return Result
end

return Map1D