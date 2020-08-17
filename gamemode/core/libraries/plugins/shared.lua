
--[[
	TTT -> Plugins library (Shared)
	by Tassilo (https://github.com/TASSIA710)
--]]

TTT.Plugins = {}
local plugins = {}



--- Loads a plugin by its folder name.
-- @param name [string] - the folder name
-- @returns success [boolean] - whether the plugin was loaded successfully
function TTT.Plugins.LoadPlugin(name)
	-- Plugin already loaded?
	if plugins[name] then return not plugins[name].Disabled end

	-- Define paths
	local abs_path = "terrortown/gamemode/core/plugins/" .. name
	-- local rel_path = "../../plugins/" .. name TODO: Is this still needed?

	-- Check meta file
	if not file.Exists(abs_path .. "/__meta.lua", "LUA") then
		Log.Warning("Failed to load plugin '" .. name .. "': no __meta.lua file found.")
		return false
	end

	-- Load meta
	local meta = include(abs_path .. "/__meta.lua")

	-- Download meta
	if SERVER then
		AddCSLuaFile(abs_path .. "/__meta.lua")
	end

	-- Check ID
	if not meta.ID then
		Log.Warning("Failed to load plugin '" .. name .. "': ID not defined in __meta.lua")
		return false
	end

	-- Check name
	if not meta.Name then
		Log.Warning("Failed to load plugin '" .. name .. "': Name not defined in __meta.lua")
		return false
	end

	-- Default values
	if not meta.Description then meta.Description = "" end
	if not meta.Version then meta.Version = "1.0.0" end
	if not meta.Requires then meta.Requires = TTT.VerMMP end
	if not meta.Depends then meta.Depends = {} end
	if not meta.Disabled then meta.Disabled = false end
	plugins[name] = meta

	-- Is disabled?
	if meta.Disabled then
		Log.Debug("- " .. plugin.Name .. " (disabled)")
		return false
	end

	-- Is compatible?
	-- TODO: Check compatibility

	-- Load depending plugins first
	for _, depend in pairs(meta.Depends) do
		if not TTT.Plugins.LoadPlugin(depend) then
			Log.Warning("Failed to load plugin '" .. name .. "': Dependency '" .. depend .. "' not available.")
			return false
		end
	end

	-- Download and include files
	if file.Exists(abs_path .. "/shared.lua", "LUA") then
		AddCSLuaFile(abs_path .. "/shared.lua")
		include(abs_path .. "/shared.lua")
	end
	if file.Exists(abs_path .. "/sv_init.lua", "LUA") then
		include(abs_path .. "/sv_init.lua")
	end
	if file.Exists(abs_path .. "/cl_init.lua", "LUA") then
		AddCSLuaFile(abs_path .. "/cl_init.lua")
	end
	Log.Debug("- " .. meta.Name)
	return true
end



--- Loads all available plugins in the plugins directory.
-- @returns count [number] - how many plugin folders were detected
-- @returns success [number] - how many plugins were loaded successfully
function TTT.Plugins.LoadPlugins()
	local count, success = 0, 0
	local _, dirs = file.Find("terrortown/gamemode/core/plugins/*", "LUA")
	for _, dir in pairs(dirs) do
		if TTT.Plugins.LoadPlugin(dir) then success = success + 1 end
		count = count + 1
	end
	return count, success
end
