# ficoni-weedruns

ficoni-weedruns is a qbus nopixel inspired weed run you can see everything on video...

## Showcase

* [Video](https://www.youtube.com/watch?v=uyUGICzViGI)

## Dependency

* [PolyZone](https://github.com/mkafrin/PolyZone)

* [ms-peds](https://github.com/MiddleSkillz/ms-peds) (Only for spawning main start weed run ped)

* [unvisible-taskbar](https://github.com/Ficoni57/unvisible-taskbar) 

* [qb-target](https://github.com/qbcore-framework/qb-target)

## Optional Dependency

* [Renewed-Weaponscarry](https://github.com/Renewed-Scripts/Renewed-Weaponscarry) (If u want to have attached weedpackage on you)

## How To Add Items

Go to qb-core/shared/items.lua and add 

```lua
["weedpackage"]= {["name"] = "weedpackage", ["label"] = "Suspicious Package",["weight"] = 25000, ["type"] = "item", ["image"] = "weedpackage.png", ["unique"] = false, ["useable"] = false, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "Marked for Police Seizure"},
    
["deliverylist"]= {["name"] = "deliverylist", ["label"] = "Delivery List",["weight"] = 5000, ["type"] = "item", ["image"] = "deliverylist.png", ["unique"] = false, ["useable"] = false, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "A suspicious list with transport instructions. Marked for Police Seizure."},

["rolls"]= {["name"] = "rolls", ["label"] = "Roll of Cash",["weight"] = 0, ["type"] = "item", ["image"] = "rolls.png", ["unique"] = false, ["useable"] = false, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = "Lots of low denominators - Indicates drug sales."},
    
["bands"]= {["name"] = "bands", ["label"] = "Band of Notes",["weight"] = 0, ["type"] = "item", ["image"] = "bands.png", ["unique"] = false, ["useable"] = false, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = "Lots of low denominators - Indicates drug sales."},
```

## How To Add Attach Weed On Player

```lua
   ["weedpackage"] = { carry = true, model = "hei_prop_heist_weed_block_01", bone = 28422, x = 0.01, y = -0.02, z = -0.12, xr = 0.0,  yr = 0.0, zr = 0.0, blockAttack = true, blockCar = true, blockRun = true},
```

## Next Update

- Cooldown
- Police Alert Chance
- New Ped To Pack Weed (Creating A New Weed Plant Script)

## Optimization

Script runs when not in use 0.0 MS while in use only when selling package 0.01 MS
