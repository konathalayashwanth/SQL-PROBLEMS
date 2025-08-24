create table artist
(
   artistid    int,
   artistname  varchar(20)
)


create table songs
(
  songid  int,
  artistid  int
  )

create table  globalsongrank
(
   day  int,
   songid   int,
   rank     int
   )

insert into artist values(101,'yaswanth'),
(120,'sneha'),
(130,'priya'),
(140,'harsha'),
(150,'golu')

insert into songs values(95202,101),
						(19960,120),
						(34455,130),
						(45005,140),
						(50045,150)


insert into globalsongrank values(1,95202,5),
								  (3,95202,2),
								  (1,19960,3),
								  (9,19960,15),
								  (4,34455,4),
								  (7,45005,8),
								  (10,50045,2),
								  (12,34455)
--Q top 5artists

select top 5 artistid from
(
select *,DENSE_RANK() over(order by noofappearences asc) as rank from
(
select s.artistid,count(*) as noofappearences from songs s inner join globalsongrank g
on s.songid=g.songid
where rank<=10
group by s.artistid
) as k) as n
order by rank asc