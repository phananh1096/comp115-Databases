-------------------------------

select 'MAKE INDEX ON r_1p and ON r_10p, r_50p';

create index on r(r_1p);
create index on r(r_10p, r_50p);
analyze r;


explain
select * from r 
where r_1p between 0 and 5
and r_10p = 0
and r_50p = 0;

drop index r_r_10p_r_50p_idx;
drop index r_r_1p_idx;

-------------------------------

select 'MAKE INDEX ON r_1p, r_10p, r_50p';

create index on r(r_1p, r_10p, r_50p);
analyze r;


explain
select * from r 
where r_1p between 0 and 5
and r_10p = 0
and r_50p = 0;

drop index r_r_1p_r_10p_r_50p_idx;