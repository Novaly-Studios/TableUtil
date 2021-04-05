local function SelectLast1D(Array, Condition)
    for Index = #Array, 1, -1 do
        local Value = Array[Index]

        if (Condition(Value, Index)) then
            return Value
        end
    end

    return nil
end

return SelectLast1D