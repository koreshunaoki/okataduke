require 'test_helper'

class HomeItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get home_items_index_url
    assert_response :success
  end

  test "should get new" do
    get home_items_new_url
    assert_response :success
  end

  test "should get show" do
    get home_items_show_url
    assert_response :success
  end

  test "should get edit" do
    get home_items_edit_url
    assert_response :success
  end

end
