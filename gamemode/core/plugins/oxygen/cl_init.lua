
--[[
	TTT -> Oxygen Plugin (ClientSide)
	by Tassilo (https://github.com/TASSIA710)
--]]

local OXYGEN_LOSE_PER_SECOND = 10
local OXYGEN_GAIN_PER_SECOND = 5

local drowning = false
local start = 0
local oxygen = 100

net.Receive("TTT:Plugin:Oxygen:ToggleDrowning", function()
	if net.ReadBool() then
		Log.Debug("Started drowning.")
		oxygen = math.min(oxygen + (CurTime() - start) * OXYGEN_GAIN_PER_SECOND, 100)
		drowning = true
		start = CurTime()
	else
		Log.Debug("Stopped drowning.")
		oxygen = math.max(oxygen - (CurTime() - start) * OXYGEN_LOSE_PER_SECOND, 0)
		drowning = false
		start = CurTime()
	end
end)

hook.Add("HUDPaint", "TTT:Plugin:Oxygen", function(ent, old, new)
	if not LocalPlayer():IsAlive() then return end
	if drowning then
		local ox = math.max(oxygen - (CurTime() - start) * OXYGEN_LOSE_PER_SECOND, 0)
		TTT.HUD.DrawRectangleBar(64, ScrH() - 64 - (48 + 16) * 2 - 32, 256, 32, "Oxygen: " .. math.Round(ox) .. "%", ox / 100, Color(0, 127, 195))
		return
	end

	if oxygen == 100 then return end
	local ox = math.min(oxygen + (CurTime() - start) * OXYGEN_GAIN_PER_SECOND, 100)
	TTT.HUD.DrawRectangleBar(64, ScrH() - 64 - (48 + 16) * 2 - 32, 256, 32, "Oxygen: " .. math.Round(ox) .. "%", ox / 100, Color(0, 127, 195))
	if ox == 100 then oxygen = 100 end
end)
