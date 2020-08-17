
--[[
	TTT -> Hooks library -> ScalePlayerDamage hook (ServerSide)
	by Tassilo (https://github.com/TASSIA710)
--]]

function GM:ScalePlayerDamage(ply, hitgroup, dmginfo)
	dmginfo:ScaleDamage(TTT.Config.DamageScales[hitgroup])
end
