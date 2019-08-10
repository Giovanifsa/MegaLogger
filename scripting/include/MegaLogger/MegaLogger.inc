#if defined _megalogger_included
 #endinput
#endif
#define _megalogger_included

public SharedPlugin __pl_MegaLogger = 
{
	name = "MegaLogger",
	file = "MegaLogger.smx",
#if defined REQUIRE_PLUGIN
	required = 1,
#else
	required = 0,
#endif
};
 
#if !defined REQUIRE_PLUGIN
public void __pl_MegaLogger_SetNTVOptional()
{
	MarkNativeAsOptional("ML_CreateCustomQuery");
	MarkNativeAsOptional("ML_IsPlayerBeingLogged");
	MarkNativeAsOptional("ML_GetDBConnectionState");
	MarkNativeAsOptional("ML_GetDBConnectionDriver");
}
#endif

#include <MegaLoggerShared>
#include <dbi>

/**
 * Called when a player had their's data logged to the database.
 *
 * Loggings that requires players data as a reference, like SteamID3,
 * should wait for this to complete, or else a database inconsistency
 * may happen.
 *
 * @param userid		Logged player's userid.
 * @param steamid3		Logged player's SteamID3.
 * @param session_count	Logged player's number of sessions in the server.
 * @param steamid2		Logged player's SteamID2.
 * @param steamid64		Logged player's SteamID64.
 */
forward void ML_OnPlayerLogged(int userid, const char[] steamid3, int session_count, const char[] steamid2, const char[] steamid64);

/**
 * Called when a player had their's name logged to the database.
 *
 * This is only called for three situations:
 * 		A player has connected for the first time;
 * 		A player has connected with a new name;
 * 		A player has changed name in-game.
 *
 * @param userid		Logged player's userid.
 * @param steamid3		Logged player's SteamID3.
 * @param name			Logged player's name.
 * @param session		Logged player's current session number.
 * @param date			Date of the logging.
 * @param time			Time of the logging.
 */
forward void ML_OnPlayerNameLogged(int userid, const char[] steamid3, const char[] name, int session, const char[] date, const char[] time);

/**
 * Called when a player's connection has been logged to the database.
 *
 * @param userid		Logged player's userid.
 * @param steamid3		Logged player's SteamID3.
 * @param ip			Logged player's IP address.
 * @param port			Logged player's connection port.
 * @param session		Logged player's current session number.
 * @param date			Date of the logging.
 * @param time			Time of the logging.
 */
forward void ML_OnPlayerConnectLogged(int userid, const char[] steamid3, const char[] ip, int port, int session, const char[] date, const char[] time);

/**
 * Called when a player's disconnection has been logged to the database.
 *
 * @param userid		Logged player's userid.
 * @param steamid3		Logged player's SteamID3.
 * @param playtime		Logged player's connection time.
 * @param session		Logged player's current session number.
 * @param date			Date of the logging.
 * @param time			Time of the logging.
 */
forward void ML_OnPlayerDisconnectLogged(int userid, const char[] steamid3, float playtime, int session, const char[] date, const char[] time);

/**
 * Called when the server has been registered to the database.
 *
 * @param serverID		Registered server's ID.
 * @param serverName	Registered server's name.
 */
forward void ML_OnServerLogged(const char[] serverID, const char[] serverName);

/**
 * Called when MegaLogger has connected to a database and is fully operational.
 */
forward void ML_OnMegaLoggerReady();

/**
 * Called when MegaLogger has been disconnected from the database.
 *
 * @param error			True if the disconnect was caused by a error.
 * @param errorMsg		Message explaining the error.
 */
forward void ML_OnMegaLoggerDisconnect();

/**
 * Checks if MegaLogger is available.
 *
 * @return 				True if MegaLogger is available, false otherwise.
 */
stock bool ML_IsAvailable()
{
	return LibraryExists("MegaLogger");
}

/**
 * Inserts a new custom query on the MegaLogger's query queue.
 *
 * @param sqlQuery		SQL for the query.
 * @param queryData		Custom query data.
 * @param qProcessor	Custom query processor callback.
 */
native void ML_CreateCustomQuery(char[] sqlQuery, StringMap queryData, MLCustomQueryProcessor qProcessor);

/**
 * Returns if a player is being logged to the database.
 *
 * @param userid		Player's userID.
 * @return 				True if the player is being logged, false otherwise.
 */
native bool ML_IsPlayerBeingLogged(int userid);

/**
 * Returns the current database's connection state.
 *
 * @param state			DBState identifier for the current connection state.
 */
native void ML_GetDBConnectionState(DBState &state);

/**
 * Returns the current database's connection driver.
 *
 * @param driver		DBDriver object for the current database connection.
 * @error				If there is no database connection.
 */
native void ML_GetDBConnectionDriver(DBDriver &driver);
