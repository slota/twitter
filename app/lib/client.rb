module Client
  def twitter_client(user)
    @twitter_client ||= TwitterService.new(user).client
  end
end
