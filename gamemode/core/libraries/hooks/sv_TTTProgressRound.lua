
--[[
	TTT -> Hooks library -> TTTProgressRound hook (ServerSide)
	by Tassilo (https://github.com/TASSIA710)
--]]

function GM:TTTProgressRound()

	if TTT.GetRoundState() == ROUND_WARMUP then
		Log.Info("Round progress: WARMUP -> PLAYING")
		local roles = TTT.DecideRoles()
		TTT.SetRoundState(ROUND_PLAYING)
		SetGlobalFloat("TTT:RoundEnd", CurTime() + TTT.Config.LengthRound)
		for role, plys in pairs(roles) do
			if not plys then continue end
			for _, ply in pairs(plys) do
				ply:SetRole(role)
			end
		end
		return
	end

	if TTT.GetRoundState() == ROUND_PLAYING then
		Log.Info("Round over: TIMEOUT")
		TTT.SendWin(WIN_TIMEOUT)
		return
	end

	if TTT.GetRoundState() == ROUND_POST then
		local should = hook.Run("TTTShouldRoundStart")
		if should then
			Log.Info("Round progress: POST -> WARMUP")
			TTT.StartRound()
		else
			Log.Info("Round progress: POST -> WAITING")
			TTT.CancelRound()
		end
		return
	end

end
