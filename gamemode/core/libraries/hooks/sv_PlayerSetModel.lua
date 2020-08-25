
--[[
	TTT -> Hooks library -> PlayerSetModel hook (ServerSide)
	by Tassilo (https://github.com/TASSIA710)
--]]

function GM:PlayerSetModel(ply)

	local mdl = table.Random(TTT.Config.PlayerModels)
	if mdl then
		ply:SetModel(mdl)
	end

end
