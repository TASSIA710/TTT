
--[[
	TTT -> Hooks library -> PlayerSpawn hook (ServerSide)
	by Tassilo (https://github.com/TASSIA710)
--]]

function GM:PlayerSpawn(ply)

	if TTT.GetRoundState() == ROUND_WAITING then
		local should = hook.Run("TTTShouldRoundStart")
		if should then
			Log.Info("Round progress: WAITING -> WARMUP")
			TTT.StartRound()
		end
	end

end
