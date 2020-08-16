
--[[
	TTT -> Entities -> ttt_win (Shared)
	Ported from: https://github.com/Facepunch/garrysmod/blob/master/garrysmod/gamemodes/terrortown/entities/entities/ttt_win.lua
--]]

ENT.Type = "point"
ENT.Base = "base_point"

function ENT:AcceptInput(name, activator, caller)
	if name == "WIN_TIMEOUT" then
		TTT.SendWin(WIN_TIMEOUT)
		return true
	elseif name == "WIN_INNOCENT" then
		TTT.SendWin(WIN_INNOCENT)
		return true
	elseif name == "WIN_TRAITOR" then
		TTT.SendWin(WIN_TRAITOR)
		return true
	elseif name == "WIN_JESTER" then
		TTT.SendWin(WIN_JESTER)
		return true
	elseif name == "WIN_SERIAL_KILLER" then
		TTT.SendWin(WIN_SERIAL_KILLER)
		return true
	elseif name == "WIN_INFECTED" then
		TTT.SendWin(WIN_INFECTED)
		return true
	end

	-- Old TTT backwards compatibility
	if name == "TraitorWin" then
		TTT.SendWin(WIN_TRAITOR)
		return true
	elseif name == "InnocentWin" then
		TTT.SendWin(WIN_INNOCENT)
		return true
	end
end
