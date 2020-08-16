
--[[
	TTT -> Entities -> ttt_random_weapon (Shared)
	Ported from: https://github.com/Facepunch/garrysmod/blob/master/garrysmod/gamemodes/terrortown/entities/entities/ttt_random_weapon.lua
--]]

ENT.Type = "point"
ENT.Base = "base_point"
ENT.AutoAmmo = 0

function ENT:KeyValue(key, value)
	if key == "auto_ammo" then
		self.AutoAmmo = tonumber(value)
	end
end

function ENT:Initialize()
	-- 50% chance of not spawning, to make maps more unique
	if math.random(2) == 2 then return end

	local wep = TTT.Config.Weapons[math.random(#TTT.Config.Weapons)]
	local ent = ents.Create(wep)
	if IsValid(ent) then
		local pos = self:GetPos()
		ent:SetPos(pos)
		ent:SetAngles(self:GetAngles())
		ent:Spawn()
		ent:PhysWake()
		local ammoEnt = TTT.Config.Ammunitions[ent.Primary.Ammo]
		if ammoEnt and self.AutoAmmo > 0 then
			for i = 1, self.AutoAmmo do
				local ammo = ents.Create(ammoEnt)
				if IsValid(ammo) then
					pos.z = pos.z + 3
					ammo:SetPos(pos)
					ammo:SetAngles(VectorRand():Angle())
					ammo:Spawn()
					ammo:PhysWake()
				end
			end
		end
	end
	self:Remove()
end
