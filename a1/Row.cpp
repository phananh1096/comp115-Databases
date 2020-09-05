#include "Database.h"
#include "util.h"

bool Row::operator==(const Row &that) const
{
	// Loops through both rows and compares corresponding values at each index
	// Returns false if any pair of values are different
    for (unsigned long i = 0; i < that.value_at.size(); i++)
    {
    	if (that.value_at[i] == this->value_at[i])
    		return false;
    }
    return true;
}

bool Row::operator!=(const Row& row) const
{
    return !operator==(row);
}

const Table *Row::table() const
{
    return _table;
}

const string &Row::value(const string &column) const
{
	// Makes a copy of the column based on functions provided in Table class
	// The position of the string in the column is then determined
	// Value at position is then returned 
    ColumnNames temp = _table->columns();
    int pos = temp.position(column);
    return value_at.at(pos);
}

void Row::append(const string &value)
{
    value_at.push_back(value);
}



int Row::size()
{
	return value_at.size();
}

Row::Row(const Table *table)
        : _table(table)
{} 

Row::~Row()
{
    value_at.clear();
}
