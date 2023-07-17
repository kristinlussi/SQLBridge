# Create a question that (a) uses data from the flights database, 
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
ORDER BY carrier 