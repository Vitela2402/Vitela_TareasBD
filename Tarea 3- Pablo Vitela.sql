--Tarea 3
--Pablo Vitela
--197263
--Cómo obtenemos todos los nombres y correos de nuestros clientes canadienses para una campaña?
select c.first_name || ' ' || c.last_name as customer_name, c.email as email
from customer c join address a using(address_id)
join city c2 using(city_id)
join country c3 using(country_id)
where country = 'Canada';

--Qué cliente ha rentado más de nuestra sección de adultos?
select c.first_name || ' '|| c.last_name as customer_name, count(*) as num_films
from rental r  join customer c using(customer_id)
join inventory i using(inventory_id)
join film f using(film_id)
where f.rating = 'NC-17'
group by f.rating, c.customer_id 
order by 2 desc 
limit 1;


--Qué películas son las más rentadas en todas nuestras stores?
select f.title , count(*) as number_of_rentals
from payment p join rental r using(rental_id)
join inventory i using(inventory_id)
join film f using(film_id)
group by f.title , i.film_id  
order by 2 desc
limit 10;



--Cuál es nuestro revenue por store?
select a.address , sum(p.amount) as revenue
from payment p join rental r using(rental_id)
join inventory i using(inventory_id)
join store s using(store_id)
join address a using(address_id)
group by a.address  , s.store_id ;


