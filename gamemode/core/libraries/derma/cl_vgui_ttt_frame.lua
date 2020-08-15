
--[[
	TTT -> Derma library -> TTTFrame (ClientSide)
	by Tassilo (https://github.com/TASSIA710)
--]]

local FRAME = {}



function FRAME:Init()
	--self:ShowCloseButton(false)
	self:SetTitle("")

	local btn = vgui.Create("TTTButton", self)
	btn:SetSize(64,64)
	btn:SetPos(64,64)
end



local border_length = 15
function FRAME:Paint(w, h)
	-- Shadow (or well something alike)
	surface.SetDrawColor(0, 0, 0, 127)
	surface.DrawRect(0, 0, w, h)

	-- Background
	surface.SetDrawColor(0, 0, 0, 195)
	surface.DrawRect(1, 1, w - 2, h - 2)

	-- Border
	surface.SetDrawColor(255, 255, 255, 127)
	surface.DrawOutlinedRect(1, 1, w - 2, h - 2)
	surface.SetDrawColor(255, 255, 255, 195)

	-- Corner: TopLeft
	surface.DrawRect(0, 0, 3 + border_length, 3)
	surface.DrawRect(0, 0, 3, 3 + border_length)

	-- Corner: TopRight
	surface.DrawRect(w - border_length - 3, 0, 3 + border_length, 3)
	surface.DrawRect(w - 3, 0, 3, 3 + border_length)

	-- Corner: BottomLeft
	surface.DrawRect(0, h - 3, 3 + border_length, 3)
	surface.DrawRect(0, h - border_length - 3, 3, 3 + border_length)

	-- Corner: BottomRight
	surface.DrawRect(w - border_length - 3, h - 3, 3 + border_length, 3)
	surface.DrawRect(w - 3, h - border_length - 3, 3, 3 + border_length)
end



vgui.Register("TTTFrame", FRAME, "DFrame")
