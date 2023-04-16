require "test_helper"

class RendaFixasControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get renda_fixas_new_url
    assert_response :success
  end

  test "should get create" do
    get renda_fixas_create_url
    assert_response :success
  end

  test "should get edit" do
    get renda_fixas_edit_url
    assert_response :success
  end

  test "should get update" do
    get renda_fixas_update_url
    assert_response :success
  end

  test "should get destroy" do
    get renda_fixas_destroy_url
    assert_response :success
  end
end
