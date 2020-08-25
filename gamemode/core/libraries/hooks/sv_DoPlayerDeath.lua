
--[[
	TTT -> Hooks library -> DoPlayerDeath hook (ServerSide)
	by Tassilo (https://github.com/TASSIA710)
--]]

function GM:DoPlayerDeath(ply, attacker, dmg)

	-- Create the players corpse
	TTT.Corpses.CreateCorpse(ply, attacker, dmg)

end
