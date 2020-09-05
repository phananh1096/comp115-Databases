#include <cstring>
#include "Database.h"
#include <set>

using namespace std;

const string &Table::name() const
{
    return _name;
}

const ColumnNames &Table::columns() const
{
    return _columns;
}

const RowSet& Table::rows()
{
    return *_rows;
}

bool Table::add(Row* row)
{
    if ((unsigned long)row->size() != _columns.size())
        throw TableException ("Attempted to add row with too few/many elements");
    // Checks if row already exists
    if (has(row))
        return false;
    _rows->insert(row);
    return true;
}

bool Table::remove(Row* row)
{
    if ((unsigned long)row->size() != _columns.size())
        throw TableException ("Attempted to remove row with too few/many elements");
    if (!has(row))
        return false;
    // Row *temp = row;
    //delete row;
    _rows->erase(row);
    return true;
}

bool Table::has(Row* row)
{
    if ((unsigned long)row->size() != _columns.size())
        throw TableException ("Attempted to find row with too few/many elements");
    if (_rows->find(row) != _rows->end())    
        return true;
    return false;
}

unsigned long Table::length()
{
    return _columns.size();
}

bool Table::empty()
{
    if (_rows->empty())
        return true;
    else
        return false;
}

ColumnNames Table::get_name()
{
    return _columns;
}

RowSet Table::get_row()
{
    return *_rows;
}

void Table::table_onion(RowSet r)
{
    _rows->insert(r.begin(),r.end());
}


void Table::table_rename(const NameMap &name_map)
{
    for (unsigned long i = 0; i < name_map.size(); i++)
    {
        if (name_map.find(_columns[i]) == name_map.end())
            throw TableException ("Wrong rename!");
        else
            _columns[i] = name_map.at(_columns[i]);
    }
}

void Table::table_select(RowSet r, RowPredicate predicate)
{
    auto i = r.begin();
    while (i != r.end())
    {
        if (predicate(*i))
            _rows->insert(*i);
        i++;
    }
}

Table::Table(const string &name, const ColumnNames &columns)
    : _name(name),
      _columns(columns)
{
    if (_columns.size() == 0)
        throw TableException("Columns can't be empty");
    // Checks for duplicates in _columns
    set<string> temp;
    for (unsigned long i = 0; i < _columns.size(); i++)
    {
        if(temp.insert(_columns[i]).second == false)
            throw TableException("Cannot have duplicate columns");
    }
    _rows = new RowSet;

}

Table::~Table()
{
    _columns.clear();
    auto i = _rows->begin();
    while (i != _rows->end())
    {
        delete (*i);
        i++;
    }
    _rows->clear();
    delete _rows;


}
