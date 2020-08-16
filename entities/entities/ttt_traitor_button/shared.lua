
--[[
	TTT -> Entities -> ttt_traitor_button (Shared)
	Ported from: https://github.com/Facepunch/garrysmod/blob/master/garrysmod/gamemodes/terrortown/entities/entities/ttt_traitor_button.lua
--]]

ENT.Type = "anim"
ENT.Base = "base_anim"

function ENT:SetupDataTables()
	self:NetworkVar("Float", 0, "Delay")
	self:NetworkVar("Float", 1, "NextUseTime")
	self:NetworkVar("Bool", 0, "Locked")
	self:NetworkVar("String", 0, "Description")
	self:NetworkVar("Int", 0, "UsableRange", { KeyName = "UsableRange" })
end

function ENT:IsUsable()
	return not self:GetLocked() and self:GetNextUseTime() < CurTime()
end
