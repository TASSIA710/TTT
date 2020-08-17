
--[[
	TTT -> Hooks library -> PostEntityTakeDamage hook (ServerSide)
	by Tassilo (https://github.com/TASSIA710)
--]]

function GM:PostEntityTakeDamage(ent, dmg, took)
	if not ent:IsPlayer() then return end
	if not took then return end
	Log.Debug(dmg:GetAttacker(), "damaged", ent, "by", dmg:GetDamage(), "DMG using", dmg:GetInflictor())
end
