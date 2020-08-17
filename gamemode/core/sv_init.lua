
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


-- Load language
Log.Info("Loading language...")
AddCSLuaFile("language/sh_" .. TTT.Config.Language .. ".lua")
include("language/sh_" .. TTT.Config.Language .. ".lua")


-- Load libraries
AddCSLuaFile("libraries/shared.lua")
include("libraries/shared.lua")


-- Load plugins
AddCSLuaFile("plugins/shared.lua")
include("plugins/shared.lua")
