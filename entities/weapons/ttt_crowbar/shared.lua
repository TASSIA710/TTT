
--[[
	TTT -> SWEPs -> Crowbar (Shared)
	by Tassilo (https://github.com/TASSIA710)
--]]

SWEP.Weight = 5
SWEP.PrintName = "Crowbar"
SWEP.Slot = 0
SWEP.SlotPos = 1
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false

SWEP.Author =  "Tassilo"
SWEP.Contact = "tassia@tassia.net"
SWEP.Purpose = ""
SWEP.Instructions = ""
SWEP.Category = "Trouble in Terrorist Town"

SWEP.Spawnable = true
SWEP.AdminSpawnable = true

SWEP.ViewModel = "models/weapons/v_crowbar.mdl"
SWEP.WorldModel = "models/weapons/w_crowbar.mdl"

SWEP.Primary.Damage = 20
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "none"
SWEP.Primary.Delay = 0.5

SWEP.Secondary.Damage = 20
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"
SWEP.Secondary.Delay = 0.5



function SWEP:Reload()
	-- Do nothing
end



function SWEP:Think()
	-- Do nothing
end



function SWEP:PrimaryAttack()
	-- Do nothing
end



function SWEP:SecondaryAttack()
	-- Do nothing
end
