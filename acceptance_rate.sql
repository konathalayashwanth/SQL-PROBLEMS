select * from friendrequest

select * from requestaccepted



select isnull
		(round(
			(select count(*) from
				(select distinct requester_id,accepter_id from requestaccepted) as request_accepted) /
					(select count(*) from
					(select distinct sender_id,send_to_id from friendrequest) as friend_request),2),0.00) as acceptance_rate