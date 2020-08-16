
--[[
	TTT -> Entities -> ttt_game_text (Shared)
	Ported from: https://github.com/Facepunch/garrysmod/blob/master/garrysmod/gamemodes/terrortown/entities/entities/ttt_game_text.lua
--]]

ENT.Type = "point"
ENT.Base = "base_point"

ENT.Message = ""
ENT.Color = Color(255, 255, 255)

local RECEIVE_ACTIVATOR = 0
local RECEIVE_ALL = 1
local RECEIVE_DETECTIVE = 2
local RECEIVE_TRAITOR = 3
local RECEIVE_INNOCENT = 4

ENT.Receiver = RECEIVE_ACTIVATOR

function ENT:KeyValue(key, value)
	if key == "message" then
		self.Message = tostring(value) or "ERROR: bad value"
	elseif key == "color" then
		local mr, mg, mb = string.match(value, "(%d*) (%d*) (%d*)")
		local c = Color(0, 0, 0)
		c.r = tonumber(mr) or 255
		c.g = tonumber(mg) or 255
		c.b = tonumber(mb) or 255
		self.Color = c
	elseif key == "receive" then
		self.Receiver = tonumber(value)
		if not (self.Receiver and self.Receiver >= 0 and self.Receiver <= 4) then
			Log.Warning("ttt_game_text has invalid receiver value")
			self.Receiver = RECEIVE_ACTIVATOR
		end
	end
end

function ENT:AcceptInput(name, activator)
	if name == "Display" then
		local recv = activator
		local r = self.Receiver
		if r == RECEIVE_ALL then
			recv = nil
		elseif r == RECEIVE_DETECTIVE then
			recv = TTT.GetDetectiveFilter()
		elseif r == RECEIVE_TRAITOR then
			recv = TTT.GetTraitorFilter()
		elseif r == RECEIVE_INNOCENT then
			recv = TTT.GetInnocentFilter()
		elseif r == RECEIVE_ACTIVATOR then
			if not IsValid(activator) or not activator:IsPlayer() then
				Log.Warning("ttt_game_text tried to show message to invalid !activator\n")
				return true
			end
		end
		TTT.Derma.ShowMessage(self.Message, self.Color, 10, recv)
	end
end
