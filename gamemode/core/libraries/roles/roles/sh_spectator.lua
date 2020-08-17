
--[[
	TTT -> Roles library -> Spectator Role (Shared)
	by Tassilo (https://github.com/TASSIA710)
--]]

local ROLE = {}

ROLE.HudText = TTT.Lang.HUD_Role_Spectator
ROLE.HudColor = Color(195, 127, 0)

ROLE.BuyMenu = nil

ROLE.RevealOnStart = true
ROLE.RevealOnDead = true
ROLE.CanUseTraitorButton = false
ROLE.TriggersTraitorCheck = false

TTT.Roles[ROLE_SPECTATOR] = ROLE
