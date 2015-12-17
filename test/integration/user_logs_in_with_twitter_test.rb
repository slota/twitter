require "test_helper"
class UserLogsInWithTwitterTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  def setup
    Capybara.app = Twitter::Application
    stub_omniauth
  end

  test "logging in" do
    VCR.use_cassette("twitter_service#log_in", :record => :new_episodes) do
      visit "/"
      assert_equal 200, page.status_code
      click_link "Login"
      assert_equal "/", current_path
      assert page.has_content?("John")
      assert page.has_content?("Firs Tweet!")
      assert page.has_link?("Logout")

      click_link "Logout"
      assert page.has_content?("Login")
    end
  end

  def stub_omniauth
   # first, set OmniAuth to run in test mode
   OmniAuth.config.test_mode = true
   # then, provide a set of fake oauth data that
   # omniauth will use when a user tries to authenticate:
   OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new(
   {"provider"=>"twitter",
     "uid"=>"4585875734",
     "info"=>
  {"nickname"=>"slota88",
   "name"=>"John Slota",
   "email"=>nil,
   "location"=>"",
   "image"=>
    "http://abs.twimg.com/sticky/default_profile_images/default_profile_6_normal.png",
   "description"=>"",
   "urls"=>{"Website"=>nil, "Twitter"=>"https://twitter.com/slota88"}},
 "credentials"=>
  {"token"=>"4585875734-J1xjpv4RVEHi9Tf9VBw3KMtA0AmiVlewrxRgj2u",
   "secret"=>"93lt7wEtCvYu5f0gnYapcVecShO06i6fIg7M7kDzNUW0y"},
 "extra"=>{
   "raw_info"=>{
     "id"=>4585875734,
     "id_str"=>"4585875734",
     "name"=>"John Slota",
     "screen_name"=>"slota88",
     "location"=>"",
     "description"=>"",
     "url"=>nil,
     "entities"=>{"description"=>{"urls"=>[]}},
     "protected"=>false,
     "followers_count"=>0,
     "friends_count"=>0,
     "listed_count"=>0,
     "created_at"=>"Thu Dec 17 16:21:12 +0000 2015",
     "favourites_count"=>0,
     "utc_offset"=>nil,
     "time_zone"=>nil,
     "geo_enabled"=>false,
     "verified"=>false,
     "statuses_count"=>0,
     "lang"=>"en",
     "contributors_enabled"=>false,
     "is_translator"=>false,
     "is_translation_enabled"=>false,
     "profile_background_color"=>"F5F8FA",
     "profile_background_image_url"=>nil,
     "profile_background_image_url_https"=>nil,
     "profile_background_tile"=>false,
     "profile_image_url"=>
      "http://abs.twimg.com/sticky/default_profile_images/default_profile_6_normal.png",
     "profile_image_url_https"=>
      "https://abs.twimg.com/sticky/default_profile_images/default_profile_6_normal.png",
     "profile_link_color"=>"2B7BB9",
     "profile_sidebar_border_color"=>"C0DEED",
     "profile_sidebar_fill_color"=>"DDEEF6",
     "profile_text_color"=>"333333",
     "profile_use_background_image"=>true,
     "has_extended_profile"=>false,
     "default_profile"=>true,
     "default_profile_image"=>true,
     "following"=>false,
     "follow_request_sent"=>false,
     "notifications"=>false
     }}}
     )
 end

end
