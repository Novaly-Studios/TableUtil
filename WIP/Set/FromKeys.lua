local function FromKeys(ValuesTable, Mode)
    local Result = {}

    for Key in pairs(ValuesTable) do
        Result[Key] = true
    end

    if Mode then
        setmetatable(Result, {__mode = Mode})
    end

    return Result
end

return FromKeys