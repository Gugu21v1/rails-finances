require "test_helper"

class TransitionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get transitions_index_url
    assert_response :success
  end

  test "should get new" do
    get transitions_new_url
    assert_response :success
  end

  test "should get create" do
    get transitions_create_url
    assert_response :success
  end

  test "should get edit" do
    get transitions_edit_url
    assert_response :success
  end

  test "should get update" do
    get transitions_update_url
    assert_response :success
  end

  test "should get destroy" do
    get transitions_destroy_url
    assert_response :success
  end
end
