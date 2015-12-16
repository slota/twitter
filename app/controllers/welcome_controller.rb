class WelcomeController < ApplicationController

  def index
    if current_user
      @tweets          = current_user.tweets
      @image           = current_user.image
      @followers_count = current_user.followers_count
      @friends_count   = current_user.friends_count
      @description     = current_user.description
      @statuses_count  = current_user.statuses_count
    end
  end
end

#tweets_for_user(current_user)
#followers_of_user(current_user)

#current_user.tweets
#current_user.followers
