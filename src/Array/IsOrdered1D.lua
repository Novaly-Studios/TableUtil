--- Returns true if the given array is ordered in the given direction.
--- AscendingOrDescendingOrEither: true -> ascending.
--- AscendingOrDescendingOrEither: false -> descending.
--- AscendingOrDescendingOrEither: nil -> either.
local function IsOrdered1D(Structure: {any}, AscendingOrDescendingOrEither: boolean?): (boolean)
    if (AscendingOrDescendingOrEither) then
        local LastValue = Structure[1]

        for Index = 2, #Structure do
            local Value = Structure[Index]

            if (Value < LastValue) then
                return false
            end

            LastValue = Value
        end

        return true
    elseif (AscendingOrDescendingOrEither == false) then
        local LastValue = Structure[1]

        for Index = 2, #Structure do
            local Value = Structure[Index]

            if (Value > LastValue) then
                return false
            end

            LastValue = Value
        end

        return true
    end

    return IsOrdered1D(Structure, true) or IsOrdered1D(Structure, false)
end

return IsOrdered1D