# Which destination in the flights database is the furthest distance away, based on information in the flights table.
# Select destination row
SELECT 
	dest AS "Destination"
# Select from flights database
FROM flights
# Sort the distance row in descending order, so the largest distances are at the top
ORDER BY distance DESC
# Selects the dest value in the first row
LIMIT 1;