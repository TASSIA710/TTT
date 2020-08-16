
--[[
	TTT -> Hooks library -> TTTCheckWin hook (ServerSide)
	by Tassilo (https://github.com/TASSIA710)
--]]

function GM:TTTCheckWin()
	local allTraitor = true
	local allInnocent = true
	local allSerialKiller = true
	local allInfected = true

	for _, ply in pairs(player.GetAll()) do
		if ply._AboutToDisconnect then continue end
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
		TTT.SendWin(WIN_TRAITOR)
	elseif allInnocent then
		TTT.SendWin(WIN_INNOCENT)
	elseif allSerialKiller then
		TTT.SendWin(WIN_SERIAL_KILLER)
	elseif allInfected then
		TTT.SendWin(WIN_INFECTED)
	end
end
