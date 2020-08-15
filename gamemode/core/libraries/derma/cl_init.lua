
--[[
	TTT -> Derma library (ClientSide)
	by Tassilo (https://github.com/TASSIA710)
--]]

TTT.Derma = {}

-- Include files
include("cl_vgui_ttt_button.lua")
include("cl_vgui_ttt_frame.lua")
include("cl_vgui_winscreen.lua")



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
