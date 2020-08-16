
--[[
	TTT -> Derma library -> Win Screen (ClientSide)
	by Tassilo (https://github.com/TASSIA710)
--]]

local WIN_BANNER = {}

local win_states = {
	[WIN_NONE] = { TTT.Lang.Win_Error, Color(0, 0, 0) },
	[WIN_TIMEOUT] = { TTT.Lang.Win_Timeout, Color(0, 0, 0) },
	[WIN_INNOCENT] = { TTT.Lang.Win_Innocent, Color(0, 195, 0) },
	[WIN_TRAITOR] = { TTT.Lang.Win_Traitor, Color(195, 0, 0) },
	[WIN_JESTER] = { TTT.Lang.Win_Jester, Color(127, 127, 0) },
	[WIN_SERIAL_KILLER] = { TTT.Lang.Win_SerialKiller, Color(63, 0, 0) },
	[WIN_INFECTED] = { TTT.Lang.Win_Infected, Color(95, 127, 0) }
}

function WIN_BANNER:Paint(w, h)
	local win = TTT._WinState
	TTT.HUD.DrawRectangle(0, 0, w, h, win_states[win][1], win_states[win][2])
end

vgui.Register("TTT:WinBanner", WIN_BANNER, "Panel")





local FRAME = {}

function FRAME:Init()
	local w, h = ScrW() * 0.5, ScrH() * 0.5
	self:SetDeleteOnClose(true)
	self:SetTitle(TTT.Lang.Win_Title)
	self:SetSize(w, h)
	self:Center()

	self.WinBanner = vgui.Create("TTT:WinBanner", self)
	self.WinBanner:SetSize(w - 48 * 2, 48)
	self.WinBanner:SetPos(48, 48)
end

function FRAME:OnRemove()
	TTT.Derma._MenuOpen = false
end

vgui.Register("TTT:WinScreen", FRAME, "DFrame")
