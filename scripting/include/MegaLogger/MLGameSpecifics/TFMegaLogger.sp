#include <tf2>
#include <tf2_stocks>

ConVar cvarTFEnableClassLog; //May be a bit too overkill of a logging?
ConVar cvarTFEnableTeamLog; //May be a bit too overkill of a logging?
ConVar cvarTFEnableClassPlaytimeLog;
ConVar cvarTFEnableTeamPlaytimeLog;
ConVar cvarTFEnableObjectiveCaptureLog;
bool bTFMLTablesReady;

void TFML_OnPluginStart()
{
	if (TFML_ModSupported())
	{
		
	}
}

void TFML_DatabasePrepare()
{
	if (databaseState == Connected)
	{
		if (TFML_ModSupported())
		{
			
		}
	}
}

void TFML_DBQuery(Database db, DBResultSet results, const char[] error, any data)
{
	if (TFML_ModSupported())
	{
		if (db != null)
		{
			
		}
	}
}

bool TFML_ModSupported()
{
	return engineVersion == Engine_TF2;
}

bool TFML_IsTablesReady()
{
	return bTFMLTablesReady;
}