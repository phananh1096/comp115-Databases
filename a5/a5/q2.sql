-- What are the send dates of messages sent by Zyrianyhippy? Order by descending date.

select distinct message_date
from routing
join message on routing.message_id = message.message_id
join member on member.member_id = routing.from_member_id
where name = 'Zyrianyhippy'
order by message_date desc;