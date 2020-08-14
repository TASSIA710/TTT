
--[[
	TTT -> Boot Entry (ServerSide)
	by Tassilo (https://github.com/TASSIA710)
--]]



-- Generic stuff
local start = SysTime()
AddCSLuaFile("sh_logging.lua")
include("sh_logging.lua")



-- Print start
Log.Info("------------------------------")
Log.Info("Booting...")



-- Load shared
AddCSLuaFile("shared.lua")
include("shared.lua")



-- Boot sequence
AddCSLuaFile("core/cl_init.lua")
include("core/sv_init.lua")



-- Start gamemode
-- TODO



-- Print finished
Log.Info("Done! Took " .. math.Round((SysTime() - start) * 1000, 2) .. "ms")
Log.Info("------------------------------")
