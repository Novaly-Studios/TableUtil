--- Counts the number of elements in a flat table.
local function Count1D(Structure: any): number
    local Count = 0

    for _ in Structure do
        Count += 1
    end

    return Count
end

return Count1D