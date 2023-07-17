# Show only the top 5 airlines, by number of flights of distance 1,000 miles or greater, ordered by number of
# flights in descending order.
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