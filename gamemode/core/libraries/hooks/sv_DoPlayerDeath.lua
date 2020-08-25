
--[[
	TTT -> Hooks library -> DoPlayerDeath hook (ServerSide)
	by Tassilo (https://github.com/TASSIA710)
--]]

function GM:DoPlayerDeath(ply, attacker, dmg)

	-- TODO: Drop players weapons

	-- Create the players corpse and make the player spectate that one
	local corpse = TTT.Corpses.CreateCorpse(ply, attacker, dmg)
	if IsValid(corpse) then
		ply:Spectate(OBS_MODE_CHASE)
		ply:SpectateEntity(corpse)
	else
		ply:Spectate(OBS_MODE_ROAMING)
	end

	-- Strip current weapons from ply
	ply:StripWeapons()

	-- TODO: Award killer with credits

	-- TODO: Send last words

end
