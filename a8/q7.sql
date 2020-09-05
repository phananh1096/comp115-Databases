select 'ORIGINAL - NO INDEX';

explain
select *
from r
where s_id in (
    select s_id
    from s
    where s_20 = 0
    and t_id in (
        select t_id
        from t
        where t_5 = 0
    )
);


-------------------------------

select 'MAKE INDEX ON r_50p and ON s_4';

-- index
create index on t(t_5);
create index on s(s_20);
-- index	
create index on s(t_id);
-- index
create index on r(s_id);	
analyze r;


explain
select *
from r
where s_id in (
    select s_id
    from s
    where s_20 = 0
    and t_id in (
        select t_id
        from t
        where t_5 = 0
    )
);

drop index t_t_5_idx;
drop index s_s_20_idx;
drop index s_t_id_idx;
drop index r_s_id_idx;

-------------------------------

select 'REWRITING QUERY';

create index on t(t_5);
create index on s(s_20);	
create index on s(t_id);
create index on r(s_id);	
analyze r;


explain
select *
from r
join s using (s_id)
join t using (t_id)
where s_20 = 0
and t_5 = 0;

drop index t_t_5_idx;
drop index s_s_20_idx;
drop index s_t_id_idx;
drop index r_s_id_idx;
