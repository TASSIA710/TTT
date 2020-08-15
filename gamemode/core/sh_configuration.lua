
--[[
	TTT -> Configuration (Shared)
	by Tassilo (https://github.com/TASSIA710)
--]]

TTT.Config = {}



-- Database configuration
TTT.Config.Database = {
	UseMySQL = true,
	Hostname = "localhost",
	Port = 3306,
	Username = "username",
	Password = "password",
	Database = "database"
}



-- Round options
TTT.Config.MinPlayers = 2
TTT.Config.LengthRound = 10 * 60
TTT.Config.LengthPrephase = 30
TTT.Config.LengthPrephaseFirst = 60
TTT.Config.LengthPostround = 30
TTT.Config.Haste = true
TTT.Config.HasteStart = 5 * 60
TTT.Config.HastePerDeath = 30



-- Role percentages
TTT.Config.PctTraitor = 0.25 -- Percentage of traitors per round, will be ceiled.
TTT.Config.PctDetective = 0.13 -- Percentage of detectives per round, will be floored.
TTT.Config.MinPhoenix = 4 -- How many innocents are required for a phoenix to spawn?
TTT.Config.MinSerialKiller = 5 -- How many innocents are required for a serial killer to spawn?
TTT.Config.MinJester = 5 -- How many innocents are required for a jester to spawn?
TTT.Config.MinInfected = 5 -- How many innocents are required for an infected player to spawn?
