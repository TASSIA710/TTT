
--[[
	TTT -> MetaTable library -> Player MetaTable (Shared)
	by Tassilo (https://github.com/TASSIA710)
--]]

local PLAYER = FindMetaTable("Player")





-- >> Is Alive?
--- Checks whether the player is alive, aka. actively playing.
-- @returns alvie [boolean] - is alive
function PLAYER:IsAlive()
	return self:GetObserverMode() ~= OBS_MODE_NONE and not self:IsSpectator()
end
-- >> Is Alive?





-- >> Role
--- Returns the role of this player.
-- @returns role [number] - the role
function PLAYER:GetRole()
	return self._Role or ROLE_FALLBACK
end

--- Returns whether this player has the specified role.
-- @param role [number] - the role to check
-- @returns is [boolean] - whether this player has the role
function PLAYER:IsRole(role)
	return (self._Role or ROLE_FALLBACK) == role
end

--- Returns whether this player has the spectator (`ROLE_SPECTATOR`) role.
-- @returns is [boolean] - whether this player is a spectator
function PLAYER:IsSpectator()
	return (self._Role or ROLE_FALLBACK) == ROLE_SPECTATOR
end

--- Returns whether this player has the innocent (`ROLE_INNOCENT`) role.
-- @returns is [boolean] - whether this player is an innocent
function PLAYER:IsInnocent()
	return (self._Role or ROLE_FALLBACK) == ROLE_INNOCENT
end

--- Returns whether this player has the traitor (`ROLE_TRAITOR`) role.
-- @returns is [boolean] - whether this player is a traitor
function PLAYER:IsTraitor()
	return (self._Role or ROLE_FALLBACK) == ROLE_TRAITOR
end

--- Returns whether this player has the detective (`ROLE_DETECTIVE`) role.
-- @returns is [boolean] - whether this player is a detective
function PLAYER:IsDetective()
	return (self._Role or ROLE_FALLBACK) == ROLE_DETECTIVE
end

--- Returns whether this player has the phoenix (`ROLE_PHOENIX`) role.
-- @returns is [boolean] - whether this player is a phoenix
function PLAYER:IsPhoenix()
	return (self._Role or ROLE_FALLBACK) == ROLE_PHOENIX
end

--- Returns whether this player has the jester (`ROLE_JESTER`) role.
-- @returns is [boolean] - whether this player is a jester
function PLAYER:IsJester()
	return (self._Role or ROLE_FALLBACK) == ROLE_JESTER
end

--- Returns whether this player has the serial killer (`ROLE_SERIAL_KILLER`) role.
-- @returns is [boolean] - whether this player is a serial killer
function PLAYER:IsSerialKiller()
	return (self._Role or ROLE_FALLBACK) == ROLE_SERIAL_KILLER
end

--- Returns whether this player has the injected (`ROLE_INFECTED`) role.
-- @returns is [boolean] - whether this player is an infected player
function PLAYER:IsInfected()
	return (self._Role or ROLE_FALLBACK) == ROLE_INFECTED
end
-- >> Role