class TweetsController < ApplicationController
  def create
    twitter_data = twitter_api(current_user)
    twitter_data.update(params[:tweet][:message])
    redirect_to root_path
  end
end
