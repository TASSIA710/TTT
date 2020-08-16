
--[[
	TTT -> Hooks library -> PostPlayerDeath hook (ServerSide)
	by Tassilo (https://github.com/TASSIA710)
--]]

function GM:PostPlayerDeath(ply)
	ply._JustDied = true
	TTT.CheckWin()
end
