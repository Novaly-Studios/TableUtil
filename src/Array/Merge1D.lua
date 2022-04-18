--- Merges multiple arrays together, in order
local function Merge1D<T>(...: {T}): {T}
    local Result = table.clone(select(1, ...))
    local Index = #Result + 1

    for SubArrayIndex = 2, select("#", ...) do
        local SubArray = select(SubArrayIndex, ...)
        local Size = #SubArray
        table.move(SubArray, 1, Size, Index, Result)
        Index += Size
    end

    return Result
end

return Merge1D