
--[[
	TTT -> Libraries (Shared)
	by Tassilo (https://github.com/TASSIA710)
--]]


-- Define libraries
local libraries = {
	"corpses",
	"database",
	"derma",
	"generic",
	"hooks",
	"hud",
	"items",
	"metatables",
	"plugins",
	"roles",
	"scoreboard"
}


-- Print log
Log.Info("Loading libraries...")

-- Load libraries
for _, lib in pairs(libraries) do
	Log.Debug("- " .. lib)
	if SERVER then
		AddCSLuaFile(lib .. "/cl_init.lua")
		include(lib .. "/sv_init.lua")
	else
		include(lib .. "/cl_init.lua")
	end
end

-- Print log
Log.Info("Loaded " .. #libraries .. " libraries!")
