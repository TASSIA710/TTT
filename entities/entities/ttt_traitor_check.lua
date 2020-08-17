
--[[
	TTT -> Entities -> ttt_traitor_check (Shared)
	Ported from: https://github.com/Facepunch/garrysmod/blob/master/garrysmod/gamemodes/terrortown/entities/entities/ttt_traitor_check.lua
--]]

ENT.Type = "brush"
ENT.Base = "base_brush"

function ENT:KeyValue(key, value)
	if key == "TraitorsFound" then
		self:StoreOutput(key, value)
	end
end

local function VectorInside(vec, mins, maxs)
	return vec.x > mins.x and vec.x < maxs.x
			and vec.y > mins.y and vec.y < maxs.y
			and vec.z > mins.z and vec.z < maxs.z
end

function ENT:CountTraitors()
	local mins = self:LocalToWorld(self:OBBMins())
	local maxs = self:LocalToWorld(self:OBBMaxs())
	local traitors = 0
	for _, ply in pairs(player.GetAll()) do
		if IsValid(ply) and ply:IsAlive() then
			local pos = ply:GetPos()
			local role = ply:Role()
			if VectorInside(pos, mins, maxs) and role.TriggersTraitorCheck then
				traitors = traitors + 1
			end
		end
	end
	return traitors
end

function ENT:AcceptInput(name, activator, caller)
	if name == "CheckForTraitor" then
		self:TriggerOutput("TraitorsFound", activator, self:CountTraitors())
		return true
	end
end
