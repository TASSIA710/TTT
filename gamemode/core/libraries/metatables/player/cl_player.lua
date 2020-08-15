
--[[
	TTT -> MetaTable library -> Player MetaTable (ClientSide)
	by Tassilo (https://github.com/TASSIA710)
--]]

local PLAYER = FindMetaTable("Player")





-- >> Role
net.Receive("TTT:SetRole", function(len)
	LocalPlayer()._Role = net.ReadUInt(8)
end)
-- >> Role
