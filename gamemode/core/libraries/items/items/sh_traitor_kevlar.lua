
--[[
	TTT -> Items library -> Traitor Kevlar (Shared)
	by Tassilo (https://github.com/TASSIA710)
--]]

local ITEM = {}

ITEM.ID = "kevlar"
ITEM.Name = "Kevlar"
ITEM.Description = "A kevlar that reduces damage by 50%."

ITEM.Price = 1
ITEM.Slot = -1

ITEM.OnBuy = function(ply)
	Log.Error("Not implemented yet.")
end

TTT.Items.RegisterItem(SHOP_TRAITOR, ITEM)
