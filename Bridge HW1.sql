# Question 1: Which destination in the flights database is the furthest distance away, based on information in the flights table.
# Select destination row
SELECT 
	dest AS "Destination"
# Select from flights database
FROM flights
# Sort the distance row in descending order, so the largest distances are at the top
ORDER BY distance DESC
# Selects the dest value in the first row
LIMIT 1;

# Question 2: What are the different numbers of engines in the planes table? 
SELECT
	# Eliminates duplicates
	DISTINCT
	# Selects column "engines"
	engines AS 'Different Number of Engines'
# Selects table "planes"
FROM planes
# Sorts engines in ascending order
ORDER BY engines;

# For each number of engines, which aircraft have the most number of seats?
SELECT *
FROM (
	SELECT 
    # selects engines column 
    engines AS "Number of Engines",
    # selects model clumn
    model AS "Aircraft",
    # selects seats column
    seats AS "Number of Seats",
    # partitions by engines and sorts by number of seats in a descending order, adds rank number to column "Rank" 
    # and allocates to t
    ROW_NUMBER() OVER (PARTITION BY engines ORDER BY seats DESC) AS "Rank"
    FROM planes) as t
# shows where "Rank" columns equals 1tailnum
WHERE t.Rank = 1;

# Question 3: Show the total number of flights.
SELECT
	COUNT(flight) AS 'Total Number of Flights'
FROM flights;

# Question 4: Show the total number of flights by airline (carrier).
SELECT
	# selecting column "carrier"
	carrier AS 'Carrier',
    # Counting how many items are in the flight column
	COUNT(flight) AS 'Count of Flights',
	CASE
		WHEN GROUPING(carrier) = 1 THEN "TOTAL"
		WHEN GROUPING(flight) = 1 THEN 'SUBTOTAL'
		ELSE '' END AS 'SUBTOTAL/TOTAL'
FROM flights
GROUP BY carrier,flight WITH ROLLUP
HAVING COUNT(flight) > 2;

# Question 5: Show all of the airlines, ordered by number of flights in descending order.
SELECT
	# selecting column "carrier"
	carrier AS 'Carrier',
    # Counting how many items are in the flight column
	COUNT(flight) AS 'Count of Flights',
	CASE
		WHEN GROUPING(carrier) = 1 THEN "TOTAL"
		WHEN GROUPING(flight) = 1 THEN 'SUBTOTAL'
		ELSE '' END AS 'SUBTOTAL/TOTAL'
FROM flights
GROUP BY carrier,flight WITH ROLLUP 
HAVING COUNT(flight) > 2
#sorting in descending order
ORDER BY COUNT(flight) DESC;


# Question 6: Show only the top 5 airlines, by number of flights, 
# ordered by number of flights in descending order.
SELECT
	# selecting column "carrier"
	carrier AS 'Carrier',
    # Counting how many items are in the flight column
	COUNT(flight) AS 'Count of Flights',
	CASE
		WHEN GROUPING(carrier) = 1 THEN "TOTAL"
		WHEN GROUPING(flight) = 1 THEN 'SUBTOTAL'
		ELSE '' END AS 'SUBTOTAL/TOTAL'
FROM flights
GROUP BY carrier,flight WITH ROLLUP 
HAVING COUNT(flight) > 2
#sorting in descending order
ORDER BY COUNT(flight) DESC
# Showing top 5 airlines and the null row for the TOTAL
LIMIT 6;


# Question 7: Show only the top 5 airlines, by number of flights of distance 1,000 miles 
# or greater, ordered by number of flights in descending order.
SELECT
	# selecting column "carrier"
	carrier AS 'Carrier',
	# Counting how many items are in the flight column
	COUNT(flight) AS 'Count of Flights',
	CASE
		WHEN GROUPING(carrier) = 1 THEN "TOTAL"
		WHEN GROUPING(flight) = 1 THEN 'SUBTOTAL'
		ELSE '' END AS 'SUBTOTAL/TOTAL'
FROM flights
WHERE distance > 1000
GROUP BY carrier,flight WITH ROLLUP 
HAVING COUNT(flight) > 2
#sorting in descending order
ORDER BY COUNT(flight) DESC
# Showing top 5 airlines and the null row for the TOTAL
LIMIT 6;


# Question 8: Create a question that (a) uses data from the flights database, 
# and (b) requires aggregation to answer it, and
#write down both the question, and the query that answers the question.
# QUESTION: What is the average flight distance and time for each airline?

SELECT
	# selecting column "carrier"
	carrier AS 'Carrier',
    # finding the average of the distance column
	avg(distance) AS 'Average Distance',
    # finding the average of the air_time column
    avg(air_time) AS 'Average Flight Time'
# selecting from flights database
FROM flights
# grouping by carrier
GROUP BY carrier
# sorting by carrier
ORDER BY carrier; 