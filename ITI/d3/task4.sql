SELECT p.Pnumber , p.Pname , p.Plocation
FROM Project as p
WHERE City in ('Cairo' , 'Alex')