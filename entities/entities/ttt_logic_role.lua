
--[[
	TTT -> Entities -> ttt_logic_role (Shared)
	Ported from: https://github.com/Facepunch/garrysmod/blob/master/garrysmod/gamemodes/terrortown/entities/entities/ttt_logic_role.lua
--]]

ENT.Type = "point"
ENT.Base = "base_point"

local OLD_ROLE_INNOCENT = 0
local OLD_ROLE_TRAITOR = 1
local OLD_ROLE_DETECTIVE = 2
local OLD_ROLE_ANY = 3

ENT.Role = OLD_ROLE_ANY



function ENT:KeyValue(key, value)
	if key == "OnPass" or key == "OnFail" then
		self:StoreOutput(key, value)
	elseif key == "Role" then
		self.Role = tonumber(value)
		if not self.Role then
			Log.Warning(self, "- bad value for role: NaN")
			self.Role = OLD_ROLE_ANY
		end
	end
end



local function passTest(ent, ply)
	ent:TriggerOutput("OnPass", ply)
	Log.Debug(ply, "passed the logic-role test of", ent:GetName(), "-", ent)
end

local function failTest(ent, ply)
	ent:TriggerOutput("OnFail", ply)
	Log.Debug(ply, "failed the logic-role test of", ent:GetName(), "-", ent)
end

local function test(ent, ply, condition)
	if condition then
		passTest(ent, ply)
	else
		failTest(ent, ply)
	end
end

function ENT:AcceptInput(name, activator)
	if name ~= "TestActivator" then return end
	if IsValid(activator) and activator:IsPlayer() then
		if TTT.GetRoundState() == ROUND_PLAYING then
			if self.Role == OLD_ROLE_INNOCENT then
				test(self, activator, activator:IsInnocent() and activator:IsAlive())
			elseif self.Role == OLD_ROLE_TRAITOR then
				test(self, activator, activator:IsTraitor() and activator:IsAlive())
			elseif self.Role == OLD_ROLE_DETECTIVE then
				test(self, activator, activator:IsDetective() and activator:IsAlive())
			elseif self.Role == OLD_ROLE_ANY then
				test(self, activator, activator:IsAlive())
			else
				-- Unknown role, so fail
				failTest(self, activator)
				Log.Warning(self, "is setup with a wrong role:", self.Role)
			end
		else
			test(self, activator, self.Role == OLD_ROLE_ANY or self.Role == OLD_ROLE_INNOCENT)
		end
	end
	return true
end
