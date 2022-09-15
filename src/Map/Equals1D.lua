--- Checks if two structures are equal on their top level
local function Equals1D(X: any, Y: any): boolean
    for Key, Value in X do
        if (Value ~= Y[Key]) then
            return false
        end
    end

    for Key, Value in Y do
        if (Value ~= X[Key]) then
            return false
        end
    end

    return true
end

return Equals1D