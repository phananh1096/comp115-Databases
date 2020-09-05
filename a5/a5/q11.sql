-- How many messages have been received by Abderian?

select count (message_date)
from routing
join message on routing.message_id = message.message_id
join member on member.member_id = routing.to_member_id
where member.name = 'Abderian';