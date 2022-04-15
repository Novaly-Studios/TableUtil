--- Filters an array for all items which satisfy some condition
local function Filter1D<T>(Array: {T}, Condition: (T, number) -> boolean): {T}
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