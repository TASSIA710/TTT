
--[[
	TTT -> Items library (Shared)
	by Tassilo (https://github.com/TASSIA710)
--]]

TTT.Items = {}
local items = {}


--- Registers a new item on the given shop.
-- @param shop [number] - the shop, e.g. `SHOP_TRAITOR` or `SHOP_DETECTIVE`
-- @param item [table] - the item data
function TTT.Items.RegisterItem(shop, item)
	if not items[shop] then items[shop] = {} end
	items[shop][item.ID] = item
end


--- Returns all registered items for the given shop.
-- @param shop [number] - the shop, e.g. `SHOP_TRAITOR` or `SHOP_DETECTIVE`
-- @returns items [table] - all registered items
function TTT.Items.GetItems(shop)
	return items[shop]
end




-- Download files
if SERVER then
	AddCSLuaFile("items/sh_traitor_kevlar.lua")
end


-- Include files
include("items/sh_traitor_kevlar.lua")
