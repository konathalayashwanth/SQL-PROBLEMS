
--find the students with same markks in physics and chemistry

select * from exams


select * from exams where student_id in(
select student_id from exams
where subject in('Chemistry','Physics')
group by student_id
having count(distinct subject)=2 and count(distinct marks)=1)