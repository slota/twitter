class WelcomeController < ApplicationController

  def index
    if current_user
      @tweets = current_user.tweets
    end
  end
end

#tweets_for_user(current_user)
#followers_of_user(current_user)

#current_user.tweets
#current_user.followers
