SELECT (select COUNT(*)
    from patients
    where gender = 'M') as [male_count] , (select COUNT(*)
    from patients
    where gender = 'F') as female_count
