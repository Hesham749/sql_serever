SELECT year(birth_date) as [year birth date]
FROM patients
group by year(birth_date)
order by year(birth_date)