use telecom;
CREATE TABLE telecom_customers (
    customer_id VARCHAR(50),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(30),
    address VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50),
    zipcode VARCHAR(10),
    signup_date DATE,
    contract_end DATE,
    plan_type VARCHAR(20),
    monthly_fee DECIMAL(10, 2),
    total_spent DECIMAL(10, 2),
    contract_length VARCHAR(30),
    payment_method VARCHAR(30),
    num_support_calls INT,
    satisfaction_score DECIMAL(5,2),
    loyalty_score INT
);

INSERT INTO telecom_customers VALUES
('8bd664cb-f99c-47e1-bb8b-f5f0dbbf97a7', 'Gregory', 'Carlson', 'garciavictor@williamson.com', '(703)921-5255', '71695 Green Valleys Apt. 843', 'Martinville', 'Vermont', 'Malta', 3121, '2021-11-25', '2024-10-23', 'Unlimited', 34.26, 2819.64, 'One Year', 'Debit Card', 50, 80.07, 123),
('10af2300-fc28-4adc-8877-c4b746ae2748', 'Ashley', 'Hill', 'halllisa@hotmail.com', '+1-373-268-0676x8799', '965 Sharon Plains Apt. 564', 'Petersonfort', 'Utah', 'Tuvalu', 92125, '2022-05-07', '2024-11-19', 'Unlimited', 79.41, 2289.33, 'One Year', 'Credit Card', 40, 53.01, 1719),
('72f6af1c-df43-40f4-b98c-ff46ac20c047', 'Susan', 'Stokes', 'allenalbert@smith-rogers.com', '625-079-0055x157', '5572 Ryan Extension', 'Rodriguezstad', 'Rhode Island', 'Latvia', 23187, '2021-10-27', '2024-11-15', 'Unlimited', 60.81, 4989.71, 'Two Year', 'Paypal', 1, 51.32, 929),
('cc38aaef-5e36-4ec3-9238-1127a553901c', 'Julia', 'Brown', 'shannon68@cox.com', '(352)365-2811', '683 Chang Vista Apt. 946', 'Brianborough', 'Arizona', 'Bahrain', 92321, '2022-11-21', '2024-03-15', 'Standard', 74.55, 1885.03, 'Two Year', 'Paypal', 40, 28.53, 224),
('327f70ab-c66c-431a-ac61-af408f9ac9e4', 'Alan', 'Weber', 'brentrichardson@schultz.net', '001-601-646-1219x349', '262 Jared Landing', 'South Peter', 'Tennessee', 'Holy See (Vatican City State)', 50157, '2022-09-22', '2024-02-15', 'Standard', 11.97, 1593.8, 'One Year', 'Bank Transfer', 25, 59.46, 1073),
('2aff6592-b42e-46e9-a499-13ff51de1733', 'Nicole', 'Powers', 'caitlin25@gmail.com', '7044229052', '146 Christine Park', 'Hammondview', 'Arkansas', 'Djibouti', 8631, '2022-08-08', '2024-05-21', 'Standard', 89.25, 2835.81, 'One Year', 'Paypal', 6, 31.34, 811),
('d7f07675-e63d-44fe-937a-2eca306a84ed', 'Ryan', 'Howard', 'whitneyarmstrong@sanders-glover.com', '401-047-7684x7598', '0323 Kimberly Squares Apt. 247', 'West Mariah', 'Nevada', 'Yemen', 65587, '2021-03-06', '2024-07-14', 'Basic', 48.76, 855.46, 'Two Year', 'Debit Card', 28, 75.58, 733),
('278c2d2d-284a-490c-9f0f-f9d2797ab46a', 'Vincent', 'Weiss', 'sara16@snyder.com', '-8362', '8454 Joseph Isle Suite 523', 'Brianburgh', 'Wisconsin', 'Saint Helena', 11940, '2023-03-23', '2024-12-23', 'Standard', 11.77, 1884.13, 'Month-to-Month', 'Credit Card', 48, 89.7, 1327),
('a060158b-8033-4ba8-a32a-9cc98bf635b7', 'Adrian', 'Jennings', 'richard10@yahoo.com', '160.668.5739', '214 Gregory Lock', 'New Manuelton', 'Virginia', 'Congo', 54573, '2021-03-09', '2024-02-29', 'Unlimited', 62.15, 2050.12, 'Two Year', 'Bank Transfer', 72, 44.31, 1302);

SELECT * FROM telecom_customers;

-- 1 Customers with a satisfaction score above 70, ordered by total spent
SELECT first_name, last_name, satisfaction_score, total_spent
FROM telecom_customers
WHERE satisfaction_score > 70
ORDER BY total_spent DESC;

-- 2 SUBQUERIES  , Customers who spent more than the average total spent
SELECT first_name, last_name, total_spent
FROM telecom_customers
WHERE total_spent > (
    SELECT AVG(total_spent) FROM telecom_customers
);


-- 3 Total revenue generated from Unlimited plans
SELECT SUM(total_spent) AS total_revenue
FROM telecom_customers
WHERE plan_type = 'Unlimited';


-- 4 View for high-loyalty customers (score > 1000)
CREATE VIEW high_loyalty_customers AS
SELECT customer_id, first_name, last_name, loyalty_score
FROM telecom_customers
WHERE loyalty_score > 1000;
SELECT * FROM high_loyalty_customers;

--  5 Add indexes on frequently queried fields
CREATE INDEX idx_satisfaction ON telecom_customers(satisfaction_score);
CREATE INDEX idx_plan_type ON telecom_customers(plan_type);
CREATE INDEX idx_payment_method ON telecom_customers(payment_method);





