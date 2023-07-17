# What are the different numbers of engines in the planes table? 
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
WHERE t.Rank = 1