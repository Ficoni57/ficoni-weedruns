local QBCore = exports['qb-core']:GetCoreObject()

local tasking = false
local drugdealer = false
local success = false
local salecount = 0

local WeedLocations = {
	[1] = { ['x'] = -148.64, ['y'] = -1687.2, ['z'] = 36.17, ['h'] = 150.46, ['info'] = ' Forum Drive 1/Apt9', ['apt'] = 1 },
	[2] = { ['x'] = -157.54, ['y'] = -1679.61, ['z'] = 36.97, ['h'] = 354.25, ['info'] = ' Forum Drive 1/Apt', ['apt'] = 1 },
	[3] = { ['x'] = -158.86, ['y'] = -1680.02, ['z'] = 36.97, ['h'] = 38.57, ['info'] = ' Forum Drive 1/Apt11', ['apt'] = 1 },
	[4] = { ['x'] = -161.03, ['y'] = -1638.38, ['z'] = 34.03, ['h'] = 15.87, ['info'] = ' Forum Drive 2/Apt1', ['apt'] = 1 },
	[5] = { ['x'] = -160.05, ['y'] = -1636.37, ['z'] = 34.03, ['h'] = 77.94, ['info'] = ' Forum Drive 2/Apt2', ['apt'] = 1 },
	[6] = { ['x'] = -153.87, ['y'] = -1641.77, ['z'] = 36.86, ['h'] = 331.14, ['info'] = ' Forum Drive 2/Apt3', ['apt'] = 1 },
	[7] = { ['x'] = -159.85, ['y'] = -1636.42, ['z'] = 37.25, ['h'] = 321.05, ['info'] = ' Forum Drive 2/Apt4', ['apt'] = 1 },
	[8] = { ['x'] = -160.26, ['y'] = -1636.28, ['z'] = 37.25, ['h'] = 201.97, ['info'] = ' Forum Drive 2/Apt5', ['apt'] = 1 },
	[9] = { ['x'] = -150.79, ['y'] = -1625.26, ['z'] = 33.66, ['h'] = 233.56, ['info'] = ' Forum Drive 2/Apt6', ['apt'] = 1 },
	[10] = { ['x'] = -150.74, ['y'] = -1622.68, ['z'] = 33.66, ['h'] = 57.73, ['info'] = ' Forum Drive 2/Apt7', ['apt'] = 1 },
	[11] = { ['x'] = -145.59, ['y'] = -1617.88, ['z'] = 36.05, ['h'] = 222.51, ['info'] = ' Forum Drive 2/Apt8', ['apt'] = 1 },
	[12] = { ['x'] = -145.84, ['y'] = -1614.71, ['z'] = 36.05, ['h'] = 67.64, ['info'] = ' Forum Drive 2/Apt9', ['apt'] = 1 },
	[13] = { ['x'] = -152.23, ['y'] = -1624.37, ['z'] = 36.85, ['h'] = 52.69, ['info'] = ' Forum Drive 2/Apt10', ['apt'] = 1 },
	[14] = { ['x'] = -150.38, ['y'] = -1625.5, ['z'] = 36.85, ['h'] = 233.14, ['info'] = ' Forum Drive 2/Apt11', ['apt'] = 1 },
	[15] = { ['x'] = -120.58, ['y'] = -1575.04, ['z'] = 34.18, ['h'] = 323.0, ['info'] = ' Forum Drive 3/Apt1', ['apt'] = 1 },
	[16] = { ['x'] = -114.73, ['y'] = -1579.95, ['z'] = 34.18, ['h'] = 318.74, ['info'] = ' Forum Drive 3/Apt2', ['apt'] = 1 },
	[17] = { ['x'] = -119.6, ['y'] = -1585.41, ['z'] = 34.22, ['h'] = 231.94, ['info'] = ' Forum Drive 3/Apt3', ['apt'] = 1 },
	[18] = { ['x'] = -123.81, ['y'] = -1590.67, ['z'] = 34.21, ['h'] = 234.7, ['info'] = ' Forum Drive 3/Apt4', ['apt'] = 1 },
	[19] = { ['x'] = -139.85, ['y'] = -1598.7, ['z'] = 34.84, ['h'] = 158.58, ['info'] = ' Forum Drive 3/Apt6', ['apt'] = 1 },
	[20] = { ['x'] = -146.85, ['y'] = -1596.64, ['z'] = 34.84, ['h'] = 69.8, ['info'] = ' Forum Drive 3/Apt7', ['apt'] = 1 },
	[21] = { ['x'] = -139.49, ['y'] = -1588.39, ['z'] = 34.25, ['h'] = 47.69, ['info'] = ' Forum Drive 3/Apt8', ['apt'] = 1 },
	[22] = { ['x'] = -133.47, ['y'] = -1581.2, ['z'] = 34.21, ['h'] = 49.62, ['info'] = ' Forum Drive 3/Apt9', ['apt'] = 1 },
	[23] = { ['x'] = -120.63, ['y'] = -1575.05, ['z'] = 37.41, ['h'] = 320.29, ['info'] = ' Forum Drive 3/Apt10', ['apt'] = 1 },
	[24] = { ['x'] = -114.71, ['y'] = -1580.4, ['z'] = 37.41, ['h'] = 322.64, ['info'] = ' Forum Drive 3/Apt11', ['apt'] = 1 },
	[25] = { ['x'] = -119.53, ['y'] = -1585.26, ['z'] = 37.41, ['h'] = 228.33, ['info'] = ' Forum Drive 3/Apt12', ['apt'] = 1 },
	[26] = { ['x'] = -123.67, ['y'] = -1590.39, ['z'] = 37.41, ['h'] = 223.58, ['info'] = ' Forum Drive 3/Apt13', ['apt'] = 1 },
	[27] = { ['x'] = -140.08, ['y'] = -1598.75, ['z'] = 38.22, ['h'] = 157.57, ['info'] = ' Forum Drive 3/Apt15', ['apt'] = 1 },
	[28] = { ['x'] = -145.81, ['y'] = -1597.55, ['z'] = 38.22, ['h'] = 99.24, ['info'] = ' Forum Drive 3/Apt16', ['apt'] = 1 },
	[29] = { ['x'] = -147.47, ['y'] = -1596.26, ['z'] = 38.22, ['h'] = 55.87, ['info'] = ' Forum Drive 3/Apt17', ['apt'] = 1 },
	[30] = { ['x'] = -139.77, ['y'] = -1587.8, ['z'] = 37.41, ['h'] = 50.77, ['info'] = ' Forum Drive 3/Apt18', ['apt'] = 1 },
	[31] = { ['x'] = -133.78, ['y'] = -1580.56, ['z'] = 37.41, ['h'] = 54.61, ['info'] = ' Forum Drive 3/Apt19', ['apt'] = 1 },
	[32] = { ['x'] = -157.6, ['y'] = -1680.11, ['z'] = 33.44, ['h'] = 48.52, ['info'] = ' Forum Drive 1/Apt1', ['apt'] = 1 },
	[33] = { ['x'] = -148.39, ['y'] = -1688.04, ['z'] = 32.88, ['h'] = 318.72, ['info'] = ' Forum Drive 1/Apt2', ['apt'] = 1 },
	[34] = { ['x'] = -147.3, ['y'] = -1688.99, ['z'] = 32.88, ['h'] = 318.81, ['info'] = ' Forum Drive 1/Apt3', ['apt'] = 1 },
	[35] = { ['x'] = -143.08, ['y'] = -1692.38, ['z'] = 32.88, ['h'] = 277.39, ['info'] = ' Forum Drive 1/Apt4', ['apt'] = 1 },
	[36] = { ['x'] = -141.89, ['y'] = -1693.43, ['z'] = 32.88, ['h'] = 225.74, ['info'] = ' Forum Drive 1/Apt5', ['apt'] = 1 },
	[37] = { ['x'] = -167.71, ['y'] = -1534.71, ['z'] = 35.1, ['h'] = 320.29, ['info'] = ' Forum Drive 10/Apt1', ['apt'] = 1 },
	[38] = { ['x'] = -180.71, ['y'] = -1553.51, ['z'] = 35.13, ['h'] = 227.11, ['info'] = ' Forum Drive 10/Apt2', ['apt'] = 1 },
	[39] = { ['x'] = -187.47, ['y'] = -1562.96, ['z'] = 35.76, ['h'] = 220.56, ['info'] = ' Forum Drive 10/Apt3', ['apt'] = 1 },
	[40] = { ['x'] = -191.86, ['y'] = -1559.4, ['z'] = 34.96, ['h'] = 124.57, ['info'] = ' Forum Drive 10/Apt4', ['apt'] = 1 },
	[41] = { ['x'] = -195.55, ['y'] = -1556.06, ['z'] = 34.96, ['h'] = 45.83, ['info'] = ' Forum Drive 10/Apt5', ['apt'] = 1 },
	[42] = { ['x'] = -183.81, ['y'] = -1540.59, ['z'] = 34.36, ['h'] = 41.2, ['info'] = ' Forum Drive 10/Apt6', ['apt'] = 1 },
	[43] = { ['x'] = -179.69, ['y'] = -1534.66, ['z'] = 34.36, ['h'] = 44.71, ['info'] = ' Forum Drive 10/Apt7', ['apt'] = 1 },
	[44] = { ['x'] = -175.06, ['y'] = -1529.53, ['z'] = 34.36, ['h'] = 321.99, ['info'] = ' Forum Drive 10/Apt8', ['apt'] = 1 },
	[45] = { ['x'] = -167.62, ['y'] = -1534.9, ['z'] = 38.33, ['h'] = 320.46, ['info'] = ' Forum Drive 10/Apt10', ['apt'] = 1 },
	[46] = { ['x'] = -180.19, ['y'] = -1553.89, ['z'] = 38.34, ['h'] = 232.72, ['info'] = ' Forum Drive 10/Apt11', ['apt'] = 1 },
	[47] = { ['x'] = -186.63, ['y'] = -1562.32, ['z'] = 39.14, ['h'] = 198.53, ['info'] = ' Forum Drive 10/Apt12', ['apt'] = 1 },
	[48] = { ['x'] = -188.32, ['y'] = -1562.5, ['z'] = 39.14, ['h'] = 136.16, ['info'] = ' Forum Drive 10/Apt13', ['apt'] = 1 },
	[49] = { ['x'] = -192.14, ['y'] = -1559.64, ['z'] = 38.34, ['h'] = 136.93, ['info'] = ' Forum Drive 10/Apt14', ['apt'] = 1 },
	[50] = { ['x'] = -195.77, ['y'] = -1555.92, ['z'] = 38.34, ['h'] = 48.33, ['info'] = ' Forum Drive 10/Apt15', ['apt'] = 1 },
	[51] = { ['x'] = -184.06, ['y'] = -1539.83, ['z'] = 37.54, ['h'] = 47.47, ['info'] = ' Forum Drive 10/Apt16', ['apt'] = 1 },
	[52] = { ['x'] = -179.58, ['y'] = -1534.93, ['z'] = 37.54, ['h'] = 48.0, ['info'] = ' Forum Drive 10/Apt17', ['apt'] = 1 },
	[53] = { ['x'] = -174.87, ['y'] = -1529.18, ['z'] = 37.54, ['h'] = 321.05, ['info'] = ' Forum Drive 10/Apt18', ['apt'] = 1 },
	[54] = { ['x'] = -208.75, ['y'] = -1600.32, ['z'] = 34.87, ['h'] = 259.54, ['info'] = ' Forum Drive 11/Apt1', ['apt'] = 1 },
	[55] = { ['x'] = -210.05, ['y'] = -1607.17, ['z'] = 34.87, ['h'] = 259.85, ['info'] = ' Forum Drive 11/Apt2', ['apt'] = 1 },
	[56] = { ['x'] = -212.05, ['y'] = -1616.86, ['z'] = 34.87, ['h'] = 244.26, ['info'] = ' Forum Drive 11/Apt3', ['apt'] = 1 },
	[57] = { ['x'] = -213.8, ['y'] = -1618.07, ['z'] = 34.87, ['h'] = 180.98, ['info'] = ' Forum Drive 11/Apt4', ['apt'] = 1 },
	[58] = { ['x'] = -221.82, ['y'] = -1617.45, ['z'] = 34.87, ['h'] = 88.95, ['info'] = ' Forum Drive 11/Apt5', ['apt'] = 1 },
	[59] = { ['x'] = -223.06, ['y'] = -1601.38, ['z'] = 34.89, ['h'] = 97.48, ['info'] = ' Forum Drive 11/Apt6', ['apt'] = 1 },
	[60] = { ['x'] = -222.52, ['y'] = -1585.71, ['z'] = 34.87, ['h'] = 84.43, ['info'] = ' Forum Drive 11/Apt7', ['apt'] = 1 },
	[61] = { ['x'] = -218.91, ['y'] = -1580.06, ['z'] = 34.87, ['h'] = 47.27, ['info'] = ' Forum Drive 11/Apt8', ['apt'] = 1 },
	[62] = { ['x'] = -216.48, ['y'] = -1577.45, ['z'] = 34.87, ['h'] = 321.55, ['info'] = ' Forum Drive 11/Apt9', ['apt'] = 1 },
	[63] = { ['x'] = -206.23, ['y'] = -1585.55, ['z'] = 34.87, ['h'] = 260.2, ['info'] = ' Forum Drive 11/Apt10', ['apt'] = 1 },
	[64] = { ['x'] = -206.63, ['y'] = -1585.8, ['z'] = 38.06, ['h'] = 275.39, ['info'] = ' Forum Drive 11/Apt12', ['apt'] = 1 },
	[65] = { ['x'] = -216.05, ['y'] = -1576.86, ['z'] = 38.06, ['h'] = 319.06, ['info'] = ' Forum Drive 11/Apt13', ['apt'] = 1 },
	[66] = { ['x'] = -218.37, ['y'] = -1579.89, ['z'] = 38.06, ['h'] = 67.83, ['info'] = ' Forum Drive 11/Apt14', ['apt'] = 1 },
	[67] = { ['x'] = -222.25, ['y'] = -1585.37, ['z'] = 38.06, ['h'] = 96.11, ['info'] = ' Forum Drive 11/Apt15', ['apt'] = 1 },
	[68] = { ['x'] = -222.26, ['y'] = -1600.93, ['z'] = 38.06, ['h'] = 90.9, ['info'] = ' Forum Drive 11/Apt16', ['apt'] = 1 },
	[69] = { ['x'] = -222.21, ['y'] = -1617.39, ['z'] = 38.06, ['h'] = 93.88, ['info'] = ' Forum Drive 11/Apt17', ['apt'] = 1 },
	[70] = { ['x'] = -214.12, ['y'] = -1617.62, ['z'] = 38.06, ['h'] = 218.57, ['info'] = ' Forum Drive 11/Apt18', ['apt'] = 1 },
	[71] = { ['x'] = -212.29, ['y'] = -1617.34, ['z'] = 38.06, ['h'] = 253.87, ['info'] = ' Forum Drive 11/Apt19', ['apt'] = 1 },
	[72] = { ['x'] = -210.46, ['y'] = -1607.36, ['z'] = 38.05, ['h'] = 263.82, ['info'] = ' Forum Drive 11/Apt20', ['apt'] = 1 },
	[73] = { ['x'] = -209.45, ['y'] = -1600.57, ['z'] = 38.05, ['h'] = 269.99, ['info'] = ' Forum Drive 11/Apt21', ['apt'] = 1 },
	[74] = { ['x'] = -216.64, ['y'] = -1673.73, ['z'] = 34.47, ['h'] = 179.38, ['info'] = ' Forum Drive 12/Apt1', ['apt'] = 1 },
	[75] = { ['x'] = -224.15, ['y'] = -1673.67, ['z'] = 34.47, ['h'] = 169.52, ['info'] = ' Forum Drive 12/Apt2', ['apt'] = 1 },
	[76] = { ['x'] = -224.17, ['y'] = -1666.14, ['z'] = 34.47, ['h'] = 82.29, ['info'] = ' Forum Drive 12/Apt3', ['apt'] = 1 },
	[77] = { ['x'] = -224.32, ['y'] = -1649.0, ['z'] = 34.86, ['h'] = 85.83, ['info'] = ' Forum Drive 12/Apt4', ['apt'] = 1 },
	[78] = { ['x'] = -216.34, ['y'] = -1648.94, ['z'] = 34.47, ['h'] = 356.29, ['info'] = ' Forum Drive 12/Apt5', ['apt'] = 1 },
	[79] = { ['x'] = -212.92, ['y'] = -1660.54, ['z'] = 34.47, ['h'] = 256.79, ['info'] = ' Forum Drive 12/Apt6', ['apt'] = 1 },
	[80] = { ['x'] = -212.95, ['y'] = -1667.96, ['z'] = 34.47, ['h'] = 264.8, ['info'] = ' Forum Drive 12/Apt7', ['apt'] = 1 },
	[81] = { ['x'] = -216.55, ['y'] = -1673.88, ['z'] = 37.64, ['h'] = 175.17, ['info'] = ' Forum Drive 12/Apt8', ['apt'] = 1 },
	[82] = { ['x'] = -224.34, ['y'] = -1673.79, ['z'] = 37.64, ['h'] = 175.13, ['info'] = ' Forum Drive 12/Apt9', ['apt'] = 1 },
	[83] = { ['x'] = -223.99, ['y'] = -1666.29, ['z'] = 37.64, ['h'] = 86.27, ['info'] = ' Forum Drive 12/Apt10', ['apt'] = 1 },
	[84] = { ['x'] = -224.44, ['y'] = -1653.99, ['z'] = 37.64, ['h'] = 87.81, ['info'] = ' Forum Drive 12/Apt11', ['apt'] = 1 },
	[85] = { ['x'] = -223.96, ['y'] = -1649.16, ['z'] = 38.45, ['h'] = 353.99, ['info'] = ' Forum Drive 12/Apt12', ['apt'] = 1 },
	[86] = { ['x'] = -216.44, ['y'] = -1649.13, ['z'] = 37.64, ['h'] = 352.36, ['info'] = ' Forum Drive 12/Apt13', ['apt'] = 1 },
	[87] = { ['x'] = -212.85, ['y'] = -1660.74, ['z'] = 37.64, ['h'] = 269.04, ['info'] = ' Forum Drive 12/Apt14', ['apt'] = 1 },
	[88] = { ['x'] = -212.72, ['y'] = -1668.23, ['z'] = 37.64, ['h'] = 272.59, ['info'] = ' Forum Drive 12/Apt15', ['apt'] = 1 },
	[89] = { ['x'] = -141.79, ['y'] = -1693.55, ['z'] = 36.17, ['h'] = 229.58, ['info'] = ' Forum Drive 1/Apt6', ['apt'] = 1 },
	[90] = { ['x'] = -142.19, ['y'] = -1692.69, ['z'] = 36.17, ['h'] = 321.38, ['info'] = ' Forum Drive 1/Apt7', ['apt'] = 1 },
	[91] = { ['x'] = -147.39, ['y'] = -1688.39, ['z'] = 36.17, ['h'] = 318.94, ['info'] = ' Forum Drive 1/Apt8', ['apt'] = 1 },
	[92] = { ['x'] = 179.94, ['y'] = -1831.79, ['z'] = 28.12, ['h'] = 142.67, ['info'] = ' Shop 2' },
	[93] = { ['x'] = 212.34, ['y'] = -1856.49, ['z'] = 27.2, ['h'] = 309.44, ['info'] = ' Shop 3' },
	[94] = { ['x'] = 174.48, ['y'] = -2025.75, ['z'] = 18.34, ['h'] = 122.0, ['info'] = ' Shop 4' },
	[95] = { ['x'] = 409.69, ['y'] = -1910.84, ['z'] = 25.46, ['h'] = 289.86, ['info'] = ' Shop 5' },
	[96] = { ['x'] = 450.73, ['y'] = -1862.38, ['z'] = 27.8, ['h'] = 52.67, ['info'] = ' Shop 6' },
	[97] = { ['x'] = 482.94, ['y'] = -1685.85, ['z'] = 29.3, ['h'] = 229.98, ['info'] = ' Shop 7' },
	[98] = { ['x'] = 225.16, ['y'] = -1511.8, ['z'] = 29.3, ['h'] = 354.17, ['info'] = ' Shop 8' },
	[99] = { ['x'] = 168.77, ['y'] = -1633.48, ['z'] = 29.3, ['h'] = 230.99, ['info'] = ' Shop 9' },
	[100] = { ['x'] = 161.63, ['y'] = -1485.4, ['z'] = 29.15, ['h'] = 116.92, ['info'] = ' Shop 10' },
	[101] = { ['x'] = 83.58, ['y'] = -1551.61, ['z'] = 29.6, ['h'] = 52.59, ['info'] = ' Shop 11' },
	[102] = { ['x'] = 95.02, ['y'] = -1810.52, ['z'] = 27.09, ['h'] = 238.45, ['info'] = ' Shop 12' },
	[103] = { ['x'] = -297.78, ['y'] = -1332.4, ['z'] = 31.3, ['h'] = 314.62, ['info'] = ' Shop 13' },
	[104] = { ['x'] = -1.58, ['y'] = -1400.38, ['z'] = 29.28, ['h'] = 91.04, ['info'] = ' Shop 14' },
	[105] = { ['x'] = -10.81, ['y'] = -1828.68, ['z'] = 25.4, ['h'] = 301.59, ['info'] = ' Grove shop' },
}


