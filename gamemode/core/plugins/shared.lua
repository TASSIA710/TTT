
--[[
	TTT -> Plugins (Shared)
	by Tassilo (https://github.com/TASSIA710)
--]]

-- Print log
Log.Info("Loading plugins...")

-- Load plugins
local count, success = TTT.Plugins.LoadPlugins()

-- Print log
if count == success then
	Log.Info("Loaded all " .. count .. " plugins.")
else
	Log.Info("Loaded " .. success .. " out of " .. count .. " available plugins.")
end
