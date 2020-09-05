select 'ORIGINAL - NO INDEX';

explain
select t.*
from t
join s using (t_id)
join r using (s_id)
join u using (u_id)
where u_5 = 0;

-------------------------------

select 'MAKE INDEX ON t_id and ON s_id and ON u_id';

create index on t(t_id);
create index on s(t_id);
-- index on s_u 
create index on s(u_id);
create index on r(s_id);
-- index on u_5
create index on u(u_5);
analyze r;


explain
select t.*
from t
join s using (t_id)
join r using (s_id)
join u using (u_id)
where u_5 = 0;

drop index t_t_id_idx;
drop index s_t_id_idx;
drop index s_u_id_idx;
drop index r_s_id_idx;
drop index u_u_5_idx;

-------------------------------
