local SetType = require(script:WaitForChild("_SetType"))
export type Set<T> = SetType.Set<T>

local Result = {
    FromValues = require(script:WaitForChild("FromValues"));
    FromKeys = require(script:WaitForChild("FromKeys"));
    ToArray = require(script:WaitForChild("ToArray"));

    SymmetricDifference = require(script:WaitForChild("SymmetricDifference"));
    Intersection = require(script:WaitForChild("Intersection"));
    Difference = require(script:WaitForChild("Difference"));
    Insert = require(script:WaitForChild("Insert"));
    Remove = require(script:WaitForChild("Remove"));
    Union = require(script:WaitForChild("Union"));

    IsProperSubset = require(script:WaitForChild("IsProperSubset"));
    IsSubset = require(script:WaitForChild("IsSubset"));
    Equals = require(script:WaitForChild("Equals"));
};

setmetatable(Result, { -- Allows for Set({"X", "Y", "Z"})
    __call = function(_, ...)
        return Result.FromValues(...)
    end;
})

return Result