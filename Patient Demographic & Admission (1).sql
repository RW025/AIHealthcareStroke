SELECT 
    p.SUBJECT_ID, --Patient Identifier
    p.GENDER, -- Patient Gender
    ROUND((EXTRACT(YEAR FROM adm.ADMITTIME) - EXTRACT(YEAR FROM p.DOB)),0) AS AGE,  -- Fetaure Engineering Patients Age
    adm.HOSPITAL_EXPIRE_FLAG AS MORTALITY,--Whether or not someone died
    MAX(CASE WHEN d.icd9_code LIKE '433%' OR d.icd9_code LIKE '434%' THEN 1 ELSE 0 END) AS STROKE_HISTORY -- 1 for stroke history, 0 for no stroke history
FROM `physionet-data.mimiciii_clinical.patients` p
JOIN `physionet-data.mimiciii_clinical.admissions` adm -- Joining necessary tables on Subject ID
ON p.SUBJECT_ID = adm.SUBJECT_ID
LEFT JOIN `physionet-data.mimiciii_clinical.diagnoses_icd` d  
ON p.SUBJECT_ID = d.SUBJECT_ID
GROUP BY p.SUBJECT_ID, p.GENDER, AGE, MORTALITY; -- Grouping conveniently for data 

