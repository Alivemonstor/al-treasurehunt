

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
    exports["qb-target"]:AddBoxZone("smeltitems", vector3(1110.41, -2008.32, 31.14), 1.65, 2.4, {
        name = "smeltitems",
        heading = 235.48,
        debugPoly = true,
        minZ = 30,
        maxZ = 32,
    }, {
        options = {
            {
                type = "client",
                event = "al-treasurehunt:SmeltItems",
                icon = "fas fa-temperature-high",
                label = "Smelt Items",
            },
        },
    distance = 2.5
    })
end)
