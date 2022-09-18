# ficoni-weedruns

ficoni-weedruns is a qbus nopixel inspired weed run you can see everything on video...

## Showcase

* [Video](https://github.com/qbcore-framework/qb-core)

## Dependency

* [PolyZone](https://github.com/mkafrin/PolyZone)

* [ms-peds](https://github.com/MiddleSkillz/ms-peds)

* [qb-target](https://github.com/qbcore-framework/qb-target)

## Optional Dependency

* [unvisible-taskbar](https://github.com/Ficoni57/unvisible-taskbar)

## How To Add Items

Go to qb-core/shared/items.lua and add 

```lua
["weedpackage"]= {["name"] = "weedpackage", ["label"] = "Suspicious Package",["weight"] = 25000, ["type"] = "item", ["image"] = "weedpackage.png", ["unique"] = false, ["useable"] = false, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "Marked for Police Seizure"},
    
["deliverylist"]= {["name"] = "deliverylist", ["label"] = "Delivery List",["weight"] = 5000, ["type"] = "item", ["image"] = "deliverylist.png", ["unique"] = false, ["useable"] = false, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "A suspicious list with transport instructions. Marked for Police Seizure."},

["rolls"]= {["name"] = "rolls", ["label"] = "Roll of Cash",["weight"] = 0, ["type"] = "item", ["image"] = "rolls.png", ["unique"] = false, ["useable"] = false, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = "Lots of low denominators - Indicates drug sales."},
    
["bands"]= {["name"] = "bands", ["label"] = "Band of Notes",["weight"] = 0, ["type"] = "item", ["image"] = "bands.png", ["unique"] = false, ["useable"] = false, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = "Lots of low denominators - Indicates drug sales."},
```
## Optimization

Script runs when not in use 0.0 MS while in use only when selling package 0.01 MS
