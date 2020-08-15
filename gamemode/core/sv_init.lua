
--[[
	TTT -> Core (ServerSide)
	by Tassilo (https://github.com/TASSIA710)
--]]


-- Load enumerations
Log.Info("Loading enumerations...")
AddCSLuaFile("sh_enumerations.lua")
include("sh_enumerations.lua")


-- Load configuration
Log.Info("Loading configuration...")
AddCSLuaFile("sh_configuration.lua")
include("sh_configuration.lua")


-- Load libraries
AddCSLuaFile("libraries/shared.lua")
include("libraries/shared.lua")


-- Load plugins
AddCSLuaFile("plugins/cl_init.lua")
include("plugins/sv_init.lua")
