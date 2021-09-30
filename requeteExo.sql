-- # Exercices de requêtes

-- ## Requêtes simples
-- 1.  Obtenir toutes les informations de tous les films
SELECT * FROM `film`;

-- 2.  Obtenir une liste des noms des pays
SELECT country FROM country;

-- 3.  Obtenir le nom complet et l'adresse mail des clients
SELECT first_name, last_name, email from customer;

-- 4.  Obtenir toutes les informations de tous les actors
SELECT * from actor;

-- 5.  Obtenir toutes les noms des catégories des films
SELECT name FROM category;

-- ## Requêtes avec de filtres
-- 6.  Chercher toutes les infos sur le client Betty White
SELECT * FROM customer WHERE first_name = 'Betty' AND last_name = 'white';

-- 7.  Obtenir les films dont la location (rental_rate) coute moins de 3€. 
--Triez le résultat par prix ascendant en utilisant ORDER BY
SELECT title FROM film WHERE rental_rate < 3 ORDER BY title;

-- 8.  Obtenir tous les films qu'on peut louer pendant plus de 5 jours
SELECT title FROM film WHERE rental_duration > 5;

-- 9.  Chercher les informations sur le film 'Backlash Undefeated'
SELECT * FROM film WHERE title = 'backlash undefeated';

-- 10. Chercher tous les films dont le nom commence par 'C'
SELECT title FROM film WHERE title LIKE 'c%';

-- 11. Obtenir les titres des films dont la location coûte entre 4 et 6 euros
SELECT title FROM film WHERE rental_rate BETWEEN 4 AND 6;

-- 12. Chercher tous les films dont le nom contient « Town »
SELECT title FROM film WHERE title LIKE '%Town%';

-- 13. Chercher tous les films dont le titre commence par 'B' or 'D'
SELECT title FROM film WHERE title LIKE 'b%' OR title LIKE 'd%';

-- 14. Chercher tous les clients qui s'appellent « Moore » (nom de famille)
SELECT * FROM customer WHERE last_name = 'Moore';

-- 15. Chercher tous les clients qui s'appellent « Rashomon »
SELECT * FROM customer WHERE last_name = 'Rashomon';

-- 16. Chercher tous les paiements qui ont été réalisés pendant les 10 premiers jours d'Aout 2005

-- ## Agrégation

-- 17. Obtenir le nombre de clients

-- 18. Calculer la moyenne des prix de location

-- 19. Compter le nombre de clients actifs

-- 20. Obtenir la durée du film le plus long

-- 21. Calculer la durée moyenne des films

-- ## Requêtes de jointure

-- 22. Obtenir la ville de chaque client

-- 23. Obtenir tous les titres des films joués par Fred Costner

-- 24. Obtenir la liste d'acteurs qui jouent dans African Egg

-- 25. Obtenir tous les films de chaque catégorie

-- 26. Obtenir toutes les villes de chaque pays

-- ## Group by + jointures

-- 27. Obtenir le nombre de films par durée de location

-- 28. Obtenir le nombre de locations par client

-- 29. Obtenir le nombre de films par rating

-- 30. Obtenir le nombre de films par langue

-- 31. Obtenir le nombre de locations par client

-- 32. Obtenir le nombre de copies de Alabama Devil qui se trouvent dans
--     l'inventaire

-- 33. Obtenir la liste de films loués par Lisa Anderson

-- 34. Obtenir le nombre de locations faites par Elizabeth Brown

-- 35. Obtenir le nombre de films par catégorie

-- 36. Obtenir le nombre de clients par pays

-- 37. Obtenir le nombre de films par acteur. Affichez le nom de l'acteur

-- 38. Obtenir le nombre de films par catégorie, uniquement pour les
--     catégories qui ont au moins 5 films

-- 39. Obtenir le prix total des locations de chaque client

-- 40. Obtenir la liste de tous les clients qui ont réalisé plus de 5
--     locations

-- ## Calculs et fonctions de base

-- 41. Les prix de location sont en dollars. Obtenez les informations du
--     tableau de « payments » en rajoutant une colonne contenant les prix
--     en euros

-- 42. Obtenir les films dont le titre a plus de 10 caractères

-- 43. Obtenir une liste de noms complets de clients (concat)

-- 44. Obtenir tous les titres de films en majuscules

-- 45. Obtenir tous les prix de location arrondis ver le haut

-- ## Exercice

-- 46. Créez 3 requêtes de jointure ayant au moins 3 tableaux (INNER JOIN)

-- 47. Créez 3 requêtes de jointure ayant au moins 3 tableaux et qui
--     contiennent un regroupement
