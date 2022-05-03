# al-treasurehunt


A new way for your non-illegal players to get some non-illegal money! Configurable to add items of your choice and locations of your choice. This script brings the fun in RP! Feel free to make PR's and suggestions if needed

## Video Preview
- <a href="https://youtu.be/16dzPSbWQXU">**Showcase**</a>

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

["emeraldore"] = {
    ["name"] = "emeraldore",
    ["label"] = "Emerald Ore",
    ["weight"] = 100,
    ["type"] = "item",
    ["image"] = "emeraldore.png",
    ["unique"] = false,
    ["useable"] = true,
    ["shouldClose"] = true,
    ["combinable"] = nil,
    ["description"] = 'Shiny Rock',
},

["diamondore"] = {
    ["name"] = "diamondore",
    ["label"] = "Diamond Ore",
    ["weight"] = 100,
    ["type"] = "item",
    ["image"] = "diamondore.png",
    ["unique"] = false,
    ["useable"] = true,
    ["shouldClose"] = true,
    ["combinable"] = nil,
    ["description"] = 'Shiny Rock',
},

["goldore"] = {
    ["name"] = "goldore",
    ["label"] = "Gold Ore",
    ["weight"] = 100,
    ["type"] = "item",
    ["image"] = "goldore.png",
    ["unique"] = false,
    ["useable"] = true,
    ["shouldClose"] = true,
    ["combinable"] = nil,
    ["description"] = 'Shiny Rock',
},
</pre>

Make sure to also add everything in the images folder to your inventory script's image folder.

inventory/html/images

## Shoutouts
Big Thanks to <a href ="https://github.com/plasmaFPS">**PlasmaFPS**</a> for allowing me to use and repurpose some of his code!
Custom Prop made by <a href="https://www.turbosquid.com/3d-models/3d-metal-detector/1138741">**Vartanyan**</a>
