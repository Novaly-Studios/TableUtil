--!optimize 2
--!native

--- Groups the elements of an array into buckets based on the key returned by the grouper function.
--- Example: GroupBy({1, 2, 3, 4, 5}, function(Value) return Value % 2 end) --> {[0] = {2, 4}, [1] = {1, 3, 5}}
local function GroupBy<Entry>(Structure: {[number]: Entry}, Grouper: ((Entry, number) -> (any?))): {[number]: {Entry}}
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