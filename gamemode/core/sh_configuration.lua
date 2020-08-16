
--[[
	TTT -> Configuration (Shared)
	by Tassilo (https://github.com/TASSIA710)
--]]

TTT.Config = {}



-- General
TTT.Config.Language = "english" -- Can be one of: english



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



-- Weapons
TTT.Config.Weapons = {
	"cw_ak74", -- Ammo: 5.45x39MM
	"cw_ar15", -- Ammo: 5.56x45MM
	"cw_deagle", -- Ammo: .50 AE
	"cw_flash_grenade", -- Ammo: none
	"cw_frag_grenade", -- Ammo: none
	"cw_g3a3", -- Ammo: 7.62x51MM
	"cw_l115", -- Ammo: .338 Lapua
	"cw_mp5", -- Ammo: 9x19MM
	"cw_mr96", -- Ammo: .44 Magnum
	"cw_smoke_grenade", -- Ammo: none
	"cw_g36c", -- Ammo: 5.56x45MM
	"cw_l85a2", -- Ammo: 5.56x45MM
	"cw_m249_official", -- Ammo: 5.56x45MM
	"cw_m14", -- Ammo: 7.62x51MM
	"cw_scarh", -- Ammo: 7.62x51MM
	"cw_p99", -- Ammo: 9x19MM
	"cw_shorty", -- Ammo: 12 Gauge
	"cw_m3super90", -- Ammo: 12 Gauge
	"cw_ump45", -- Ammo: .45 ACP
	"cw_m1911", -- Ammo: .45 ACP
	"cw_mac11", -- Ammo: 9x17MM
	"cw_vss", -- Ammo: 9x39MM
	"cw_fiveseven", -- Ammo: 5.7x28MM
	"cw_makarov" -- Ammo: 9x18MM
}



-- Ammunitions
TTT.Config.Ammunitions = {
	["5.45x39MM"] = "cw_ammo_545x39",
	["5.56x45MM"] = "cw_ammo_556x45",
	[".50 AE"] = "cw_ammo_50ae",
	["7.62x51MM"] = "cw_ammo_762x51",
	[".338 Lapua"] = "cw_ammo_338lapua",
	["9x19MM"] = "cw_ammo_9x19",
	[".44 Magnum"] = "cw_ammo_44magnum",
	["12 Gauge"] = "cw_ammo_12gauge",
	[".45 ACP"] = "cw_ammo_45acp",
	["9x17MM"] = "cw_ammo_9x17",
	["9x39MM"] = "cw_ammo_9x39"
}
