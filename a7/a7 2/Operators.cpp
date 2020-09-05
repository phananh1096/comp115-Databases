#include <cassert>
#include <algorithm>
#include "QueryProcessor.h"
#include "Table.h"
#include "Index.h"
#include "Iterator.h"
#include "Row.h"
#include "ColumnSelector.h"
#include "Operators.h"
#include "util.h"

//----------------------------------------------------------------------

// TableIterator 

unsigned TableIterator::n_columns() 
{
    //return IMPLEMENT_ME;
    return _table->columns().size();
}

void TableIterator::open() 
{
    //IMPLEMENT_ME;
    _end = _table->rows().end();
    _input = _table->rows().begin();
}

Row* TableIterator::next() 
{
  //return IMPLEMENT_ME;  
  //Row* row = NULL;
  if (_input == _end)
    return NULL;
  else  {
    /*
    row = new Row;
    for (unsigned i = 0; i < (*_input)->size(); i++) {
      row->append((*_input)->at(i));
    }
    */
    return *_input++;
  }
}

void TableIterator::close() 
{
    //_input;
    //_end;
}

TableIterator::TableIterator(Table* table)
    : _table(table)
{
}

//----------------------------------------------------------------------

// IndexScan

unsigned IndexScan::n_columns()
{
    //return IMPLEMENT_ME;
    return _index->n_columns();
}

void IndexScan::open()
{
    if (_index->empty()){
      return;
    }
    _input = _index->begin();
    while (_input->first < *_lo) {
      _input++;
    }
    for (_end = --_index->end(); _end != _input; _end--) {
        if (_end->first < *_hi) {
          break;
        }
    } 
    _end++;
}

Row* IndexScan::next()
{
    // How to check for base case?
    if (_index->size() == 0)
      return NULL;
    else if (_input == _end)
      return NULL;
    else
      return (_input++)->second;
}

void IndexScan::close()
{
  
}

IndexScan::IndexScan(Index* index, Row* lo, Row* hi)
    : _index(index),
      _lo(lo),
      _hi(hi == NULL ? lo : hi)
{}

//----------------------------------------------------------------------

// SelectIterator 

unsigned Select::n_columns()
{
    return _input->n_columns();
    //return IMPLEMENT_ME;
}

void Select::open()
{
    _input->open();
}

Row* Select::next()
{
    Row* selected = NULL;
    Row* curr = _input->next();
    while (curr != NULL) {
      if (_predicate(curr)) {
        selected = new Row();
        for (unsigned i = 0; i < curr->size(); i++) {
          selected->append(curr->at(i));
        }
        break;
      }
      else {
        Row::reclaim(curr);
        curr = _input->next();
      }
    }
    Row::reclaim(curr);
    return selected;
}

void Select::close()
{
    _input->close();
}

Select::Select(Iterator* input, RowPredicate predicate)
    : _input(input),
      _predicate(predicate)
{
}

Select::~Select()
{
    delete _input;
}

//----------------------------------------------------------------------

// ProjectIterator 

unsigned Project::n_columns()
{
  //return IMPLEMENT_ME;
  return _column_selector.n_selected();
}

void Project::open()
{
  _input->open();
}

Row* Project::next()
{
  //return IMPLEMENT_ME;
    Row* projected = NULL;
    Row* row = _input->next();
    if (row) {
        projected = new Row();
        for (unsigned i = 0; i < _column_selector.n_selected(); i++) {
            projected->append(row->at(_column_selector.selected(i)));
        }
        Row::reclaim(row);
    }
    return projected;
}

void Project::close()
{
    //IMPLEMENT_ME;
    _input->close();
}

Project::Project(Iterator* input, const initializer_list<unsigned>& columns)
    : _input(input),
      _column_selector(input->n_columns(), columns)
{}

Project::~Project()
{
    delete _input;
}

//----------------------------------------------------------------------

// NestedLoopsJoinIterator

unsigned NestedLoopsJoin::n_columns()
{
    return (_left_join_columns.n_columns() +_right_join_columns.n_unselected());
}

void NestedLoopsJoin::open()
{
    _left->open();
    _right->open();
    _left_row = _left->next();
    /*
    Row* temp = _right->next();
    Row::reclaim(temp);
    */
}

