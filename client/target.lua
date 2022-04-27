

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
            },
            distance = 2.5,
        },
    })
end)
