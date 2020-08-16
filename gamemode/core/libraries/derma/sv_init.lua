
--[[
	TTT -> Derma library (ServerSide)
	by Tassilo (https://github.com/TASSIA710)
--]]

TTT.Derma = {}

-- Download files
AddCSLuaFile("cl_vgui_traitorshop.lua")
AddCSLuaFile("cl_vgui_ttt_button.lua")
AddCSLuaFile("cl_vgui_ttt_frame.lua")
AddCSLuaFile("cl_vgui_winscreen.lua")





-- >> Show Message
--- Networked to show a message in the top left corner.
-- @direction SV --> CL
util.AddNetworkString("TTT:ShowMessage")

--- Shows a message in the top right corner.
-- @param text [string] - the text to display
-- @param color [Color] - the color
-- @param duration [number] (=5) - how long should the notification stay
-- @param target [Player|RecipientFilter] (=nil) - who to send the message to
function TTT.Derma.ShowMessage(text, color, duration, target)
	net.Start("TTT:ShowMessage")
	net.WriteString(text)
	net.WriteColor(color)
	net.WriteUInt(duration or 5, 8)
	if target then net.Send(target) else net.Broadcast() end
end
-- >> Show Message
