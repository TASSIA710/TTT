
--[[
	TTT -> Hooks library -> PlayerLoadout hook (ServerSide)
	by Tassilo (https://github.com/TASSIA710)
--]]

function GM:PlayerLoadout(ply)
	ply:StripAmmo()
	ply:StripWeapons()
	ply:Give("ttt_crowbar")
end
