ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

if Config.MaxInService ~= -1 then
  TriggerEvent('esx_service:activateService', 'taco', Config.MaxInService)
end

TriggerEvent('esx_phone:registerNumber', 'taco', _U('taco_customer'), true, true)
TriggerEvent('esx_society:registerSociety', 'taco', 'taco', 'society_taco', 'society_taco', 'society_taco', {type = 'private'})



RegisterServerEvent('esx_tacojob:getStockItem')
AddEventHandler('esx_tacojob:getStockItem', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_taco', function(inventory)

    local item = inventory.getItem(itemName)

    if item.count >= count then
      inventory.removeItem(itemName, count)
      xPlayer.addInventoryItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_removed') .. count .. ' ' .. item.label)

  end)

end)

RegisterServerEvent('esx_tacojob:Billing')--Not Working...
AddEventHandler('esx_tacojob:Billing', function(money, player)

  local xPlayer = ESX.GetPlayerFromId(source)
  local xTarget = ESX.GetPlayerFromId(player)
  local valor = money

    if xTarget.getMoney() >= valor then
      xTarget.removeMoney(valor)
      xPlayer.addMoney(valor)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, "O seu cliente nao tem esse dinheiro, valor: " ..valor)
	  TriggerClientEvent('esx:showNotification', xTarget.source, "Voce nao tem esse dinheiro, valor: " ..valor)
    end
end)--Not Working

ESX.RegisterServerCallback('esx_tacojob:getStockItems', function(source, cb)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_taco', function(inventory)
    cb(inventory.items)
  end)

end)

RegisterServerEvent('esx_tacojob:putStockItems')
AddEventHandler('esx_tacojob:putStockItems', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_taco', function(inventory)

    local item = inventory.getItem(itemName)
    local playerItemCount = xPlayer.getInventoryItem(itemName).count

    if item.count >= 0 and count <= playerItemCount then
      xPlayer.removeInventoryItem(itemName, count)
      inventory.addItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_quantity'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_added') .. count .. ' ' .. item.label)

  end)

end)


RegisterServerEvent('esx_tacojob:getFridgeStockItem')
AddEventHandler('esx_tacojob:getFridgeStockItem', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_taco_fridge', function(inventory)

    local item = inventory.getItem(itemName)

    if item.count >= count then
      inventory.removeItem(itemName, count)
      xPlayer.addInventoryItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_removed') .. count .. ' ' .. item.label)

  end)

end)

ESX.RegisterServerCallback('esx_tacojob:getFridgeStockItems', function(source, cb)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_taco_fridge', function(inventory)
    cb(inventory.items)
  end)

end)

RegisterServerEvent('esx_tacojob:putFridgeStockItems')
AddEventHandler('esx_tacojob:putFridgeStockItems', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_taco_fridge', function(inventory)

    local item = inventory.getItem(itemName)
    local playerItemCount = xPlayer.getInventoryItem(itemName).count

    if item.count >= 0 and count <= playerItemCount then
      xPlayer.removeInventoryItem(itemName, count)
      inventory.addItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_quantity'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_added') .. count .. ' ' .. item.label)

  end)

end)


RegisterServerEvent('esx_tacojob:buyItem')
AddEventHandler('esx_tacojob:buyItem', function(itemName, price, itemLabel)

    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    local limit = xPlayer.getInventoryItem(itemName).limit
    local qtty = xPlayer.getInventoryItem(itemName).count
    local societyAccount = nil

    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_taco', function(account)
        societyAccount = account
      end)
    
    if societyAccount ~= nil and societyAccount.money >= price then
        if qtty < limit then
            societyAccount.removeMoney(price)
            xPlayer.addInventoryItem(itemName, 1)
            TriggerClientEvent('esx:showNotification', _source, _U('bought') .. itemLabel)
        else
            TriggerClientEvent('esx:showNotification', _source, _U('max_item'))
        end
    else
        TriggerClientEvent('esx:showNotification', _source, _U('not_enough'))
    end

end)


