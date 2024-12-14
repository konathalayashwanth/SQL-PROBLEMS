select * from loginfo




select a.accountid from loginfo a,loginfo b
where a.accountid=b.accountid and a.ipaddress<>b.ipaddress and a.login between b.login and b.logout