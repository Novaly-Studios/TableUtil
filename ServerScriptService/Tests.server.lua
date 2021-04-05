if (script.Parent.Parent ~= game:GetService("ServerScriptService")) then
    return
end

local Filtered = {}

for _, Item in pairs(game:GetService("ReplicatedFirst").TableUtil:GetDescendants()) do
    if (Item:IsA("ModuleScript") and Item.Name:sub(-5) == ".spec") then
        table.insert(Filtered, Item)
    end
end

require(script.Parent.TestEZ).TestBootstrap:run(Filtered)

return true