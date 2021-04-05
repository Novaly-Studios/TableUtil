local function FromValues(ValuesTable, Mode)
    local Result = {}

    for _, Value in pairs(ValuesTable) do
        Result[Value] = true
    end

    if Mode then
        setmetatable(Result, {__mode = Mode})
    end

    return Result
end

return FromValues