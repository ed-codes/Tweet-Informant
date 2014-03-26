# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@client = Twitter::REST::Client.new do |config|
			config.consumer_key        = "4yyLe1DMOtY3tpCAVx4w"
			config.consumer_secret     = "e7BZXZM54nNO04GiP8d9rixZdz4v9SZ3RKeXrLdHujo"
			config.access_token        = "628446928-yfO6Tnew2KtRdRAuOWlcnC2OUI7ZkokyUC5qXLFc"
			config.access_token_secret = "4N5kzSLHq9kf4hQgRXTUkBj58ZLSVbtbWkcy3GFqNUBSh"
		end


City.all.each do |c|
	# get the XML city info inclusing lat long from Yahoo API, HTTParty converts it to a hash
	response = HTTParty.get("http://where.yahooapis.com/v1/place/#{c.woeid}?appid=dj0yJmk9anFkWWdubGVJbnRRJmQ9WVdrOWJEQlRXR3BXTjJrbWNHbzlNVEl6TVRVMk5EazJNZy0tJnM9Y29uc3VtZXJzZWNyZXQmeD01MA--")
	# set lat long for each city
	c.lat = response.parsed_response["place"]["centroid"]["latitude"]
	c.long = response.parsed_response["place"]["centroid"]["longitude"]
	# c.trendlist = JSON.generate(@client.trends(c.woeid))
	c.save
end

world = City.find_by woeid: "1"
world.lat = 100
world.long = 0
world.save