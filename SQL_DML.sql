/* 
 * Typically name of the film are always unique, but im not sure that this one will be 100% effective one. But we can also give another condition for it - better to understand buisness concept to make a 100% effective condition for it.
 */

insert into film (title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating, last_update, special_features, fulltext)
select 'Godzilla Minus One', 'Post war Japan is at its lowest point when a new crisis emerges in the form of a giant monster, baptized in the horrific power of the atomic bomb.', 2023, 1, 7, 4.99, 90, 19.99, 'R', current_timestamp, '{Commentaries}', 'TRUE'
where not exists (
  select * 
  from film
  where title = 'Godzilla Minus One'
  limit 1
);

insert into film (title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating, last_update, special_features, fulltext)
select 'Urojenie', 'A woman returns to her childhood home to discover that the imaginary friend she left behind is very real and unhappy that she abandoned him.', 2024, 1, 14, 9.99, 120, 29.99, 'PG-13', current_timestamp, '{Trailers}', 'TRUE'
where not exists (
  select *
  from film
  where title = 'Urojenie'
  limit 1
);

insert into film (title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating, last_update, special_features, fulltext)
select 'The Crow', 'Soulmates Eric Draven and Shelly Webster are brutally murdered. Given the chance to save his true love by sacrificing himself, Eric sets out to seek revenge, traversing the worlds of the living and the dead to put the wrong things right.', 2024, 1, 21, 19.99, 110, 24.99, 'R', current_timestamp, '{Trailers}', 'TRUE'
where not exists(
  select *
  from film
  where title = 'The Crow'
  limit 1
);

/*
 * The same as in the first task, just to insert some data
 */

insert into actor (first_name, last_name, last_update)
select 'Minami', 'Hamabe', current_timestamp
where not exists(
  select *
  from actor
  where first_name = 'Minami' and last_name = 'Hamabe'
  limit 1
);

insert into actor (first_name, last_name, last_update)
select 'Rikako', 'Miura', current_timestamp
where not exists(
  select *
  from actor
  where first_name = 'Rikako' and last_name = 'Miura'
  limit 1
);

insert into actor (first_name, last_name, last_update)
select 'DeWanda', 'Wise', current_timestamp
where not exists(
  select *
  from actor
  where first_name = 'DeWanda' and last_name = 'Wise'
  limit 1
);

insert into actor (first_name, last_name, last_update)
select 'Taegen', 'Burns', current_timestamp
where not exists(
  select *
  from actor
  where first_name = 'Taegen' and last_name = 'Burns'
  limit 1
);

insert into actor (first_name, last_name, last_update)
select 'Bill', 'Skarsgard', current_timestamp
where not exists(
  select *
  from actor
  where first_name = 'Bill' and last_name = 'Skarsgard'
  limit 1
);

insert into actor (first_name, last_name, last_update)
select 'Danny', 'Huston', current_timestamp
where not exists(
  select *
  from actor
  where first_name = 'Danny' and last_name = 'Huston'
  limit 1
);

---------------------------------------------------------------------------------------------

insert into film_actor (actor_id, film_id, last_update)
select a.actor_id, f.film_id, current_timestamp
from (select actor_id from actor where first_name = 'Minami' and last_name = 'Hamabe') a,
     (select film_id from film where title = 'Godzilla Minus One') f
where not exists(
    select * 
    from film_actor 
    where actor_id = a.actor_id and film_id = f.film_id
);

insert into film_actor (actor_id, film_id, last_update)
select a.actor_id, f.film_id, current_timestamp
from (select actor_id from actor where first_name = 'Rikako' and last_name = 'Miura') a,
     (select film_id from film where title = 'Godzilla Minus One') f
where not exists(
    select * 
    from film_actor 
    where actor_id = a.actor_id and film_id = f.film_id
);

insert into film_actor (actor_id, film_id, last_update)
select a.actor_id, f.film_id, current_timestamp
from (select actor_id from actor where first_name = 'DeWanda' and last_name = 'Wise') a,
     (select film_id from film where title = 'Urojenie') f
where not exists(
    select * 
    from film_actor 
    where actor_id = a.actor_id and film_id = f.film_id
);

