require 'twitter'


class TrendsController < ApplicationController

	before_action :setup
	
	def setup

		@client = Twitter::REST::Client.new do |config|
			config.consumer_key        = "4yyLe1DMOtY3tpCAVx4w"
			config.consumer_secret     = "e7BZXZM54nNO04GiP8d9rixZdz4v9SZ3RKeXrLdHujo"
			config.access_token        = "628446928-yfO6Tnew2KtRdRAuOWlcnC2OUI7ZkokyUC5qXLFc"
			config.access_token_secret = "4N5kzSLHq9kf4hQgRXTUkBj58ZLSVbtbWkcy3GFqNUBSh"
		end

	end

	def available
		@trends_available = @client.trends_available
		render :json => @trends_available
	end


	def place
		@trends_place = @client.trends(params[:place_id])
		render :json => @trends_place
	end


end
