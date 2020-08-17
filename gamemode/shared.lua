
--[[
	TTT -> Boot Entry (Shared)
	by Tassilo (https://github.com/TASSIA710)
--]]



-- Derive gamemode from base
DeriveGamemode("base")



-- Define base variable
TTT = {}



-- Define version
TTT.VerData = {
	Major = 0,
	Minor = 0,
	Patch = 1,
	Build = 1,
	Head = "b1ae5c712b84483ccff46662d42c16795210558a",
	Branch = "master"
}
TTT.VerMM = TTT.VerData.Major .. "." .. TTT.VerData.Minor
TTT.VerMMP = TTT.VerMM .. "." .. TTT.VerData.Patch
TTT.VerMMPB = TTT.VerMMP .. ", build " .. TTT.VerData.Build
TTT.Version = TTT.VerMMP



-- Gamemode constants
GM.Name = "Trouble in Terrorist Town"
GM.Author = "Tassilo"
GM.Email = "tassia710@gmail.com"
GM.Website = "https://tassia.net/"
TTT.GM = GM
