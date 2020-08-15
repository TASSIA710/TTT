
--[[
	TTT -> Hooks library -> Think hook (ServerSide)
	by Tassilo (https://github.com/TASSIA710)
--]]

function GM:Think()

	local roundEnd = GetGlobalFloat("TTT:RoundEnd", 0)
	if roundEnd ~= 0 and CurTime() >= roundEnd then
		SetGlobalFloat("TTT:RoundEnd", 0)
		hook.Run("TTTProgressRound")
	end

end
