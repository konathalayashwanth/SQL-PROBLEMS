select min(distance) as shortest from
(
select abs(p1.x-p2.x) as distance
from point p1 cross join point p2
where p1.x<>p2.x
) as d