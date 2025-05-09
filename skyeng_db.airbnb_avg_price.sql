Сравните средние цены в трех городах на отдельные комнаты (Private room), которые сдаются минимум на 30 суток.

select 'Dallas' as City, dallas_listings.room_type, avg(dallas_listings.price) as avg_price
from airbnb_dallas.listings as dallas_listings
    join airbnb_dallas.calendar as dallas_calendar on dallas_listings.id = dallas_calendar.listing_id
where room_type = 'Private room'
    and dallas_calendar.minimum_nights >= 30
group by city, room_type

union all 
select 'Oakland' as City, oakland_listings.room_type, avg(oakland_listings.price) as avg_price
from airbnb_oakland.listings as oakland_listings
    join airbnb_oakland.calendar as oakland_calendar on oakland_listings.id = oakland_calendar.listing_id
where room_type = 'Private room'
    and oakland_calendar.minimum_nights >= 30
group by city, room_type

union all
select 'New York' as City, new_york_listings.room_type, avg(new_york_listings.price) as avg_price
from airbnb_new_york.listings as new_york_listings
    join airbnb_new_york.calendar as new_york_calendar on new_york_listings.id = new_york_calendar.listing_id
where room_type = 'Private room'
	and new_york_calendar.minimum_nights >= 30
group by city, room_type
order by avg_price desc
