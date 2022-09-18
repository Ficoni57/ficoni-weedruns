# ficoni-weedruns

ficoni-weedruns is a qbus nopixel inspired weed run you can see everything on video...

## Showcase

* [Video](https://github.com/qbcore-framework/qb-core)

## Dependency

* [PolyZone](https://github.com/mkafrin/PolyZone)

* [ms-peds](https://github.com/MiddleSkillz/ms-peds)

* [qb-target](https://github.com/qbcore-framework/qb-target)

## Optional Dependency

* [QBCore](https://github.com/qbcore-framework/qb-core)

## How To Add Items

Go to qb-core/shared/items.lua and add 

["weedpackage"]= {["name"] = "weedpackage", ["label"] = "Suspicious Package",["weight"] = 25000, ["type"] = "item", ["image"] = "weedpackage.png", ["unique"] = false, ["useable"] = false, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "Marked for Police Seizure"},
    
["deliverylist"]= {["name"] = "deliverylist", ["label"] = "Delivery List",["weight"] = 5000, ["type"] = "item", ["image"] = "deliverylist.png", ["unique"] = false, ["useable"] = false, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "A suspicious list with transport instructions. Marked for Police Seizure."},

## Optimization

Script runs when not in use 0.0 ms while in use only when selling package 0.01/0.02
