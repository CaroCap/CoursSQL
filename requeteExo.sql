--*# Exercices de requêtes

-- *## Requêtes simples
-- 1.  Obtenir toutes les informations de tous les films
SELECT * FROM film;

-- 2.  Obtenir une liste des noms des pays
SELECT country FROM country;

-- 3.  Obtenir le nom complet et l'adresse mail des clients
SELECT first_name, last_name, email from customer;

-- 4.  Obtenir toutes les informations de tous les actors
SELECT * from actor;

-- 5.  Obtenir toutes les noms des catégories des films
SELECT name FROM category;

-- *## Requêtes avec de filtres
-- 6.  Chercher toutes les infos sur le client Betty White
SELECT * FROM customer WHERE first_name = 'Betty' AND last_name = 'white';
-- 6.BIS  Chercher toutes les infos sur les clients SAUF Betty White
SELECT * FROM customer WHERE NOT (first_name = 'Betty' AND last_name = 'white');
--ou
SELECT * FROM customer WHERE first_name <> 'Betty' OR last_name <> 'white';

-- 7.  Obtenir les films dont la location (rental_rate) coute moins de 3€. 
--Triez le résultat par prix ascendant en utilisant ORDER BY
SELECT film.title, film.rental_rate FROM film WHERE rental_rate < 3 ORDER BY rental_rate DESC;

-- 8.  Obtenir tous les films qu'on peut louer pendant plus de 5 jours
SELECT title FROM film WHERE rental_duration > 5;

-- 9.  Chercher les informations sur le film 'Backlash Undefeated'
SELECT * FROM film WHERE title = 'backlash undefeated';

-- 10. Chercher tous les films dont le nom commence par 'C'
SELECT title FROM film WHERE title LIKE 'c%';

-- 11. Obtenir les titres des films dont la location coûte entre 4 et 6 euros
SELECT title FROM film WHERE rental_rate BETWEEN 4 AND 6;
--ou
SELECT title FROM film WHERE rental_rate >= 4 AND rental_rate <= 6;

-- 12. Chercher tous les films dont le nom contient « Town »
SELECT title FROM film WHERE title LIKE '%Town%';

-- 13. Chercher tous les films dont le titre commence par 'B' or 'D'
SELECT title FROM film WHERE title LIKE 'b%' OR title LIKE 'd%';

-- 14. Chercher tous les clients qui s'appellent « Moore » (nom de famille)
SELECT * FROM customer WHERE last_name = 'Moore';

-- 15. Chercher tous les clients qui s'appellent « Rashomon »
-- ?
SELECT * FROM customer WHERE last_name = 'Rashomon';

-- 16. Chercher tous les paiements qui ont été réalisés pendant les 10 premiers jours d'Aout 2005
--?
 SELECT * FROM payment WHERE payment_date BETWEEN 2005-08-01 AND 2005-08-10;

-- *## Agrégation
-- 17. Obtenir le nombre de clients
SELECT COUNT(*) FROM customer;

-- 18. Calculer la moyenne des prix de location avec 2 décimales après la virgule
SELECT ROUND(AVG(film.rental_rate),2) from film;

-- 19. Compter le nombre de clients actifs
SELECT COUNT(active) FROM `customer` WHERE active = 1;

-- 20. Obtenir la durée du film le plus long
SELECT MAX(length) FROM film;

-- 21. Calculer la durée moyenne des films
SELECT AVG(length) FROM film;

-- *## Requêtes de jointure
--22.  Obtenir tous les titres des films joués par Fred Costner
SELECT film.title AS 'Film de Fred Costner' FROM film INNER JOIN film_actor ON film_actor.film_id = film.film_id INNER JOIN actor ON film_actor.actor_id = actor.actor_id WHERE actor.first_name = 'Fred' AND last_name = 'Costner';

-- 23.  Obtenir la liste d'acteurs qui jouent dans African Egg
SELECT actor.first_name, actor.last_name FROM actor INNER JOIN film_actor ON film_actor.actor_id = actor.actor_id INNER JOIN film ON film_actor.film_id = film.film_id WHERE film.title = 'African Egg';

-- 24.  Obtenir tous les films de chaque catégorie
SELECT film.title, category.name FROM film
INNER JOIN film_category
ON film_category.film_id = film.film_id
INNER JOIN category
ON film_category.category_id = category.category_id;

-- 25.  Obtenir toutes les villes de chaque pays
SELECT country.country, city.city FROM city 
INNER JOIN country ON city.country_id = country.country_id
GROUP BY country.country;

-- *## Group by + jointures
-- 26.  Obtenir le nombre de films par durée de location
SELECT film.rental_duration, COUNT(film.film_id) FROM film GROUP BY film.rental_duration;

