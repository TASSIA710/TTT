
--[[
	TTT -> Entities -> ttt_damageowner (Shared)
	Ported from: https://github.com/Facepunch/garrysmod/blob/master/garrysmod/gamemodes/terrortown/entities/entities/ttt_damageowner.lua
--]]

ENT.Type = "point"
ENT.Base = "base_point"

ENT.Damager = nil
ENT.KillName = nil



function ENT:KeyValue(key, value)
	if key == "damager" then
		self.Damager = tostring(value)
	elseif key == "killname" then
		self.KillName = tostring(value)
	end
end



function ENT:AcceptInput(name, activator, caller, data)
	if name == "SetActivatorAsDamageOwner" then
		if not self.Damager then return end
		if IsValid(activator) and activator:IsPlayer() then
			for _, ent in ipairs(ents.FindByName(self.Damager) or {}) do
				if IsValid(ent) and ent.SetDamageOwner then
					Log.Debug("Setting damage owner on", ent, ent:GetName())
					ent:SetDamageOwner(activator)
					ent.ScoreName = self.KillName
				end
			end
		end
		return true
	end
	if name == "ClearDamageOwner" then
		if not self.Damager then return end
		for _, ent in ipairs(ents.FindByName(self.Damager) or {}) do
			if IsValid(ent) and ent.SetDamageOwner then
				Log.Debug("Clearing damage owner on", ent, ent:GetName())
				ent:SetDamageOwner(nil)
			end
		end
		return true
	end
end
