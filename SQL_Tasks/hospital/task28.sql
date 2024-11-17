SELECT DAY(admission_date) as day_number , COUNT(*) as number_of_admission
FROM admissions
GROUP BY DAY(admission_date)
ORDER BY COUNT(*) DESC