--Sección 2: Consultas Intermedias
-- 1. Selección única:
-- Selecciona todos los nombres únicos de películas.
select
	title 
from film f;

-- 2. Filtros combinados con duración:
-- Encuentra las películas que son comedias y tienen una duración mayor a 180 minutos.
select 
	title,
	c."name" as "tipo_pelicula",
	f.length as "duracion"
from film f 
inner join film_category fc on fc.film_id = f.film_id 
inner join category c on c.category_id = fc.category_id 
where c."name" = 'Comedy' and f.length > 180;

-- 3. Promedio por categoría:
-- Encuentra las categorías de películas con un promedio de duración superior a 110 minutos y muestra el nombre de la categoría junto con el promedio.
select
	c."name" ,
	round(avg(f.length),2) as "promedio_duracion"
from category c 
inner join film_category fc ON fc.category_id = c.category_id 
inner join film f on f.film_id = fc.film_id
group by 1
having avg(f.length) > 110;

-- 4. Duración media de alquiler:
-- ¿Cuál es la media de duración del alquiler de las películas?
select 
    AVG(extract (EPOCH from ("return_date" - "rental_date")) / 86400) as "media_duracion" --86400 son los segundos en un dia
from
    rental r;
  
-- 5. Concatenación de nombres:
-- Crea una columna con el nombre completo (nombre y apellidos) de los actores y actrices.
select 
	concat(a.first_name, ' ', a.last_name) 
from actor a ;
    
-- 6. Conteo de alquileres por día:
-- Muestra los números de alquileres por día, ordenados de forma descendente.
select 
	r.rental_date,
	count(*) as "cantidad_alquileres"
from rental r
group by 1
ORDER BY cantidad_alquileres desc

-- 7. Películas sobre el promedio:
-- Encuentra las películas con una duración superior al promedio.
select 
	title,
	length 
from film f 
where length > (select avg(f.length) from film f)
order by 2 desc;

-- 8. Conteo mensual:
-- Averigua el número de alquileres registrados por mes.
select
	count(*) as "alquiler_mes",
	extract ('month' from r.rental_date) as "mes"
from rental r 
group by 2;


-- 9. Estadísticas de pagos:
-- Encuentra el promedio, la desviación estándar y la varianza del total pagado.
select
	avg(amount) as "promedio",
	stddev(amount) as "desvio_std",
	variance(amount) as "varianza"
from payment p 

-- 10. Películas caras:
-- ¿Qué películas se alquilan por encima del precio medio?
select
	f.title as pelicula,
	p.amount 
from film f 
inner join inventory i on i.film_id = f.film_id 
inner join rental r on r.inventory_id = i.inventory_id
inner join payment p on r.rental_id = p.rental_id 
where
	 p.amount > (SELECT AVG(amount) FROM payment)
order by 2 desc ;

-- 11. Actores en muchas películas:
-- Muestra el ID de los actores que hayan participado en más de 40 películas.
select
	a.actor_id,
	concat(a.first_name, ' ', a.last_name) as "nombre",
	count(fa.film_id) as "conteo_peliculas"
from actor a 
inner join film_actor fa on fa.actor_id = a.actor_id 
inner join film f on f.film_id = fa.film_id 
group by 1,2
having (count(fa.film_id)) > 40

-- 12. Disponibilidad en inventario:
-- Obtén todas las películas y, si están disponibles en el inventario, muestra la cantidad disponible.
select 
	f.title,
	count(i.film_id)
from film f 
inner join inventory i ON f.film_id = i.film_id 
group by 1
order by 2 desc 

-- 13. Número de películas por actor:
-- Obtén los actores y el número de películas en las que han actuado.
select
	concat(a.first_name, ' ', a.last_name) as "nombre",
	count(f.film_id) 
from film f 
inner join film_actor fa  on f.film_id = fa.film_id 
inner join actor a on fa.actor_id = a.actor_id 
group by 1
order by 2 desc

-- 14. Relaciones actor-película:
-- Obtén todas las películas con sus actores asociados, incluso si algunas no tienen actores.
select
	concat(a.first_name, ' ', a.last_name) as "nombre",
	f.title 
from film f 
inner join film_actor fa  on f.film_id = fa.film_id 
inner join actor a on fa.actor_id = a.actor_id 
order by 2;
-- 15. Clientes destacados:
-- Encuentra los 5 clientes que más dinero han gastado.
select
	concat(c.first_name, ' ', c.last_name) as "nombre",
	sum(p.amount)
from customer c
inner join rental r on c.customer_id= r.customer_id 
inner join payment p on p.rental_id = r.rental_id
group by 1
order by 2 desc
limit 5;