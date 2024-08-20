SELECT -- PROJECT 1
-- specifying the needed columns in the new table
    inventory.inventory_id,
    inventory.store_id,
    film.title,
    film.description
-- selecting the left tableName
FROM film
	-- joining the right tableName
	INNER JOIN 
		inventory
        -- specifying the column they have in common
        ON film.film_id = inventory.film_id;


SELECT -- PROJECT 2
-- this is how to pull needed columns that originally exists in different but are needed for a new table
-- it is done by: 
-- specifying the needed columns from the two tables, using tableName.columnName
	customer.customer_id,
    customer.first_name,
    customer.last_name,
    address.address,
    address.district
-- selecting the left tableName
FROM customer
	-- joining to the right tableName
	INNER JOIN 
		address 
        -- stating the column they have in common
		ON customer.address_id = address.address_id;


SELECT -- PROJECT 3
-- selecting the needed fields in the tables 
	customers.customerName,
    customers.contactFirstName,
    customers.contactLastName,
    customers.city,
    orders.orderNumber,
    orders.status
-- specifying the left table
FROM customers
	-- joining the right table
	INNER JOIN
		orders
        -- specifying their joins
        ON customers.customerNumber = orders.customerNumber
-- indicating the required status and city
WHERE status = "Shipped" AND city = "NYC";


SELECT -- PROJECT 4
	customer.first_name,
    customer.last_name,
    address.address,
    address.district,
    city.city,
    country.country
FROM customer
	INNER JOIN 
		address
        ON customer.address_id = address.address_id
	JOIN
		city
        ON address.city_id = city.city_id
	JOIN 
		country
        ON city.country_id = country.country_id;
        



SELECT -- PROJECT 5
-- selecting the needed fields with customers details and the date of their order
	
	customers.contactFirstName,
    	customers.contactLastName,
    	orders.orderDate
-- specifying the leftTable
FROM customers
-- joining the rightTable
INNER JOIN orders
	-- specifying their linking field
	ON customers.customerNumber = orders.customerNumber
-- joining the rightTable against itself with an alias "wild"
JOIN
	orders wild
    -- specifying the value in the field of interest 
    ON wild.orderNumber = 10110
-- filtering out orders made after the date of the specified orderNumber
WHERE wild.orderDate < orders.orderDate;


SELECT -- PROJECT 6
-- filtering cutomers personal details in specific cities
-- selecting needed columns
	customer.address_id,
    customer.first_name,
    customer.last_name,
    address.address,
    city.city
FROM customer
JOIN
	address
    ON customer.address_id = address.address_id
JOIN
	city
	ON city.city_id = address.city_id
WHERE city LIKE "a%"; -- filtering cities using wildcard



SELECT -- PROJECT 7
-- combining two tables which are believed to shares duplicate values in some rows based on selected fields in the database: ispor
-- to avoid duplication, UNION operator will be used
	first_name,
    last_name,
    other_names
FROM(
	-- merging the two tables and removing the duplicates 
	SELECT 
		first_name,
		last_name,
		other_names
	FROM finalists
    UNION -- this merges the tables and removes duplicates
    SELECT
		first_name,
		last_name,
		other_names
	FROM fifth_year
) AS Unique_names -- assigning an alias to the outcome
ORDER BY 
-- sorting the groups based on how we want the result to be 
	first_name,
    last_name,
    other_names