SELECT -- PROJECT 1
-- selecting personal details of the staff
	first_name,
    last_name,
    email,
    store_id
-- from the staff table
FROM staff; 


SELECT DISTINCT -- PROJECT 2
-- taking the number of inventory according to the different stores available
	store_id,
    -- counting the number of inventories in each store and saving under a new alias
    COUNT(inventory_id) "Number of inventory" 
-- from the inventory table
FROM inventory  
-- arranging according to stores
GROUP BY store_id; 


SELECT -- PROJECT 3
-- checking for the number of active customers per store
	store_id,
    -- counting them and saving under an alias
    COUNT(active) "Active customers"
-- from the customer table
FROM customer 
-- only for those with the activity status of 1 which means "active"
WHERE active = 1 
-- arranging according to stores
GROUP BY store_id; 


SELECT DISTINCT -- PROJECT 4
-- coiunting the number of available customers' email addresses and saving them under a new alias
	COUNT(email) "Number of email addresses"
-- from the customers table
FROM customer
-- ordering them in ascending order
ORDER BY COUNT(email);


SELECT -- PROJECT 5
-- counting the number of different films in each store and saving them under an alias
	store_id,
    COUNT(DISTINCT film_id) "Unique films"
-- from the inventory table
FROM inventory
-- grouping them according to stores
GROUP BY store_id;
SELECT
-- counting the different categories of films using their unique id
	COUNT(DISTINCT category_id) "Unique film category"
-- from the film_category table
FROM film_category;


SELECT -- PROJECT 6
-- checking the minimum, maximum and average replacement cost of films and saving under new aliases
	MIN(replacement_cost) "Minimum",
    MAX(replacement_cost) "Maximum",
    AVG(replacement_cost) "Average"
-- from the film table
FROM film;


SELECT -- PROJECT 7
-- checking the average and maximum payments processed 
	AVG(amount) "Average amount processed",
    MAX(amount) "Maximum amount processed"
-- from the payment table
FROM payment;


SELECT -- PROJECT 8
-- checking the number of rentals each customer has done 
	customer_id,
    -- counting them and saving under a new alias 
    COUNT(rental_id) "Number of rentals"
-- from the rental table 
FROM rental
-- grouped based on each customers' id
GROUP BY customer_id
-- from the customers with highest rentals coming first
ORDER BY COUNT(rental_id) DESC