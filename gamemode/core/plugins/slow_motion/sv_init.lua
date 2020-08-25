
--[[
	TTT -> Slow Motion Plugin (ServerSide)
	by Tassilo (https://github.com/TASSIA710)
--]]

-- Download content
resource.AddSingleFile("sound/terrortown/plugins/slow_motion/slow_motion_end.wav")
resource.AddSingleFile("sound/terrortown/plugins/slow_motion/slow_motion_start.wav")



hook.Add("TTT_RoundOver", "TTT:Plugin:SlowMotion", function(result)

	-- Slow motion!
	local duration = TTT.Config.Plugins["Slow Motion"].Duration
	game.SetTimeScale(0.25)
	local steps = 10

	timer.Simple(1, function()
		for i = 1, steps do
			timer.Simple((duration / steps) * i, function()
				game.SetTimeScale(0.25 + 0.75 * ((i^2) / 100))
			end)
		end
		timer.Simple(duration + 0.05, function()
			game.SetTimeScale(1)
		end)
	end)
	timer.Simple(duration + 1, function()
		game.SetTimeScale(1)
	end)

end)
