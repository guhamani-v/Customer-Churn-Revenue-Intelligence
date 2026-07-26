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

-- What is our overall churn rate?

SELECT
    COUNT(*) AS total_customers,
    SUM(CASE WHEN customer_status = 'Churned' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN customer_status = 'Churned' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM customer_churn;

-- The company has a churn rate of 27%, 
--indicating that approximately 1 in every 4 customers has left

-- Which contract type has the highest churn rate?

SELECT 
	contract,
	COUNT(*) AS total_customers,
	SUM(CASE WHEN customer_status = 'Churned' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN customer_status = 'Churned' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate
FROM customer_churn
GROUP BY contract
ORDER BY churn_rate DESC;

-- Insight: Month-to-Month contracts experience the highest customer churn, 
--suggesting that customers without long-term commitments are more likely to switch or cancel services.

-- Which payment method has the highest churn rate?

SELECT 
	payment_method,
	COUNT(*) AS total_customers,
	SUM(CASE WHEN customer_status = 'Churned' THEN 1 ELSE 0 END) AS churn_status,
	ROUND(100.0 * SUM(CASE WHEN customer_status = 'Churned' THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate
FROM customer_churn
GROUP BY 1
ORDER BY churn_rate DESC;

-- Insight: Customers using the Mailed Check payment method experience the highest churn rate, 
--indicating that this payment option may be associated with lower customer retention compared to other payment methods.

-- Which of the Top 3 Internet Type has the highest churn rate?

WITH customers AS(
	SELECT 
		internet_type,
		COUNT(*) AS total_customers,
		SUM(CASE WHEN customer_status = 'Churned' THEN 1 ELSE 0 END) AS churn_customers,
		ROUND(100.0 * SUM(CASE WHEN customer_status = 'Churned' THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate,
		ROW_NUMBER() OVER(ORDER BY ROUND(100.0 * SUM(CASE WHEN customer_status = 'Churned' THEN 1 ELSE 0 END) / COUNT(*), 2) DESC) AS rnk
	FROM customer_churn
	GROUP BY 1
)
SELECT 
	*
FROM customers
WHERE rnk <= 3;

--Insight: Fiber Optic customers have the highest churn rate among all internet service types
--Investigating the Fiber Optic customer experience could help improve retention

-- Which cities have lost the most revenue due to customer churn?

SELECT
    city,
    COUNT(*) AS churned_customers,
    SUM(total_revenue) AS revenue_lost
FROM customer_churn
WHERE customer_status = 'Churned'
GROUP BY city
ORDER BY revenue_lost DESC;

-- Insight: San Diego contributes the highest revenue loss due to customer churn, 
--indicating that customer retention efforts in this city could have the greatest financial impact.