RegisterServerEvent('esx_tacojob:craftingCoktails')
AddEventHandler('esx_tacojob:craftingCoktails', function(Value)

    local _source = source
    local escolha = Value       
if escolha == "taco" then
            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('cmeat').count
            local bethQuantity      = xPlayer.getInventoryItem('conion').count
            local gammaQuantity      = xPlayer.getInventoryItem('ctomato').count

            if alephQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "You need Chopped Meat")
            elseif bethQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "You need Chopped Onions")
            elseif gammaQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "You need Chopped Tomatoes")
            else
              TriggerClientEvent('esx:showNotification', _source, "Making Taco")
              TriggerClientEvent('esx_taco:StartCookAnimation', _source)
                    Citizen.Wait(20000)
                    TriggerClientEvent('esx_taco:StopCookAnimation', _source)
                    TriggerClientEvent('esx:showNotification', _source, "You Made a Taco")
                    xPlayer.removeInventoryItem('cmeat', 1)
                    xPlayer.removeInventoryItem('conion', 1)
                    xPlayer.removeInventoryItem('ctomato', 1)
                    xPlayer.addInventoryItem('taco', 1)
            end
  elseif escolha == "ctomato" then
            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('tomato').count

            if alephQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "You need more tomatoes")
            else
              TriggerClientEvent('esx:showNotification', _source, "Chopping tomatoes")
              TriggerClientEvent('esx_taco:StartCookAnimation', _source)
                    Citizen.Wait(20000)
                    TriggerClientEvent('esx_taco:StopCookAnimation', _source)
                    TriggerClientEvent('esx:showNotification', _source, "You chopped up a tomato")
                    xPlayer.removeInventoryItem('tomato', 1)
                    xPlayer.addInventoryItem('ctomato', 1)
            end
  elseif escolha == "cmeat" then
            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('meat').count

            if alephQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "You need more meat")
            else
              TriggerClientEvent('esx:showNotification', _source, "Chopping meat")
              TriggerClientEvent('esx_taco:StartCookAnimation', _source)
                    Citizen.Wait(20000)
                    TriggerClientEvent('esx_taco:StopCookAnimation', _source)
                    TriggerClientEvent('esx:showNotification', _source, "You chopped up the Meat")
                    xPlayer.removeInventoryItem('meat', 1)
                    xPlayer.addInventoryItem('cmeat', 1)
            end
  elseif escolha == "conion" then
            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('onion').count

            if alephQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "You need more onions")
            else
                TriggerClientEvent('esx:showNotification', _source, "Chopping onions into slices")
                TriggerClientEvent('esx_taco:StartCookAnimation', _source)
                    Citizen.Wait(20000)
                    TriggerClientEvent('esx_taco:StopCookAnimation', _source)
                    TriggerClientEvent('esx:showNotification', _source, "You chopped up the onions")
                    xPlayer.removeInventoryItem('onion', 1)
                    xPlayer.addInventoryItem('conion', 1)
            end
		else
			TriggerClientEvent('esx:showNotification', _source, "Rip ~r~ERROR 404~w~")
		end
end)

RegisterServerEvent('esx_tacojob:shop')
AddEventHandler('esx_tacojob:shop', function(item, valor)

    local _source = source
    local xPlayer           = ESX.GetPlayerFromId(_source)
	local comida = item
	local preco = valor
	if xPlayer.getMoney() >= preco then
        xPlayer.removeMoney(preco)
        xPlayer.addInventoryItem(comida, 1)
	end
end)

ESX.RegisterServerCallback('esx_tacojob:getVaultWeapons', function(source, cb)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_taco', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    cb(weapons)

  end)

end)

ESX.RegisterServerCallback('esx_tacojob:addVaultWeapon', function(source, cb, weaponName)

  local xPlayer = ESX.GetPlayerFromId(source)

  xPlayer.removeWeapon(weaponName)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_taco', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = weapons[i].count + 1
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 1
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)

ESX.RegisterServerCallback('esx_tacojob:removeVaultWeapon', function(source, cb, weaponName)

  local xPlayer = ESX.GetPlayerFromId(source)

  xPlayer.addWeapon(weaponName, 1000)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_taco', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 0
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)

ESX.RegisterServerCallback('esx_tacojob:getPlayerInventory', function(source, cb)

  local xPlayer    = ESX.GetPlayerFromId(source)
  local items      = xPlayer.inventory

  cb({
    items      = items
  })

end)
