#include <sstream>
#include <cstring>
#include <algorithm>
#include <iostream>
#include "RelationalAlgebra.h"
#include "Database.h"
#include "unittest.h"

//__________________________________________________________________________________________

Table *onion(Table *r, Table *s)
{
    if (r->length() != s->length())
        throw  UnionIncompatibilityException("Tried to join tables of different length");
    ColumnNames r_names = r->get_name();
    ColumnNames s_names = s->get_name();
    for (unsigned long i = 0; i < r_names.size(); i++)
    {
        if (r_names[i] != s_names[i]) 
        {
            throw UnionIncompatibilityException("Different columns!");
        }
    }
    // Sets up new table
    ColumnNames temp_cols = r->get_name();
    Table* temp = new Table(Database::new_table_name(), temp_cols);
    // Gets the rowset from both tables to undergo unions
    RowSet first = r->get_row();
    RowSet second = s->get_row();
    temp->table_onion(first);
    temp->table_onion(second);
    return temp;
}

Table *intersect(Table *r, Table *s)
{
    if (r->length() != s->length())
        throw  UnionIncompatibilityException
        ("Tried to intersect tables of different length");
    // Sets up new table
    ColumnNames temp_cols = r->get_name();
    Table* temp = new Table(Database::new_table_name(), temp_cols);
    RowSet first = r->get_row();
    RowSet second = s->get_row();
    // Deals with the case where either tables are empty
    if (r->empty() || s->empty())
        return temp;
    // Checks for intersections by looping through one RowSet
    // Checks if current row is present in the other table. 
    // If yes, adds to newly created table.
    auto i = first.begin();
    while (i != first.end())
    {
        if (s->has(*i))
            temp->add(*i);
        i++;
    }
    return temp;
}

Table *diff(Table *r, Table *s)
{
    if (r->length() != s->length())
        throw  UnionIncompatibilityException
        ("Tried to intersect tables of different length");
    // Sets up new table
    ColumnNames temp_cols = r->get_name();
    Table* temp = new Table(Database::new_table_name(), temp_cols);
    RowSet first = r->get_row();
    RowSet second = s->get_row();
    // Checks for intersections by looping through one RowSet
    // Checks if current row is present in the other table. 
    // If not, adds to newly created table.
    auto i = first.begin();
    while (i != first.end())
    {
        if (!s->has(*i))
            temp->add(*i);
        i++;
    }
    return temp;
}

Table *product(Table *r, Table *s)
{
    // To implement the column exception
    ColumnNames first_name = r->get_name();
    ColumnNames second_name = s->get_name();
    for (unsigned long i = 0; i < first_name.size(); i++)
    {
        for (unsigned long j = 0; j < second_name.size(); j++)
        {
            if (first_name[i] == second_name[j])
                throw TableException ("Duplicate columns!");
        }
    }
    // Sets up new columns
    ColumnNames temp_cols = first_name;
    for (unsigned long i = 0; i < second_name.size(); i ++)
    {
        temp_cols.push_back(second_name[i]);
    }
    Table* temp = new Table(Database::new_table_name(), temp_cols);
    // If either column is empty then returns empty table
    RowSet first = r->get_row();
    RowSet second = s->get_row();
    if (r->empty() || s->empty())
        return temp;
    auto first_it = first.begin();
    auto second_it = second.begin();
    while (first_it != first.end())
    {
        while (second_it != second.end())
        {
            Row* add = new Row(temp);
            for (unsigned long i = 0; i < first_name.size(); i++)
            {
                add->append((*first_it)->value(first_name[i]));
            }
            for (unsigned long i = 0; i < second_name.size(); i++)
            {
                add->append((*second_it)->value(second_name[i]));
            }
            temp->add(add);
            second_it++;
        }
        first_it++;
        second_it = second.begin();
    }
    return temp;
}

Table *rename(Table *r, const NameMap &name_map)
{
    if (r->length() < name_map.size())
        throw TableException ("Rename Too Many!");
    if (name_map.size() == 0)
        return r;
    /*
    ColumnNames temp_cols = r->get_name();
    Table *temp = new Table(Database::new_table_name(), temp_cols);
    RowSet temp_rows = r->get_row();
    auto i = temp_rows.begin();
    while (i != temp_rows.end())
    {
        temp->add(*i);
        i++;
    }
    temp->table_rename(name_map);
    */
    r->table_rename(name_map);
    return r;
}

