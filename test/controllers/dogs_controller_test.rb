require 'test_helper'

class DogsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dogs_index_url
    assert_response :success
  end

  test "should get show" do
    get dogs_show_url
    assert_response :success
  end

  test "should get new" do
    get dogs_new_url
    assert_response :success
  end

  test "should get create" do
    get dogs_create_url
    assert_response :success
  end

  test "should get edit" do
    get dogs_edit_url
    assert_response :success
  end

  test "should get update" do
    get dogs_update_url
    assert_response :success
  end

end
