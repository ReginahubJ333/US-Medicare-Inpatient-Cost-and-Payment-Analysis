CREATE DATABASE healthcare_analytics;
USE healthcare_analytics;

CREATE TABLE medicare_inpatient(
drg TEXT,
drg_code VARCHAR(50),
drg_description TEXT,
provider_id INT,
hospital_name TEXT,
address TEXT,
city VARCHAR(50),
state VARCHAR(50),
postal_code VARCHAR(10),
hospital_referral_region TEXT,
total_discharges INT,
avg_covered_charges DECIMAL(12,2),
avg_total_payments DECIMAL(12,2),
avg_medicare_payments DECIMAL(12,2),
total_charges DECIMAL(15,2),
payment_gap DECIMAL(12,2),
medicare_payment_ratio DECIMAL(6,4)
);
SET GLOBAL local_infile = 1;

SHOW VARIABLES LIKE 'local_infile';

LOAD DATA LOCAL INFILE 'C:\Users\Brighton\OneDrive\Desktop\Regina\General\Data Analyst\US Healthcare Medical Billing & AR Analytics\Cleaned Dataset'
INTO TABLE medicare_inpatient
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

