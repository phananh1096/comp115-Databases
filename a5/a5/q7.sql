-- What are the names of senders and receivers of messages sent on 2016/05/17? Order by sender name and receiver name, alphabetically.

select p.sender, q.receiver
from (
	select distinct name as sender, message.message_id
			from routing
			join message on routing.message_id = message.message_id
			join member on member.member_id = routing.from_member_id
			where message_date = '2016/05/17')p
join (
	select distinct name as receiver, message.message_id
			from routing
			join message on routing.message_id = message.message_id
			join member on member.member_id = routing.to_member_id
			where message_date = '2016/05/17')q
	using (message_id)
order by sender, receiver asc;
