require 'test_helper'

class PickupsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get pickups_create_url
    assert_response :success
  end

  test "should get destroy" do
    get pickups_destroy_url
    assert_response :success
  end

end
