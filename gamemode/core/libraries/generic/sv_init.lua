
--[[
	TTT -> Generic library (ServerSide)
	by Tassilo (https://github.com/TASSIA710)
--]]





-- >> Refresh Map
--- Refreshes the map. This involves cleaning decals, removing spawned weapons
-- and ammunitions, and reloading default weapon spawns.
function TTT.RefreshMap()
	game.CleanUpMap()
end
-- >> Refresh Map





-- >> Check Win
--- Called to check if the current round should end.
function TTT.CheckWin()
	if TTT.GetRoundState() ~= ROUND_PLAYING then return end
	local win = hook.Run("TTTCheckWin")
	if win then
		TTT.SendWin(win)
	end
end
-- >> Check Win





-- >> Send Win
--- Networked if the round is over.
-- @direction SV --> CL
util.AddNetworkString("TTT:SendWin")
TTT._WinState = WIN_NONE

--- Sends a win to all players.
-- @param win [number] - the win type
function TTT.SendWin(win)
	SetGlobalFloat("TTT:RoundEnd", CurTime() + TTT.Config.LengthPostround)
	TTT.SetRoundState(ROUND_POST)
	net.Start("TTT:SendWin")
	net.WriteUInt(win, 8)
	net.Broadcast()
	-- TODO
end
-- >> Send Win





-- >> Start Round
--- Starts a new round, spawns all eligible players and sets
-- the round state to `ROUND_WARMUP`.
function TTT.StartRound()
	SetGlobalFloat("TTT:RoundEnd", CurTime() + TTT.Config.LengthPrephase)
	TTT.RefreshMap()
	TTT.SetRoundState(ROUND_WARMUP)

	for _, ply in pairs(player.GetAll()) do
		if ply:IsSpectator() then
			-- TODO
		else
			ply:Spawn()
		end
	end
end
-- >> Start Round





-- >> Cancel Round
--- Cancels the current round, puts all players back into spectate mode
-- and sets the round state to `ROUND_WAITING`. This should be called
-- when a player disconnects and there are no-longer enough players.
function TTT.CancelRound()
	SetGlobalFloat("TTT:RoundEnd", 0)
	TTT.SetRoundState(ROUND_WAITING)
	for _, ply in pairs(player.GetAll()) do
		ply:StripAmmo()
		ply:StripWeapons()
		ply:Spectate(OBS_MODE_ROAMING)
	end
end
-- >> Cancel Round





-- >> Round State
--- Returns the state of the current round.
-- @returns state [number] - the state
function TTT.GetRoundState()
	return GetGlobalInt("TTT:RoundState", ROUND_FALLBACK)
end

--- Sets the state of the current round.
-- @param state [number] - the state
function TTT.SetRoundState(state)
	SetGlobalInt("TTT:RoundState", state)
end
-- >> Round State





-- >> Decide roles
--- Called to decide the roles for the next round.
-- @returns roles [table] - a table containing the role with selected players
function TTT.DecideRoles()
	-- Determine eligible players for the next round
	local eligible = {}
	for _, ply in pairs(player.GetAll()) do
		if ply:IsSpectator() then continue end
		table.insert(eligible, ply)
	end

	-- Create tables for the roles
	local roles = {}
	roles[ROLE_INNOCENT] = table.Copy(eligible)
	roles[ROLE_TRAITOR] = {}
	roles[ROLE_DETECTIVE] = {}
	roles[ROLE_PHOENIX] = nil
	roles[ROLE_JESTER] = nil
	roles[ROLE_SERIAL_KILLER] = nil
	roles[ROLE_INFECTED] = nil

	-- Calculate amount of traitors and detective
	local amountTraitors = math.ceil(#eligible * TTT.Config.PctTraitor)
	local amountDetectives = math.floor(#eligible * TTT.Config.PctDetective)

	-- Fill traitors
	for i = 1, amountTraitors do
		local ply, key = table.Random(roles[ROLE_INNOCENT])
		table.remove(roles[ROLE_INNOCENT], key)
		table.insert(roles[ROLE_TRAITOR], ply)
	end

	-- Fill detectives
	for i = 1, amountDetectives do
		local ply, key = table.Random(roles[ROLE_INNOCENT])
		table.remove(roles[ROLE_INNOCENT], key)
		table.insert(roles[ROLE_DETECTIVE], ply)
	end

	-- Phoenix?
	if TTT.Config.MinPhoenix <= #roles[ROLE_INNOCENT] then
		local ply, key = table.Random(roles[ROLE_INNOCENT])
		table.remove(roles[ROLE_INNOCENT], key)
		roles[ROLE_PHOENIX] = {ply}
	end

	-- Serial Killer?
	if TTT.Config.MinSerialKiller <= #roles[ROLE_INNOCENT] then
		local ply, key = table.Random(roles[ROLE_INNOCENT])
		table.remove(roles[ROLE_INNOCENT], key)
		roles[ROLE_SERIAL_KILLER] = {ply}
	end

	-- Jester?
	if TTT.Config.MinJester <= #roles[ROLE_INNOCENT] then
		local ply, key = table.Random(roles[ROLE_INNOCENT])
		table.remove(roles[ROLE_INNOCENT], key)
		roles[ROLE_JESTER] = {ply}
	end

	-- Infected?
	if TTT.Config.MinInfected <= #roles[ROLE_INNOCENT] then
		local ply, key = table.Random(roles[ROLE_INNOCENT])
		table.remove(roles[ROLE_INNOCENT], key)
		roles[ROLE_INFECTED] = {ply}
	end

	return roles
end
-- >> Decide roles
