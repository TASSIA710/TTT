
--[[
	TTT -> Slow Motion Plugin (ClientSide)
	by Tassilo (https://github.com/TASSIA710)
--]]

local mt = 0
local drawSlowMotion = false
local ColorConstTable, ColorModifyTable, BloomTable

local soundStart = "terrortown/plugins/slow_motion/slow_motion_start.wav"
local soundEnd = "terrortown/plugins/slow_motion/slow_motion_end.wav"


hook.Add("TTT:RoundOver", "TTT:Plugin:SlowMotion", function(result)
	surface.PlaySound(soundStart)

	local slowtime = TTT.Config.Plugins["Slow Motion"].Duration
	if result == WIN_TRAITOR then
		ColorConstTable = {0.14, 0, 0, 0.026, 0.88, 0.2, 0.5, 0, 2}
		BloomTable = {0.76, 3.74, 45.1, 26.03, 2, 2.58, 1, 1, 1}
	else
		ColorConstTable = {0, 0, 0.1, 0.05, 0.88, 0.65, 0, 0, 0}
		BloomTable = {0.72, 1.73, 37.89, 22.94, 2, 4.23, 1, 1, 1}
	end

	drawSlowMotion = true
	timer.Simple(slowtime + slowtime * 0.5, function()
		drawSlowMotion = false
	end)

	local fadeInStepTime = 0.01
	local fadeOutStepTime = slowtime * 1.1
	for i = 1, 20 do
		timer.Simple(fadeInStepTime * i, function()
			mt = (i^2) / 400
		end)
		if i != 5 then
			timer.Simple(fadeOutStepTime + fadeInStepTime * 1.25 * i, function()
				mt = 1 - (i^2) / 400
			end)
		else
			timer.Simple(fadeOutStepTime + fadeInStepTime * 1.25 * i, function()
				mt = 1 - (i^2) / 400
				surface.PlaySound(soundEnd)
			end)
		end
	end
end)



hook.Add("RenderScreenspaceEffects", "TTT:Plugin:SlowMotion", function()
	if drawSlowMotion then
		ColorModifyTable = {
			["$pp_colour_addr"]			= ColorConstTable[1] * mt,
			["$pp_colour_addg"]			= ColorConstTable[2] * mt,
			["$pp_colour_addb"]			= ColorConstTable[3] * mt,
			["$pp_colour_brightness"]	= ColorConstTable[4] * mt,
			["$pp_colour_contrast"]		= 1 + (mt * (ColorConstTable[5] - 1)),
			["$pp_colour_colour"]		= 1 + (mt * (ColorConstTable[6] - 1)),
			["$pp_colour_mulr"]			= ColorConstTable[7] * mt,
			["$pp_colour_mulg"]			= ColorConstTable[8] * mt,
			["$pp_colour_mulb"]			= ColorConstTable[9] * mt
		}
		DrawToyTown(4, mt * (ScrH() * 0.2))
		DrawBloom(mt * BloomTable[1], mt * BloomTable[2], mt * BloomTable[3], mt * BloomTable[4],
				math.Round(mt * BloomTable[5]), mt * BloomTable[6], mt * BloomTable[7], mt * BloomTable[8], mt * BloomTable[9])
		DrawColorModify(ColorModifyTable)
	end
end)
