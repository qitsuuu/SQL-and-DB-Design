-- 1. Get all the list of customers.
	SELECT * FROM customer;
    
-- 2. Get all the list of customers as well as their address.
SELECT CONCAT(first_name, ' ', last_name) AS customer_name, address FROM customer LEFT JOIN address ON customer.address_id=address.address_id;

-- 3. Get all the list of customers as well as their address and the city name.
SELECT CONCAT(first_name, ' ', last_name) AS customer_name, address, city FROM customer LEFT JOIN address ON customer.address_id=address.address_id LEFT JOIN city ON address.city_id =city.city_id;

-- 4. Get all the list of customers as well as their address, city name, and the country.
SELECT CONCAT(first_name, ' ', last_name) AS customer_name, address, city, country FROM customer LEFT JOIN address ON customer.address_id=address.address_id LEFT JOIN city ON address.city_id = city.city_id LEFT JOIN country ON city.country_id = country.country_id ORDER BY country;

-- 5. Get all the list of customers who live in Bolivia
SELECT CONCAT(first_name, ' ', last_name) AS customer_name, address, city, country FROM customer LEFT JOIN address ON customer.address_id=address.address_id LEFT JOIN city ON address.city_id = city.city_id LEFT JOIN country ON city.country_id = country.country_id WHERE country='Bolivia';

-- 6. Get all the list of customers who live in Bolivia, Germany and Greece
SELECT CONCAT(first_name, ' ', last_name) AS customer_name, address, city, country FROM customer LEFT JOIN address ON customer.address_id=address.address_id LEFT JOIN city ON address.city_id = city.city_id LEFT JOIN country ON city.country_id = country.country_id WHERE country IN ('Bolivia', 'Germany', 'Greece');

-- 7. Get all the list of customers who live in the city of Baku.
SELECT CONCAT(first_name, ' ', last_name) AS customer_name, address, city, country FROM customer LEFT JOIN address ON customer.address_id=address.address_id LEFT JOIN city ON address.city_id = city.city_id LEFT JOIN country ON city.country_id = country.country_id WHERE city='Baku';

-- 8. Get all the list of customers who live in the city of Baku, Beira, and Bergamo.
SELECT CONCAT(first_name, ' ', last_name) AS customer_name, address, city, country FROM customer LEFT JOIN address ON customer.address_id=address.address_id LEFT JOIN city ON address.city_id = city.city_id LEFT JOIN country ON city.country_id = country.country_id WHERE city IN ('Baku', 'Beira', 'Bergamo') ORDER BY city;

-- 9. Get all the list of customers who live in a country where the country name's length is less than 5.  Show the customer with the longest full name first.  (Hint:  Look into how you can concatenate a string in SQL).
SELECT CONCAT(first_name, ' ', last_name) AS customer_name, country, length(country) AS country_name_length FROM customer LEFT JOIN address ON customer.address_id=address.address_id LEFT JOIN city ON address.city_id = city.city_id LEFT JOIN country ON city.country_id = country.country_id WHERE length(country)<5 ORDER BY length(CONCAT(first_name,last_name)) DESC, country ASC, city ASC;

-- 10. Get all the list of customers who live in a city name whose length is more than 10.  Order the result so that the customers who live in the same country are shown together.
SELECT CONCAT(first_name, ' ', last_name) AS customer_name, country, city, length(city) AS city_name_length FROM customer LEFT JOIN address ON customer.address_id=address.address_id LEFT JOIN city ON address.city_id = city.city_id LEFT JOIN country ON city.country_id = country.country_id WHERE length(city)>10 ORDER BY country ASC, city ASC;

-- 11. Get all the list of customers who live in a city where the city name includes the word 'ba'.  For example Arratuba or Baiyin  should show up in your result.
SELECT CONCAT(first_name, ' ', last_name) AS customer_name, city FROM customer LEFT JOIN address ON customer.address_id=address.address_id LEFT JOIN city ON address.city_id = city.city_id WHERE city LIKE '%ba%' ORDER BY city; 

-- 12. Get all the list of customers where the city name includes a space.  Order the result so that customers who live in the longest city are shown first.
SELECT CONCAT(first_name, ' ', last_name) AS customer_name, city, length(city) AS city_name_length FROM customer LEFT JOIN address ON customer.address_id=address.address_id LEFT JOIN city ON address.city_id = city.city_id WHERE city LIKE '% %' ORDER BY city_name_length DESC, city DESC;

-- 13. Get all the customers where the country name is longer than the city name.
SELECT CONCAT(first_name, ' ', last_name) AS customer_name, city, country, length(city) AS city_name_length, length(country) AS country_name_length FROM customer LEFT JOIN address ON customer.address_id=address.address_id LEFT JOIN city ON address.city_id = city.city_id LEFT JOIN country ON city.country_id = country.country_id WHERE length(country)>length(city);