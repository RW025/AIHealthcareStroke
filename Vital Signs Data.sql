SELECT 
    SUBJECT_ID, -- Patient Identifier 
    AVG(CASE WHEN ITEMID IN (220179, 220050) THEN valuenum END) AS bp_systolic, --Systolic Blood Pressure
    AVG(CASE WHEN ITEMID IN (220180, 220051) THEN valuenum END) AS bp_diastolic, -- Diastolic Blood Pressure
    AVG(CASE WHEN ITEMID = 220045 THEN valuenum END) AS heart_rate,-- Heart Rate
    AVG(CASE WHEN ITEMID = 220277 THEN valuenum END) AS o2_saturation -- O2 Saturation
FROM physionet-data.mimiciii_clinical.chartevents
WHERE ITEMID IN (220179, 220050, 220180, 220051, 220045, 220277)
GROUP BY SUBJECT_ID;
