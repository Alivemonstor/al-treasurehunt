Config = {}

--Treasure Hunt

Config.TreasureLocations = {
    [1] = {
        name = "PierBeach",
        debugPoly = false,
        blip = vector3(-1477.09, -1218.28, 4.41),
        zones = {
            vector2(-1215.8862304688, -1763.9927978516),
            vector2(-1261.4217529297, -1830.6840820312),
            vector2(-1612.1901855469, -1141.1480712891),
            vector2(-1586.1876220703, -1071.6724853516),
            vector2(-1422.1868896484, -1110.5142822266),
            vector2(-1405.5825195312, -1395.3377685547),
            vector2(-1323.0729980469, -1605.9655761719)
        },
    },
    [2] = {
        name = "PierBeach2",
        debugPoly = false,
        blip = vector3(-1785.73, -800.48, 9.94),
        zones = {
            vector2(-1679.6752929688, -981.88470458984),
            vector2(-1679.6752929688, -981.88470458984),
            vector2(-1717.31640625, -1063.8728027344),
            vector2(-2113.6811523438, -554.88806152344),
            vector2(-2057.0686035156, -503.62591552734),
            vector2(-1848.9615478516, -657.43768310547),
            vector2(-1752.3885498047, -741.12536621094),
            vector2(-1729.9864501953, -918.60015869141)
        },
    },
    [3] = {
        name = "Golf Course",
        debugPoly = false,
        blip = vector3(-1216.32, 87.66, 56.6),
        zones = {
            vector2(-1075.5496826172, -145.32153320312),
            vector2(-1324.7716064453, 23.515180587769),
            vector2(-1338.4162597656, 183.1936340332),
            vector2(-1109.5949707031, 219.35273742676),
            vector2(-975.8134765625, -25.266059875488)
        },
    },
}
Config.PedModel = 'a_m_y_hiker_01'

Config.PedLocation = vector4(-1371.1, -1204.83, 4.45, 257.94)

Config.EmeraldOrePrice = 7500

Config.DiamondOrePrice = 5000

Config.GoldOrePrice = 2500

Config.LowChance = 50
-- High chance must be higher 
Config.HighChance = 60

Config.Treasureloot = {
    ['Tier1'] = {
        [1] = {
            'goldore',
        },
        [2] = {
            'phone',
            'plastic',
        }
    },
    ['Tier2'] = {
        [1] = {
            'diamondore',
        }
    },
    ['Tier3'] = {
        [1] = {
            'emeraldore',  
        }   
    }
}

-- If you want to add more tiers make sure you change the tier checker in server.lua
