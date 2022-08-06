-- PART 1
-- 1. How many customers are there for each country?  Have your result display the full country name and the number of customers for each country
SELECT country, count(*) AS total_number_of_customer FROM customer LEFT JOIN address ON customer.address_id = address.address_id LEFT JOIN city ON address.city_id = city.city_id LEFT JOIN country ON city.country_id = country.country_id GROUP BY country;

-- 2. How many customers are there for each city?  Have your result display the full city name, the full country name, as well as the number of customers for each city.
SELECT city, country, count(*) AS total_number_of_customer FROM customer LEFT JOIN address ON customer.address_id = address.address_id LEFT JOIN city ON address.city_id = city.city_id LEFT JOIN country ON city.country_id = country.country_id GROUP BY city HAVING total_number_of_customer =1;

-- PART 2
-- 1. Retrieve both the average rental amount, the total rental amount, as well as the total number of transactions for each month of each year.
SELECT CONCAT(monthname(payment_date),'-', year(payment_date)) AS month_and_year, sum(amount) AS total_rental_amount, count(payment_id) as total_transactions, avg(amount) AS average_rental_amount FROM payment GROUP BY month_and_year ORDER BY year(payment_date), month(payment_date);

-- 2. Your manager comes and asks you to pull payment report based on the hour of the day.  The managers wants to know which hour the company earns the most money/payment.  Have your sql query generate the top 10 hours of the day with the most sales.  Have the first row of your result be the hour with the most payments received.
SELECT time_format(payment_date, '%h %p') AS hour, sum(amount) AS total_payments_received FROM payment GROUP BY hour ORDER BY total_payments_received DESC LIMIT 10;