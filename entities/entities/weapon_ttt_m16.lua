
--[[
	TTT -> Entities -> weapon_ttt_m16 (Shared)
	by Tassilo (https://github.com/TASSIA710)
--]]

ENT.Type = "point"
ENT.Base = "base_point"

function ENT:Initialize()
	local ent = ents.Create(TTT.Config.WeaponReplacements["weapon_ttt_m16"])
	if IsValid(ent) then
		ent:SetPos(self:GetPos())
		ent:SetAngles(self:GetAngles())
		ent:Spawn()
		ent:PhysWake()
	end
	self:Remove()
end
