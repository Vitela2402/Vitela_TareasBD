--Pablo Vitela
--197263
--Tarea 5

--Checar cuantas peliculas hay por tienda
select i.store_id as store, count(i.inventory_id) as num_peliculas 
	from inventory i
	group by i.store_id;

--Checar en que tienda y cómo se distribuirian los cilindros 
select i.store_id, c."name" , count(f.film_id) 
from category c join film_category fc using(category_id) 
join film f using(film_id) 
join inventory i using(film_id) 
join store s using(store_id) 
group by i.store_id, c.category_id
order by count desc;

--50 kilos y 500 gramos
select 50/.5 as "cuantos";
--volumen de una caja de pelicula 
select 20*13.5*1.5;


select (25*8)/(2*pi()) as apotema;
select (8/(2*tan(31.83))) as resultado_apotema; 
select(9.101608+30) as distancia;
select sqrt(power(39.1016,2)+power(4,2)) as radio; --Radio del cilindro
select pi()*power(49481.55,2) as area_base;--area de la base
select 1039112.66*21 as volumen;--volumen del cilindro


select i.store_id ,ceil((count(f.film_id)*1.0)/75) as cilindros_por_tienda 
from inventory i join film f using(film_id) 
join store s using(store_id) 
group by i.store_id; --total de cilindros 62

select i.store_id, c."name",ceil((count(f.film_id)*1.0)/75) as cilindros_por_categoria 
from category c join film_category fc using(category_id) 
join film f using(film_id) 
join inventory i using(film_id) 
join store s using(store_id)  
group by i.store_id, c.category_id;
