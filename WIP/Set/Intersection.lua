local function Intersection(Set1, Set2)
    local Result = {}

    for Key in pairs(Set1) do
        if (Set2[Key] and Set1[Key]) then
            Result[Key] = true
        end
    end

    return Result
end

return Intersection