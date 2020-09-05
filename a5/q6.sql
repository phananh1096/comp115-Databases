-- What are the names of members who received messages from Cephalophore? Order alphabetically.

select distinct name
from routing
join message on routing.message_id = message.message_id
join member on member.member_id = routing.to_member_id
where routing.from_member_id = (
								select distinct member_id
								from member
								where name = 'Cephalophore')
order by name asc;