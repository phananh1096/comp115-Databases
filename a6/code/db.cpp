#include <cstdlib>
#include <string.h>
#include "db.h"

PGconn* connect_to_database(const char* host, const char* dbname, const char* user, const char* password)
{
	char cnxn_info[200];
	strcpy(cnxn_info, "host=");
	strcat(cnxn_info, host);
	strcat(cnxn_info, " dbname=");
	strcat(cnxn_info, dbname);
	strcat(cnxn_info, " user=");
	strcat(cnxn_info, user);
	strcat(cnxn_info, " password=");
	strcat(cnxn_info, password);
	//fprintf(stderr, "%s", cnxn_info);
	PGconn *connection = PQconnectdb(cnxn_info);
      if (PQstatus(connection) != CONNECTION_OK) 
      {
        oops(connection, "connection to database failed");
      }
    return connection;
}

void disconnect_from_database(PGconn* connection)
{
	PQfinish(connection);
}

void begin_transaction(PGconn* connection)
{
	PGresult *res = PQexec(connection, "begin");
	if (PQresultStatus(res) != PGRES_COMMAND_OK) 
	{
      PQclear(res);
      oops(connection, "begin failed");
    }
    PQclear(res);
}

int commit_transaction(PGconn* connection)
{
	PGresult *res = PQexec(connection, "commit");
      if (PQresultStatus(res) != PGRES_COMMAND_OK)
        {
          PQclear(res);
          oops(connection, "commit failed");
          return 0;
        }
    PQclear(res);
    return 1;
}

PGresult* query(PGconn* connection, const char* sql, int n_params, const char** params)
{
	PGresult *res = PQexecParams(connection, sql, n_params, NULL, params, NULL, NULL, 0);
	if (PQresultStatus(res) == PGRES_FATAL_ERROR)
	{
		PQclear(res);
		return NULL;
	}
	else if (PQresultStatus(res) == PGRES_TUPLES_OK)
	{
		return res;
	}
	else 
	{
		fprintf(stderr,"Error, update cannot be executed. Error: %s\n", PQerrorMessage(connection));
		PQclear(res);
		return NULL;
	}
}

int update(PGconn* connection, const char* sql, int n_params, const char** params)
{
	PGresult *res = PQexecParams(connection, sql, n_params, NULL, params, NULL, NULL, 0);
	if (PQresultStatus(res) == PGRES_FATAL_ERROR)
	{
		PQclear(res);
		return -1;
	}
	else if (PQresultStatus(res) == PGRES_COMMAND_OK)
	{
		int num = atoi(PQcmdTuples(res));
		PQclear(res);
		return num;
	}
	else 
	{
		fprintf(stderr,"Error, update cannot be executed. Error: %d\n", PQresultStatus(res));
		PQclear(res);
		return -2;
	}
}

const char* field(PGresult* result, int row, int column)
{
	if (PQgetisnull(result,row, column) == 1)	
    	return NULL;
    else
    	return PQgetvalue(result, row, column);
}

void end_query(PGresult* result)
{
	PQclear(result);
}
