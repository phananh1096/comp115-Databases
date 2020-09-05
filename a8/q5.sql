select 'ORIGINAL - NO INDEX';

explain
select r_10, s_20
from r
join s using (s_id)
where r_50p = 0
and s_4 = 0;


-------------------------------

select 'MAKE INDEX ON r_50p and ON s_4';

create index on r(r_50p);
-- index
create index on r(s_id);
create index on s(s_id);	
-- index
create index on s(s_4);
analyze r;


explain
select r_10, s_20
from r
join s using (s_id)
where r_50p = 0
and s_4 = 0;

drop index r_r_50p_idx;
drop index r_s_id_idx;
drop index s_s_id_idx;
drop index s_s_4_idx;

-------------------------------
