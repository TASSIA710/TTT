
--[[
	TTT -> Roles library (Shared)
	by Tassilo (https://github.com/TASSIA710)
--]]

TTT.Roles = {}


-- Download files
if SERVER then
	AddCSLuaFile("roles/sh_fallback.lua")
	AddCSLuaFile("roles/sh_innocent.lua")
	AddCSLuaFile("roles/sh_traitor.lua")
	AddCSLuaFile("roles/sh_detective.lua")
	AddCSLuaFile("roles/sh_spectator.lua")
end


-- Include files
include("roles/sh_fallback.lua")
include("roles/sh_innocent.lua")
include("roles/sh_traitor.lua")
include("roles/sh_detective.lua")
include("roles/sh_spectator.lua")
