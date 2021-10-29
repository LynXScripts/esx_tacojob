Go to your esx_basicneeds folder add this
to:
CLIENT.lua
RegisterNetEvent('esx_basicneeds:onEat3')
AddEventHandler('esx_basicneeds:onEat3', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'prop_taco_01'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('mp_player_inteat@burger', function()
				TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 8.0, -8, -1, 49, 0, 0, 0, 0)

				Citizen.Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)

And add this to your basicneeds SERVER.lua
ESX.RegisterUsableItem('taco', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('taco', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 800000)
	TriggerClientEvent('esx_basicneeds:onEat3', source)
	xPlayer.showNotification('You Ate A Delicious Taco')
end)