local rnd = 0
local blip = 0
local deliveryPed = 0

function CreateWeedPed()

    local hashKey = `a_m_y_stwhi_01`

    local pedType = 5

    RequestModel(hashKey)
    while not HasModelLoaded(hashKey) do
        RequestModel(hashKey)
        Wait(100)
    end


	deliveryPed = CreatePed(pedType, hashKey, WeedLocations[rnd]["x"],WeedLocations[rnd]["y"],WeedLocations[rnd]["z"], WeedLocations[rnd]["h"], 1, 0)
	

    ClearPedTasks(deliveryPed)
    ClearPedSecondaryTask(deliveryPed)
    TaskSetBlockingOfNonTemporaryEvents(deliveryPed, true)
    SetPedFleeAttributes(deliveryPed, 0, 0)
    SetPedCombatAttributes(deliveryPed, 17, 1)

    SetPedSeeingRange(deliveryPed, 0.0)
    SetPedHearingRange(deliveryPed, 0.0)
    SetPedAlertness(deliveryPed, 0)
    searchPockets()
    SetPedKeepTask(deliveryPed, true)
	exports['qb-target']:AddEntityZone('WeedRunNPC', deliveryPed, {
		name="WeedRunNPC",
		debugPoly=false,
		useZ = true
		}, {
		options = {
				{
					event = "deliverpackage",
					icon = "fas fa-hand-holding",
					label = "Deliver package",
				}
			},  
		distance = 1.5
	})
