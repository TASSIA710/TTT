
--[[
	TTT -> Hooks library -> TTTCheckWin hook (ServerSide)
	by Tassilo (https://github.com/TASSIA710)
--]]

function GM:TTTCheckWin()
	Log.Debug("Checking for win...")
	local allTraitor = true
	local allInnocent = true
	local allSerialKiller = true
	local allInfected = true

	for _, ply in pairs(player.GetAll()) do
		if ply._AboutToDisconnect then continue end
		if not ply:IsAlive() then continue end
		if ply:IsInnocent() or ply:IsDetective() then
			allTraitor = false
			allSerialKiller = false
			allInfected = false
		elseif ply:IsTraitor() then
			allInnocent = false
			allSerialKiller = false
			allInfected = false
		elseif ply:IsSerialKiller() then
			allTraitor = false
			allInnocent = false
			allInfected = false
		elseif ply:IsInfected() then
			allTraitor = false
			allInnocent = false
			allSerialKiller = false
		end
	end

	if allTraitor then
		Log.Debug("Only traitors left, result: WIN_TRAITOR")
		return WIN_TRAITOR
	elseif allInnocent then
		Log.Debug("Only innocents left, result: WIN_INNOCENT")
		return WIN_INNOCENT
	elseif allSerialKiller then
		Log.Debug("Only the serial killer left, result: WIN_SERIAL_KILLER")
		return WIN_SERIAL_KILLER
	elseif allInfected then
		Log.Debug("Only infected left, result: WIN_INFECTED")
		return WIN_INFECTED
	else
		Log.Debug("Players of multiple roles left, aborting.")
		return false
	end
end
