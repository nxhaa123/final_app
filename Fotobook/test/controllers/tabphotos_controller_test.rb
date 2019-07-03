require 'test_helper'

class TabphotosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tabphotos_index_url
    assert_response :success
  end

  test "should get show" do
    get tabphotos_show_url
    assert_response :success
  end

  test "should get new" do
    get tabphotos_new_url
    assert_response :success
  end

  test "should get create" do
    get tabphotos_create_url
    assert_response :success
  end

end
