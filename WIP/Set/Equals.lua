local function Equals(Set1, Set2)
    for Key in pairs(Set1) do
        if (not Set2[Key]) then
            return false
        end
    end

    for Key in pairs(Set2) do
        if (not Set1[Key]) then
            return false
        end
    end

    return true
end

return Equals