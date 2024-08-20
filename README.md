# Querying databases and filtering datasets

#A - inventory_review.sql

1. Publishing the personal details of all customers
2. Publishing the number of different inventories in each store and grouping them according to stores.
3. Checking the number of active customers in each available store.
4. Publishing the total number of customers' email addresses.
5. Publishing the number of different films in each available store and their unique categories.
6. Checking the minimum, maximum and average replacement cost of films in the company database.
7. Publishing the average and maximum payment available on the company database.
8. Publishing the number of rentals done by each customer, from the highest number of rentals down to the lowest.

#B - staff_review.sql

1. Publishing the inventory ID, store ID, titles and descriptions of films in the company's database.
2. Publishing customers' IDs, personal details and addresses.
3. Publishing customers' personal details and orders details based on status of their orders and city 
4. Publishing customers' personal details and some of their social demographics according to the available data on the database. 
5. Publishing customers' details and order dates for orders after an order number: 10110
6. Publishing customers' personal details from more than two tables based on specific cities
7. Publishing details of members of an organisation from different tables in their database but avoid duplication of any sort


#C - acquisition_report.sql

These are requests from a client to give insight for decision-making in his new acquisition:
1. My partner and I want to come by each of the stores in person and meet the managers. Please send over the managers’ names at each store, with the full address of each property (street address, district, city, and country).
2. I would like to get a better understanding of all of the inventory that would come along with the business. Please pull together a list of each inventory item you have stocked, including the store_id number, the inventory_id, the name of the film, the film’s rating, its rental rate and replacement cost.
3. From the same list of films you just pulled, please roll that data up and provide a summary level overview of your inventory. We would like to know how many inventory items you have with each rating at each store.
4. Similarly, we want to understand how diversified the inventory is in terms of replacement cost. We want to see how big of a hit it would be if a certain category of film became unpopular at a certain store. We would like to see the number of films, as well as the average replacement cost, and total replacement cost, sliced by store and film category.
5. We want to make sure you folks have a good handle on who your customers are. Please provide a list of all customer names, which store they go to, whether or not they are currently active, and their full addresses – street address, city, and country.
6. We would like to understand how much your customers are spending with you, and also to know who your most valuable customers are. Please pull together a list of customer names, their total lifetime rentals, and the sum of all payments you have collected from them. It would be great to see this ordered on total lifetime value, with the most valuable customers at the top of the list.
7. My partner and I would like to get to know your board of advisors and any current investors. Could you please provide a list of advisor and investor names in one table? Could you please note whether they are an investor or an advisor, and for the investors, it would be good to include which company they work with. 
8. We're interested in how well you have covered the most-awarded actors. Of all the actors with three types of awards, for what % of them do we carry a film? And how about for actors with two types of awards? Same questions. Finally, how about actors with just one award?