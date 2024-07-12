--!optimize 2
--!native

local function Sum<T>(Array: {T}, From: number?, To: number?): T
    local Size = #Array
    From = From or 1
    To = To or Size

    if (From < 1) then
        error("From must be at least 1")
    end

    if (To > Size) then
        error(`To must be at most the length of the array (${Size})`)
    end

    local Sum = 0
    for Index = From, To, math.sign(To - From) do
        Sum += Array[Index]
    end
    return Sum
end

print(">>>", Sum({1, 2, 3, 4}, 1, 3))

return Sum