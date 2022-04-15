--- Copies & sorts an array according to some condition
local function Sort1D<T>(Array: {T}, Condition: (T, T) -> boolean): {T}
    local Result = table.clone(Array)
    table.sort(Result, Condition)
    return Result
end

return Sort1D