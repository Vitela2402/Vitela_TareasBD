--Pablo Vitea
--197263

-- 1 Qué contactos de proveedores tienen la posición de sales representative?

-- 2 Qué contactos de proveedores no son marketing managers?
 
-- 3 Cuales órdenes no vienen de clientes en Estados Unidos?

-- 4 Qué productos de los que transportamos son quesos?

-- 5 Qué ordenes van a Bélgica o Francia?

-- 6 Qué órdenes van a LATAM?

-- 7 Qué órdenes no van a LATAM?

-- 8 Necesitamos los nombres completos de los empleados, nombres y apellidos unidos en un mismo registro

-- 9 Cuánta lana tenemos en inventario?

-- 10 Cuantos clientes tenemos de cada país? 

--1
select contact_title from suppliers s where s.contact_title like 'Sales Representative';

--2
select contact_title from suppliers s where s.contact_title not like 'Marketing Manager';

--3  
select ship_country from orders o where o.ship_country not like 'USA' order by o.ship_country;

--4
select distinct p.product_id , p.product_name
from categories c join products p using (category_id)
join order_details od using (product_id)
join orders o using (order_id)
where shipped_date is not null 
and c.description = 'Cheeses'
order by 1 desc;

--5
select distinct o.order_id, o.ship_country 
from orders o join order_details od using (order_id)
where  (ship_country= 'France' or ship_country = 'Belgium')
order by 1 asc;

--6
select distinct o.order_id, o.ship_country 
from orders o join order_details od using (order_id)
where  (ship_country  = 'Argentina' or ship_country='Brazil' or ship_country='Venezuela')
order by 1 asc;

--7
select distinct o.order_id, o.ship_country 
from orders o join order_details od using (order_id)
where ship_country not like 'Argentina' and ship_country not like 'Brazil' and ship_country not like 'Venezuela' 
order by 1 asc;

--8
select concat(e.first_name,' ',e.last_name) from employees e;

--9
select SUM (unit_price*units_in_stock) from products p;

--10
select c.country, count(*) from customers c 
group by c.country
order by 2 desc;


--SEGUNDA PARTE
-- 1 Obtener un reporte de edades de los empleados para checar su elegibilidad para seguro de gastos médicos menores.
-- 2 Cuál es la orden más reciente por cliente?
-- 3 De nuestros clientes, qué función desempeñan y cuántos son?
-- 4 Cuántos productos tenemos de cada categoría?
-- 5 Cómo podemos generar el reporte de reorder?
-- 6 A donde va nuestro envío más voluminoso?
-- 7 Cómo creamos una columna en customers que nos diga si un cliente es bueno, regular, o malo?
-- 8 Qué colaboradores chambearon durante las fiestas de navidad?
-- 9 Qué productos mandamos en navidad?
-- 10 Qué país recibe el mayor volumen de producto?

--1 
select concat(e.first_name,'', e.last_name) as employee_name, age(current_date, e.birth_date) as employee_age
from employees e 
order by employee_age desc;
 
--2
select max(o.order_date) as most_recent, c.customer_id, c.contact_name
from customers c join orders o using(customer_id)
group by customer_id 
order by most_recent desc;

--3
select c.contact_title as función ,count(*) as cantidad from customers c
group by c.contact_title 
order by 2 desc;

--4
select p.category_id, count(*) as number_products from products p 
group by p.category_id 
order by p.category_id;

--5
select reorder_level, p.product_name, p.quantity_per_unit, p.unit_price * p.units_in_stock as costo
from products p, suppliers s 
group by p.product_id;

--6
select od.order_id , o.ship_country, od.quantity   from order_details od join orders o using(order_id)
order  by od.quantity desc limit 2;

--7 
select o.order_id, o.ship_country, od.quantity from order_details od join orders o using(order_id)
order by od.quantity desc;

--8
select e.first_name , e.employee_id from employees e, orders o 
where cast(o.order_date as text) like '%-12-25'
group by e.first_name, e.employee_id;

--9
select o.order_id, o.shipped_date 
from orders o join order_details od using (order_id)
where cast(o.shipped_date as text) like '%-12-25';

--10
select sum(od.quantity), o.ship_country from order_details od join orders o using(order_id)
group by o.ship_country 
order by sum(od.quantity) desc limit 1;





