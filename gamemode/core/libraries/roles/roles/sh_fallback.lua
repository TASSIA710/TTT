
--[[
	TTT -> Roles library -> Fallback Role (Shared)
	by Tassilo (https://github.com/TASSIA710)
--]]

local ROLE = {}

ROLE.HudText = TTT.Lang.HUD_Role_Fallback
ROLE.HudColor = Color(0, 0, 0)

ROLE.BuyMenu = nil

ROLE.RevealOnStart = false
ROLE.RevealOnDead = true
ROLE.CanUseTraitorButton = false
ROLE.TriggersTraitorCheck = false

TTT.Roles[ROLE_FALLBACK] = ROLE
