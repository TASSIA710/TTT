
--[[
	TTT -> Boot Entry -> Logging Module (Shared)
	by Tassilo (https://github.com/TASSIA710)
--]]

Log = {}
local pterodactyl = false
local log_info = true
local log_warning = true
local log_error = true
local log_debug = true
local log_net = true



local function varargsToString(level, ...)
	local args, str = {...}, ""
	for _, arg in pairs(args) do
		if isentity(arg) then
			if arg:IsPlayer() then
				arg = arg:Nick() .. " (" .. arg:UserID() .. ")"
			else
				arg = arg:GetClass() .. "-" .. arg:EntIndex()
			end
		elseif isvector(arg) then
			arg = arg.x .. ", " .. arg.y .. ", " .. arg.z
		end
		str = str .. " " .. tostring(arg)
	end
	return os.date("%c") .. " | " .. level .. " | " .. string.sub(str, 2)
end



--- Logs a message with the `INFO` level.
-- @param msg [varargs] - the message to log
function Log.Info(...)
	if not log_info then return end
	if SERVER and pterodactyl then print("\27[38;2;255;255;255m" .. varargsToString("  INFO", ...) .. "\27[0m")
	else MsgC(Color(255, 255, 255), varargsToString("  INFO", ...) .. "\n") end
end



--- Logs a message with the `WARN` level.
-- @param msg [varargs] - the message to log
function Log.Warning(...)
	if not log_warning then return end
	if SERVER and pterodactyl then print("\27[38;2;255;191;0m" .. varargsToString("  WARN", ...) .. "\27[0m")
	else MsgC(Color(255, 191, 0), varargsToString("  WARN", ...) .. "\n") end
end



--- Logs a message with the `ERROR` level.
-- @param msg [varargs] - the message to log
function Log.Error(...)
	if not log_error then return end
	if SERVER and pterodactyl then print("\27[38;2;255;0;0m" .. varargsToString(" ERROR", ...) .. "\27[0m")
	else MsgC(Color(255, 0, 0), varargsToString(" ERROR", ...) .. "\n") end
end



--- Logs a message with the `SEVERE` level.
-- @param msg [varargs] - the message to log
function Log.Severe(...)
	if SERVER and pterodactyl then print("\27[101;93m" .. varargsToString("SEVERE", ...) .. "\27[0m")
	else MsgC(Color(255, 0, 0), varargsToString("SEVERE", ...) .. "\n") end
end



--- Logs a message with the `DEBUG` level.
-- @param msg [varargs] - the message to log
function Log.Debug(...)
	if not log_debug then return end
	if SERVER and pterodactyl then print("\27[38;2;127;127;127m" .. varargsToString(" DEBUG", ...) .. "\27[0m")
	else MsgC(Color(151, 151, 151), varargsToString(" DEBUG", ...) .. "\n") end
end



--- Logs a message with the `NET` level.
-- @param msg [varargs] - the message to log
function Log.Net(...)
	if not log_net then return end
	if SERVER and pterodactyl then print("\27[38;2;127;127;255m" .. varargsToString("   NET", ...) .. "\27[0m")
	else MsgC(Color(127, 127, 255), varargsToString("   NET", ...) .. "\n") end
end





-- >> Error Overrides
local default_error = error
local default_Error = Error
local default_ErrorNoHalt = ErrorNoHalt

function error(msg, error_level)
	Log.Severe(msg)
	default_error(msg, error_level)
end

function Error(...)
	Log.Error(varargsToString(...))
	default_Error(...)
end

function ErrorNoHalt(...)
	Log.Error(varargsToString(...))
	default_ErrorNoHalt(...)
end
-- >> Error Overrides





-- >> Net Overrides
local default_NetStart = net.Start
local default_NetReceive = net.Receive

function net.Start(msg, unreliable)
	default_NetStart(msg, unreliable)
	if SERVER then
		Log.Net("SV --> CL | " .. msg)
	else
		Log.Net("SV <-- CL | " .. msg)
	end
end

function net.Receive(msg, callback)
	default_NetReceive(msg, function(len, ply)
		callback(len, ply)
		if SERVER then
			Log.Net("SV <-- CL | " .. msg)
		else
			Log.Net("SV --> CL | " .. msg)
		end
	end)
end
-- >> Net Overrides
