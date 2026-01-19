--- 1. Which DRGs have the highest average covered charges? ---

SELECT drg_code, drg_description, ROUND(AVG(avg_covered_charges), 2) AS avg_charge
FROM medicare_inpatient
GROUP BY drg_code, drg_description
ORDER BY avg_charge DESC
LIMIT 10;

--- 2. How does Medicare payment compare to hospital charges? ---

SELECT drg_code, 
       drg_description,
       ROUND(AVG(avg_covered_charges), 2) AS avg_charge,
       ROUND(AVG(avg_medicare_payments), 2) AS avg_medicare_payments,
       ROUND(AVG(payment_gap), 2) AS avg_payment_gap
FROM medicare_inpatient
GROUP BY drg_code, drg_description
ORDER BY avg_payment_gap DESC
LIMIT 10; 

--- 3. Which hospitals have the largest Medicare payment gaps? ---

SELECT hospital_name,
       state,
       ROUND(SUM(payment_gap * total_discharges), 2) AS total_payment_gap,
       ROUND(SUM(medicare_payment_ratio), 3) AS avg_medicare_ratio
FROM medicare_inpatient
GROUP BY hospital_name, state
ORDER BY total_payment_gap DESC
LIMIT 10;

--- 4. Are there state-level differences in hospital charges and Medicare payments? ---

SELECT state,
       ROUND(AVG(avg_covered_charges), 2) AS avg_charge,
       ROUND(AVG(avg_medicare_payments), 2) AS avg_medicare_payment,
       ROUND(AVG(medicare_payment_ratio), 3) AS avg_medicare_ratio
FROM medicare_inpatient
GROUP BY state
ORDER BY avg_charge DESC;

--- 5. Which hospitals are relatively more efficient in Medicare reimbursement? ---

SELECT hospital_name,
       state,
       SUM(total_discharges) AS total_discharges,
       ROUND(AVG(medicare_payment_ratio), 3) AS avg_medicare_ratio,
       ROUND(AVG(avg_covered_charges), 2) AS avg_charge
FROM medicare_inpatient
GROUP BY hospital_name, state
HAVING SUM(total_discharges) >= 100
ORDER BY avg_medicare_ratio DESC
LIMIT 10;       