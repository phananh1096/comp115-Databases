-- Print the number of messages sent by Lucarne to every other member (i.e. omit messages from Lucarne to Lucarne), identified by name. 
select member.name, COALESCE(number_of_messages, 0) as number_of_messages
from (
	select name, count (*) as number_of_messages, member.member_id
	from routing
	join message on routing.message_id = message.message_id
	join member on member.member_id = routing.to_member_id
	where routing.from_member_id = (
									select distinct member_id
									from member
									where name = 'Lucarne')
	and name != 'Lucarne'
	group by name, member.member_id)q
right join member using (member_id)
where member.name != 'Lucarne'
order by number_of_messages desc;