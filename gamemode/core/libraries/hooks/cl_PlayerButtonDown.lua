
--[[
	TTT -> Hooks library -> PlayerButtonDown hook (ClientSide)
	by Tassilo (https://github.com/TASSIA710)
--]]

local drop_cooldown = 0

function GM:PlayerButtonDown(ply, btn)

	if btn == KEY_Q and CurTime() > (drop_cooldown + 2) then
		drop_cooldown = CurTime()
		net.Start("TTT:DropWeapon")
		net.SendToServer()
		return
	end

	if btn == KEY_F1 then
		if TTT.GetRoundState() == ROUND_PLAYING then
			if LocalPlayer():IsTraitor() then
				TTT.Derma.ShowTraitorShop()
			elseif LocalPlayer():IsDetective() then
			end
		else
			TTT.Derma.ShowWinScreen()
		end
	end

end
