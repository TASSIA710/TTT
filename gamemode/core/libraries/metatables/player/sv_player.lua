
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
