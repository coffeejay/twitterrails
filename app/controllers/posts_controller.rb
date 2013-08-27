
require "rubygems"
require "twitter"


class PostsController < ApplicationController


	CONSUMER_KEY="wJOqwY5HVNo3bueBVFZAUg"
	CONSUMER_SECRET="IwwOExoZ72HDwTqI6nhXQXiTnUIWiLnQj8jiugdOT4"
	OAUTH_TOKEN="353614622-zHxLBKXRjIlCzchWgKSsHUiX19G8jviTETUZGEeo"
	OAUTH_TOKEN_SECRET="uzGFv4Yo7GAefL7G5I41ESZg3B6adxCjioDQ5zmk"


	def index

		Twitter.configure do |config|
 			config.consumer_key = CONSUMER_KEY
  			config.consumer_secret = CONSUMER_SECRET

  			config.oauth_token = OAUTH_TOKEN
  			config.oauth_token_secret = OAUTH_TOKEN_SECRET
		end

		client = Twitter::Client.new
		@name=client.current_user.name
		@image=client.current_user.profile_image_url

		@posts = Twitter.home_timeline
	end 


	def show 

		Twitter.configure do |config|
 			config.consumer_key = CONSUMER_KEY
  			config.consumer_secret = CONSUMER_SECRET
  			config.oauth_token = OAUTH_TOKEN
  			config.oauth_token_secret = OAUTH_TOKEN_SECRET
		end

		@post=Twitter.status(params['id'])
	end 


	def new 

		

	end 


	def create 

		@post=Post.new(params[:post])
		
		if @post.save

			redirect_to posts_path, :notice => "Post was Saved"

		else

			render "new"

		end 

	end 


	def edit


	end 


	def update 


	end 


	def destory 


	end 



end
