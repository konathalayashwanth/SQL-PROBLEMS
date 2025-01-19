use indianbank

--derived table
select * from(select * from accountmaster) as k



--list the name,acid,noftxns from the year 2011 havin g nooftxns morenthan 3

--derivedtableconcept

select a.acid,name,nooftxns from accountmaster as a join
(select acid,count(*) as nooftxns from txnmaster where datepart(yy,DATEOFTRANSACTION)=2019 group by acid) as k
on a.ACID=k.ACID

select [TRANSACTIONNUMBER], [DATEOFTRANSACTION], [ACID], [BRID], [TXN_TYPE], [CHQ_NO], [CHQ_DATE], [TXN_AMOUNT] from txnmaster


