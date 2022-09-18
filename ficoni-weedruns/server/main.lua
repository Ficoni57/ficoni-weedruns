local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('givememoneybro', function()
	local Player = QBCore.Functions.GetPlayer(source)
	local hasMarkedBills = Player.Functions.GetItemByName("markedbills")
	local hasBandNotes = Player.Functions.GetItemByName("bands")
	local hasCashRolls = Player.Functions.GetItemByName("rolls")

	local rollchance = math.random(1, 10)
	Player.Functions.AddMoney('cash', math.random(3950, 5000))
		if Config.WashMoney then
 
			if rollchance < Config.MarkedBills then
				if hasMarkedBills then
					worth = Player.Functions.GetItemByName('markedbills').info.worth
					markedbillsworth = math.random(Player.Functions.GetItemByName("markedbills").amount)
					Player.Functions.AddMoney('cash', markedbillsworth*worth)

					Player.Functions.RemoveItem("markedbills", markedbillsworth)
					TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["markedbills"], "remove")
				end
			end

			if rollchance < Config.CashRollChance then
				if hasCashRolls then
					cashrollworth = math.random(Player.Functions.GetItemByName("rolls").amount)
					Player.Functions.AddMoney('cash', cashrollworth*math.random(Config.RollMinimum, Config.RollMaximum))

					Player.Functions.RemoveItem("rolls", cashrollworth)
					TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["rolls"], "remove")
				end
			end

			if rollchance < Config.BandNotesChance then
				if hasBandNotes then
					bandnotesworth = math.random(Player.Functions.GetItemByName("bands").amount)
					Player.Functions.AddMoney('cash', bandnotesworth*math.random(Config.BandMinimum, Config.BandMaximum))

					Player.Functions.RemoveItem("bands", bandnotesworth)
					TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["bands"], "remove")
			    end
	        end
	   end
end)
