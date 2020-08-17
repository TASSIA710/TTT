
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



-- Credits
TTT.Config.TraitorCreditsStarting = 2
TTT.Config.DetectiveCreditsStarting = 1



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
	"ttt_cw2_ak74", -- Ammo: 5.45x39MM
	"ttt_cw2_ar15", -- Ammo: 5.56x45MM
	"ttt_cw2_deagle", -- Ammo: .50 AE
	"ttt_cw2_flash_grenade", -- Ammo: none
	"ttt_cw2_frag_grenade", -- Ammo: none
	"ttt_cw2_g3a3", -- Ammo: 7.62x51MM
	"ttt_cw2_l115", -- Ammo: .338 Lapua
	"ttt_cw2_mp5", -- Ammo: 9x19MM
	"ttt_cw2_mr96", -- Ammo: .44 Magnum
	"ttt_cw2_smoke_grenade", -- Ammo: none
	"ttt_cw2_g36c", -- Ammo: 5.56x45MM
	"ttt_cw2_l85a2", -- Ammo: 5.56x45MM
	"ttt_cw2_m249_official", -- Ammo: 5.56x45MM
	"ttt_cw2_m14", -- Ammo: 7.62x51MM
	"ttt_cw2_scarh", -- Ammo: 7.62x51MM
	"ttt_cw2_p99", -- Ammo: 9x19MM
	"ttt_cw2_shorty", -- Ammo: 12 Gauge
	"ttt_cw2_m3super90", -- Ammo: 12 Gauge
	"ttt_cw2_ump45", -- Ammo: .45 ACP
	"ttt_cw2_m1911", -- Ammo: .45 ACP
	"ttt_cw2_mac11", -- Ammo: 9x17MM
	"ttt_cw2_vss", -- Ammo: 9x39MM
	"ttt_cw2_fiveseven", -- Ammo: 5.7x28MM
	"ttt_cw2_makarov" -- Ammo: 9x18MM
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



-- Entity replacements
TTT.Config.EntityReplacements = {
	["item_ammo_357_ttt"] = "cw_ammo_50ae",
	["item_ammo_pistol_ttt"] = "cw_ammo_45acp",
	["item_ammo_revolver_ttt"] = "cw_ammo_44magnum",
	["item_ammo_smg1_ttt"] = "cw_ammo_9x17",
	["item_box_buckshot_ttt"] = "cw_ammo_12gauge",
	["weapon_ttt_confgrenade"] = "ttt_cw2_frag_grenade",
	["weapon_ttt_glock"] = "ttt_cw2_p99",
	["weapon_ttt_m16"] = "ttt_cw2_ar15",
	["weapon_ttt_smokegrenade"] = "ttt_cw2_smoke_grenade",
	["weapon_zm_mac10"] = "ttt_cw2_mac11",
	["weapon_zm_molotov"] = "ttt_cw2_frag_grenade",
	["weapon_zm_pistol"] = "ttt_cw2_m1911",
	["weapon_zm_revolver"] = "ttt_cw2_mr96",
	["weapon_zm_rifle"] = "ttt_cw2_l115",
	["weapon_zm_shotgun"] = "ttt_cw2_m3super90",
	["weapon_zm_sledge"] = "ttt_cw2_m249_official"
}



-- Debug
TTT.Config.PreventWin = true
