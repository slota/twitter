class WelcomeController < ApplicationController

  def index
    if current_user
      @twitter_data = twitter_api(current_user)
      @user = current_user
    end
  end

end

#tweets_for_user(current_user)
#followers_of_user(current_user)

#current_user.tweets
#current_user.followers
