local function Union(Set1, Set2)
    local Result = {}

    for Key in pairs(Set1) do
        Result[Key] = true
    end

    for Key in pairs(Set2) do
        Result[Key] = true
    end

    return Result
end

return Union