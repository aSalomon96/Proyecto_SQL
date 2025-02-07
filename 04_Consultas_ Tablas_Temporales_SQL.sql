--Sección 4: Consultas con Tablas Temporales
-- 1. Alquileres totales:
-- Calcula el número total de alquileres realizados por cada cliente.
create temporary table "alquileres_totales"(
	"id_cliente" int,
	"nombre" varchar(255),
	"cantidad_alquieleres"int);

insert into "alquileres_totales"
select 
	c.customer_id as "id_cliente",
	concat(c.first_name, ' ', c.last_name) as "nombre",
	count(r."rental_id") as "cantidad_alquieleres"
from customer c 
inner join rental r on c.customer_id =r.customer_id 
group by 1,2
order by 3 desc;

select 
	"id_cliente",
	"nombre",
	"cantidad_alquieleres"
from "alquileres_totales";

-- 2. Duración total por categoría:
-- Calcula la duración total de las películas en la categoría Action.
create temporary table "Duración_total_por_categoría"(
	"categoria" varchar(255),
	"duracion" DECIMAL(10, 2))

insert into "Duración_total_por_categoría"
select 
	c."name" as "categoria",
	round(avg(f."length"),2)  as "duracion"
from film f 
inner join film_category fc on f.film_id = fc.film_id 
inner join category c on fc.category_id = c.category_id 
group by 1

select 
	"categoria",
	"duracion"
from "Duración_total_por_categoría"
where "categoria" = 'Action';

-- 3. Clientes destacados:
-- Encuentra los clientes que alquilaron al menos 7 películas distintas.
create temporary table "Clientes_destacados"(
	"nombre" varchar(255),
	"peliculas_alquiladas" int);

insert into "Clientes_destacados"
select
	concat(c.first_name, ' ', c.last_name) as "nombre",
	count( distinct f.title) as "peliculas_alquiladas"
from customer c 
inner join rental r on c.customer_id = r.customer_id 
inner join inventory i on i.inventory_id = r.inventory_id 
inner join film f on f.film_id = i.film_id 
group by 1;

select 
	"nombre",
	"peliculas_alquiladas"
from "Clientes_destacados"
where "peliculas_alquiladas" > 0
order by 2;

-- 4. Categorías destacadas:
-- Encuentra la cantidad total de películas alquiladas por categoría.
create temporary table "Categorías_destacada"(
	"categoria" varchar(255),
	"alquiler_por_categoria" int);

insert into "Categorías_destacada"
select
	c."name" as "categoria",
	count(r.rental_id) "alquiler_por_categoria"
from rental r 
inner join inventory i on i.inventory_id = r.inventory_id 
inner join film f on i.film_id = f.film_id 
inner join film_category fc on fc.film_id = f.film_id 
inner join category c on c.category_id = fc.category_id 
group by 1
order by 2;


select 
	"categoria",
	"alquiler_por_categoria"
from "Categorías_destacada";

-- 5. Nuevas columnas:
-- Renombra las columnas first_name como Nombre y last_name como Apellido.
ALTER TABLE actor 
RENAME COLUMN "first_name" TO "Nombre";

ALTER TABLE actor 
RENAME COLUMN "last_name" TO "Apellido";
-- 6. Tablas temporales:
-- Crea una tabla temporal llamada cliente_rentas_temporal para almacenar el total de alquileres por cliente.
create temporary table "cliente_rentas_temporal"(
	"nombre" varchar(255),
	"peliculas_alquiladas" int);

insert into "cliente_rentas_temporal"
select
	concat(c.first_name, ' ', c.last_name) as "nombre",
	count( distinct r.rental_id) as "peliculas_alquiladas"
from customer c 
inner join rental r on c.customer_id = r.customer_id 
inner join inventory i on i.inventory_id = r.inventory_id 
inner join film f on f.film_id = i.film_id 
group by 1;

select 
	"nombre",
	"peliculas_alquiladas"
from "cliente_rentas_temporal";

-- Crea otra tabla temporal llamada peliculas_alquiladas para almacenar películas alquiladas al menos 10 veces.
create temporary table "peliculas_alquiladas"(
	"nombre_pelicula" varchar(255),
	"alquileres" int);
	
insert into "peliculas_alquiladas"
select 
	f.title as "nombre_pelicula",
	count(r.rental_id) as "alquileres"
from film f 
inner join inventory i on f.film_id =i.film_id 
inner join rental r on i.inventory_id = r.inventory_id 
group by 1

select nombre_pelicula, alquileres
from "peliculas_alquiladas"
where alquileres > 10
order by 2;


-- 7. Actores en Sci-Fi:
-- Encuentra los actores que actuaron en películas de la categoría Sci-Fi.
select 
	concat(a."Nombre" , ' ', a."Apellido") as "actor",
	count(f.film_id) as peliculas,
	c."name" as categoria
from film f 
inner join film_category fc on fc.film_id = f.film_id 
inner join film_actor fa on fa.film_id = f.film_id 
inner join actor a on a.actor_id = fa.actor_id 
inner join category c on c.category_id = fc.category_id 
where "name" = 'Sci-Fi'
group by 1,3
