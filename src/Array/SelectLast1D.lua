--- Selects the last item in an array which satisfies some condition
local function SelectLast1D<T>(Array: {T}, Condition: (T, number) -> boolean): T?
    for Index = #Array, 1, -1 do
        local Value = Array[Index]

        if (Condition(Value, Index)) then
            return Value
        end
    end

    return nil
end

return SelectLast1D