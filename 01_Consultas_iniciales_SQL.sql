-- Sección 1: Consultas SQL Iniciales   
    
-- 2. Consultas básicas de selección:
-- Muestra los nombres de todas las películas con una clasificación por edades de ‘R’.
SELECT 
    title,
    rating
FROM
    film
WHERE rating = 'R';

-- 3. Rangos de identificación:
-- Encuentra los nombres de los actores con actor_id entre 30 y 40.
select
	concat(a.last_name ,', ',a.first_name) as nombre,
	actor_id 
from 
	actor a
where 
	actor_id > 30 and actor_id < 40;

-- 4. Filtrar por idioma:
-- Obtén las películas cuyo idioma coincide con el idioma original.
select 
	title as pelicula,
	language_id,
	original_language_id 
from 
	film f 
where language_id = original_language_id ;

-- 5. Clasificación por duración:
-- Ordena las películas por duración de forma ascendente.
select 
	title,
	f.length 
from film f 
order by 2 desc;

-- 6. Filtro por apellido:
-- Encuentra el nombre y apellido de los actores con ‘Allen’ en su apellido.
select 
	first_name,
	last_name 
from actor a 
where last_name = 'ALLEN'

-- 7. Conteo de películas por clasificación:
-- Encuentra la cantidad total de películas en cada clasificación de la tabla film y muestra la clasificación junto con el recuento.
select
	rating, 
	count( rating) 
from 
	film f
group by rating 

-- 8. Filtro combinado:
-- Encuentra el título de todas las películas que son ‘PG13’ o tienen una duración mayor a 3 horas.
select
	title,
	rating,
	length 
from film f 
where rating = 'PG-13' or length > '180'

-- 9. Análisis de costos:
-- Encuentra la variabilidad de lo que costaría reemplazar las películas.
select 
	stddev(f.replacement_cost) as "desvio_std",
	variance(f.replacement_cost) as "varianza"
from
	film f 

-- 10. Duraciones extremas:
-- Encuentra la mayor y menor duración de una película en la base de datos.
select 
	max(length),
	min(length) 
from film f 
	
-- 11. Costo del alquiler:
-- Encuentra lo que costó el antepenúltimo alquiler ordenado por día.
select 
	p.amount,
	p.payment_date
from
	payment p 
order by 2 desc
offset 2;


-- 12. Exclusión de clasificaciones:
-- Encuentra el título de las películas que no sean ni ‘NC-17’ ni ‘G’ en cuanto a clasificación.
select
	title,
	rating 
from film f 
where rating != 'NC-17' and rating != 'G'
order by 2;

-- 13. Promedios de duración por clasificación:
-- Encuentra el promedio de duración de las películas para cada clasificación y muestra la clasificación junto con el promedio.
select 
	round(avg(length),2),
	rating 
from film f 
group by 2
order by 1;

-- 14. Películas largas:
-- Encuentra el título de todas las películas con una duración mayor a 180 minutos.
select
	title,
	length 
from film f 
where f.length > 180
order by 2 desc;

-- 15. Ingresos totales:
-- ¿Cuánto dinero ha generado en total la empresa?
select
	sum(amount) as "ingresos_totales"
from payment p 

-- 16. Clientes con ID alto:
-- Muestra los 10 clientes con mayor valor de ID.
select
	concat(c.last_name ,', ',c.first_name) as nombre,
	c.customer_id 
from customer c 
order by 2 desc
limit 10
-- 17. Película específica:
-- Encuentra el nombre y apellido de los actores que aparecen en la película con título ‘Egg Igby’.
select 
	concat(a.last_name ,', ',a.first_name) as nombre,
	f.title
from actor a
inner join film_actor fa on fa.actor_id = a.actor_id 
inner join film f on f.film_id = fa.film_id 
where f."title" = 'EGG IGBY';