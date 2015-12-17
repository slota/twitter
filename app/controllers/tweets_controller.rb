  class TweetsController < ApplicationController
    def create
      twitter_data.update(params[:tweet][:message])
      redirect_to root_path
    end

    def update
      twitter_data.favorite(params[:id].to_i)
      redirect_to root_path
    end

    def twitter_data
      twitter_api(current_user)
    end

end
