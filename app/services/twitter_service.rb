class TwitterService
  attr_reader :client

  def initialize(current_user)
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["consumer_key"]
      config.consumer_secret     = ENV["consumer_secret"]
      config.access_token        = current_user[:oauth_token]
      config.access_token_secret = current_user[:oauth_token_secret]
    end
  end
end
