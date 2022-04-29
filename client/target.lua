

CreateThread(function()
    exports['qb-target']:SpawnPed({
        model = Config.PedModel,
        coords = Config.PedLocation, 
        minusOne = true, 
        freeze = true, 
        invincible = true, 
        blockevents = true,
        target = { 
            options = {
                {
                    type = "server",
                    event = "al-treasurehunt:collectmap",
                    icon = "fas fa-map",
                    label = "Collect a treasure map!"
                },
                {
                    type = "client",
                    event = "al-treasurehunt:sellitems",
                    icon = "fas fa-shop",
                    label = "Lemme take a look at what you have!"
                },
            },
            distance = 2.5,
        },
    })
end)

CreateThread(function()
    exports["qb-target"]:AddBoxZone("smeltitems", vector3(), 1.65, 2.4, {
        name = "smeltitems",
        heading = ,
        debugPoly = false,
        minZ = ,
        maxZ = ,
    }, {
        options = {
            {
                type = "server",
                event = "al-treasurehunt:SmeltGold",
                icon = "fas fa-tempreature-full",
                label = "Smelt Gold",
            },
        },
    distance = 2.5
    })
end)
