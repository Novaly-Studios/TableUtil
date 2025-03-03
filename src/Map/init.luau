return table.freeze({
    Changes = require("./Map/Changes");
    Count = require("./Map/Count");
    CreatePatchDeep = require("./Map/CreatePatchDeep");
    Creations = require("./Map/Creations");
    Equals = require("./Map/Equals");
    Filter = require("./Map/Filter");
    Flatten = require("./Map/Flatten");
    FromKeyValueArray = require("./Map/FromKeyValueArray");
    GroupBy = require("./Map/GroupBy");
    Map = require("./Map/Map");
    Merge = require("./Map/Merge");
    MergeDeep = require("./Map/MergeDeep");
    MergeMany = require("./Map/MergeMany");
    MutableMerge = require("./Map/MutableMerge");
    MutableMergeDeep = require("./Map/MutableMergeDeep");
    MutableMergeMany = require("./Map/MutableMergeMany");
    Removals = require("./Map/Removals");
    ToKeyValueArray = require("./Map/ToKeyValueArray");

    -- Shared
    CloneDeep = require("./Shared/CloneDeep");
    IsArray = require("./Shared/IsArray");
    IsMap = require("./Shared/IsMap");
    IsMixed = require("./Shared/IsMixed");
    IsPureArray = require("./Shared/IsPureArray");
    IsPureMap = require("./Shared/IsPureMap");
    Keys = require("./Shared/Keys");
    Lockdown = require("./Shared/Lockdown");
    SetUnresizable = require("./Shared/SetUnresizable");
    SwapKeysValues = require("./Shared/SwapKeysValues");
    Values = require("./Shared/Values");
});