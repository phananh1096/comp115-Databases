-- Who sent messages on 2016/05/17? Order alphabetically.

select distinct name
from routing
join message on routing.message_id = message.message_id
join member on member.member_id = routing.from_member_id
where message_date = '2016/05/17'
order by name asc;