local QBCore = exports['qb-core']:GetCoreObject()

local boneoffsets = {
    ["w_am_digiscanner"] = {
        bone = 18905,
        offset = vector3(0.15, 0.1, 0.0),
        rotation = vector3(270.0, 90.0, 80.0),
    },
}

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
        QBCore.Functions.Progressbar('InZone', 'Searching the area...', math.random(5000, 10000), false, true, {
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
	    TriggerServerEvent('al-treasurehunt:additems')
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
    local treasurezone = PolyZone:Create(setlocation.zones, {
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


RegisterNetEvent('al-treasurehunt:usemap')
AddEventHandler('al-treasurehunt:usemap', function()
    QBCore.Functions.Progressbar('UseMap', 'Looking at the map....', 10000, false, true, {
        disableMovement = false,
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
    }, {}, {}, function()
    end)
    setlocation = GetLocation()
    print(setlocation)
    generatepolyz(setlocation)
    print("poly loaded and dat")
    Citizen.Wait(10000)
    TriggerServerEvent("al-treasurehunt:removemap")
end)

local function setblip()
	treasureblip = AddBlipForCoord

