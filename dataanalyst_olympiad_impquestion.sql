select * from students_list


select * from student_response

select * from correct_answer


select * from question_paper_code




----SOLUTION


with cte as
(
select sl.roll_number,sl.student_name,sl.class,sl.section,sl.school_name,
sum(case when qpc.subject='math' and sr.option_marked=ca.correct_option and sr.option_marked<>'e' then 1 else 0 end) as mathcorrect,
sum(case when qpc.subject='math' and sr.option_marked<>ca.correct_option and sr.option_marked<>'e' then 1 else 0 end) as mathwrong,
sum( case when qpc.subject='math' and sr.option_marked='e' then 1 else 0  end) as math_yet_to_learn,
sum(case when qpc.subject='science' and sr.option_marked=ca.correct_option and sr.option_marked<>'e' then 1 else 0 end) as sciencecorrect,
sum(case when qpc.subject='science' and sr.option_marked<>ca.correct_option and sr.option_marked<>'e' then 1 else 0 end) as sciencewrong,
sum( case when qpc.subject='science' and sr.option_marked='e' then 1 else 0  end) as science_yet_to_learn,
sum(case when qpc.subject='math' then 1 else 0 end ) as total_math_questions,
sum(case when qpc.subject='science' then 1 else 0 end) as science_total_questions
from students_list sl join student_response sr
on sl.roll_number=sr.roll_number
join correct_answer ca
on ca.question_paper_code=sr.question_paper_code and ca.question_number=sr.question_number
join question_paper_code qpc
on qpc.paper_code=sr.question_paper_code
group by sl.roll_number,sl.student_name,sl.class,sl.section,sl.school_name
)
select roll_number,student_name,class,section,school_name,mathcorrect,mathwrong,math_yet_to_learn,
round((mathcorrect/total_math_questions)*100,2) as math_percentage,
sciencecorrect,sciencewrong,science_yet_to_learn,
round((sciencecorrect/science_total_questions)*100,2) as science_percentage
from cte