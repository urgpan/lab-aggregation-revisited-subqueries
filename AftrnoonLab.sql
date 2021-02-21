-- 1 
select customer.customer_id, first_name, last_name from customer left join rental on customer.customer_id = rental.customer_id group by customer.customer_id;

-- 2 
select  customer.customer_id, concat(first_name,"  ",last_name), AVG(payment.amount) from customer left join payment on customer.customer_id = payment.customer_id group by customer.customer_id;

-- 3
select c.first_name, c.email from customer as c
left join rental as r
on c.customer_id = r.customer_id
join inventory as i
on r.inventory_id = i.inventory_id
join film_category as f
on i.film_id = f.film_id
join category as cat
on f.category_id = cat.category_id
where cat.name = 'Action';

-- 4
select amount, (case when amount > 0 and amount < 2 then 'low' when amount > 2 and amount < 4 then 'med' when amount > 4 then 'high' end)  from payment