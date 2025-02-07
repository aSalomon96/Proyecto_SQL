--Sección 3: Consultas Avanzadas
-- 1. ID extremos:
-- Encuentra el ID del actor más bajo y más alto.
select
	min(actor_id) as "ID_mas_bajo",
	max(actor_id) as "ID_mas_alto"
from actor a 

-- 2. Conteo total de actores:
-- Cuenta cuántos actores hay en la tabla actor.
select 
	count(distinct a.actor_id)
from actor a 

-- 3. Ordenación por apellido:
-- Selecciona todos los actores y ordénalos por apellido en orden ascendente.
select
	distinct a.last_name
from actor a
order by 1
	
-- 4. Películas iniciales:
-- Selecciona las primeras 5 películas de la tabla film.
select 
	title 
from film f 
limit 5;

-- 5. Agrupación por nombres:
-- Agrupa los actores por nombre y cuenta cuántos tienen el mismo nombre.
select 
	a.first_name,
	count( a.first_name)
from actor a 
group by 1
order by 2 desc;

-- 6. Alquileres y clientes:
-- Encuentra todos los alquileres y los nombres de los clientes que los realizaron.
select 
	r.customer_id,
	r.rental_id
from customer c 
inner join rental r on r.customer_id = c.customer_id;
-- 7. Relación cliente-alquiler:
-- Muestra todos los clientes y sus alquileres, incluyendo los que no tienen.
select 
	r.customer_id,
	r.rental_id
from customer c 
left join rental r on r.customer_id = c.customer_id
order by 1;
-- 8. CROSS JOIN:
-- Realiza un CROSS JOIN entre las tablas film y category. Analiza su valor.
select * 
from film f 
cross join category c2;

-- 9. Actores en categorías específicas:
-- Encuentra los actores que han participado en películas de la categoría ‘Action’.
select
	concat(a.first_name, ' ', a.last_name) as "actor",
	c."name" 
from actor a 
inner join film_actor fa on fa.actor_id = a.actor_id 
inner join film f on fa.film_id = f.film_id 
inner join film_category fc on fc.film_id = f.film_id 
inner join category c on c.category_id = fc.category_id 
where c."name" = 'Action';

-- 10. Actores sin películas:
-- Encuentra todos los actores que no han participado en películas.
SELECT 
    CONCAT(a.first_name, ' ', a.last_name) AS actor
FROM actor a
LEFT JOIN film_actor fa ON fa.actor_id = a.actor_id
LEFT JOIN film f ON f.film_id = fa.film_id 
WHERE fa.actor_id IS NULL;

-- 11. Crear vistas:
-- Crea una vista llamada actor_num_peliculas que muestre los nombres de los actores y el número de películas en las que han actuado.
create view "actor_num_peliculas" as
select
	concat(a.first_name, ' ', a.last_name) as "actor",
	count(fa.film_id) 
from actor a 
inner join film_actor fa on a.actor_id = fa.actor_id
group by 1;


SELECT * FROM actor_num_peliculas ORDER BY count DESC;