end

function DeleteCreatedPed()
	if DoesEntityExist(deliveryPed) then 
        if success then
        RequestAnimDict('anim@heists@box_carry@')
			while not HasAnimDictLoaded('anim@heists@box_carry@') do
				Wait(0)
			end
			ClearPedTasksImmediately(deliveryPed)
			RequestModel('hei_prop_heist_weed_block_01')
			while not HasModelLoaded('hei_prop_heist_weed_block_01') do
				Wait(0)
			end
			local plyCoords = GetEntityCoords(PlayerPedId())
			local weedObject = CreateObjectNoOffset('hei_prop_heist_weed_block_01', plyCoords.x, plyCoords.y, plyCoords.z - 5.0, 1, 1, 0)
			SetObjectAsNoLongerNeeded(weedObject)
			AttachEntityToEntity(
				weedObject, deliveryPed, GetPedBoneIndex(deliveryPed, 28422), 
				0.01, -0.02, -0.12, 0, 0, 0, 1, 1, 0, 0, 2, 1
			)
			TaskPlayAnim(deliveryPed, 'anim@heists@box_carry@', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)
			TaskWanderStandard(deliveryPed, 10.0, 10)
            SetPedAsNoLongerNeeded(deliveryPed)
            deliveryPed = 0
            else
            TaskSetBlockingOfNonTemporaryEvents(deliveryPed, false)
		ClearPedTasks(deliveryPed)
		TaskWanderStandard(deliveryPed, 10.0, 10)
		SetPedAsNoLongerNeeded(deliveryPed)
        deliveryPed = 0
        SetPedKeepTask(deliveryPed, false)
        end
	end
