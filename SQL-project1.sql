-- Q1
-- SELECT DISTINCT
-- MIN(replacement_cost)
-- FROM film

-- Q2
-- SELECT 
-- CASE
-- WHEN replacement_cost BETWEEN 9.99 AND 19.99 THEN 'LOW'
-- WHEN replacement_cost BETWEEN 20.00 AND 24.99 THEN 'MEDIUM'
-- WHEN replacement_cost BETWEEN 25.00 AND 29.99 THEN 'HIGH'
-- ELSE 'other'
-- END as cos,
-- COUNT(*)
-- FROM film
-- GROUP BY cos

-- Q3
-- SELECT
-- title,
-- length,
-- name
-- FROM film as fi1
-- INNER JOIN film_category as fi2
-- on fi1.film_id=fi2.film_id
-- INNER JOIN category as fi3
-- on fi2.category_id=fi3.category_id
-- WHERE name = 'Drama' or name = 'Sports'
-- ORDER BY length DESC

-- Q4
-- SELECT
-- COUNT(*),
-- name
-- FROM film as fi1
-- INNER JOIN film_category as fi2
-- ON fi1.film_id=fi2.film_id
-- INNER JOIN category as fi3
-- ON fi2.category_id=fi3.category_id
-- GROUP BY name
-- ORDER BY count DESC


-- Q5
-- SELECT DISTINCT
--   act.first_name,
--   act.last_name,
--   COUNT(fa.film_id) AS film_count
-- FROM
--   actor act
--   INNER JOIN film_actor fa ON act.actor_id = fa.actor_id
-- GROUP BY
--   act.actor_id, act.first_name, act.last_name
-- ORDER BY film_count DESC 


-- Q6
-- SELECT
-- address,
-- adr.address_id,
-- customer_id
-- from address adr
-- LEFT OUTER JOIN customer cus
-- ON cus.address_id=adr.address_id
-- WHERE customer_id IS NULL

-- Q7
-- SELECT 
-- city,
-- SUM(amount) as sum_am
-- FROM payment pay
-- INNER JOIN customer cus
-- ON pay.customer_id=cus.customer_id
-- INNER JOIN address adr
-- ON adr.address_id=cus.address_id
-- INNER JOIN city cit
-- ON cit.city_id=adr.city_id
-- GROUP BY city
-- ORDER BY sum_am DESC

-- Q8
-- SELECT 
-- country ||','|| city as location,
-- country,
-- SUM(amount) as sum_am
-- FROM payment pay
-- INNER JOIN customer cus
-- ON pay.customer_id=cus.customer_id
-- INNER JOIN address adr
-- ON adr.address_id=cus.address_id
-- INNER JOIN city cit
-- ON cit.city_id=adr.city_id
-- INNER JOIN country con
-- ON cit.country_id=con.country_id
-- GROUP BY city, country
-- ORDER BY sum_am ASC

-- Q9
-- -- SELECT
-- -- COUNT(customer_id),
-- -- staff_id
-- -- FROM
-- -- payment
-- -- GROUP BY 
-- -- staff_id

-- -- SELECT 
-- -- SUM(amount),
-- -- staff_id
-- -- FROM
-- -- payment
-- -- GROUP BY staff_id
-- SELECT
--   AVG(customer_avg_amount),
--   staff_id
-- FROM
--   (SELECT
--     COUNT(customer_id),
--     staff_id,
--     SUM(amount) / COUNT(DISTINCT customer_id) AS customer_avg_amount
--   FROM
--     payment
--   GROUP BY
--     staff_id, customer_id) AS subquery
-- GROUP BY
--   staff_id;

-- =======Q10 do zrobienia============================
-- -- działające daje same niedziele
-- -- SELECT
-- -- amount,
-- -- TO_CHAR(payment_date, 'DD-MM-YYYY') as dayy
-- -- FROM payment
-- -- WHERE EXTRACT(DOW FROM payment_date) = 0

-- SELECT
-- AVG(amount),
-- TO_CHAR(payment_date, 'DD-MM-YYYY') as dayy
-- FROM payment
-- WHERE EXTRACT(DOW FROM payment_date) = 0
-- GROUP BY 2

SELECT 
AVG(total)
FROM 
	(SELECT
	 SUM(amount) as total,
	 DATE(payment_date),
	 EXTRACT(dow from payment_date) as weekday
	 FROM payment
	 WHERE EXTRACT(dow from payment_date)=0
	 GROUP BY DATE(payment_date),weekday) daily
--=====================================================

-- Q11
-- SELECT 
-- length,
-- replacement_cost,
-- title
-- FROM film fi1
-- WHERE length > 
-- (SELECT AVG(length) FROM film fi2 
--  WHERE fi1.replacement_cost = fi2.replacement_cost)
-- ORDER BY length

-- Q12
-- SELECT
-- ROUND(AVG(sum_a),2),
-- district
-- FROM(SELECT
-- cus.customer_id,
-- SUM(amount) sum_a,
-- district
-- FROM payment pay
-- LEFT OUTER JOIN customer cus
-- ON pay.customer_id=cus.customer_id
-- LEFT OUTER JOIN address adr
-- ON cus.address_id=adr.address_id
-- GROUP BY cus.customer_id, district
-- ORDER BY 3)sub
-- GROUP BY district
-- ORDER BY 1 DESC

-- Q13
-- SELECT
-- SUM(pay.amount),
-- cat.name,
-- MIN(payment_id)
-- FROM payment pay
-- LEFT OUTER JOIN rental ren
-- ON pay.rental_id=ren.rental_id
-- LEFT OUTER JOIN inventory inv
-- ON ren.inventory_id=inv.inventory_id
-- LEFT OUTER JOIN film_category fica
-- ON inv.film_id=fica.film_id
-- LEFT OUTER JOIN category cat
-- ON fica.category_id=cat.category_id
-- GROUP BY cat.name
-- ORDER BY name ASC

-- Q14
-- SELECT
-- SUM(amount),
-- title,
-- name
-- FROM payment pay
-- LEFT OUTER JOIN rental ren
-- ON pay.rental_id=ren.rental_id
-- LEFT OUTER JOIN inventory inv
-- ON ren.inventory_id=inv.inventory_id
-- LEFT OUTER JOIN film_category fica
-- ON inv.film_id=fica.film_id
-- LEFT OUTER JOIN category cat
-- ON fica.category_id=cat.category_id
-- LEFT OUTER JOIN film fi
-- ON fica.film_id=fi.film_id
-- WHERE
-- cat.name = 'Animation'
-- GROUP BY name, title
-- ORDER BY 1 DESC








