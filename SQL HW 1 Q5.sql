# Show all of the airlines, ordered by number of flights in descending order.
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