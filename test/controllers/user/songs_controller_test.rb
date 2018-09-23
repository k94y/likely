require 'test_helper'

class User::SongsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get user_songs_show_url
    assert_response :success
  end

end
