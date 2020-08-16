
--[[
	TTT -> Hooks library -> PlayerDisconnected hook (ServerSide)
	by Tassilo (https://github.com/TASSIA710)
--]]

function GM:PlayerDisconnected(ply)
	ply._AboutToDisconnect = true

	if TTT.GetRoundState() == ROUND_WARMUP then
		local should = hook.Run("TTTShouldRoundStart")
		if not should then
			Log.Info("Round progress: WARMUP -> WAITING")
			TTT.CancelRound()
		end
	end

	TTT.CheckWin()
end
