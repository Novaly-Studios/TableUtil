--- Selects the first item in an array which satisfies some condition
local function SelectFirst1D<T>(Array: {T}, Condition: (T, number) -> boolean): T?
    for Index = 1, #Array do
        local Value = Array[Index]

        if (Condition(Value, Index)) then
            return Value
        end
    end

    return nil
end

return SelectFirst1D