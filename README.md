# salty_crafting
Crafting system for FiveM using EssentialMode Extended (ESX) inventory and item system.
![Screenshot](https://gta.saltyserver.net/resources/salty_crafting/screenshot.PNG)

## Features
Using the existing items and inventory system in ESX, players can craft new items using predefined recipes. Recipes can create new ESX items or weapons.

## Setup
This resource uses and requires ESX. ESX must be installed and working. In addition, this resource assumes that you have items already setup. In order to add items to ESX, add them to the `items` table of your database.

The configuration of this resource is done entirely in the `config.lua` file.

### Configuration
Recipes are defined in tables with the following structure:
```lua
['resultingItemName'] = {
    { item = "ingredient1", quantity = 2, remove = true },
    { item = "ingredient2", quantity = 3 },
},
```
In the example above, the resultingItemName requires two "ingredient1" and three "ingredient2". *NOTE:* These are all based on the `name` field of the item in the database, not the `label` field. There is no limit on the amount of recipes you can create, nor the amount of ingredients each recipe can have. The `remove` parameter is optional. `remove = false` will prevent the ingredient item from being removed from the player's inventory. `remove` will default to `true` if not specified.

The Crafting Menu can be made available either through a "store" where a player must visit a specified location on the map, or through a keyboard shortcut. Both of these options may be configured through the `config.lua` file.
