require "test_helper"

class GastosFixosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get gastos_fixos_index_url
    assert_response :success
  end

  test "should get new" do
    get gastos_fixos_new_url
    assert_response :success
  end

  test "should get create" do
    get gastos_fixos_create_url
    assert_response :success
  end

  test "should get edit" do
    get gastos_fixos_edit_url
    assert_response :success
  end

  test "should get update" do
    get gastos_fixos_update_url
    assert_response :success
  end

  test "should get destroy" do
    get gastos_fixos_destroy_url
    assert_response :success
  end
end
