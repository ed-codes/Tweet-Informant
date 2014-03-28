== README

Tweet Informant lets you see what people are talking about across the world.
http://tweet-informant.herokuapp.com/

=== Key Technologies

* Twitter API 
Play with the console here https://dev.twitter.com/console
	- GET trends/available gets me all the cities Twitter has information for, and gives me a Yahoo Where On Earth ID (woeid) for each.
	- GET trends/place/(woeid) gets me the top 10 trends for a city
	- GET search/tweets gets the search results

* Yahoo API
Using HTTParty to get conversion of WOEID to latitude/longitude


* AmCharts Capitals Map

