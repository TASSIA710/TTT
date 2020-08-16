
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
		weight = 500,
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
	surface.DrawRect(x, y, w, h)

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



local roles = {
	[ROLE_FALLBACK] = { TTT.Lang.HUD_Role_Fallback, Color(0, 0, 0) },
	[ROLE_DEAD] = { TTT.Lang.HUD_Role_Dead, Color(0, 0, 0) },
	[ROLE_SPECTATOR] = { TTT.Lang.HUD_Role_Spectator, Color(195, 127, 0) },
	[ROLE_INNOCENT] = { TTT.Lang.HUD_Role_Innocent, Color(0, 195, 0) },
	[ROLE_TRAITOR] = { TTT.Lang.HUD_Role_Traitor, Color(195, 0, 0) },
	[ROLE_DETECTIVE] = { TTT.Lang.HUD_Role_Detective, Color(0, 0, 195) },
	[ROLE_PHOENIX] = { TTT.Lang.HUD_Role_Phoenix, Color(0, 127, 195) },
	[ROLE_JESTER] = { TTT.Lang.HUD_Role_Jester, Color(127, 127, 0) },
	[ROLE_SERIAL_KILLER] = { TTT.Lang.HUD_Role_SerialKiller, Color(63, 0, 0) },
	[ROLE_INFECTED] = { TTT.Lang.HUD_Role_Infected, Color(95, 127, 0) }
}



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

	local role = LocalPlayer():GetRole()
	TTT.HUD.DrawRectangle(64, ScrH() - 64 - 48 - 48 - 16, 64 * 4, 48, roles[role][1], roles[role][2])
	TTT.HUD.DrawRectangleSub(64 + 8 + 64 * 2, ScrH() - 64 - 48, 64 * 2 - 8, 48, formatTime(), TTT.Lang.HUD_State_Haste, Color(0, 0, 0))
end
