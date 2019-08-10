char SQL_CREATE_MLSERVER[] = "CREATE TABLE IF NOT EXISTS 															\
													MLServer 														\
													( 																\
														id 			TEXT PRIMARY KEY, 								\
														name 		TEXT											\
													)";

char SQL_CREATE_MLSERVERSTART[] = "CREATE TABLE IF NOT EXISTS 														\
														MLServerStart												\
														(															\
															id 			INTEGER PRIMARY KEY AUTOINCREMENT,			\
															server_id 	TEXT NOT NULL,								\
															mod			TEXT NOT NULL,								\
															date		TEXT NOT NULL,								\
															time		TEXT NOT NULL,								\
															server_ip	TEXT NOT NULL,								\
															server_port	INTEGER NOT NULL							\
														)";

char SQL_CREATE_MLPLAYER[] = "CREATE TABLE IF NOT EXISTS 															\
													MLPlayer														\
													(																\
														steamid3 		TEXT NOT NULL PRIMARY KEY,					\
														session_count 	INTEGER DEFAULT 0,							\
														steamid2		TEXT NOT NULL,								\
														steamid64		TEXT NOT NULL								\
													)";

char SQL_CREATE_MLPLAYERNAME[] = "CREATE TABLE IF NOT EXISTS 														\
														MLPlayerName												\
														(															\
															id				INTEGER PRIMARY KEY AUTOINCREMENT,		\
															steamid3 		TEXT NOT NULL,							\
															name			TEXT NOT NULL,							\
															session 		INT NOT NULL,							\
															date			TEXT NOT NULL,							\
															time			TEXT NOT NULL							\
														)";
														
char SQL_CREATE_MLPLAYERIGNORED[] = "CREATE TABLE IF NOT EXISTS 													\
															MLPlayerIgnored											\
															(														\
																id				INTEGER PRIMARY KEY AUTOINCREMENT,	\
																steamid3 		TEXT NOT NULL,						\
																ignore_ips 		BOOLEAN NOT NULL,					\
																date			TEXT NOT NULL,						\
																time			TEXT NOT NULL						\
															)";

char SQL_CREATE_MLPLAYERCONNECT[] = "CREATE TABLE IF NOT EXISTS 													\
															MLPlayerConnect											\
															(														\
																id				INTEGER PRIMARY KEY AUTOINCREMENT,	\
																steamid3 		TEXT NOT NULL,						\
																ip_address		TEXT NOT NULL,						\
																ip_port			INTEGER NOT NULL,					\
																session 		INTEGER NOT NULL,					\
																date			TEXT NOT NULL,						\
																time			TEXT NOT NULL,						\
																server_id		TEXT NOT NULL						\
															)";
															
char SQL_CREATE_MLPLAYERDISCONNECT[] = "CREATE TABLE IF NOT EXISTS 													\
															MLPlayerDisconnect										\
															(														\
																id				INTEGER PRIMARY KEY AUTOINCREMENT,	\
																steamid3 		TEXT NOT NULL,						\
																playtime		REAL NOT NULL,						\
																session 		INTEGER NOT NULL,					\
																date			TEXT NOT NULL,						\
																time			TEXT NOT NULL,						\
																server_id		TEXT NOT NULL						\
															)";

char SQL_QUERY_CHECKPLAYERLOGGED[] = "SELECT * 																		\
										FROM MLPlayer 																\
										WHERE steamid3 = \'%s\'";
															
char SQL_QUERY_CHECKPLAYERIGNORED[] = "SELECT * 																	\
										FROM MLPlayerIgnored 														\
										WHERE steamid3 = \'%s\'";
														
char SQL_INSERT_LOGPLAYER[] = "INSERT OR REPLACE INTO 																\
												MLPlayer															\
												(																	\
													steamid3,														\
													session_count,													\
													steamid2,														\
													steamid64														\
												)																	\
												VALUES																\
												(																	\
													\'%s\',															\
													%d,																\
													\'%s\',															\
													\'%s\'															\
												)";

char SQL_QUERY_LOGPLAYERNAME[] = "SELECT * 																			\
									FROM MLPlayerName 																\
									WHERE steamid3 = \'%s\' 														\
									ORDER BY id DESC 																\
									LIMIT 1";
									
char SQL_INSERT_LOGPLAYERNAME[] = "INSERT INTO 																		\
											MLPlayerName 															\
											(																		\
												steamid3, 															\
												name, 																\
												session, 															\
												date, 																\
												time 																\
											)																		\
											VALUES																	\
											(																		\
												\'%s\',																\
												\'%s\',																\
												%d,																	\
												\'%s\',																\
												\'%s\'																\
											)";
											
char SQL_INSERT_SERVERLOGIN[] = "REPLACE INTO 																		\
											MLServer 																\
											(																		\
												id, 																\
												name 																\
											) 	 																	\
											VALUES 																	\
											(																		\
												\'%s\', 															\
												\'%s\' 																\
											)";
													
char SQL_INSERT_LOGPLAYERCONNECT[] = "INSERT INTO 																	\
												MLPlayerConnect 													\
												(																	\
													steamid3, 														\
													ip_address, 													\
													ip_port, 														\
													session, 														\
													date, 															\
													time, 															\
													server_id														\
												)																	\
												VALUES																\
												(																	\
													\'%s\',															\
													\'%s\',															\
													%d,																\
													%d,																\
													\'%s\', 														\
													\'%s\', 														\
													\'%s\'															\
												)";

char SQL_INSERT_SERVERSTART[] = "INSERT INTO 																		\
										MLServerStart 																\
										(																			\
											server_id,																\
											mod,																	\
											date,																	\
											time,																	\
											server_ip,																\
											server_port																\
										)																			\
										VALUES																		\
										(																			\
											\'%s\',																	\
											\'%s\',																	\
											\'%s\',																	\
											\'%s\',																	\
											\'%s\',																	\
											%d																		\
										)";
										
char SQL_INSERT_LOGPLAYERDISCONNECT[] = "INSERT INTO 																\
												MLPlayerDisconnect 													\
												(																	\
													steamid3, 														\
													playtime, 														\
													session, 														\
													date, 															\
													time, 															\
													server_id														\
												)																	\
												VALUES																\
												(																	\
													\'%s\',															\
													%f,																\
													%d,																\
													\'%s\', 														\
													\'%s\', 														\
													\'%s\'															\
												)";