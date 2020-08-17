
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





-- >> Credits
net.Receive("TTT:SetCredits", function(len)
	LocalPlayer()._Credits = net.ReadUInt(8)
end)
-- >> Credits





-- >> Credits
net.Receive("TTT:SetKarma", function(len)
	LocalPlayer()._Karma = net.ReadUInt(16)
end)
-- >> Credits
