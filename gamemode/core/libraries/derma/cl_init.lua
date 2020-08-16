
--[[
	TTT -> Derma library (ClientSide)
	by Tassilo (https://github.com/TASSIA710)
--]]

TTT.Derma = {}

-- Include files
include("cl_vgui_ttt_button.lua")
include("cl_vgui_ttt_frame.lua")
include("cl_vgui_winscreen.lua")





-- >> Show Message
TTT.Derma._Messages = {}

net.Receive("TTT:ShowMessage", function(len)
	local data = {
		Text = net.ReadString(),
		Color = net.ReadColor(),
		Duration = net.ReadUInt(8),
		Start = CurTime()
	}
	table.insert(TTT.Derma._Messages, data)
	timer.Simple(data.Duration, function()
		table.RemoveByValue(TTT.Derma._Messages, data)
	end)
end)
-- >> Show Message





-- >> Win Screen
TTT.Derma._WinScreenOpen = false

--- Opens the win screen at the end of the round.
function TTT.Derma.ShowWinScreen()
	if TTT.Derma._WinScreenOpen then return end
	if TTT._WinState == WIN_NONE then return end
	TTT.Derma._WinScreenOpen = true

	local frame = vgui.Create("TTT:WinScreen")
	frame:MakePopup()
end
-- >> Win Screen
