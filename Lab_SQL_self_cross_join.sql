USE sakila;

#1 Get all pairs of actors that worked together.
SELECT c.title, a.actor_id AS Actor_1, b.actor_id AS Actor_2
FROM film_actor a
JOIN film_actor b
ON a.film_id = b.film_id
INNER JOIN film c
ON b.film_id = c.film_id
INNER JOIN actor d
ON a.actor_id = d.actor_id;


#2 Get all pairs of customers that have rented the same film more than 2 times.
SELECT c.film_id, a.customer_id AS Customer_1, b.customer_id AS Customer_2, COUNT(*) AS Movie
FROM rental a
JOIN rental b
ON a.inventory_id = b.inventory_id and a.customer_id > b.customer_id
INNER JOIN inventory c
ON b.inventory_id = c.inventory_id
GROUP BY c.film_id, a.customer_id, b.customer_id
HAVING COUNT(*) > 2;


#3 Get all possible pairs of actors and films.
SELECT f.title, CONCAT(a.first_name,' ',a.last_name) AS Actor_Name FROM actor a
CROSS JOIN film f;
