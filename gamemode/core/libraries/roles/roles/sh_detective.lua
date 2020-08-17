
--[[
	TTT -> Roles library -> Detective Role (Shared)
	by Tassilo (https://github.com/TASSIA710)
--]]

local ROLE = {}

ROLE.HudText = TTT.Lang.HUD_Role_Detective
ROLE.HudColor = Color(0, 0, 195)

ROLE.BuyMenu = function()
	if not CLIENT then return end
	TTT.Derma.ShowDetectiveShop()
end

ROLE.RevealOnStart = true
ROLE.RevealOnDead = true
ROLE.CanUseTraitorButton = false
ROLE.TriggersTraitorCheck = false

TTT.Roles[ROLE_DETECTIVE] = ROLE
