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
        ON city.country_id = country.country_id