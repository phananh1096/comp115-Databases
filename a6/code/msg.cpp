#include <cstdlib>
#include <cstdio>
#include <libpq-fe.h>
#include <cstring>
#include "msg.h"
#include "db.h"

static const char* INSERT_MEMBER =
    "insert into member(name, birth_date) values($1, $2)";

static const char* INSERT_MESSAGE =
    "insert into message(message_date, message_text) values($1, $2)";

static const char* INSERT_ROUTING =
    "select store_routing($1, $2, $3)";

static const char* PK_VALUE =
    "select lastval()";

static const char* BIRTH_DATE_QUERY =
    "select birth_date from member where name = $1";

static const char* SENDER_AND_RECEIVER_QUERY = ""
    "select distinct f.name, t.name\n"
    "from member f join routing r on f.member_id = r.from_member_id\n"
    "              join member t on r.to_member_id = t.member_id\n"
    "              join message m on r.message_id = m.message_id\n"
    "where m.message_date = $1\n"
    "order by f.name, t.name";


// API

int add_member(PGconn* connection, const char* name, const char* birth_date)
{
    const char *params[2] = {name,birth_date};
    const char *select[0] = {};
    int add_mem = update(connection,INSERT_MEMBER, 2, params);
    if (add_mem >= 0) 
    {
        PGresult *member_id = query (connection, PK_VALUE, 0, select);
        int num = atoi(field(member_id, 0, 0));
        end_query(member_id);
        return num;
    }
    return -1;
}

int add_message(PGconn* connection, const char* message_date, const char* message_text)
{
    const char *params[2] = {message_date,message_text};
    const char *select[0] = {};
    int add_mess = update(connection, INSERT_MESSAGE, 2, params);
    if (add_mess >= 0) 
    {
        PGresult *member_id = query (connection, PK_VALUE, 0, select);
        int num = atoi(field(member_id, 0, 0));
        end_query(member_id);
        return num;
    }
    return -1;
}

int add_routing(PGconn* connection, const char* from_member_id, const char* to_member_id, const char* message_ids)
{
    const char *params[3] = {from_member_id, to_member_id, message_ids};
    PGresult *add_rout = query(connection, INSERT_ROUTING, 3, params);
    int num = atoi(field(add_rout, 0, 0));
    end_query(add_rout);
    return num;
}

int birth_date(PGconn* connection, const char* name, char* buffer)
{
    const char *params[1] = {name};
    PGresult *b_date = query(connection,BIRTH_DATE_QUERY,1, params);
    if (PQntuples(b_date) == 0) {
        end_query(b_date);
        return 0;
    }
    else {
        sprintf(buffer, "%s",field(b_date, 0, 0));
        end_query(b_date);
        return 1;
    }
}

int senders_and_receivers(PGconn* connection, const char* date, int max_results, char* buffer[])
{
    const char *params[1] = {date};
    PGresult * s_and_r = query (connection, SENDER_AND_RECEIVER_QUERY, 1, params);
    int buffer_size = 0;
    char *temp = NULL;

    for (int i = 0; i < PQntuples(s_and_r); i++) {
        temp = (char *)field(s_and_r, i, 0);
        strcpy(buffer[i],temp);
        strcat(buffer[i],",");
        temp = (char *)field(s_and_r, i, 1);
        strcat(buffer[i],temp);
        buffer_size++;
    }
    end_query(s_and_r);
    if (buffer_size -1 <= max_results)
        return buffer_size;
    else 
    {
        fprintf(stderr,"Error, update cannot be executed");
        exit(1);
    }
}
