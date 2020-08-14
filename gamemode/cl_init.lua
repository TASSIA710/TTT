
--[[
	TTT -> Boot Entry (ClientSide)
	by Tassilo (https://github.com/TASSIA710)
--]]



-- Generic stuff
local start = SysTime()
AddCSLuaFile("sh_logging.lua")
include("sh_logging.lua")



-- Print start
Log.Info("------------------------------")
Log.Info("[TTT] Booting...")



-- Load shared
include("shared.lua")



-- Boot sequence
include("core/cl_init.lua")



-- Start gamemode
-- TODO



-- Print finished
Log.Info("[TTT] Done! Took " .. math.Round((SysTime() - start) * 1000, 2) .. "ms")
Log.Info("------------------------------")
