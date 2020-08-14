
--[[
	TTT -> Boot Entry -> Logging Module (Shared)
	by Tassilo (https://github.com/TASSIA710)
--]]

Log = {}
local log_info = true
local log_warning = true
local log_error = true
local log_debug = true
local log_net = true



local function varargsToString(level, ...)
	local args, str = {...}, ""
	for _, arg in pairs(args) do
		str = str .. " " .. tostring(arg)
	end
	return os.date("%c") .. " | " .. level .. " | " .. string.sub(str, 2)
end



--- Logs a message with the `INFO` level.
-- @param msg [varargs] the message to log
function Log.Info(...)
	if not log_info then return end
	if SERVER then print("\27[38;2;255;255;255m" .. varargsToString("  INFO", ...) .. "\27[0m")
	else MsgC(Color(255, 255, 255), varargsToString("  INFO", ...) .. "\n") end
end



--- Logs a message with the `WARN` level.
-- @param msg [varargs] the message to log
function Log.Warning(...)
	if not log_warning then return end
	if SERVER then print("\27[38;2;255;191;0m" .. varargsToString("  WARN", ...) .. "\27[0m")
	else MsgC(Color(255, 191, 0), varargsToString("  WARN", ...) .. "\n") end
end



--- Logs a message with the `ERROR` level.
-- @param msg [varargs] the message to log
function Log.Error(...)
	if not log_error then return end
	if SERVER then print("\27[38;2;255;0;0m" .. varargsToString(" ERROR", ...) .. "\27[0m")
	else MsgC(Color(255, 0, 0), varargsToString(" ERROR", ...) .. "\n") end
end



--- Logs a message with the `SEVERE` level.
-- @param msg [varargs] the message to log
function Log.Severe(...)
	if SERVER then print("\27[101;93m" .. varargsToString("SEVERE", ...) .. "\27[0m")
	else MsgC(Color(255, 0, 0), varargsToString("SEVERE", ...) .. "\n") end
end



--- Logs a message with the `DEBUG` level.
-- @param msg [varargs] the message to log
function Log.Debug(...)
	if not log_debug then return end
	if SERVER then print("\27[38;2;127;127;127m" .. varargsToString(" DEBUG", ...) .. "\27[0m")
	else MsgC(Color(127, 127, 127), varargsToString(" DEBUG", ...) .. "\n") end
end



--- Logs a message with the `NET` level.
-- @param msg [varargs] the message to log
function Log.Net(...)
	if not log_net then return end
	if SERVER then print("\27[38;2;127;127;255m" .. varargsToString("   NET", ...) .. "\27[0m")
	else MsgC(Color(127, 127, 255), varargsToString("   NET", ...) .. "\n") end
end
