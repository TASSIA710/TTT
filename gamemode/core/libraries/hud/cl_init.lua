
--[[
	TTT -> HUD library (ClientSide)
	by Tassilo (https://github.com/TASSIA710)
--]]

TTT.HUD = {}


-- Include themes
local theme_edge = include("themes/edge.lua")



-- >> HUD Paint
function GM:HUDPaint()
	theme_edge()
end
-- >> HUD Paint



-- >> HUD Should Draw
local draw = {
	["CHudChat"] = true,
	["CHudGMod"] = true,
	["CHudMenu"] = true,
	["CHudWeaponSelection"] = true,
	["CHudZoom"] = true,
	["NetGraph"] = true
}
function GM:HUDShouldDraw(name)
	return draw[name] == true
end
-- >> HUD Should Draw
