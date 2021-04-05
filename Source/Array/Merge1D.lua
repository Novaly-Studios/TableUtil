local function Merge1D(...)
    local ToMerge = {...}
    local Result = {}
    local Index = 1

    for SubArrayIndex = 1, #ToMerge do
        local SubArray = ToMerge[SubArrayIndex]

        for ItemIndex = 1, #SubArray do
            Result[Index] = SubArray[ItemIndex]
            Index += 1
        end
    end

    return Result
end

return Merge1D