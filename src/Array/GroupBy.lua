local function GroupBy<Entry>(Structure: {[number]: Entry}, Grouper: ((Entry, number) -> (number))): {[number]: {Entry}}
    local Result = {}

    for Key, Value in Structure do
        local NewKey = Grouper(Value, Key)

        if (NewKey == nil) then
            continue
        end

        local Target = Result[NewKey]

        if (Target) then
            table.insert(Target, Value)
            continue
        end

        Result[NewKey] = {Value}
    end

    return Result
end

return GroupBy