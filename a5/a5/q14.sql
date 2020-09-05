-- What are the names of members with unknown birth dates? Order by name.

select name 
from member
where birth_date is NULL
order by name asc;