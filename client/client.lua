local QBCore = exports['qb-core']:GetCoreObject()

treasurezone = nil

local boneoffsets = {
    ["w_am_digiscanner"] = {
        bone = 18905,
        offset = vector3(0.15, 0.1, 0.0),
        rotation = vector3(270.0, 90.0, 80.0),
    },
}

RegisterNetEvent('al-treasurehunt:destroyzone')
AddEventHandler('al-treasurehunt:destroyzone', function()
    treasurezone:destroy()
    local destroyblip = RemoveBlip(destination)
    local destroyblip2 = RemoveBlip(treasureblip)
end)

local function AttachEntity(ped, model)
    if boneoffsets[model] then
        QBCore.Functions.LoadModel(model)
        pos = GetEntityCoords(PlayerPedId())
        ent = CreateObjectNoOffset(model, pos, 1, 1, 0)
        AttachEntityToEntity(ent, ped, GetPedBoneIndex(ped, boneoffsets[model].bone), boneoffsets[model].offset, boneoffsets[model].rotation, 1, 1, 0, 0, 2, 1)
    end
end

RegisterNetEvent('al-treasurehunt:detect')
AddEventHandler('al-treasurehunt:detect', function()
    if inZone == 1 then 
        QBCore.Functions.Progressbar('InZone', 'Searching the area...', math.random(7000), false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
            },{
            animDict = 'mini@golfai',
            anim = 'wood_idle_a',
            flags = 49,
        }, {}, {}, function()
        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, 'metaldetector', 0.2)
        Citizen.Wait(3000)
        DetachEntity(ent, 0, 0)
        DeleteEntity(ent)
        QBCore.Functions.RequestAnimDict('amb@medic@standing@kneel@base')  
        TaskPlayAnim(PlayerPedId(), "amb@medic@standing@kneel@base", "base", 8.0, -8.0, -1, 1, 0, false, false, false)
        Citizen.Wait(5000)
        StopAnimTask(PlayerPedId(), "amb@medic@standing@kneel@base", "base", 1.0)
	    TriggerServerEvent('al-treasurehunt:AddItems')
        end)
    else
        QBCore.Functions.Progressbar('OutZone', 'Searching the area...', math.random(5000, 10000), false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
            animDict = 'mini@golfai',
            anim = 'wood_idle_a',
            flags = 49,
        }, {}, {}, {}, function()  
        QBCore.Functions.Notify("You found nothing, maybe try somewhere else.", "error")
        end)
    end
end)

function GetLocation()
    return Config.TreasureLocations[math.random(1, #Config.TreasureLocations)]
end


local function generatepolyz(setlocation)
    treasurezone = PolyZone:Create(setlocation.zones, {
        name = setlocation.name,
        debugPoly = setlocation.debugPoly,
    })
        
    treasurezone:onPlayerInOut(function(isPointInside)
        if isPointInside then
            inZone = 1
            QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
                if HasItem then
                    AttachEntity(PlayerPedId(), "w_am_digiscanner")
                end
            end, 'metaldetector') 
        else
            inZone = 0
            DetachEntity(ent, 0, 0)
            DeleteEntity(ent)
        end
    end)
end


function setblip(setlocation)
	treasureblip = AddBlipForRadius(setlocation.blip, 100.0)
    SetBlipAlpha(treasureblip, 128)
    SetBlipColour(treasureblip, 46)
    destination = AddBlipForCoord(setlocation.blip)
    SetBlipSprite(destination, 617)
    SetBlipColour(destination, 0)
end


RegisterNetEvent('al-treasurehunt:usemap')
AddEventHandler('al-treasurehunt:usemap', function()
    QBCore.Functions.Progressbar('UseMap', 'Looking at the map....', 10000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
        },{
        animDict = 'amb@world_human_tourist_map@male@base',
        anim = 'base',
        flags = 49,
        },{
        model = 'p_tourist_map_01_s',
        bone = 28422,
        offset = vector3(0.15, 0.1, 0.0),
        rotation = vector3(270.0, 90.0, 80.0)
    }, {}, function()
        setlocation = GetLocation()
        generatepolyz(setlocation)
        print("poly loaded and dat")
        TriggerServerEvent("al-treasurehunt:removemap")
        setblip(setlocation)  
    end)
end)


RegisterNetEvent('al-treasurehunt:sellitems')
AddEventHandler('al-treasurehunt:sellitems', function()
    exports['qb-menu']:openMenu({
        {
            header = "Martin's Backpack Shop",
            isMenuHeader = true
        },
        {
            header = "Sell Emeralds",
            txt = "Current Price: $"..Config.EmeraldOrePrice.. "Per Emerald Ore",
            params = {
                isServer = true,
                event = "al-treasurehunt:SellEmerald",
                args = 1
            }
        },
        {
            header = "Sell Diamonds",
            txt = "Current Price: $"..Config.DiamondOrePrice.. "Per Diamond Ore ",
            params = {
                isServer = true,
                event = "al-treasurehunt:SellDiamond",
                args = 2
            }
        },
        {
            header = "Sell Gold",
            txt = "Current Price: $"..Config.GoldOrePrice.. "Per Gold Ore",
            params = {
                isServer = true,
                event = "al-treasurehunt:SellGold",
                args = 3
            }
        }
    })
end)
