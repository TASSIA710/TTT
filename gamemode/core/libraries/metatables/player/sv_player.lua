
--[[
	TTT -> MetaTable library -> Player MetaTable (ServerSide)
	by Tassilo (https://github.com/TASSIA710)
--]]

local PLAYER = FindMetaTable("Player")





-- >> Role
--- Networked to update the role of a player.
-- @direction SV --> CL
util.AddNetworkString("TTT:SetRole")

--- Sets the role for this player.
-- @param role [number] - the role
function PLAYER:SetRole(role)
	self._Role = role
	net.Start("TTT:SetRole")
	net.WriteUInt(role, 8)
	net.Send(self)
end
-- >> Role





-- >> Credits
--- Networked, if the amount of credits for a player changes.
-- @direction SV --> CL
util.AddNetworkString("TTT:SetCredits")

--- Sets the amount of credits this player has.
-- @param amount [number] - amount of credits
function PLAYER:SetCredits(amount)
	self._Credits = amount
	net.Start("TTT:SetCredits")
	net.WriteUInt(amount, 8)
	net.Send(self)
end
-- >> Credits
