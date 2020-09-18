require 'test_helper'

class RoutinesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get routines_index_url
    assert_response :success
  end

  test "should get new" do
    get routines_new_url
    assert_response :success
  end

  test "should get create" do
    get routines_create_url
    assert_response :success
  end

  test "should get edit" do
    get routines_edit_url
    assert_response :success
  end

  test "should get update" do
    get routines_update_url
    assert_response :success
  end

  test "should get destroy" do
    get routines_destroy_url
    assert_response :success
  end

end
