Config = {}

-- Ammo given by default to crafted weapons
Config.WeaponAmmo = 42

Config.Recipes = {
	-- Can be a normal ESX item
	["lockpick"] = { 
		{item = "bobbypin", quantity = 4 }, 
		{item = "rubberband", quantity = 1 },
	},
	
	-- Can be a weapon, must follow this format
	['WEAPON_ASSAULTRIFLE'] = { 
		{item = "steel", quantity = 4 }, 
		{item = "gunpowder", quantity = 2},
	}
}

-- Enable a shop to access the crafting menu
Config.Shop = {
	useShop = true,
	shopCoordinates = { x=962.5, y=-1585.5, z=29.6 },
	shopName = "Crafting Station",
	shopBlipID = 446,
	zoneSize = { x = 2.5, y = 2.5, z = 1.5 },
	zoneColor = { r = 255, g = 0, b = 0, a = 100 }
}

-- Enable crafting menu through a keyboard shortcut
Config.Keyboard = {
	useKeyboard = false,
	keyCode = 303
}
