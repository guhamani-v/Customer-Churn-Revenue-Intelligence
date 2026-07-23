-- creating table for customer churn data; table name: customer_churn

CREATE TABLE customer_churn (
    customer_id VARCHAR(20),
    gender VARCHAR(10),
    age INT,
    married VARCHAR(5),
    number_of_dependents INT,
    city VARCHAR(100),
    zip_code INT,
    latitude DECIMAL(10,6),
    longitude DECIMAL(10,6),
    number_of_referrals INT,
    tenure_in_months INT,
    offer VARCHAR(50),
    phone_service VARCHAR(10),
    avg_monthly_long_distance_charges DECIMAL(10,2),
    multiple_lines VARCHAR(10),
    internet_service VARCHAR(10),
    internet_type VARCHAR(50),
    avg_monthly_gb_download INT,
    online_security VARCHAR(10),
    online_backup VARCHAR(10),
    device_protection_plan VARCHAR(10),
    premium_tech_support VARCHAR(10),
    streaming_tv VARCHAR(10),
    streaming_movies VARCHAR(10),
    streaming_music VARCHAR(10),
    unlimited_data VARCHAR(10),
    contract VARCHAR(50),
    paperless_billing VARCHAR(10),
    payment_method VARCHAR(50),
    monthly_charge DECIMAL(10,2),
    total_charges DECIMAL(10,2),
    total_refunds DECIMAL(10,2),
    total_extra_data_charges INT,
    total_long_distance_charges DECIMAL(10,2),
    total_revenue DECIMAL(10,2),
    customer_status VARCHAR(20),
    churn_category VARCHAR(50),
    churn_reason TEXT
);

-- since some of the columns has more than 10 characters, 
-- we are altering the created table: customer_churn

ALTER TABLE customer_churn
    ALTER COLUMN multiple_lines TYPE VARCHAR(25),
    ALTER COLUMN internet_service TYPE VARCHAR(25),
    ALTER COLUMN online_security TYPE VARCHAR(25),
    ALTER COLUMN online_backup TYPE VARCHAR(25),
    ALTER COLUMN device_protection_plan TYPE VARCHAR(25),
    ALTER COLUMN premium_tech_support TYPE VARCHAR(25),
    ALTER COLUMN streaming_tv TYPE VARCHAR(25),
    ALTER COLUMN streaming_movies TYPE VARCHAR(25),
    ALTER COLUMN streaming_music TYPE VARCHAR(25),
    ALTER COLUMN unlimited_data TYPE VARCHAR(25),
    ALTER COLUMN paperless_billing TYPE VARCHAR(25);

-- importing the cleaned dataset using excel 

COPY customer_churn 
FROM 'C:\PostGresData\cleaned_dataset_customer.csv' 
WITH ( 
FORMAT csv, 
header TRUE 
);

-- testing the imported data

SELECT 
	*
FROM customer_churn
LIMIT 5;

SELECT 
	COUNT(*) as Total_Count
FROM customer_churn; 

-- Auditing the data for duplicate customers 

SELECT 
	customer_id,
	COUNT(*) AS duplicate_records
FROM customer_churn
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- Auditing the data for missing customers ids

SELECT 
	COUNT(*) AS missing_ids
FROM customer_churn
WHERE customer_id IS NULL;

-- Auditing the data for Customer Status Distribution

SELECT 
	customer_status,
	COUNT(*) AS status_check
FROM customer_churn
GROUP BY customer_status;

-- Auditing the data for category exists

SELECT 
	churn_category,
	COUNT(*) AS count_category
FROM customer_churn
GROUP BY churn_category;
	