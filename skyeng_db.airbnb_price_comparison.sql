

-- Найдите цену самого дорогого объекта для сдачи у продавца, 
-- у которого был просмотр объявления апартаментов из Бруклина (Нью-Йорк) 1 апреля 2020 года. 
-- Нужно вывести ID продавца, имя и цену объекта. Объект может находиться в любом районе Нью-Йорка.

select distinct listings.id, listings.name, listings.price, neighbourhoods.neighbourhood_group, neighbourhoods.neighbourhood
from airbnb_new_york.listings as listings
    join airbnb_new_york.neighbourhoods as neighbourhoods on listings.neighbourhood = neighbourhoods.neighbourhood
    join airbnb_new_york.reviews as reviews on listings.id = reviews.listing_id
where neighbourhoods.neighbourhood_group ilike '%Brooklyn%'
    and reviews.date = '2020-04-01'
order by price desc
limit 1
