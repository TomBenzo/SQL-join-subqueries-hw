
--Q1
--Answer: Jennifer Davis, Kim Cruz, Richard Mccrary, Bryan Hardison, Ian Still

select *
from customer
inner join address
on address.address_id = customer.address_id
where district  like 'Texas';

--Q2
select first_name,last_name,amount
from customer
join payment
on customer.customer_id = payment.customer_id
where  amount > 6.99
order by amount asc;

--Q3
select first_name,last_name
from customer
where customer_id IN (
	select customer_id
	from payment
	group by customer_id
	having sum(amount) > 175
	order by sum(amount) DESC
);

--Q4
--Answer: 0 customers live in Nepal 
select first_name, last_name 
from customer
join city
on customer.customer_id = city.city_id
where city like 'Nepal';

--Q5
--Answer: Staff 2 had the most transactions
select staff_id, COUNT(staff_id)
from payment
group by staff_id 
order by staff_id asc;

--Q6
--Answer: there are 178 rated G movies, 194 rated PG movies, 223 rated PG-13 movies, 195 rated R movies, and 210 rated NC-17 movies 
select rating, count (rating)
from film
group by rating 
order by rating asc;

--Q7
select first_name, last_name , customer_id 
	from customer 
	where customer_id in (
	select customer_id 
	from payment
	group by customer_id, amount
	having amount > 6.99
	order by amount asc
	);

--Q8
select store_id, first_name, last_name, amount 
from customer
join payment
on customer.customer_id = payment.customer_id
where amount = 0.00
order by amount asc;