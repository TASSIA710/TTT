
--[[
	TTT -> Entities -> Weapon (Shared)
	by Tassilo (https://github.com/TASSIA710)
--]]

ENT.Type = "anim"
ENT.Base = "base_anim"

ENT.Category = "Trouble in Terrorist Town"
ENT.Spawnable = false
ENT.Editable = false
ENT.AdminOnly = false
ENT.PrintName = "Weapon"
ENT.Author = "Tassilo"
ENT.Contact = ""
ENT.Purpose = ""
ENT.Instructions = ""
ENT.RenderGroup = RENDERGROUP_OPAQUE

ENT.Model = nil
ENT.WeaponClass = nil



function ENT:Initialize()
	if not self.Model then
		Log.Warning("ttt_weapon entity spawned without setting Model.")
		self:Remove()
		return
	end
	if not self.Model then
		Log.WeaponClass("ttt_weapon entity spawned without setting WeaponClass.")
		self:Remove()
		return
	end

	self:SetTrigger(true)
	self:SetModel(self.Model)
end



function ENT:StartTouch(ent)
	if not IsValid(ent) then return end
	if not ent:IsPlayer() then return end

	Log.Debug(ply, "picked up", self.WeaponClass, "@", self:GetPos())
	ply:Give(self.WeaponClass)
	self:Remove()
end
