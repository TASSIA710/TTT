
--[[
	TTT -> Entities -> ttt_credit_adjust (Shared)
	Ported from: https://github.com/Facepunch/garrysmod/blob/master/garrysmod/gamemodes/terrortown/entities/entities/ttt_credit_adjust.lua
--]]

ENT.Type = "point"
ENT.Base = "base_point"

ENT.Credits = 0

function ENT:KeyValue(key, value)
	if key == "OnSuccess" or key == "OnFail" then
		self:StoreOutput(key, value)
	else
		if not tonumber(value) then
			Log.Warning(self, "has bad 'credits' setting.")
		else
			self.Credits = tonumber(value) or 0
		end
	end
end

function ENT:AcceptInput(name, activator)
	if name ~= "TakeCredits" then return end
	if IsValid(activator) and activator:IsPlayer() then
		if self:GetCredits() >= self.Credits then
			activator:SetCredits(activator:GetCredits() - self.Credits)
			self:TriggerOutput("OnSuccess", activator)
		else
			self:TriggerOutput("OnFail", activator)
		end
	end
	return true
end
