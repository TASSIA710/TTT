
--[[
	TTT -> Entities -> ttt_map_settings (Shared)
	Ported from: https://github.com/Facepunch/garrysmod/blob/master/garrysmod/gamemodes/terrortown/entities/entities/ttt_map_settings.lua
--]]

ENT.Type = "point"
ENT.Base = "base_point"

function ENT:Initialize()
	timer.Simple(0, function()
		self:TriggerOutput("MapSettingsSpawned", self)
	end)
end

function ENT:KeyValue(key, value)
	-- TODO
end

function ENT:AcceptInput(name, activator, caller, data)
	if name ~= "SetPlayerModels" then return end
	local mdlname = tostring(data)
	if not mdlname then
		Log.Warning(self, "- Invalid parameter to SetPlayerModels input!")
		return false
	elseif not util.IsValidModel(mdlname) then
		Log.Warning(self, "- Invalid model given: " .. mdlname)
		return false
	end
	-- TODO: Force player models
	return true
end

function ENT:RoundStateTrigger()
	-- TODO
end
