
--[[
	TTT -> Generic library (ClientSide)
	by Tassilo (https://github.com/TASSIA710)
--]]





-- >> Send Win
TTT._WinState = WIN_NONE
net.Receive("TTT:SendWin", function(len)
	TTT._WinState = net.ReadUInt(8)
	TTT.Derma.ShowWinScreen()
end)
-- >> Send Win





-- >> Round State
--- Returns the state of the current round.
-- @returns state [number] - the state
function TTT.GetRoundState()
	return GetGlobalInt("TTT:RoundState", ROUND_FALLBACK)
end
-- >> Round State
