require 'twitter'


class TrendsController < ApplicationController

	before_action :setup
	

	def index
		@trends_available = City.all

		if @trends_available.empty?
			@trends_available = @client.trends_available

			@trends_available.each do |c| 
				City.create(name: c.name, woeid: c.woeid)
			end
		end

		render :json => @trends_available
	end


	# def place
	# 	@trends_place = Place_trendlist.all

	# 	if @trends_place.empty?
	# 		@trends_place = @client.trends(params[:place_id])
			
	# 		@trends_place.each do |t|
	# 			Place_trendlist.create(name: t.name, query: t.query, url: t.url)
	# 		end
	# 	end

	# 	render :json => @trends_place
	# end

	def search 
		# @tweet_search = 
	end

	
	private 

	def setup

		@client = Twitter::REST::Client.new do |config|
			config.consumer_key        = "4yyLe1DMOtY3tpCAVx4w"
			config.consumer_secret     = "e7BZXZM54nNO04GiP8d9rixZdz4v9SZ3RKeXrLdHujo"
			config.access_token        = "628446928-yfO6Tnew2KtRdRAuOWlcnC2OUI7ZkokyUC5qXLFc"
			config.access_token_secret = "4N5kzSLHq9kf4hQgRXTUkBj58ZLSVbtbWkcy3GFqNUBSh"
		end

	end

end