-- EXTRA TIME -> TIMEDIFF & DATEDIFF
SELECT rental_id, timediff(return_date, rental_date), rental_date, return_date FROM `rental`;
SELECT rental_id, dateediff(return_date, rental_date), rental_date, return_date FROM `rental`;

-- 27. Obtenir le nombre de locations par client
SELECT customer.first_name, customer.last_name, COUNT(rental.customer_id) FROM customer INNER JOIN rental ON rental.customer_id = customer.customer_id GROUP BY rental.customer_id;

-- 28. Obtenir le nombre de films par rating
SELECT film.rating, COUNT(film.rating) FROM film GROUP BY film.rating;

-- 29. Obtenir le nombre de films par langue
SELECT language.name, COUNT(film.film_id) FROM film 
INNER JOIN language 
ON language.language_id = film.language_id 
GROUP BY language.name;

-- 30. Obtenir le nombre de locations par client
SELECT customer.first_name, customer.last_name, COUNT(rental.customer_id) 
FROM customer 
INNER JOIN rental 
ON rental.customer_id = customer.customer_id 
GROUP BY rental.customer_id;

-- 31. Obtenir le nombre de copies de Alabama Devil qui se trouvent dans l'inventaire
SELECT film.title, COUNT(inventory.film_id) FROM `film` INNER JOIN inventory ON inventory.film_id = film.film_id WHERE film.title = 'Alabama Devil' GROUP BY film.title;

-- 32. Obtenir la liste de films loués par Lisa Anderson
SELECT film.title FROM `film` 
INNER JOIN inventory
ON inventory.film_id = film.film_id
INNER JOIN rental
ON rental.inventory_id = inventory.inventory_id
INNER JOIN customer
ON rental.customer_id = customer.customer_id
WHERE customer.first_name = 'Lisa' AND customer.last_name = 'Anderson';

-- 33. Obtenir le nombre de locations faites par Elizabeth Brown
SELECT customer.first_name, customer.last_name, COUNT(rental.customer_id) FROM customer
INNER JOIN rental
ON rental.customer_id = customer.customer_id
WHERE customer.first_name = 'Elizabeth' AND customer.last_name = 'Brown'
GROUP BY rental.customer_id;

-- 34. Obtenir le nombre de films par catégorie
SELECT category.name, COUNT(film_category.film_id) FROM category
INNER JOIN film_category
ON film_category.category_id = category.category_id
GROUP BY category.name;

-- 35. Obtenir le nombre de clients par pays 
-- * IMPOSSIBLE CAR PAS LE LIEN ENTRE TABLES

-- 36. Obtenir le nombre de films par acteur. Affichez le nom de l'acteur
SELECT actor.first_name, actor.last_name, COUNT(film_actor.film_id) FROM actor
INNER JOIN film_actor
ON film_actor.actor_id = actor.actor_id
GROUP BY film_actor.film_id;

-- 37. Obtenir le nombre de films par catégorie, uniquement pour les catégories qui ont au moins 60 films
SELECT category.name, COUNT(film_category.film_id) FROM category
INNER JOIN film_category
ON film_category.category_id = category.category_id
GROUP BY category.category_id
HAVING COUNT(film_category.category_id) >=60;

-- 38. Obtenir le prix total des locations de chaque client
SELECT customer.first_name, customer.last_name, SUM(payment.amount) FROM customer
INNER JOIN payment
ON payment.customer_id = customer.customer_id
GROUP BY customer.customer_id;

-- 39. Obtenir la liste de tous les clients qui ont réalisé plus de 25 locations
SELECT customer.first_name, customer.last_name, COUNT(rental.customer_id) FROM customer
INNER JOIN rental
ON rental.customer_id = customer.customer_id
GROUP BY rental.customer_id
HAVING COUNT(rental.customer_id) >=25;

-- *## Calculs et fonctions de base
-- 41. Les prix de location sont en dollars. Obtenez les informations du tableau de « payments » en rajoutant une colonne contenant les prix en euros
SELECT film.title AS 'Titre', film.rental_rate AS 'Prix $', ROUND(film.rental_rate*0.86,2) AS 'Prix €' FROM film;

-- 42. Obtenir les films dont le titre a plus de 10 caractères
SELECT film.title FROM film
WHERE LENGTH(film.title) > 10;

-- 43. Obtenir une liste de noms complets de clients (concat)
SELECT CONCAT(customer.first_name, " ", customer.last_name) FROM customer;

-- 44. Obtenir tous les titres de films en majuscules
SELECT UPPER(film.title) FROM film;
SELECT LOWER(film.title) FROM film;

-- 45. Obtenir tous les prix de location arrondis ver le haut
SELECT ROUND(film.rental_rate) AS 'Prix de Location' FROM film;

-- ## Exercice
-- 46. Créez 3 requêtes de jointure ayant au moins 3 tableaux (INNER JOIN)

-- 47. Créez 3 requêtes de jointure ayant au moins 3 tableaux et qui contiennent un regroupement

