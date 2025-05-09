Сравните средние предложенные сервисом цены (adjusted_price) 
на Entire home/apt за три месяца весны 2021 года в Далласе, Нью-Йорке и Окленде. 

select 'Dallas' as City, dallas_listings.room_type, AVG(CAST(REPLACE(REPLACE(dallas_calendar.adjusted_price, '$', ''), ',', '') AS NUMERIC)) AS avg_adjusted_price
from airbnb_dallas.listings as dallas_listings
    join airbnb_dallas.calendar as dallas_calendar on dallas_listings.id = dallas_calendar.listing_id
where room_type = 'Entire home/apt'
    and date between '2021-03-01' and '2021-05-31' 
group by dallas_listings.room_type

union all 
select 'Oakland' as City, oakland_listings.room_type, AVG(CAST(REPLACE(REPLACE(oakland_calendar.adjusted_price, '$', ''), ',', '') AS NUMERIC)) AS avg_adjusted_price
from airbnb_oakland.listings as oakland_listings
    join airbnb_oakland.calendar as oakland_calendar on oakland_listings.id = oakland_calendar.listing_id
where room_type = 'Entire home/apt'
    and date between '2021-03-01' and '2021-05-31'
group by oakland_listings.room_type

union all
select 'New York' as City, new_york_listings.room_type, AVG(CAST(REPLACE(REPLACE(new_york_calendar.adjusted_price, '$', ''), ',', '') AS NUMERIC)) AS avg_adjusted_price
from airbnb_new_york.listings as new_york_listings
    join airbnb_new_york.calendar as new_york_calendar on new_york_listings.id = new_york_calendar.listing_id
where room_type = 'Entire home/apt'
    and date between '2021-03-01' and '2021-05-31'
group by new_york_listings.room_type
order by avg_adjusted_price desc
