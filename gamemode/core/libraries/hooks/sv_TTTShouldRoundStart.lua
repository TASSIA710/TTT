
--[[
	TTT -> Hooks library -> TTTShouldRoundStart hook (ServerSide)
	by Tassilo (https://github.com/TASSIA710)
--]]

function GM:TTTShouldRoundStart()
	local count = 0
	for _, ply in pairs(player.GetAll()) do
		if not ply:IsSpectator() then
			count = count + 1
		end
	end
	return count >= TTT.Config.MinPlayers
end
