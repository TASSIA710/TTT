
--[[
	TTT -> Hooks library -> PlayerCanPickupWeapon hook (ServerSide)
	by Tassilo (https://github.com/TASSIA710)
--]]

function GM:PlayerCanPickupWeapon(ply, weapon)
	for _, wep in pairs(ply:GetWeapons()) do
		if wep.Slot == weapon.Slot then return false end
	end
	return true
end
