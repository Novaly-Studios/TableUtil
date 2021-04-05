local function Cut1D(Array, From, To)
    local Size = #Array

    assert(From >= 1, "Start index less than 1!")
    assert(To >= 1, "End index greater than 1!")

    assert(From <= Size, "Start index beyond array length!")
    assert(To <= Size, "End index beyond array length!")

    local Diff = To - From
    local Range = math.abs(Diff)

    if (Range == Size - 1) then
        return Array
    end

    local ResultIndex = 1
    local Result = table.create(Range)
    local Increment = Diff == 0 and 1 or math.sign(Diff)

    for Index = From, To, Increment do
        Result[ResultIndex] = Array[Index]
        ResultIndex += 1
    end

    return Result
end

return Cut1D