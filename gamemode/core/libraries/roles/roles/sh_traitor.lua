
--[[
	TTT -> Roles library -> Traitor Role (Shared)
	by Tassilo (https://github.com/TASSIA710)
--]]

local ROLE = {}

ROLE.HudText = TTT.Lang.HUD_Role_Traitor
ROLE.HudColor = Color(195, 0, 0)

ROLE.BuyMenu = function()
	if not CLIENT then return end
	TTT.Derma.ShowTraitorShop()
end

ROLE.RevealOnStart = false
ROLE.RevealOnDead = true
ROLE.CanUseTraitorButton = true
ROLE.TriggersTraitorCheck = true

TTT.Roles[ROLE_TRAITOR] = ROLE