end


function DeleteBlip()
	if DoesBlipExist(blip) then
		RemoveBlip(blip)
	end
end

function CreateBlip()
	DeleteBlip()
	if WeedRun then
		blip = AddBlipForCoord(WeedLocations[rnd]["x"],WeedLocations[rnd]["y"],WeedLocations[rnd]["z"])
	end
    
    SetBlipSprite(blip, 514)
    SetBlipScale(blip, 0.7)
    SetBlipColour(blip, 25)
    SetBlipAsShortRange(blip, false)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Client")
    EndTextCommandSetBlipName(blip)
    SetBlipRoute(blip, true)
end

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
		Wait(100)
    end
end 

function searchPockets()
    if ( DoesEntityExist( deliveryPed ) and not IsEntityDead( deliveryPed ) ) then 
        loadAnimDict( "random@mugging4" )
        TaskPlayAnim( deliveryPed, "random@mugging4", "agitated_loop_a", 8.0, 1.0, -1, 16, 0, 0, 0, 0 )
    end
end

function giveAnim()
    if ( DoesEntityExist( deliveryPed ) and not IsEntityDead( deliveryPed ) ) then 
        loadAnimDict( "mp_safehouselost@" )
        if ( IsEntityPlayingAnim( deliveryPed, "mp_safehouselost@", "package_dropoff", 3 ) ) then 
            TaskPlayAnim( deliveryPed, "mp_safehouselost@", "package_dropoff", 8.0, 1.0, -1, 16, 0, 0, 0, 0 )
        else
            TaskPlayAnim( deliveryPed, "mp_safehouselost@", "package_dropoff", 8.0, 1.0, -1, 16, 0, 0, 0, 0 )
        end     
    end
