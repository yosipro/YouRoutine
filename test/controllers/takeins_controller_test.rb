require 'test_helper'

class TakeinsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get takeins_create_url
    assert_response :success
  end

  test "should get destroy" do
    get takeins_destroy_url
    assert_response :success
  end

end
