
--[[
	TTT -> Entities -> ttt_random_ammo (Shared)
	Ported from: https://github.com/Facepunch/garrysmod/blob/master/garrysmod/gamemodes/terrortown/entities/entities/ttt_random_ammo.lua
--]]

ENT.Type = "point"
ENT.Base = "base_point"

function ENT:Initialize()
	-- 50% chance of not spawning, to make maps more unique
	if math.random(2) == 2 then return end

	local ammo = table.Random(TTT.Config.Ammunitions)
	local ent = ents.Create(ammo)
	if IsValid(ent) then
		ent:SetPos(self:GetPos())
		ent:SetAngles(self:GetAngles())
		ent:Spawn()
		ent:PhysWake()
	end
	self:Remove()
end
