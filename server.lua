ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('salty_crafting:getPlayerInventory')
AddEventHandler('salty_crafting:getPlayerInventory', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer ~= nil then
		TriggerClientEvent('salty_crafting:openMenu', _source, xPlayer.inventory)
	end
end)

function findRecipe(list)
	for item, ingredients in pairs(Config.Recipes) do
		if #ingredients == #list then
			-- same length, let's compare
			local found = 0
			for i=1, #ingredients, 1 do
				for j=1, #list, 1 do
					if ingredients[i].item == list[j].item and ingredients[i].quantity == list[j].quantity then
						found = found + 1
					end
				end
			end
			if found == #list then
				return item
			end
		end
	end
	return false
end

function hasAllIngredients(inventory, ingredients)
	for i=1, #ingredients, 1 do
		for j=1, #inventory, 1 do
			if ingredients[i].name == inventory[j].name then
				if inventory[j].count < ingredients[i].quantity then
					return false
				end
			end
		end
	end
	return true
end

function itemLabel(name, inventory)
	if string.match(string.lower(name), "weapon_") then
		return ESX.GetWeaponLabel(name)
	else
		for i=1, #inventory, 1 do
			if inventory[i].name == name then
				return inventory[i].label
			end
		end
	end
	return "unknown item"
end

RegisterServerEvent('salty_crafting:craftItem')
AddEventHandler('salty_crafting:craftItem', function(ingredients)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local item = findRecipe(ingredients)
	if not item then
		TriggerClientEvent('esx:showNotification', _source, 'No recipe found with these ingredients')
	else
		if xPlayer ~= nil then
			if hasAllIngredients(xPlayer.inventory, Config.Recipes[item]) then
				for _,ingredient in pairs(Config.Recipes[item]) do
					if (ingredient.remove ~= nil and ingredient.remove) or (ingredient.remove == nil) then
						xPlayer.removeInventoryItem(ingredient.item, ingredient.quantity)
					end
				end
				if string.match(string.lower(item), "weapon_") then
					xPlayer.addWeapon(item, Config.WeaponAmmo)
				else
					xPlayer.addInventoryItem(item, 1)
				end
				TriggerClientEvent('esx:showNotification', _source, '~y~Item Crafted: ~w~' .. itemLabel(item, xPlayer.inventory))
			else
				TriggerClientEvent('esx:showNotification', _source, 'You do not have all of the ingredients')
			end
		end
	end
end)
