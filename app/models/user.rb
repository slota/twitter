class User < ActiveRecord::Base
  # include ::Client
  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid                = auth_info.uid
      new_user.name               = auth_info.extra.raw_info.name
      new_user.oauth_token        = auth_info.credentials.token
      new_user.oauth_token_secret = auth_info.credentials.secret
    end
    user = User.find_by(uid: auth_info.uid)
    user.screen_name              = auth_info.extra.raw_info.screen_name
    user.profile_image_url        = auth_info.info.image
    user.description              = auth_info.info.description
    user.followers_count          = auth_info.extra.raw_info.followers_count
    user.friends_count            = auth_info.extra.raw_info.friends_count
    user.statuses_count           = auth_info.extra.raw_info.statuses_count
    user.save
    user
    # self.save
    # self
  end
end
