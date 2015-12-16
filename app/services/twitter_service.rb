class TwitterService
  attr_reader :client

  def initialize(current_user)
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "SHM9LZpu9tlcAKDFmVDSEpSQe"
      config.consumer_secret     = "Lqnz3dBoU58aib8LuMyhvKYMr2PkqGAv6rRHpwPZDi7bR6yjpX"
      config.access_token        = "378211029-DfbDvspu3r5NsqNxrP3ZHpYQKAFouxKUvMyLwKJd"
      config.access_token_secret = "iqZqFjUQdAoNKPvQvt3zhPTWINX8YeIbx0ANOgAPRd354"
    end
  end
end
