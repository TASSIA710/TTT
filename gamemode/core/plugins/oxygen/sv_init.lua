
--[[
	TTT -> Oxygen Plugin (ServerSide)
	by Tassilo (https://github.com/TASSIA710)
--]]

util.AddNetworkString("TTT:Plugin:Oxygen:ToggleDrowning")

local OXYGEN_LOSE_PER_SECOND = 10
local OXYGEN_GAIN_PER_SECOND = 5

hook.Add("OnEntityWaterLevelChanged", "TTT:Plugin:Oxygen", function(ent, old, new)
	if not ent:IsPlayer() then return end
	if old ~= 3 and new == 3 then
		-- Send net message
		net.Start("TTT:Plugin:Oxygen:ToggleDrowning")
		net.WriteBool(true)
		net.Send(ent)

		-- Load variables
		ent._Drowning = true
		if ent._Oxygen then
			ent._Oxygen = math.min(ent._Oxygen + (CurTime() - ent._DrownStart) * OXYGEN_GAIN_PER_SECOND, 100)
		else
			ent._Oxygen = 100
		end
		ent._DrownStart = CurTime()

		-- Create timer
		-- We subtact one second from the timer duration, so that the damage
		-- timer will start immediately
		timer.Create("PlayerDrown:" .. ent:UserID(), (ent._Oxygen / OXYGEN_LOSE_PER_SECOND) - 1, 1, function()
			ent._DrownDamageIndex = 1
			timer.Create("PlayerDrown:" .. ent:UserID(), 1, 100, function()
				ent:TakeDamage(ent._DrownDamageIndex, nil, nil)
				ent._DrownDamageIndex = ent._DrownDamageIndex + 1
				if ent:Health() <= 0 then
					timer.Remove("PlayerDrown:" .. ent:UserID())
				end
			end)
		end)

		-- Print log
		Log.Debug(ent, "started drowning with " .. ent._Oxygen .. "% oxygen.")
		return
	end
	if old == 3 and new ~= 3 then
		-- Send net message
		net.Start("TTT:Plugin:Oxygen:ToggleDrowning")
		net.WriteBool(false)
		net.Send(ent)

		-- Load variables
		ent._Drowning = false
		ent._Oxygen = math.max(ent._Oxygen - (CurTime() - ent._DrownStart) * OXYGEN_LOSE_PER_SECOND, 0)
		ent._DrownStart = CurTime()

		-- Remove timer
		timer.Remove("PlayerDrown:" .. ent:UserID())

		-- Print log
		Log.Debug(ent, "stopped drowning with " .. ent._Oxygen .. "% oxygen.")
		return
	end
end)
