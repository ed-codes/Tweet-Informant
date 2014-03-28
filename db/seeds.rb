# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@client = Twitter::REST::Client.new do |config|
			config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
			config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
			config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
			config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
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