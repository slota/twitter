require './test/test_helper'

class TwitterServiceTest < ActiveSupport::TestCase

  def create_user
    user = User.create(name: "John",
                       screen_name: "Slotanator",
                       uid: ENV["test_uid"],
                       oauth_token: ENV["test_access_token"],
                       oauth_token_secret: ENV["test_access_token_secret"]
                       )
  end

  test "VCR setup" do
    VCR.use_cassette("twitter_service#home_feed") do
      user = create_user
      service = TwitterService.new(user)
      assert_equal "yes!!!!!!!!!!!", service.client.user_timeline.first.text
    end
  end

  test "access token check" do
   VCR.use_cassette('twitter_service#home_feed') do
     user = create_user
     service = TwitterService.new(user)

     assert_equal ENV['test_access_token'], service.client.access_token
   end
 end

 test "access token secret check" do
   VCR.use_cassette('twitter_service#user_access') do
     user = create_user
     service = TwitterService.new(user)

     assert_equal ENV['test_access_token_secret'], service.client.access_token_secret
   end
 end

 test "screen name check" do
   VCR.use_cassette('twitter_service#secret_access') do
     user = create_user
     service = TwitterService.new(user)

     assert_equal 'Slotanator', service.client.user.screen_name
   end
 end
end
