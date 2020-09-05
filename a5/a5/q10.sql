-- What are the minimum and maximum birth dates among the members?

select MIN(birth_date) as min_birth_date, MAX(birth_date) as max_birth_date
from member;