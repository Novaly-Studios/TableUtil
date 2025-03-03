local SetType = require("./Set/_SetType")
export type Set<T> = SetType.Set<T>

return table.freeze({
    FromValues = require("./Set/FromValues");
    Difference = require("./Set/Difference");
    Equals = require("./Set/Equals");
    FromKeys = require("./Set/FromKeys");
    Insert = require("./Set/Insert");
    Intersection = require("./Set/Intersection");
    IsProperSubset = require("./Set/IsProperSubset");
    IsSubset = require("./Set/IsSubset");
    Remove = require("./Set/Remove");
    SymmetricDifference = require("./Set/SymmetricDifference");
    ToArray = require("./Set/ToArray");
    Union = require("./Set/Union");
})