Table *select(Table *r, RowPredicate predicate)
{
    // Create new table
    ColumnNames temp_cols = r->get_name();
    Table* temp = new Table(Database::new_table_name(), temp_cols);
    // Gets new row and makes selection
    RowSet temp_rows = r->get_row();
    temp->table_select(temp_rows, predicate);
    return temp;
}

Table *project(Table *r, const ColumnNames &columns)
{
    if (columns.empty())
        throw TableException ("Empty columns!");
    ColumnNames old_cols= r->get_name();
    for (unsigned long i = 0; i < columns.size(); i++)
    {
        if (std::find(old_cols.begin(), old_cols.end(),columns[i]) == old_cols.end())
        throw TableException ("Unknown columns!");
    }
    Table* temp = new Table(Database::new_table_name(), columns);
    RowSet old_rows = r->get_row();
    auto k = old_rows.begin();
    // Loops through all rows and deletes the corresponding columns
    while (k != old_rows.end())
    {
        Row* r_temp = new Row(temp);
        for (unsigned long l = 0; l < columns.size(); l++)
        {
            r_temp->append((*k)->value(columns[l]));
        }
        temp->add(r_temp);
        k++;
    }
    return temp;
}

Table *join(Table *r, Table *s)
{
    ColumnNames r_names = r->get_name();
    ColumnNames s_names = s->get_name();
    bool has = false;
    for (unsigned long i = 0; i < r_names.size(); i++)  {   
        for (unsigned long j = 0; j < s_names.size(); j++) {
            if (r_names[i] == s_names[j])
                has = true;
        }
    }
    if (!has)
        throw JoinException ("No Join Columns");
    if (r->empty())
        return r;
    if (s->empty())
        return s;
    //cerr << "finding join column" << endl;
    // Fnds a join column
    string join_col = "";
    for (unsigned long i = 0; i < r_names.size(); i++)
    {
        for (unsigned long j = 0; j < s_names.size(); j++)
        {
            if (r_names[i] == s_names[j])
            {
                join_col = r_names[i];
                break;
            }
        }
    }
    //cerr << "Found join column, creating new array for namemapping" << endl;
    // Creates new array for namemapping S.
    ColumnNames proj_names = r_names;
    NameMap* new_name = new NameMap;
    //string col = "0";
    for (unsigned long i = 0; i < s_names.size(); i++)
    {
        // Loops through s_names, if finds similar column than a then renames 
        // this ensures no duplicate columns before doing cartesian product.
        if (std::find(r_names.begin(), r_names.end(),s_names[i]) == r_names.end())
        {
            new_name->insert(std::pair<string, string>(s_names[i],s_names[i]));
            proj_names.push_back(s_names[i]);
        }
        else
        {
           new_name->insert(std::pair<string, string>(s_names[i],("s" + s_names[i])));
           // need to keep track of which columns changed 
        }
    }
    //cerr << "Trying to rename s" << endl;
    // Renames s
    s->table_rename(*new_name);
    //cerr << "Making cartesian product" << endl;
    // Cartesian product of both tables
    Table *c_prod = product(r,s);
    //cerr << "Removing columns" << endl;
    // Removes columns where join columns don't match
    Table *to_be_removed = new Table(Database::new_table_name(), c_prod->get_name());
    RowSet c_rows = c_prod->get_row();
    auto h = c_rows.begin();
    while (h != c_rows.end())
    {
        if ((*h)->value(join_col) != (*h)->value("s" + join_col))
        {
            to_be_removed->add(*h);
        }
        h++;
    }
    c_prod = diff(c_prod, to_be_removed);
    //cerr << "Removed columns projecting based on updated columns" << endl;
    // Projects based on modified column names
    c_prod = project(c_prod, proj_names);
    //cerr << "Removing duplicate rows" << endl;
    // Final step is to create a new table and add each row of the project table
    // This will get rid of duplicate rows. 
    RowSet select_rows = c_prod->get_row();
    auto i = select_rows.begin();
    Table* final_table = new Table(Database::new_table_name(), proj_names);
    while (i != select_rows.end())
    {
        if (!final_table->has(*i))
            final_table->add(*i);
        i++;
    }
    return final_table;
}
