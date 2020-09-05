select 'MAKE INDEX ON r_2, r_1p, r_50p';

create index on r(r_2);
create index on r(r_50p);
create index on r(r_1p);
analyze r;

select 'EXPLAIN QUERY PLANS';

explain
select * from r where r_2 = 0;

explain
select * from r where r_1p = 0;

explain
select * from r where r_50p = 0;

drop index r_r_2_idx;
drop index r_r_1p_idx;
drop index r_r_50p_idx;