end

RegisterNetEvent("SellWeedPackage")
AddEventHandler("SellWeedPackage", function()

	if tasking then
		return
	end
	
	rnd = math.random(1,#WeedLocations)

	CreateBlip()

	local pedCreated = false

	tasking = true
	local toolong = 600000
	while tasking do

		Wait(100)
		local veh = GetVehiclePedIsIn(PlayerPedId(),false)
		local plycoords = GetEntityCoords(PlayerPedId())
		local dstcheck = #(plycoords - vector3(WeedLocations[rnd]["x"],WeedLocations[rnd]["y"],WeedLocations[rnd]["z"])) 
		if dstcheck < 40.0 and not pedCreated then
			pedCreated = true
			DeleteCreatedPed()
			CreateWeedPed()
		end
		toolong = toolong - 1
		if toolong < 0 then
			tasking = false
			WeedRun = false
		end
	end

	DeleteCreatedPed()
	DeleteBlip()
end)

RegisterNetEvent("StartSellingWeed")
AddEventHandler("StartSellingWeed", function()
	if not WeedRun then	
	    local NearNPC = exports["isPed"]:GetClosestNPC()
	    PlayAmbientSpeech1(NearNPC, "Chat_Resp", "SPEECH_PARAMS_FORCE", 1)
	    salecount = 0	
	    WeedRun = true
		TriggerEvent("SellWeedPackage")
        TriggerServerEvent("QBCore:Server:RemoveItem", "deliverylist", 1)
        TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["deliverylist"], "remove")
	else 
		print('U ARE ALREADY DELIVERING')
	end
end)


