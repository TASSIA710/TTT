
--[[
	TTT -> Items library (ClientSide)
	by Tassilo (https://github.com/TASSIA710)
--]]

include("shared.lua")



net.Receive("TTT:BuyItem", function()
	local shop = net.ReadUInt(8)
	local itemStr = net.ReadString()

	if not TTT.Items.GetItems(shop) then
		Log.Warning("Received invalid shop:", shop)
		return
	end
	local item = TTT.Items.GetItems(shop)[itemStr]
	if not item then
		Log.Warning("Received invalid item '" .. itemStr .. "' from shop", shop)
		return
	end

	Log.Debug("Received item purchase:", item.Name)

	LocalPlayer()._Purchases = LocalPlayer()._Purchases or {}
	LocalPlayer()._Purchases[shop] = LocalPlayer()._Purchases[shop] or {}
	LocalPlayer()._Purchases[shop][itemStr] = true
	item.OnBuyCS()
end)
