# Lab | SQL Advanced queries

-- In this lab, you will be using the [Sakila](https://dev.mysql.com/doc/sakila/en/) database of movie rentals.

USE sakila;

### Instructions

-- 1. List each pair of actors that have worked together.

SELECT * FROM actor;

WITH cte_actor_id AS (
  SELECT DISTINCT FA1.actor_id AS actor1_id, FA2.actor_id AS actor2_id
  FROM (
    SELECT actor_id, film_id
    FROM film_actor
  ) FA1
  JOIN (
    SELECT actor_id, film_id
    FROM film_actor
  ) FA2 ON FA1.film_id = FA2.film_id
  WHERE FA1.actor_id < FA2.actor_id
)
SELECT A1.actor_id AS actor1_id, A1.first_name, A1.last_name, A2.actor_id AS actor2_id, A2.first_name, A2.last_name
FROM cte_actor_id
JOIN actor A1 ON cte_actor_id.actor1_id = A1.actor_id
JOIN actor A2 ON cte_actor_id.actor2_id = A2.actor_id;

-- 2. For each film, list actor that has acted in more films.

SELECT FA.actor_id, A.first_name AS Name, A.last_name AS Last_name, COUNT(F.film_id) AS Count_films
FROM film F
JOIN film_actor FA ON F.film_id = FA.film_id
JOIN actor A ON FA.actor_id = A.actor_id
GROUP BY FA.actor_id
ORDER BY Count_films DESC;

# No se me ocurrió como hacerlo con Subqueries



