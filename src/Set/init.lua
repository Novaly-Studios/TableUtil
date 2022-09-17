local SetType = require(script:WaitForChild("_SetType"))
export type Set<T> = SetType.Set<T>

local Result = {
    FromValues = require(script:WaitForChild("FromValues"));
    FromKeys = require(script:WaitForChild("FromKeys"));

    Intersection = require(script:WaitForChild("Intersection"));
    Negation = require(script:WaitForChild("Negation"));
    Union = require(script:WaitForChild("Union"));
    Outer = require(script:WaitForChild("Outer"));
};

setmetatable(Result, { -- Allows for Set({"X", "Y", "Z"})
    __call = function(_, ...)
        return Result.FromValues(...)
    end;
})

return Result