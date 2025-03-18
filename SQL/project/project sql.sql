use da;
create table hotels(
hotel_name varchar(50),
reg	varchar(50),
state varchar(50),	
types varchar(50),
phone_no varchar(12),	
customer_rating	float,
membership varchar(50),
payment_method	varchar(50),
resv_status	varchar(50),
assgn_room	varchar(50),
cus_seg	varchar(50),
room_type varchar(50),
adult int,	
price varchar(50),	
nights	int,
gross varchar(50),
arrival_date varchar(50),	
depature_date varchar(50),	
customer_review varchar(50));

load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\hotel sql.csv'
into table hotels
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

show variables like 'secure_file_priv';
show variables like 'local_infile';
set global local_infile = 1;

select * from hotels;

---  Customer Ratings and Trends
SELECT types, AVG(customer_rating) AS avg_rating
FROM hotels
GROUP BY types
ORDER BY avg_rating;

---  Customer Segmentation
SELECT cus_seg, AVG(nights) AS avg_nights
FROM hotels
GROUP BY cus_seg;

--- Reservation Status 
SELECT resv_status, COUNT(*) AS count
FROM hotels
GROUP BY resv_status;

--- Room Type 
SELECT room_type, COUNT(*) AS room_count
FROM hotels
GROUP BY room_type
ORDER BY room_count;

--- Room Availability by Assigned Room
SELECT assgn_room, COUNT(*) AS room_count
FROM hotels
GROUP BY assgn_room;

--- Hotel Occupancy Rate by State
SELECT state, SUM(nights) / (COUNT(*) * 365) AS occupancy_rate
FROM hotels
GROUP BY state;


--- Top 5 Hotels with Highest Customer Ratings
SELECT hotel_name, customer_rating
FROM hotels
ORDER BY customer_rating DESC
LIMIT 5;

--- Total Gross Revenue by State
SELECT state, SUM(CAST(REPLACE(gross, '$', '') AS DECIMAL(10,2))) AS total_revenue
FROM hotels
GROUP BY state
ORDER BY total_revenue DESC;

--- Bookings by Membership Type
SELECT membership, COUNT(*) AS bookings_count
FROM hotels
GROUP BY membership;
 
 --- Cancellation Rates by Reservation Status
 SELECT resv_status, COUNT(*) AS cancellations
FROM hotels
WHERE resv_status = 'Cancelled'
GROUP BY resv_status;

--- Top 3 Most Popular Room Types
SELECT room_type, COUNT(*) AS room_count
FROM hotels
GROUP BY room_type
ORDER BY room_count DESC
LIMIT 3;

--- Average Customer Rating for Each State 
SELECT state, AVG(customer_rating) AS avg_rating
FROM hotels
GROUP BY state
ORDER BY avg_rating DESC;

--- Most Frequent Payment Methods
SELECT payment_method, COUNT(*) AS payment_count
FROM hotels
GROUP BY payment_method;

--- Customer Review Analysis
SELECT customer_review, COUNT(*) AS review_count
FROM hotels
GROUP BY customer_review
ORDER BY review_count DESC;

--- INSIGHT
--- customer rating
--- the customer rating on diffrenet types of hotels. you can use diffrent types of room and make experience.

--- customer Segmentation
--- Average night stayed per customer segmentation. ex- how long diffrent types of group stay diffrent duration. 

--- Reservation Status 
--- Counting booking by reservation status, if reservatuion cancellation is high, then check your booking process.

--- Room Type 
--- See which room types are booked the most and focus on those room. you can use most popular room type.

--- Room Availability
---  Data on room can show room rates or availability room trends.

--- Hotel Occupancy Rate by State
--- If hotels in certain states are not full, give discounts or market them more.

--- Top 5 Hotels with Highest Customer Ratings
--- A list of hotels with the highest customer ratings can showcase top rated hotels.

--- Total Gross Revenue by State
--- Revenue information reveals which states contribute most to your earnings.

--- Bookings by Membership Type
--- Understanding the number of bookings by membership type you can see loyality of customers onwards to hotels.

--- Cancellation Rates by Reservation Status
--- Understand why people cancel and make the process easier to encourage bookings for hotels.

--- Top 3 Most Popular Room Types
--- You can see most popular room type people use always. you see which room are booked always.

--- Most Frequent Payment Methods
--- Make the most-used payment method for booking. it help you easily booking.

--- Customer Review Analysis
--- You can always check first customer review for booking. it help you for better decision making.






