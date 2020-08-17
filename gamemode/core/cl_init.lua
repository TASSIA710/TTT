
--[[
	TTT -> Core (ClientSide)
	by Tassilo (https://github.com/TASSIA710)
--]]


-- Load enumerations
Log.Info("Loading enumerations...")
include("sh_enumerations.lua")


-- Load configuration
Log.Info("Loading configuration...")
include("sh_configuration.lua")


-- Load language
Log.Info("Loading language...")
include("language/sh_" .. TTT.Config.Language .. ".lua")


-- Load libraries
include("libraries/shared.lua")


-- Load plugins
include("plugins/shared.lua")
