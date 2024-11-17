select patient_id  , count(*) as total_admissions
from admissions
where patient_id = 579
group by patient_id