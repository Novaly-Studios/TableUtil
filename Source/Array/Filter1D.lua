local function Filter1D(Array, Condition)
    local Result = {}
    local Index = 1

    for ItemIndex = 1, #Array do
        local Value = Array[ItemIndex]

        if (Condition(Value, ItemIndex)) then
            Result[Index] = Value
            Index += 1
        end
    end

    return Result
end

return Filter1D