
--[[
	TTT -> Hooks library -> TTTShouldRoundStart hook (ServerSide)
	by Tassilo (https://github.com/TASSIA710)
--]]

function GM:TTTShouldRoundStart()
	local count = 0
	for _, ply in pairs(player.GetAll()) do
		if ply._AboutToDisconnect then continue end
		if ply:IsSpectator() then continue end
		count = count + 1
	end
	return count >= TTT.Config.MinPlayers
end
