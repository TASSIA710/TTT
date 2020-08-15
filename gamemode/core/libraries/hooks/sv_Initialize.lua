
--[[
	TTT -> Hooks library -> Initialize hook (ServerSide)
	by Tassilo (https://github.com/TASSIA710)
--]]

function GM:Initialize()
	-- Print log
	local start = SysTime()
	Log.Info("Initializing...")

	-- Set round state to `ROUND_WAITING`
	Log.Debug("- Setting round state to ROUND_WAITING...")
	TTT.SetRoundState(ROUND_WAITING)

	-- Force friendly fire to be enabled. If it is off, we do not get lag compensation.
	Log.Debug("- Setting mp_friendlyfire to 1...")
	RunConsoleCommand("mp_friendlyfire", "1")

	Log.Info("Connecting to database...")
	TTT.Database:connect()
	TTT.Database:wait()

	-- Print log
	Log.Info("Done! Gamemode initialized in " .. math.Round((SysTime() - start) * 1000, 2) .. "ms")
end
