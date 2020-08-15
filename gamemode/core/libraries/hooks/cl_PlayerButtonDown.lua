
--[[
	TTT -> Hooks library -> PlayerButtonDown hook (ClientSide)
	by Tassilo (https://github.com/TASSIA710)
--]]

function GM:PlayerButtonDown(ply, btn)

	if btn == KEY_C then
		if TTT.GetRoundState() ~= ROUND_POST and TTT.GetRoundState() ~= ROUND_WAITING and TTT.GetRoundState() ~= ROUND_WARMUP then return end
		TTT.Derma.ShowWinScreen()
	end

end
