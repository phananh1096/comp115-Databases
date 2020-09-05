-- What are the names of members who received messages on their birthdays? Order alphabetically.

select distinct name
from routing
join message on routing.message_id = message.message_id
join member on member.member_id = routing.to_member_id
where TO_CHAR(message.message_date, 'mon-dd') = TO_CHAR(member.birth_date, 'mon-dd')
order by name asc;