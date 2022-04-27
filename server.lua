local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("metaldetector", function(src, item)
    TriggerClientEvent("al-treasurehunt:detect", src)
end)

QBCore.Functions.CreateUseableItem("treasuremap", function(src, item)
    TriggerClientEvent("al-treasurehunt:usemap", src )
end)

RegisterServerEvent('al-treasurehunt:additems')
AddEventHandler('al-treasurehunt:additems', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local Chance = math.random(1, 100)
    local Tier = GetTier(Chance)
    local Item = ItemPicker(Tier)
    local Amount = GetAmount(Tier)
    Player.Functions.AddItem(Item, Amount)
    TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[Item], "add")
    TriggerClientEvent('QBCore:Notify', src, "You found some ".. Item .."!", "success")
end)

RegisterServerEvent("al-treasurehunt:removemap")
AddEventHandler("al-treasurehunt:removemap", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('QBCore:Notify', src, "You read the map and marked the location on your GPS!", "success")
    Player.Functions.RemoveItem("treasuremap", 1, false)
    TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items['treasuremap'], "remove")
end)

RegisterServerEvent('al-treasurehunt:collectmap')
AddEventHandler('al-treasurehunt:collectmap', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName('treasuremap') then
        TriggerClientEvent('QBCore:Notify', src, "You already have a Treasure Map", "error")
    else
        Player.Functions.AddItem("treasuremap", 1, false)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items['treasuremap'], "add")
        TriggerClientEvent('QBCore:Notify', src, "You were given a Treasure Map!", "success")        
    end
end)

function GetTier(Chance)
    local Tier = nil
    if Chance <= 90 then
        Tier = 'Tier1'
    elseif Chance <= 99 then
        Tier = 'Tier2'
    else
        Tier = 'Tier3'
    end
    return Tier
end

function ItemPicker(Tier)
    return Config.Treasure[Tier][math.random(1, #Config.Treasure[Tier])]
end

function GetAmount(Tier)
    local Amount = nil
    if Tier == 'Tier1' then
        Amount = math.random(1, 10)
    elseif Tier == 'Tier2' then 
        Amount = math.random(1, 3)
    else
        Amount = 1
    end
    return Amount
end



