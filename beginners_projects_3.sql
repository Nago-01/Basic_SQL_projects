/* 
1. My partner and I want to come by each of the stores in person and meet the managers. 
Please send over the managers’ names at each store, with the full address 
of each property (street address, district, city, and country please).  
*/ 

SELECT -- Project 1
	staff.first_name AS "First Name",
    staff.last_name AS "Last Name",
    address.address AS "Street Address",
    address.district AS "District",
    city.city AS "City",
    country.country AS "Country"
FROM store
	LEFT JOIN staff
		ON store.manager_staff_id = staff.staff_id
	LEFT JOIN address
		ON store.address_id = address.address_id
	LEFT JOIN city
		ON address.city_id = city.city_id
	LEFT JOIN country
		ON city.country_id = country.country_id;
        

/*
2.	I would like to get a better understanding of all of the inventory that would come along with the business. 
Please pull together a list of each inventory item you have stocked, including the store_id number, 
the inventory_id, the name of the film, the film’s rating, its rental rate and replacement cost. 
*/

SELECT -- Project 2
	inventory.store_id AS "Store ID",
    inventory.inventory_id AS "Inventory ID",
    film.title AS "Film Title",
    film.rating AS "Film rating",
    film.rental_rate AS "Rental rate",
    film.replacement_cost AS "Replacement cost"
FROM film
	LEFT JOIN inventory
		ON film.film_id = inventory.film_id;


/* 
3.	From the same list of films you just pulled, please roll that data up and provide a summary level overview 
of your inventory. We would like to know how many inventory items you have with each rating at each store. 
*/

SELECT DISTINCT -- Project 3
	inventory.store_id AS "Store",
	film.rating AS "Rating",
	COUNT(film.film_id) AS "Number of Inventory"
FROM inventory
	LEFT JOIN film
		ON film.film_id = inventory.film_id
GROUP BY film.rating, inventory.store_id;


/* 
4. Similarly, we want to understand how diversified the inventory is in terms of replacement cost. We want to 
see how big of a hit it would be if a certain category of film became unpopular at a certain store.
We would like to see the number of films, as well as the average replacement cost, and total replacement cost, 
sliced by store and film category. 
*/ 

SELECT -- Project 4
	inventory.store_id AS "Store ID",
    category.name AS "Category",
    COUNT(inventory.inventory_id) AS "Number of Films",
    AVG(film.replacement_cost) AS "Avg Replacement Cost",
    SUM(film.replacement_cost) AS "Total Replacement"
FROM inventory
	LEFT JOIN film
		ON inventory.film_id = film.film_id
	LEFT JOIN film_category
		ON film.film_id = film_category.film_id
	LEFT JOIN category
		ON film_category.category_id = category.category_id
GROUP BY
	inventory.store_id, category.name
ORDER BY SUM(film.replacement_cost) DESC;


/*
5.	We want to make sure you folks have a good handle on who your customers are. Please provide a list 
of all customer names, which store they go to, whether or not they are currently active, 
and their full addresses – street address, city, and country. 
*/

SELECT -- Project 5
	CONCAT(customer.first_name, ' ', customer.last_name) AS "Names of Customers",
    customer.store_id "Store ID",
    address.address "Address",
    city.city "City",
    country.country "Country",
    CASE
		WHEN customer.active = 1 THEN "Active"
		WHEN customer.active = 0 THEN "Inactive"
        ELSE " "
        END AS Status
FROM customer
	LEFT JOIN address
		ON customer.address_id = address.address_id
	LEFT JOIN city
		ON address.city_id = city.city_id
	LEFT JOIN country
		ON city.country_id = country.country_id;
	


/*
6.	We would like to understand how much your customers are spending with you, and also to know 
who your most valuable customers are. Please pull together a list of customer names, their total 
lifetime rentals, and the sum of all payments you have collected from them. It would be great to 
see this ordered on total lifetime value, with the most valuable customers at the top of the list. 
*/

SELECT -- Project 6
	customer.first_name "First Name",
    customer.last_name "Last Name",
    COUNT(rental.rental_id) "Total Lifetime Rentals",
    SUM(payment.amount) "Total payments"
FROM customer
	LEFT JOIN rental
		ON customer.customer_id = rental.customer_id
	LEFT JOIN payment
		ON rental.rental_id = payment.rental_id
GROUP BY 
	customer.first_name, customer.last_name
ORDER BY 
	SUM(payment.amount) DESC;



/*
7. My partner and I would like to get to know your board of advisors and any current investors.
Could you please provide a list of advisor and investor names in one table? 
Could you please note whether they are an investor or an advisor, and for the investors, 
it would be good to include which company they work with. 
*/

SELECT -- Project 7
	"Investor" AS Type,
	CONCAT(investor.first_name, ' ', investor.last_name) "Names of Investors",
    investor.company_name "Company name"
FROM investor
UNION
SELECT
	"Advisor" AS Type,
	CONCAT(advisor.first_name, ' ', advisor.last_name) "Names of Advisors",
    NULL
FROM advisor;


/*
8. We're interested in how well you have covered the most-awarded actors. 
Of all the actors with three types of awards, for what % of them do we carry a film?
And how about for actors with two types of awards? Same questions. 
Finally, how about actors with just one award? 
*/

SELECT -- Project 8
	CASE 
		WHEN actor_award.awards = 'Emmy, Oscar, Tony ' THEN '3 awards'
        WHEN actor_award.awards IN ('Emmy, Oscar','Emmy, Tony', 'Oscar, Tony') THEN '2 awards'
		ELSE '1 award'
	END AS "Number of awards", 
    AVG(CASE WHEN actor_award.actor_id IS NULL THEN 0 ELSE 1 END) AS "% with one film"
	
FROM actor_award
	

GROUP BY 
	CASE 
		WHEN actor_award.awards = 'Emmy, Oscar, Tony ' THEN '3 awards'
        WHEN actor_award.awards IN ('Emmy, Oscar','Emmy, Tony', 'Oscar, Tony') THEN '2 awards'
		ELSE '1 award'
	END




