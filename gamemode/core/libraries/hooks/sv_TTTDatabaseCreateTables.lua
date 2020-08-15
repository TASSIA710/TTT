
--[[
	TTT -> Hooks library -> TTTDatabaseCreateTables hook (ServerSide)
	by Tassilo (https://github.com/TASSIA710)
--]]

function GM:TTTDatabaseCreateTables(db)

	Log.Debug("- Creating table 'ttt_players'")
	local q = db:query([[
	CREATE TABLE IF NOT EXISTS ttt_players (
		UserID BIGINT NOT NULL AUTO_INCREMENT,
		SteamID VARCHAR(255) NOT NULL,
		Karma BIGINT NOT NULL,
		PRIMARY KEY (UserID), INDEX (SteamID)
	) ENGINE = InnoDB CHARSET=utf8mb4 COLLATE utf8mb4_bin;
	]])
	q.onError = TTT.Database.GenericErrorCallback
	q:start()
	q:wait(true)

	Log.Debug("- Creating table 'ttt_rounds'")
	q = db:query([[
	CREATE TABLE IF NOT EXISTS ttt_rounds (
		RoundID BIGINT NOT NULL AUTO_INCREMENT,
		Result VARCHAR(255) NOT NULL,
		RoundStart BIGINT NOT NULL,
		RoundEnd BIGINT NOT NULL,
		PRIMARY KEY (RoundID)
	) ENGINE = InnoDB CHARSET=utf8mb4 COLLATE utf8mb4_bin;
	]])
	q.onError = TTT.Database.GenericErrorCallback
	q:start()
	q:wait(true)

end
