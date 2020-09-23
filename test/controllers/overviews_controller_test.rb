require 'test_helper'

class OverviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get overviews_index_url
    assert_response :success
  end

end
