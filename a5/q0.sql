-- What are the names of users who have not sent a message to themselves? Order alphabetically.

select distinct name
from routing
join message on routing.message_id = message.message_id
join member on member.member_id = routing.from_member_id
except
select distinct name
from routing
join message on routing.message_id = message.message_id
join member on member.member_id = routing.to_member_id
where routing.from_member_id = routing.to_member_id
order by name asc;