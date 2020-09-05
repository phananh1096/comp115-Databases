-- What are the names of members who have never sent a message? Order alphabetically.

select name 
from member
except 
select name 
from routing
join message on routing.message_id = message.message_id
join member on member.member_id = routing.from_member_id

