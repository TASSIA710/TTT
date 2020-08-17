
--[[
	TTT -> HUD library -> Edge Theme (ClientSide)
	by Tassilo (https://github.com/TASSIA710)
--]]


surface.CreateFont("TTTHUD", {
		font = "Roboto",
		size = ScrH() / 31,
		weight = 500,
		bold = false
})
surface.CreateFont("TTTHUD2", {
		font = "Roboto",
		size = ScrH() / 51,
		weight = 300,
		bold = false
})
surface.CreateFont("TTTHUDSub", {
		font = "Roboto",
		size = ScrH() / 71,
		weight = 500,
		bold = false
})


local border_length = 15
function TTT.HUD.DrawRectangle(x, y, w, h, text, color)
	-- Shadow (or well something alike)
	surface.SetDrawColor(0, 0, 0, 127)
	surface.DrawRect(x - 1, y - 1, w + 2, h + 2)

	-- Background
	surface.SetDrawColor(color.r, color.g, color.b, 195)
	surface.DrawRect(x, y, w, h)

	-- Border
	surface.SetDrawColor(255, 255, 255, 127)
	surface.DrawOutlinedRect(x, y, w, h)
	surface.SetDrawColor(255, 255, 255, 195)

	-- Draw text
	draw.SimpleText(text, "TTTHUD", x + (w * 0.5), y + (h * 0.5), Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

	-- Corner: TopLeft
	surface.DrawRect(x - 1, y - 1, 3 + border_length, 3)
	surface.DrawRect(x - 1, y - 1, 3, 3 + border_length)

	-- Corner: TopRight
	surface.DrawRect(x + w - 2 - border_length, y - 1, 3 + border_length, 3)
	surface.DrawRect(x + w - 2, y - 1, 3, 3 + border_length)

	-- Corner: BottomLeft
	surface.DrawRect(x - 1, y + h - 2, 3 + border_length, 3)
	surface.DrawRect(x - 1, y + h - 2 - border_length, 3, 3 + border_length)

	-- Corner: BottomRight
	surface.DrawRect(x + w - 2 - border_length, y + h - 2, 3 + border_length, 3)
	surface.DrawRect(x + w - 2, y + h - 2 - border_length, 3, 3 + border_length)
end


function TTT.HUD.DrawRectangleSub(x, y, w, h, text, text2, color)
	-- Shadow (or well something alike)
	surface.SetDrawColor(0, 0, 0, 127)
	surface.DrawRect(x - 1, y - 1, w + 2, h + 2)

	-- Background
	surface.SetDrawColor(color.r, color.g, color.b, 195)
	surface.DrawRect(x, y, w, h)

	-- Border
	surface.SetDrawColor(255, 255, 255, 127)
	surface.DrawOutlinedRect(x, y, w, h)
	surface.SetDrawColor(255, 255, 255, 195)

	-- Draw text
	draw.SimpleText(text, "TTTHUD", x + (w * 0.5), y + (h * 0.5) - 4, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	draw.SimpleText(text2, "TTTHUDSub", x + (w * 0.5), y + (h * 0.5) + 12, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

	-- Corner: TopLeft
	surface.DrawRect(x - 1, y - 1, 3 + border_length, 3)
	surface.DrawRect(x - 1, y - 1, 3, 3 + border_length)

	-- Corner: TopRight
	surface.DrawRect(x + w - 2 - border_length, y - 1, 3 + border_length, 3)
	surface.DrawRect(x + w - 2, y - 1, 3, 3 + border_length)

	-- Corner: BottomLeft
	surface.DrawRect(x - 1, y + h - 2, 3 + border_length, 3)
	surface.DrawRect(x - 1, y + h - 2 - border_length, 3, 3 + border_length)

	-- Corner: BottomRight
	surface.DrawRect(x + w - 2 - border_length, y + h - 2, 3 + border_length, 3)
	surface.DrawRect(x + w - 2, y + h - 2 - border_length, 3, 3 + border_length)
end


function TTT.HUD.DrawRectangleBar(x, y, w, h, text, value, color)
	-- Shadow (or well something alike)
	surface.SetDrawColor(0, 0, 0, 127)
	surface.DrawRect(x - 1, y - 1, w + 2, h + 2)

	-- Background
	surface.SetDrawColor(color.r, color.g, color.b, 195)
	surface.DrawRect(x, y, w * value, h)

	-- Border
	surface.SetDrawColor(255, 255, 255, 127)
	surface.DrawOutlinedRect(x, y, w, h)
	surface.SetDrawColor(255, 255, 255, 195)

	-- Draw text
	draw.SimpleText(text, "TTTHUD2", x + (w * 0.5), y + (h * 0.5), Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

	-- Corner: TopLeft
	surface.DrawRect(x - 1, y - 1, 3 + border_length, 3)
	surface.DrawRect(x - 1, y - 1, 3, 3 + border_length)

	-- Corner: TopRight
	surface.DrawRect(x + w - 2 - border_length, y - 1, 3 + border_length, 3)
	surface.DrawRect(x + w - 2, y - 1, 3, 3 + border_length)

	-- Corner: BottomLeft
	surface.DrawRect(x - 1, y + h - 2, 3 + border_length, 3)
	surface.DrawRect(x - 1, y + h - 2 - border_length, 3, 3 + border_length)

	-- Corner: BottomRight
	surface.DrawRect(x + w - 2 - border_length, y + h - 2, 3 + border_length, 3)
	surface.DrawRect(x + w - 2, y + h - 2 - border_length, 3, 3 + border_length)
end



function TTT.HUD.DrawNotification(index, text, color, progress)
	progress = progress or 100

	-- Check size
	surface.SetFont("TTTHUD2")
	local tw, th = surface.GetTextSize(text)
	local outer_margin = 48
	local inner_margin = 8
	local paddingX = 16
	local paddingY = 8

	local w, h = tw + paddingX * 2, th + paddingY * 2
	local x, y = ScrW() - outer_margin - w, outer_margin + (h + inner_margin) * index

	-- Shadow
	surface.SetDrawColor(0, 0, 0, 127)
	surface.DrawRect(x - 1, y - 1, w + 2, h + 2)

	-- Background
	surface.SetDrawColor(63, 63, 63, 255)
	surface.DrawRect(x, y, w, h)

	-- Draw text
	draw.SimpleText(text, "TTTHUD2", x + (w * 0.5), y + (h * 0.5), Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	surface.SetDrawColor(color.r, color.g, color.b, 195)
	local wshift = w * progress
	surface.DrawRect(x + wshift, y + h - 3, w - wshift + 1, 3)
end



local function timeLeft(to)
	local diff = to - CurTime()
	if diff < 0 then diff = -diff end

	local minutes = math.floor(diff / 60)
	local seconds = math.floor(diff % 60)
	return string.format("%02d:%02d", minutes, seconds)
end

local function formatTime()
	local left = GetGlobalFloat("TTT:RoundEnd", 0)
	if left == 0 then return "--:--" else return timeLeft(left) end
end



return function()
	-- Draw health
	if LocalPlayer():IsAlive() then
		TTT.HUD.DrawRectangle(64, ScrH() - 64 - 48, 64 * 2 - 8, 48, LocalPlayer():Health(), Color(0, 0, 0))
	end

	-- Draw ammunition
	local wep = LocalPlayer():GetActiveWeapon()
	if IsValid(wep) and wep:Clip1() ~= -1 then
		local str = wep:Clip1() .. "/" .. LocalPlayer():GetAmmoCount(wep:GetPrimaryAmmoType())
		TTT.HUD.DrawRectangle(64 + (8 + 64 * 2) * 2, ScrH() - 64 - 48, 64 * 2 - 8, 48, str, Color(0, 0, 0))
	end

	-- Draw messages
	for i, data in ipairs(TTT.Derma._Messages) do
		local progress = CurTime() - data.Start
		TTT.HUD.DrawNotification(i - 1, data.Text, data.Color, progress / data.Duration)
	end

	if TTT.GetRoundState() == ROUND_FALLBACK then
		TTT.HUD.DrawRectangle(64, ScrH() - 64 - 48 - 48 - 16, 64 * 4, 48, TTT.Lang.HUD_State_Error, Color(0, 0, 0))
		TTT.HUD.DrawRectangle(64 + 8 + 64 * 2, ScrH() - 64 - 48, 64 * 2 - 8, 48, "--:--", Color(0, 0, 0))
		return
	end

	if TTT.GetRoundState() == ROUND_WAITING then
		TTT.HUD.DrawRectangle(64, ScrH() - 64 - 48 - 48 - 16, 64 * 4, 48, TTT.Lang.HUD_State_Waiting, Color(0, 0, 0))
		TTT.HUD.DrawRectangle(64 + 8 + 64 * 2, ScrH() - 64 - 48, 64 * 2 - 8, 48, "--:--", Color(0, 0, 0))
		return
	end

	if TTT.GetRoundState() == ROUND_WARMUP then
		TTT.HUD.DrawRectangle(64, ScrH() - 64 - 48 - 48 - 16, 64 * 4, 48, TTT.Lang.HUD_State_Preparing, Color(0, 0, 0))
		TTT.HUD.DrawRectangle(64 + 8 + 64 * 2, ScrH() - 64 - 48, 64 * 2 - 8, 48, formatTime(), Color(0, 0, 0))
		return
	end

	if TTT.GetRoundState() == ROUND_POST then
		TTT.HUD.DrawRectangle(64, ScrH() - 64 - 48 - 48 - 16, 64 * 4, 48, TTT.Lang.HUD_State_RoundOver, Color(0, 0, 0))
		TTT.HUD.DrawRectangle(64 + 8 + 64 * 2, ScrH() - 64 - 48, 64 * 2 - 8, 48, formatTime(), Color(0, 0, 0))
		return
	end

	local role = LocalPlayer():Role()
	TTT.HUD.DrawRectangle(64, ScrH() - 64 - 48 - 48 - 16, 64 * 4, 48, role.HudText, role.HudColor)
	TTT.HUD.DrawRectangleSub(64 + 8 + 64 * 2, ScrH() - 64 - 48, 64 * 2 - 8, 48, formatTime(), TTT.Lang.HUD_State_Haste, Color(0, 0, 0))
end
