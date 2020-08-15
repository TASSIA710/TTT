
--[[
	TTT -> Derma library -> TTTButton (ClientSide)
	by Tassilo (https://github.com/TASSIA710)
--]]

local BUTTON = {}



function BUTTON:Init()
end



local border_length = 15
function BUTTON:Paint(w, h)

	-- Background
	surface.SetDrawColor(127, 127, 127, 63)
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



vgui.Register("TTTButton", BUTTON, "DButton")
