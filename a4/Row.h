#ifndef RA_C_ROW_H
#define RA_C_ROW_H

#include <unordered_map>
#include <string>
#include <vector>

using namespace std;

class Table;

class Row
{
public:
    bool operator==(const Row &) const;

    bool operator!=(const Row &row) const;

    // This Row's table
    const Table *table() const;

    // The value for the given column in this Row
    const string &value(const string &column) const;

    // Append a value to this Row
    void append(const string& value);

    // Create a Row for the given Table
    Row(const Table *table);

    // Destroy this Row
    ~Row();

    //Returns size of the Row
    int size();

private:
    const Table *_table;
    vector<string> value_at; 
};

#endif //RA_C_ROW_H
