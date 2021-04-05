local function Negation(Set1, Set2)
    local Result = {}

    for Key in pairs(Set1) do
        if (Set2[Key] == nil) then
            Result[Key] = true
        end
    end

    return Result
end

return Negation