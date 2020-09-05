-- What are the send dates of messages sent by Zyrianyhippy? Order by descending date.

select send_date
from routing
join message as rm on routing.message_id = message.message_id 
join member as rmm on member.member_id = rm.member_id
where rmm.name = 'Zyrianyhippy';