local handthegood = false 
local NoItem = nil
RegisterNetEvent("deliverpackage")
AddEventHandler("deliverpackage", function()
	if not handthegood then 
		handthegood = true
        if DoesEntityExist(deliveryPed) and not IsEntityDead(deliveryPed) then
            TaskTurnPedToFaceEntity(deliveryPed, PlayerPedId(), 0)
            exports['qb-target']:RemoveZone("WeedRunNPC")
	    	if WeedRun and QBCore.Functions.HasItem("weedpackage") then
	    		if QBCore.Functions.HasItem("weedpackage") then
                   NoItem = false
                   FreezeEntityPosition(PlayerPedId(), true)
                    local finished = exports["unvisible-taskbar"]:taskBar(15000,"Weighing package")
                     if (finished == 100) then 
                    print('SUCCESS')
                    success = true
	    		else
                    FreezeEntityPosition(PlayerPedId(), false)
                    print('ERROR OR NO ITEM')
	    			NoItem = true
	    			success = false 
	    		end
	    	end
	    end
        if success then
	    searchPockets()
	    Wait(1500)
	    PlayAmbientSpeech1(deliveryPed, "Chat_State", "Speech_Params_Force")
	    local counter = math.random(50,200)
	    while counter > 0 do
	    	local coordsofped = GetEntityCoords(deliveryPed)
	    	counter = counter - 1
	    end
	end
	    local coordsofped = GetEntityCoords(deliveryPed)
	    if success and not NoItem  then
            local finished = exports["unvisible-taskbar"]:taskBar(10000,"Counting bills")
            if (finished == 100) and QBCore.Functions.HasItem("weedpackage") then
             giveAnim()
            TriggerServerEvent("QBCore:Server:RemoveItem", "weedpackage", 1)
	    	TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["weedpackage"], "remove") 
	    	PlayAmbientSpeech1(deliveryPed, "Generic_Thanks", "Speech_Params_Force_Shouted_Critical")
            TriggerServerEvent('givememoneybro')
            print('SUCCESS2')
            FreezeEntityPosition(PlayerPedId(), false)
        else
            NoItem = true
            FreezeEntityPosition(PlayerPedId(), false)
            print('ERROR OR NO ITEM')
            success = false
	      end
     end
	    DeleteBlip()
	    if success then
	    	Wait(7000)
	    	salecount = salecount + 1 
	    	if salecount == 5 then 
	    		tasking = false
	    		WeedRun = false 
				handthegood = false
				DeleteCreatedPed()
	    	else 	
			DeleteCreatedPed()
	    	Citizen.Wait(math.random(40000,80000))
			NoItem = false
	    	tasking = false
			handthegood = false
			SendMail()
	    	TriggerEvent("SellWeedPackage")
	    	end
	    elseif NoItem then
			DeleteCreatedPed()
	    	Wait(3000)
			NoItem = false
	    	tasking = false
			handthegood = false
			SendMail()
            salecount = salecount + 1 
	    	TriggerEvent("SellWeedPackage")
            print('bte')
	    elseif not NoItem and not success and not QBCore.Functions.HasItem("weedpackage") then
            SendMail()
			DeleteCreatedPed()
	    	Wait(5000)
			NoItem = false
	    	tasking = false
			handthegood = false
	    	TriggerEvent("SellWeedPackage")
                    print('ERROR OR NO ITEM V2')
	        end
        end
	end
end)
 
function SendMail()
	Wait(2000)
	TriggerServerEvent('qb-phone:server:sendNewMail', {
	sender = 'Food Delivery',
	subject = '#A-1003',
	message = 'Drive to the next handoff location',
	})
	Wait(3000)
end

Citizen.CreateThread(function()
	exports["qb-target"]:AddBoxZone("StartWeedRun", vector3(457.6573, -1498.134, 28.18816), 1.0, 1.0, {
	  name="StartWeedRun",
	  heading=147.34,
	  debugPoly=false,
	  minZ=27.0,
	  maxZ=29.2
	  }, {
		  options = {
			  {
				  event = "StartSellingWeed",
				  icon = "fas fa-circle",
				  label = "Talk with person",
				  canInteract = function()
					return  not IsPedInAnyVehicle(PlayerPedId()) and QBCore.Functions.HasItem("deliverylist")
					end,
				 }
			  },
		  distance = 1.5
  })
end)
