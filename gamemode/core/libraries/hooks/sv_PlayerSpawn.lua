
--[[
	TTT -> Hooks library -> PlayerSpawn hook (ServerSide)
	by Tassilo (https://github.com/TASSIA710)
--]]

function GM:PlayerSpawn(ply)

	-- Should we start a new round?
	if TTT.GetRoundState() == ROUND_WAITING then
		local should = hook.Run("TTTShouldRoundStart")
		if should then
			Log.Info("Round progress: WAITING -> WARMUP")
			TTT.StartRound()
		end
	end

	if TTT.GetRoundState() == ROUND_WARMUP then
		-- Give the default loadout
		ply:UnSpectate()
		hook.Run("PlayerLoadout", ply)
	else
		-- Force spectate mode
		ply:Spectate(OBS_MODE_ROAMING)
	end

	ply._JustDied = false
end
