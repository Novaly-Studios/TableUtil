local function Flatten(Structure: any, DepthLimit: number?)
    DepthLimit = DepthLimit or math.huge

    if (DepthLimit == 0) then
        return
    end

    local Result = {}

    for Key, Value in Structure do
        if (typeof(Value) == "table") then
            local Flattened = Flatten(Value, DepthLimit - 1)

            if (Flattened) then
                for FlattenedKey, FlattenedValue in Flattened do
                    Result[FlattenedKey] = FlattenedValue
                end
            end
        else
            Result[Key] = Value
        end
    end

    return Result
end

return Flatten