local SetType = require(script:WaitForChild("_SetType"))
export type Set<T> = SetType.Set<T>

local FromValues = require(script.FromValues)
local Result = {
    FromValues = FromValues;
    Difference = require(script.Difference);
    Equals = require(script.Equals);
    FromKeys = require(script.FromKeys);
    Insert = require(script.Insert);
    Intersection = require(script.Intersection);
    IsProperSubset = require(script.IsProperSubset);
    IsSubset = require(script.IsSubset);
    Remove = require(script:FindFirstChild("Remove"));
    SymmetricDifference = require(script.SymmetricDifference);
    ToArray = require(script.ToArray);
    Union = require(script.Union);
};

setmetatable(Result, { -- Allows for Set({"X", "Y", "Z"})
    __call = function(_, ...)
        return FromValues(...)
    end;
})

return Result