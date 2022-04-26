# al-treasurehunt


A treasure hunt script, highly configurable, easy drag and drop into server

## Video Preview
https://www.youtube.com/watch?v=Uk-hqCwVUxI

## Dependencies
- <a href="https://github.com/qbcore-framework/qb-core">**qb-core**</a>
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

## Shoutouts
Big Thanks to <a href ="https://github.com/plasmaFPS">**PlasmaFPS**</a> for allowing me to use and repurpose his code!
Custom Prop made by <a href="https://www.turbosquid.com/3d-models/3d-metal-detector/1138741">**Vartanyan**</a>
