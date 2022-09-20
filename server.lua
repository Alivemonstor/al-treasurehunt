local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("metaldetector", function(src, item)
    TriggerClientEvent("al-treasurehunt:detect", src)
end)

QBCore.Functions.CreateUseableItem("treasuremap", function(src, item)
    TriggerClientEvent("al-treasurehunt:usemap", src )
end)

RegisterServerEvent('al-treasurehunt:AddItems', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local Chance = math.random(1, 100)
    local Tier = GetTier(Chance)
    local Items = ItemPicker(Tier)
    local Amount = GetAmount(Tier)
    for k, Item in pairs(Items) do
        Player.Functions.AddItem(Item, Amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[Item], "add")
        TriggerClientEvent('QBCore:Notify', src, "You found ".. QBCore.Shared.Items[Item].label .."!", "success")
    end
end)

RegisterServerEvent("al-treasurehunt:removemap", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('QBCore:Notify', src, "You read the map and marked the location on your GPS!", "success")
    Player.Functions.RemoveItem("treasuremap", 1, false)
    TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items['treasuremap'], "remove")
end)

RegisterServerEvent('al-treasurehunt:collectmap', function()
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
    if Chance <= Config.LowChance then
        Tier = 'Tier1'
    elseif Chance <= Config.HighChance then
        Tier = 'Tier2'
    else
        Tier = 'Tier3'
    end
    return Tier
end

function ItemPicker(Tier)
    return Config.Treasureloot[Tier][math.random(1, #Config.Treasureloot[Tier])]
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

RegisterNetEvent('al-treasurehunt:SellEmerald', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName('emeraldore') then
        Player.Functions.AddMoney('cash', Config.EmeraldOrePrice)
        Player.Functions.RemoveItem("emeraldore", 1, false)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items['emeraldore'], "remove")
    else
        TriggerClientEvent('QBCore:Notify', src, "You dont have any emeralds!", "error")
    end
end)

RegisterNetEvent('al-treasurehunt:SellDiamond', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName('diamondore') then
        Player.Functions.AddMoney('cash', Config.DiamondOrePrice)
        Player.Functions.RemoveItem("diamondore", 1, false)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items['diamondore'], "remove")
    else
        TriggerClientEvent('QBCore:Notify', src, "You dont have any diamonds!", "error")
    end
end)

RegisterNetEvent('al-treasurehunt:SellGold', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName('goldore') then
        Player.Functions.AddMoney('cash', Config.GoldOrePrice)
        Player.Functions.RemoveItem("goldore", 1, false)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items['goldore'], "remove")
    else
        TriggerClientEvent('QBCore:Notify', src, "You dont have any gold!", "error")
    end
end)
