
--[[
	TTT -> Database library (ServerSide)
	by Tassilo (https://github.com/TASSIA710)
--]]


-- Load MySQLOO
require("mysqloo")
TTT.Database = mysqloo.connect(TTT.Config.Database.Hostname,
		TTT.Config.Database.Username, TTT.Config.Database.Password,
		TTT.Config.Database.Database, TTT.Config.Database.Port)



-- Generic error callback
TTT.Database.GenericErrorCallback = function(_, sql, err)
	Log.Error("Error while trying to execute query:")
	Log.Error("> " .. sql)
	Log.Error("SQL: " .. err)
end



-- Connection established
TTT.Database.onConnected = function()
	Log.Info("Database connection established, running initial queries...")
	hook.Run("TTTDatabaseCreateTables", TTT.Database)
	hook.Run("TTTDatabaseInitialQueries", TTT.Database)
	hook.Run("TTTDatabaseConnected", TTT.Database)
	Log.Info("Database successfully initialized.")
end



-- Connection failed
TTT.Database.onConnectionFailed = function(_, err)
	Log.Error("Failed to connect to database:")
	Log.Error(err)
end
