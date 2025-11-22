    -- Before this, set first day of week to Monday (1)
SET DATEFIRST 1;

WITH MeetingsWithWeek AS (
    SELECT
        m.employee_id,
        e.employee_name,
        e.department,
        DATEADD(DAY, 1 - DATEPART(WEEKDAY, m.meeting_date), CAST(m.meeting_date AS DATE)) AS week_start_date,
        m.duration_hours
    FROM meetings m
    JOIN employees e ON m.employee_id = e.employee_id
),
WeeklyMeetingHours AS (
    SELECT
        employee_id,
        employee_name,
        department,
        week_start_date,
        SUM(duration_hours) AS total_meeting_hours
    FROM MeetingsWithWeek
    GROUP BY employee_id, employee_name, department, week_start_date
),
MeetingHeavyWeeks AS (
    SELECT
        employee_id,
        employee_name,
        department,
        week_start_date
    FROM WeeklyMeetingHours
    WHERE total_meeting_hours > 20
),
FinalCount AS (
    SELECT
        employee_id,
        employee_name,
        department,
        COUNT(DISTINCT week_start_date) AS meeting_heavy_weeks
    FROM MeetingHeavyWeeks
    GROUP BY employee_id, employee_name, department
)
SELECT
    employee_id,
    employee_name,
    department,
    meeting_heavy_weeks
FROM FinalCount
WHERE meeting_heavy_weeks >= 2
ORDER BY meeting_heavy_weeks DESC, employee_name ASC;