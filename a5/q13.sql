-- On what dates did Unguiferous and Abderian both send messages? Print dates in order.

select distinct message_date
from routing
join message on routing.message_id = message.message_id
join member on member.member_id = routing.from_member_id
where name = 'Abderian'
intersect
select distinct message_date
from routing
join message on routing.message_id = message.message_id
join member on member.member_id = routing.from_member_id
where name = 'Unguiferous'
order by message_date asc;