insert into film_actor (actor_id, film_id, last_update)
select a.actor_id, f.film_id, current_timestamp
from (select actor_id from actor where first_name = 'Taegen' and last_name = 'Burns') a,
     (select film_id from film where title = 'Urojenie') f
where not exists(
    select * 
    from film_actor 
    where actor_id = a.actor_id and film_id = f.film_id
);

insert into film_actor (actor_id, film_id, last_update)
select a.actor_id, f.film_id, current_timestamp
from (select actor_id from actor where first_name = 'Bill' and last_name = 'Skarsgard') a,
     (select film_id from film where title = 'The Crow') f
where not exists(
    select * 
    from film_actor 
    where actor_id = a.actor_id and film_id = f.film_id
);

insert into film_actor (actor_id, film_id, last_update)
select a.actor_id, f.film_id, current_timestamp
from (select actor_id from actor where first_name = 'Danny' and last_name = 'Huston') a,
     (select film_id from film where title = 'The Crow') f
where not exists(
    select * 
    from film_actor 
    where actor_id = a.actor_id and film_id = f.film_id
);

/* 
 * Easy inserting, ( for understanding which index my films and actors have I used select * from table_name order by id desc;
 */

insert into inventory (film_id, store_id, last_update)
select f.film_id, 1, current_timestamp from film f
where f.title = 'Godzilla Minus One' and not exists(
  select *
  from inventory i 
  where i.film_id = f.film_id and i.store_id = 1
);

insert into inventory (film_id, store_id, last_update)
select f.film_id, 1, current_timestamp from film f
where f.title = 'Urojenie' and not exists(
  select *
  from inventory i 
  where i.film_id = f.film_id and i.store_id = 1
);

insert into inventory (film_id, store_id, last_update)
select f.film_id, 2, current_timestamp from film f
where f.title = 'The Crow' and not exists(
  select *
  from inventory i 
  where i.film_id = f.film_id and i.store_id = 2
);

/* 
 * Im sorry that I didn't use condtion here - because I analysed data before complete this task - so there was no any needs to use condition here, but I will write it again here
 */

select customer.customer_id
from customer
inner join rental on customer.customer_id = rental.customer_id 
inner join payment on customer.customer_id = payment.customer_id 
group by customer.customer_id 
having count(distinct rental.rental_id) >= 43 and count(distinct payment.payment_id) >= 43;

update customer
set first_name = 'Valerii', last_name = 'Andriushchenko', email = 'shriksankaprof@gmail.com', last_update = current_timestamp 
where customer_id = (
  select c.customer_id
  from customer c
  where c.customer_id = 1 and not exists(
   select *
   from customer
   where email = 'shriksankaprof@gmail.com'
   ) limit 1
);
/* 
 * I will remove from payment table, just with where clause where customer_id = 1
 */

delete from payment 
where customer_id = (select customer_id from customer where email = 'shriksankaprof@gmail.com');

delete from rental
where customer_id = (select customer_id from customer where email = 'shriksankaprof@gmail.com');

/* TASK 1. PART 6
 * Rent you favorite movies from the store they are in and pay for them (add corresponding records to the database to represent this activity)
 * (Note: to insert the payment_date into the table payment, you can create a new partition (see the scripts to install the training database ) or add records for the
 * first half of 2017) 
 * Okay, here we need our rental_id ( that we will make ) just use select * from rental order by id desc; staff_id we will use default 1, amount will be the same as that it was in the first task: 4.99, 9.99, 19.99
 * Also we will look for our inventory_id, by the select * from inventory order by film_id desc;
*/

insert into rental (rental_date, inventory_id, customer_id, return_date, staff_id, last_update)
values ('2017-01-15', 4582, 1, current_date + interval '1 week', 1, current_timestamp), -- WE WILL USE + interval to CALCULATE return_date
('2017-02-15', 4583, 1, current_date + interval '2 weeks', 1, current_timestamp),
('2017-03-15', 4584, 1, current_date + interval '3 weeks', 1, current_timestamp);

-- Next we will add data to payment table:
-- select *
-- from rental r (32298-32300) our rentals
-- Let's say that we will pay today

insert into payment (customer_id, staff_id, rental_id, amount, payment_date)
values (1, 1, 32298, 4.99, '2017-01-15'), (1, 1, 32299, 9.99, '2017-02-15'), (1, 1, 32300, 19.99, '2017-03-15');

