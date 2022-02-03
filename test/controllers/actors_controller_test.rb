require "test_helper"

class ActorsControllerTest < ActionDispatch::IntegrationTest
  test "should get reviews" do
    get actors_reviews_url
    assert_response :success
  end
end
