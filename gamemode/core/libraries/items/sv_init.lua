
--[[
	TTT -> Items library (ServerSide)
	by Tassilo (https://github.com/TASSIA710)
--]]

AddCSLuaFile("shared.lua")
include("shared.lua")


--- Networked if a player buys an item in a shop.
-- @direction SV <-> CL
util.AddNetworkString("TTT:BuyItem")

net.Receive("TTT:BuyItem", function(len, ply)
	local shop = net.ReadUInt(8)
	local itemStr = net.ReadString()

	if not TTT.Items.GetItems(shop) then
		Log.Warning(ply, "tried to use invalid shop:", shop)
		return
	end
	local item = TTT.Items.GetItems(shop)[itemStr]
	if not item then
		Log.Warning(ply, "tried to buy invalid item '" .. itemStr .. "' from shop", shop)
		return
	end

	if ply:GetCredits() < item.Price then
		Log.Warning(ply, "tried to buy item", item.Name, "but doesn't have enough credits.")
		return
	end

	if item.IsPurchased(ply) then
		Log.Warning(ply, "tried to buy item", item.Name, "but item is already purchased.")
		return
	end

	Log.Debug(ply, "bought item", item.Name)
	ply:SetCredits(ply:GetCredits() - item.Price)

	ply._Purchases = ply._Purchases or {}
	ply._Purchases[shop] = ply._Purchases[shop] or {}
	ply._Purchases[shop][itemStr] = true

	item.OnBuy(ply)

	net.Start("TTT:BuyItem")
	net.WriteUInt(shop, 8)
	net.WriteString(itemStr)
	net.Send(ply)
end)
