-- creating table zip_code for the same db: telecom_churn_db

CREATE TABLE zip_code (
	Zip_code INT,
	Population INT
);

-- importing table zip_code for the same db: telecom_churn_db

COPY zip_code
FROM 'C:\PostGresData\telecom_zipcode.csv'
WITH (
	format csv,
	header true
);

-- testing the imported data

SELECT 
	* 
FROM zip_code
LIMIT 5;