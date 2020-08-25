
--[[
	TTT -> Hooks library -> TTTProgressRound hook (ServerSide)
	by Tassilo (https://github.com/TASSIA710)
--]]

function GM:TTTProgressRound()

	if TTT.GetRoundState() == ROUND_WARMUP then
		Log.Info("Round progress: WARMUP -> PLAYING")

		-- Reset players healths
		for _, ply in pairs(player.GetAll()) do
			if ply:IsSpectator() then continue end
			if not ply:Alive() then
				ply:Spawn()
			end
			ply:SetHealth(100)
		end

		-- Clear current corpses because someone died in warmup
		for _, ent in pairs(ents.FindByClass("prop_ragdoll")) do
			ent:Remove()
		end

		-- Set round state
		TTT.SetRoundState(ROUND_PLAYING)
		SetGlobalFloat("TTT:RoundEnd", CurTime() + TTT.Config.LengthRound)

		-- Set roles
		local roles = TTT.DecideRoles()
		for role, plys in pairs(roles) do
			if not plys then continue end
			for _, ply in pairs(plys) do
				if role == ROLE_TRAITOR then
					ply:SetCredits(TTT.Config.TraitorCreditsStarting)
				elseif role == ROLE_DETECTIVE then
					ply:SetCredits(TTT.Config.DetectiveCreditsStarting)
				end
				ply:SetRole(role)
			end
		end

		-- Check win to make sure
		TTT.CheckWin()
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
