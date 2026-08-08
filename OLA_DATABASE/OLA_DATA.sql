-- 1. Retrieve all successful bookings:
CREATE VIEW Successful_Bookings AS 
SELECT
*
FROM bookings
WHERE booking_status = 'Success'
--------------------------------------
SELECT * FROM Successful_Bookings

-- 2. Find the average ride distance for each vehicle type:
CREATE VIEW Average_Ride_Distance AS
SELECT
    vehicle_type,
    ROUND(AVG(ride_distance), 2) AS "average ride distance"
FROM bookings
GROUP BY vehicle_type
ORDER BY vehicle_type;
--------------------------------------
SELECT * FROM Average_Ride_Distance

-- 3. Get the total number of cancelled rides by customers:
CREATE VIEW total_number_of_cancelled_rides_by_customers AS
SELECT 
	COUNT(*)
FROM bookings
WHERE booking_status = 'Canceled by Customer'
--------------------------------------
SELECT * FROM total_number_of_cancelled_rides_by_customers

-- 4. List the top 5 customers who booked the highest number of rides:
CREATE VIEW highest_number_of_rides AS 
SELECT
    customer_id,
    COUNT(*) AS "highest number of rides"
FROM bookings
GROUP BY customer_id
ORDER BY COUNT(*) DESC
LIMIT 5;
--------------------------------------
SELECT * FROM highest_number_of_rides 

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
CREATE VIEW rides_cancelled_by_drivers_due_to_personal_and_car_related_issues AS 
SELECT 
	COUNT(*)
FROM bookings
WHERE canceled_rides_by_driver = 'Personal & Car related issue'
--------------------------------------
SELECT * FROM rides_cancelled_by_drivers_due_to_personal_and_car_related_issues

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
CREATE VIEW maximum_and_minimum_driver_ratings_for_Prime_Sedan_bookings AS 
SELECT
	MAX(driver_ratings) AS "maximum driver ratings",
	MIN(driver_ratings) AS "minimum driver ratings"
FROM bookings
WHERE vehicle_type = 'Prime Sedan'
--------------------------------------
SELECT * FROM maximum_and_minimum_driver_ratings_for_Prime_Sedan_bookings

-- 7. Retrieve all rides where payment was made using UPI:
CREATE VIEW rides_where_payment_was_made_using_UPI AS
SELECT * 
FROM bookings
WHERE payment_method = 'UPI'
--------------------------------------
SELECT * FROM rides_where_payment_was_made_using_UPI

-- 8. Find the average customer rating per vehicle type:
CREATE VIEW average_customer_rating_per_vehicle_type AS
SELECT
    vehicle_type,
    ROUND(AVG(customer_rating)::numeric, 2) AS average_customer_rating
FROM bookings
GROUP BY vehicle_type
ORDER BY vehicle_type;
--------------------------------------
SELECT * FROM average_customer_rating_per_vehicle_type

-- 9. Calculate the total booking value of rides completed successfully:
Create VIEW total_successful_ride_value AS
SELECT SUM(booking_value) as total_successful_ride_value
FROM bookings
WHERE booking_status = 'Success';
--------------------------------------
SELECT * FROM total_successful_ride_value

-- 10. List all incomplete rides along with the reason:
Create View Incomplete_Rides_Reason As
SELECT booking_id, incomplete_rides_reason
FROM bookings
WHERE incomplete_rides = 'Yes';
--------------------------------------
SELECT * FROM Incomplete_Rides_Reason