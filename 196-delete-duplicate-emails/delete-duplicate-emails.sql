delete from person where id in
(select a.id from
                (select id,email,row_number() over (partition by email order by id) as rn from person)
                as a
where a.rn>1
);