Row* NestedLoopsJoin::next()
{
  Row* curr = NULL;
  Row* rrow = _right->next();
  if (rrow == NULL) 
    return NULL;
  while (_left_row != NULL) {
    if (rrow != NULL) {
      if (_left_row->at(_left_join_columns.selected(0)) == rrow->at(_right_join_columns.selected(0)))
        break;
      else {
        Row::reclaim(rrow);
        rrow =_right ->next();
      }
    }
    else if (rrow == NULL) {
      Row::reclaim(_left_row);
      _left_row = _left->next();
      if (_left_row != NULL){
        _right->close();
        _right->open(); 
        rrow = _right->next();
      }
    }
  }
  if (_left_row != NULL && rrow != NULL) {
    curr = new Row();
    for (unsigned i = 0; i < _left_row->size(); i++) {
          curr->append(_left_row->at(i));
      }
    for (unsigned i = 0; i < _right_join_columns.n_unselected(); i++) {
          curr->append(rrow->at(_right_join_columns.unselected(i)));
      }
    Row::reclaim(rrow);
    return curr;
  }
  else
    return NULL;

  /*
    Row* curr = NULL;
    Row* rrow = _right->next();
    if (_left_row != NULL && rrow != NULL) {
      while (_left_row->at(_left_join_columns.selected(0)) != rrow->at(_right_join_columns.selected(0))){
          _left_row = _left->next();
          if (_left_row == NULL)
            break;
        }
      if (_left_row != NULL) {
        curr = new Row();
        for (unsigned i = 0; i < _left_row->size(); i++) {
              curr->append(_left_row->at(i));
          }
        for (unsigned i = 0; i < _right_join_columns.n_unselected(); i++) {
              curr->append(rrow->at(_right_join_columns.unselected(i)));
          }
      }
      Row::reclaim(rrow);
    }
    return curr;
    */
}

void NestedLoopsJoin::close()
{
    _left->close();
    _right->close();
}

NestedLoopsJoin::NestedLoopsJoin(Iterator* left,
                                 const initializer_list<unsigned>& left_join_columns,
                                 Iterator* right,
                                 const initializer_list<unsigned>& right_join_columns)
    : _left(left),
      _right(right),
      _left_join_columns(left->n_columns(), left_join_columns),
      _right_join_columns(right->n_columns(), right_join_columns),
      _left_row(NULL)
{
    assert(_left_join_columns.n_selected() == _right_join_columns.n_selected());
}

NestedLoopsJoin::~NestedLoopsJoin()
{
    delete _left;
    delete _right;
    Row::reclaim(_left_row);
}

//----------------------------------------------------------------------

// Sort

unsigned Sort::n_columns() 
{
    return _input->n_columns();
}

void Sort::open() 
{
    _input->open();
    Row* curr = _input->next();
    if (curr) {
      _sorted.push_back(curr);
      while (curr != NULL) {
        curr = _input->next();
        if (curr != NULL) {
          _sorted.push_back(curr);
        }
        //Row::reclaim(curr);
      }
    }
    sort(_sorted.begin(), _sorted.end(), RowCompare::only);
    Row::reclaim(curr);
    _sorted_iterator = _sorted.begin();
}

Row* Sort::next() 
{
  if (_sorted_iterator == _sorted.end())
    return NULL;
  else  {
    return *_sorted_iterator++;
  }
}

void Sort::close() 
{
    _sorted.clear();
    _input->close();
}

Sort::Sort(Iterator* input, const initializer_list<unsigned>& sort_columns)
    : _input(input),
      _sort_columns(input->n_columns(), sort_columns)
{}

Sort::~Sort()
{
    delete _input;
}

//----------------------------------------------------------------------

// Unique

unsigned Unique::n_columns()
{
    return _input->n_columns();
}

void Unique::open() 
{
    _input->open();
}

Row* Unique::next()
{
  Row* curr = NULL;
  Row* row = _input->next();
  if (row == NULL) {
    Row::reclaim(row);
    return NULL;
  } 
  if (_last_unique == NULL) {
    curr = new Row;
    for (unsigned i = 0; i < row->size(); i++) {
          curr->append(row->at(i));
    }
    _last_unique = row;
    return curr;
  }
  else {
    while (*row == *_last_unique) {
      Row::reclaim(row);
      row = _input->next();
      if (row == NULL)
        break;
    }
    Row::reclaim(_last_unique);
    _last_unique = row;
    if (row != NULL) {
      curr = new Row;
      for (unsigned i = 0; i < row->size(); i++) {
          curr->append(row->at(i));
      }
    }
    return curr;
  }
}

void Unique::close() 
{
    _last_unique = NULL;
    _input->close();
}

Unique::Unique(Iterator* input)
    : _input(input),
      _last_unique(NULL)
{}

Unique::~Unique()
{
    delete _input;
}
