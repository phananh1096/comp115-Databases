-- Find the dates of the oldest and newest messages sent for each user. Print name and the two dates, ordered by name.

select name, min(message_date) as oldest_date, max(message_date) as newest_date
from routing
join message on routing.message_id = message.message_id
right join member on member.member_id = routing.from_member_id
group by name
order by name asc;