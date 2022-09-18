local QBCore = exports['qb-core']:GetCoreObject()

local Cooldown = false
local checkpackage = true
local packagerecieved = false
players = {}
entities = {}


RegisterServerEvent('sd-weedrun:server:coolout', function()
    Cooldown = true
    local timer = Config.Cooldown * 1000
    while timer > 0 do
        Wait(1000)
        timer = timer - 1000
        if timer == 0 then
			TriggerClientEvent('sd-weedrun:signin', -1)
            Cooldown = false

        end
    end
end)

RegisterServerEvent('sd-weedrun:server:signoff', function()
	Cooldown = false
end)

QBCore.Functions.CreateCallback("sd-weedrun:server:coolc",function(source, cb)
    if Cooldown then
        cb(true)
    else
        cb(false) 
    end
end)

RegisterServerEvent('package-delivered', function()
	local Player = QBCore.Functions.GetPlayer(source)
	local ply = QBCore.Functions.GetPlayer(source)
	local hasBags = Player.Functions.GetItemByName("markedbills")
	local hasBands = Player.Functions.GetItemByName("bands")
	local hasRolls = Player.Functions.GetItemByName("rolls")

	local chance = math.random(1, 10)
	ply.Functions.AddMoney('cash', math.random(3950, 5000))
		if Config.CleanMoney then

			if chance < Config.BagChance then
				if hasBags then
					worth = Player.Functions.GetItemByName('markedbills').info.worth
					bagAmount = math.random(Player.Functions.GetItemByName("markedbills").amount)
					Player.Functions.AddMoney('cash', bagAmount*worth)

					Player.Functions.RemoveItem("markedbills", bagAmount)
					TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["markedbills"], "remove")
				end
			end

			if chance < Config.BandChance then
				if hasBands then
					bandAmount = math.random(Player.Functions.GetItemByName("bands").amount)
					Player.Functions.AddMoney('cash', bandAmount*math.random(Config.BandMinPayout, Config.BandMaxPayout))

					Player.Functions.RemoveItem("bands", bandAmount)
					TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["bands"], "remove")
				end
			end

			if chance < Config.RollChance then
				if hasRolls then
					rollAmount = math.random(Player.Functions.GetItemByName("rolls").amount)
					Player.Functions.AddMoney('cash', rollAmount*math.random(Config.RollMinPayout, Config.RollMaxPayout))

					Player.Functions.RemoveItem("rolls", rollAmount)
					TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["rolls"], "remove")
				end
			end
	end
end)

QBCore.Functions.CreateCallback('sd-weedrun:server:getCops', function(source, cb)
    local amount = 0
    local players = QBCore.Functions.GetQBPlayers()
    for _, Player in pairs(players) do
        if Player.PlayerData.job.name == "police" and Player.PlayerData.job.onduty then
            amount = amount + 1
        end
    end
    cb(amount)
end)

AddEventHandler('onResourceStart', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
		return
	end
	for i=1, 1000 do
		if GetPlayerPed(i) ~= 0 then
			players[i] = {}
		end
	end
end)
