select 'ORIGINAL - NO INDEX';

explain
select * 
from r
where r_1p = 0
union
select *
from r
where r_10 = 0;


-------------------------------

select 'MAKE INDEX ON r_1p and ON r_10';

create index on r(r_1p);
create index on r(r_10);
analyze r;

explain
select * 
from r
where r_1p = 0
union
select *
from r
where r_10 = 0;

drop index r_r_1p_idx;
drop index r_r_10_idx;

-------------------------------

select 'REWRITING QUERY';

-- Index on both and use OR
create index on r(r_1p); 
create index on r(r_10);
analyze r;

explain
select * 
from r
where r_1p = 0
or r_10 = 0;

drop index r_r_10_idx;
drop index r_r_1p_idx;