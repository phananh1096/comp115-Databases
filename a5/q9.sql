-- Who has sent at least 20 distinct messages?

select name, count(distinct message.message_id)
from routing
join message on routing.message_id = message.message_id
join member on member.member_id = routing.from_member_id
group by name
having count(distinct message.message_id) >= 20
order by count(distinct message.message_id) desc;