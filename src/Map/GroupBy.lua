local function GroupBy<EntryKey, Entry>(Structure: {[EntryKey]: Entry}, Grouper: ((Entry, EntryKey) -> (EntryKey))): {[EntryKey]: {Entry}}
    local Result = {}

    for Key, Value in Structure do
        local NewKey = Grouper(Value, Key)

        if (NewKey == nil) then
            continue
        end

        local Target = Result[NewKey]

        if (Target) then
            Target[Key] = Value
            continue
        end

        Result[NewKey] = {[Key] = Value}
    end

    return Result
end

return GroupBy