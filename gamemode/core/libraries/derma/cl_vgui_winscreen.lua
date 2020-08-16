
--[[
	TTT -> Derma library -> Win Screen (ClientSide)
	by Tassilo (https://github.com/TASSIA710)
--]]

local WIN_BANNER = {}

local win_states = {
	[WIN_NONE] = { "Error", Color(0, 0, 0) },
	[WIN_TIMEOUT] = { "Timelimit reached!", Color(0, 0, 0) },
	[WIN_INNOCENT] = { "The innocent win!", Color(0, 195, 0) },
	[WIN_TRAITOR] = { "The traitors win!", Color(195, 0, 0) },
	[WIN_JESTER] = { "The jester wins!", Color(127, 127, 0) },
	[WIN_SERIAL_KILLER] = { "The serial killer wins!", Color(63, 0, 0) },
	[WIN_INFECTED] = { "The plague wins!", Color(95, 127, 0) }
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
	self:SetTitle("Round Over!")
	self:SetSize(w, h)
	self:Center()

	self.WinBanner = vgui.Create("TTT:WinBanner", self)
	self.WinBanner:SetSize(w - 48 * 2, 48)
	self.WinBanner:SetPos(48, 48)
end

function FRAME:OnRemove()
	TTT.Derma._WinScreenOpen = false
end

vgui.Register("TTT:WinScreen", FRAME, "DFrame")
