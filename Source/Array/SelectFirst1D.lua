local function SelectFirst1D(Array, Condition)
    for Index = 1, #Array do
        local Value = Array[Index]

        if (Condition(Value, Index)) then
            return Value
        end
    end

    return nil
end

return SelectFirst1D