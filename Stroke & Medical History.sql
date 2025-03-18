SELECT 
    SUBJECT_ID, -- Patient Identifier 
    MAX(CASE WHEN ICD9_CODE LIKE 'I63%' THEN 1 ELSE 0 END) AS stroke_history, -- Stroke History 
    MAX(CASE WHEN ICD9_CODE  LIKE 'I10%' THEN 1 ELSE 0 END) AS hypertension, -- Hypertension (Binary)
    MAX(CASE WHEN ICD9_CODE  LIKE 'E11%' THEN 1 ELSE 0 END) AS diabetes -- Diabetes (Binary)
FROM physionet-data.mimiciii_clinical.diagnoses_icd
GROUP BY SUBJECT_ID;
