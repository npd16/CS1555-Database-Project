select fname,lname,t.total 
from (
	select sender as UserId,(c_sender+c_receiver) as Total 
	from (
		select sender,count(sender) as c_sender 
		from messages 
		where sent_date 
		between to_date('2015-04-26','YYYY-MM-DD') and to_date('2016-04-25','YYYY-MM-DD') 
		group by sender 
	)t1 join (
		select receiver,count(receiver) as c_receiver 
		from messages 
		where sent_date 
		between to_date('2015-04-26','YYYY-MM-DD') and to_date('2016-04-25','YYYY-MM-DD') 
		group by receiver 
	)t2 
	on t1.sender = t2.receiver 
	order by total desc 
)t join Profiles 
on t.userID = profiles.userid 
where rownum <= 12;