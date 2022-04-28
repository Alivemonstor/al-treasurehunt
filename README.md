# al-treasurehunt


A new way for your non-illegal players to get some non-illegal money! Configurable to add items of your choice and locations of your choice. This script brings the fun in RP!

## Video Preview


## Dependencies
- <a href="https://github.com/qbcore-framework/qb-core">**qb-core**</a>
- <a href="https://github.com/qbcore-framework/qb-menu">**qb-menu**</a> 
- <a href="https://github.com/BerkieBb/qb-target">**qb-target**</a>
- <a href="https://github.com/mkafrin/PolyZone">**PolyZone**</a>

## Items
Make sure you add to your items.lua (qb-core/shared/items.lua)
<pre>

["metaldetector"] = {
    ["name"] = "metaldetector",
    ["label"] = "Metal Detector",
    ["weight"] = 200,
    ["type"] = "item",
    ["image"] = "metaldetector.png",
    ["unique"] = false,
    ["useable"] = true,
    ["shouldClose"] = true,
    ["combinable"] = nil,
    ["description"] = '*beep*, *beep*',
},

["treasuremap"] = {
    ["name"] = "treasuremap",
    ["label"] = "Treasure Map",
    ["weight"] = 100,
    ["type"] = "item",
    ["image"] = "treasuremap.png",
    ["unique"] = false,
    ["useable"] = true,
    ["shouldClose"] = true,
    ["combinable"] = nil,
    ["description"] = 'Shrivelled up paper',
},
</pre>

Make sure to also add everything in the images folder to your inventory script's image folder.

inventory/html/images

## Shoutouts
Big Thanks to <a href ="https://github.com/plasmaFPS">**PlasmaFPS**</a> for allowing me to use and repurpose his code!
Custom Prop made by <a href="https://www.turbosquid.com/3d-models/3d-metal-detector/1138741">**Vartanyan**</a>
