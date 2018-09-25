require 'test_helper'

class User::ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get add" do
    get user_products_add_url
    assert_response :success
  end

end
